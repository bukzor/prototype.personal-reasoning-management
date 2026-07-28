/-! Corpus traversal shared by `gen` and `roundtrip`. Both executables must
see one file order, or rows and files stop pairing up. -/

open System

/-- Fail with the offending file in the message. -/
def fail (path : FilePath) (msg : String) : IO α :=
  throw <| IO.userError s!"{path}: {msg}"

/-- All corpus claim files, in sorted path order -- the one traversal order,
so generated rows line up with authored files. -/
def corpusFiles (root : FilePath) : IO (Array FilePath) := do
  let paths ← root.walkDir
  let files := paths.filter fun p =>
    p.extension == some "md"
      && p.fileName != some "CLAUDE.md"
      && (p.parent.map (·.toString.endsWith ".kb")).getD false
  pure <| files.qsort (·.toString < ·.toString)

/-- The theory a corpus file belongs to: its `.kb` directory's stem. Shared
like the traversal -- both executables must bucket claims identically. -/
def theoryOf (path : FilePath) : String :=
  match path.parent >>= (·.fileName) with
  | some dir => (dir.dropEnd ".kb".length).copy
  | none => ""

/-- The authored frontmatter: the lines strictly between the opening and
closing `---`. -/
def frontmatterLines (path : FilePath) (contents : String) : IO (List String) := do
  match contents.splitOn "\n" with
  | first :: rest =>
    unless first.trimAscii.copy.startsWith "---" do
      fail path "no frontmatter: first line must open with ---"
    let block := rest.takeWhile (fun l => l.trimAscii.copy ≠ "---")
    unless rest.length > block.length do
      fail path "unterminated frontmatter: no closing ---"
    pure block
  | [] => fail path "empty file"
