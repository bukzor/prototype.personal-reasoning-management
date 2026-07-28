import Corpus.Generated
import Gen.Common

/-! # `lake exe roundtrip` -- print the value back, diff clean

The generator is untrusted (`UNTRUSTED_XLATE`). This printer maps the
*compiled* registry value back to canonical frontmatter and compares it to
the authored surface byte for byte. It shares no parsing with `gen` -- rows
pair with files positionally, through the one sorted traversal -- so a parser
bug cannot cancel itself out: either the surfaces match, or CI dies here.

The comparison also enforces canonical authoring form: bare `---` delimiters,
key order claim, authority, date, premises, text, no blank lines. -/

open System

/-- Print a row back to canonical frontmatter, delimiters included. -/
def printFrontmatter (path : FilePath) (row : ClaimMeta) : IO (List String) := do
  let mut lines := ["---", s!"claim: {row.label}"]
  match row.evidence with
  | [] => pure ()
  | [v] =>
    unless v.source == .user do
      fail path s!"{row.label}: only user authority has a surface form"
    unless v.judged == row.hash do
      fail path s!"{row.label}: stale evidence has no surface form"
    lines := lines ++ ["authority: user", s!"date: {v.date}"]
  | _ => fail path s!"{row.label}: multiple verdicts have no surface form yet"
  unless row.premises.isEmpty do
    let labels := row.premises.map (·.toString)
    lines := lines ++ [s!"premises: [{String.intercalate ", " labels}]"]
  pure <| lines ++ [s!"text: {row.text}", "---"]

def main : IO UInt32 := do
  let files ← corpusFiles "corpus"
  let rows := Corpus.ledger.map (·.row)
  if files.size ≠ rows.length then
    IO.eprintln s!"roundtrip: {files.size} corpus files vs {rows.length} rows -- run lake exe gen"
    return 1
  let mut ok := true
  for (path, row) in files.toList.zip rows do
    let contents ← IO.FS.readFile path
    let authored := "---" :: (← frontmatterLines path contents) ++ ["---"]
    let printed ← printFrontmatter path row
    unless authored == printed do
      ok := false
      IO.eprintln s!"roundtrip mismatch: {path}"
      IO.eprintln s!"  authored: {authored}"
      IO.eprintln s!"  printed:  {printed}"
  unless ok do return 1
  IO.println s!"roundtrip: {files.size} files match the compiled value"
  return 0
