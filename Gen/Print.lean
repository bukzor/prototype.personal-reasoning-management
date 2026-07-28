import Corpus.Generated
import Gen.Common

/-! # `lake exe roundtrip` -- print the value back, diff clean

The generator is untrusted (`UNTRUSTED_XLATE`). This printer maps the
*compiled* registry value back to canonical frontmatter and compares it to
the authored surface byte for byte. It shares no parsing with `gen` -- rows
pair with files positionally, through the one sorted traversal -- so a parser
bug cannot cancel itself out: either the surfaces match, or CI dies here.

Depth artifacts (`stmt:`/`proof:`) have no printable value -- a compiled
`Prop` keeps no surface -- so they are audited from the other two ends: the
compiled `Depth` constructor must be the one the authored keys pay for, and
the generated module text must contain the exact declaration line each
authored key dictates, restated here independently of the emitter so an
emitter bug cannot vouch for itself.

The comparison also enforces canonical authoring form: bare `---` delimiters,
key order claim, authority, date, premises, text, stmt, proof, no blank
lines. -/

open System

/-- Extract a `key:` line's value from the authored block -- whole rest of
line, so embedded colons survive. Deliberately not `gen`'s parser. -/
def findKey (block : List String) (key : String) : Option String :=
  block.findSome? fun l =>
    if l.startsWith (key ++ ":") then
      some ((l.drop (key.length + 1)).copy.trimAscii.copy)
    else none

/-- The load-bearing declaration line each authored artifact must have
produced in the generated module; docstrings and layout stay decor. -/
def expectedDecls (label : Lean.Name) (stmt proofTactic : Option String) :
    List String :=
  (stmt.map fun s => s!"abbrev C.{label}.stmt : Prop := {s}").toList
    ++ (proofTactic.map fun p =>
      s!"theorem C.{label}.pf : C.{label}.stmt := by {p}").toList

/-- Does the compiled depth match what the authored keys pay for? -/
def depthMatches : Depth → Option String → Option String → Bool
  | .stated, none, none => true
  | .described _, some _, none => true
  | .proven _ _, some _, some _ => true
  | _, _, _ => false

/-- Print a row back to canonical frontmatter, delimiters included. The
`stmt`/`proof` values are echoed from the authored block -- their fidelity
check lives in `expectedDecls` -- so here they only pin canonical form and
position. -/
def printFrontmatter (path : FilePath) (row : ClaimMeta)
    (stmt proofTactic : Option String) : IO (List String) := do
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
  pure <| lines ++ [s!"text: {row.text}"]
    ++ (stmt.map (s!"stmt: {·}")).toList
    ++ (proofTactic.map (s!"proof: {·}")).toList
    ++ ["---"]

def main : IO UInt32 := do
  let files ← corpusFiles "corpus"
  if files.size ≠ Corpus.ledger.length then
    IO.eprintln s!"roundtrip: {files.size} corpus files vs {Corpus.ledger.length} claims -- run lake exe gen"
    return 1
  let genText ← IO.FS.readFile "Corpus/Generated.lean"
  let mut ok := true
  for (path, claim) in files.toList.zip Corpus.ledger do
    let row := claim.row
    let contents ← IO.FS.readFile path
    let block ← frontmatterLines path contents
    let stmt := findKey block "stmt"
    let proofTactic := findKey block "proof"
    unless depthMatches claim.depth stmt proofTactic do
      ok := false
      IO.eprintln s!"roundtrip mismatch: {path}"
      IO.eprintln s!"  {row.label}: compiled depth disagrees with authored stmt:/proof: keys"
    for want in expectedDecls row.label stmt proofTactic do
      unless (genText.splitOn want).length > 1 do
        ok := false
        IO.eprintln s!"roundtrip mismatch: {path}"
        IO.eprintln s!"  generated module lacks: {want}"
    let authored := "---" :: block ++ ["---"]
    let printed ← printFrontmatter path row stmt proofTactic
    unless authored == printed do
      ok := false
      IO.eprintln s!"roundtrip mismatch: {path}"
      IO.eprintln s!"  authored: {authored}"
      IO.eprintln s!"  printed:  {printed}"
  unless ok do return 1
  IO.println s!"roundtrip: {files.size} files match the compiled value"
  return 0
