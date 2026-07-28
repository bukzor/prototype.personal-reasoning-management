import Ledger.Core
import Ledger.Hash
import Gen.Common

/-! # `lake exe gen` -- corpus/ frontmatter to `Corpus/Generated.lean`

The authoring surface is llm-kb markdown; the record is Lean
(`SURFACE_SPLIT`). This generator parses `corpus/**.kb/*.md` frontmatter into
registry rows -- generation, not elab-time IO, so the artifact is diffable in
review and export tools see plain Lean (`UNTRUSTED_XLATE`).

Determinism is load-bearing: CI regenerates and requires `git diff` clean, so
output depends only on corpus content -- files in sorted path order, dates
from frontmatter (an `authority:` without a `date:` is an error; the
generator never invents evidence).

The frontmatter subset is flat and canonical -- one `key: value` per line,
`premises` as a flow list -- because the round-trip printer must reproduce it
byte-exact. -/

open System

/-- One corpus claim, as authored. -/
structure Entry where
  /-- Source file, for provenance comments and error messages. -/
  path : FilePath
  /-- The claim label, a plain identifier. -/
  label : String
  /-- The surface statement (hash input, after the quotient). -/
  text : String
  /-- Premise labels (`ARROWS!`); motivation, not entailment. -/
  premises : List String := []
  /-- Stipulating authority, when present; only `user` is understood. -/
  authority : Option String := none
  /-- Judgment date for the authority's verdict, ISO 8601. -/
  date : Option String := none
  /-- Formal statement (`stmt:`), a Lean proposition -- the `describe` verb. -/
  stmt : Option String := none
  /-- Proof tactics (`proof:`) discharging `stmt` -- the `assert` verb. -/
  proofTactic : Option String := none

/-- A label must be a plain Lean identifier: no escaping in the emitter. -/
def validLabel (s : String) : Bool :=
  !s.isEmpty && !s.front.isDigit
    && s.foldl (fun ok c => ok && (c.isAlphanum || c == '_')) true

/-- Parse one `key: value` frontmatter line. -/
def parseLine (path : FilePath) (line : String) : IO (String × String) := do
  match line.splitOn ":" with
  | key :: rest =>
    if rest.isEmpty then
      fail path s!"not a key: value line: {line}"
    else
      pure (key.trimAscii.copy, (String.intercalate ":" rest).trimAscii.copy)
  | [] => fail path s!"not a key: value line: {line}"

/-- Parse a flow list `[A, B]` into its elements. -/
def parseFlowList (path : FilePath) (value : String) : IO (List String) := do
  let inner := value.trimAscii.copy
  unless inner.startsWith "[" && inner.endsWith "]" do
    fail path s!"expected a flow list [A, B], got: {value}"
  pure <| ((inner.drop 1).dropEnd 1).copy.splitOn ","
    |>.map (·.trimAscii.copy) |>.filter (· ≠ "")

/-- Parse the frontmatter block of one corpus file into an `Entry`. Body
text below the closing `---` is kb prose, not record. -/
def parseFile (path : FilePath) : IO Entry := do
    let contents ← IO.FS.readFile path
    let block ← frontmatterLines path contents
    let mut entry : Entry :=
      { path, label := "", text := "" }
    for line in block do
      if line.trimAscii.copy.isEmpty then
        continue
      let (key, value) ← parseLine path line
      match key with
      | "claim" => entry := { entry with label := value }
      | "text" => entry := { entry with text := value }
      | "premises" => entry := { entry with premises := ← parseFlowList path value }
      | "authority" => entry := { entry with authority := some value }
      | "date" => entry := { entry with date := some value }
      | "stmt" => entry := { entry with stmt := some value }
      | "proof" => entry := { entry with proofTactic := some value }
      | _ => fail path s!"unknown frontmatter key: {key}"
    unless validLabel entry.label do
      fail path s!"claim label must be a plain identifier, got: {entry.label}"
    if entry.text.isEmpty then
      fail path "missing text:"
    unless entry.premises.all validLabel do
      fail path s!"premise labels must be plain identifiers: {entry.premises}"
    match entry.authority with
    | some "user" =>
      if entry.date.isNone then
        fail path "authority: without date: -- the generator never invents evidence"
    | some other => fail path s!"unsupported authority: {other}"
    | none => pure ()
    if entry.stmt == some "" then
      fail path "empty stmt:"
    if entry.proofTactic == some "" then
      fail path "empty proof:"
    if entry.proofTactic.isSome && entry.stmt.isNone then
      fail path "proof: without stmt: -- nothing to prove"
    unless validLabel (theoryOf path) do
      fail path s!"theory directory must be a plain identifier: {theoryOf path}"
    pure entry

/-- Render a `UInt64` as padded hex, matching how humans cite hashes. -/
def hex (n : UInt64) : String :=
  let digits := String.ofList <| Nat.toDigits 16 n.toNat
  "0x" ++ "".pushn '0' (16 - digits.length) ++ digits

/-- Emit one registry row definition. -/
def emitRow (e : Entry) : String :=
  let h := hex <| ContentHash.ofText e.text
  let premises := e.premises.map (s!"`{·}")
  let evidence := match e.authority, e.date with
    | some "user", some date =>
      s!"[\{ source := .user, judged := {h}, date := {reprStr date} }]"
    | _, _ => "[]"
  s!"/-- Registry row generated from `{e.path}`. -/
def C.{e.label} : ClaimMeta where
  label := `{e.label}
  hash := {h}
  text := {reprStr e.text}
  premises := [{String.intercalate ", " premises}]
  evidence := {evidence}"

/-- Emit the formal statement a claim's `stmt:` line authors
(`DEPTH_ATTEST`). Adjacency to the row is the pin -- the elaborator makes a
missing or ill-typed artifact a build failure. `abbrev` so proofs and
`decide` can see through the name. -/
def emitStmt (e : Entry) : Option String :=
  e.stmt.map fun s =>
    s!"/-- Formal statement authored for `{e.label}`: the claim made
propositional. Reducible so proofs can see through the name. -/
abbrev C.{e.label}.stmt : Prop := {s}"

/-- Emit a theory's frame (`FRAME_BUNDLE+`): one field per stipulation,
typed by its formal statement when described, `True` when informal -- named
in the trust base either way. Never `axiom` (`NO_AXIOMS`). -/
def emitFrame (theory : String) (entries : List Entry) : String :=
  let fields := entries.filterMap fun e =>
    if e.authority.isSome then
      let ty := match e.stmt with
        | some _ => s!"C.{e.label}.stmt"
        | none => "True"
      some s!"  /-- Stipulated (`STIP`): granted by its authority, not proven. -/
  {e.label} : {ty}"
    else none
  let header := s!"/-- Hypothesis bundle for theory `{theory}`: its stipulations,
threaded explicitly through every proof (`FRAME_BUNDLE+`). -/
structure Frame.{theory}"
  if fields.isEmpty then header
  else header ++ " where\n" ++ String.intercalate "\n" fields

/-- Emit a claim's proof theorem. Every proof threads its theory's frame,
used or not -- a claim's shape never changes when a frame dependency
appears -- so the unused-binder lint is off for the one declaration. -/
def emitProof (theory : String) (e : Entry) : Option String :=
  e.proofTactic.map fun p =>
    s!"set_option linter.unusedVariables false in
/-- Proof authored for `{e.label}`: `stmt` discharged under the
theory's frame. -/
@[nolint unusedArguments]
theorem C.{e.label}.pf (f : Frame.{theory}) : C.{e.label}.stmt := by {p}"

/-- The `Depth` cell an entry's authored artifacts pay for. A proven cell
records the hypothetical judgment: under the theory's frame, the statement. -/
def depthCell (theory : String) (e : Entry) : String :=
  match e.stmt, e.proofTactic with
  | none, none => ".stated"
  | some _, none => s!".described C.{e.label}.stmt"
  | some _, some _ =>
    s!".proven (Frame.{theory} → C.{e.label}.stmt) C.{e.label}.pf"
  | none, some _ => panic! "proof without stmt survived parseFile"

/-- Bucket sorted entries by theory; sorting made each theory contiguous. -/
def groupByTheory (entries : List Entry) : List (String × List Entry) :=
  entries.foldr (init := []) fun e acc =>
    let t := theoryOf e.path
    match acc with
    | (t', es) :: rest =>
      if t == t' then (t, e :: es) :: rest else (t, [e]) :: (t', es) :: rest
    | [] => [(t, [e])]

/-- Emit the whole generated module, theory by theory: statements and rows,
then the frame they pay into, then the proofs that draw on it. -/
def emit (entries : Array Entry) : String :=
  let groups := groupByTheory entries.toList
  let decls := groups.flatMap fun (theory, es) =>
    es.flatMap (fun e => (emitStmt e).toList ++ [emitRow e])
      ++ [emitFrame theory es]
      ++ es.filterMap (emitProof theory)
  let cells := groups.flatMap fun (theory, es) =>
    es.map fun e => s!"  \{ row := C.{e.label}, depth := {depthCell theory e} }"
  String.intercalate "\n\n" <| (
    ["-- Generated by `lake exe gen`; do not edit (`UNTRUSTED_XLATE`).
import Ledger.Core
-- declares the `unusedArguments` linter the proof theorems nolint
import Batteries.Tactic.Lint.Misc

namespace Corpus"]
    ++ decls
    ++ [s!"/-- The registry (`NATIVE!`), one row per corpus claim, in
sorted-path order. -/
def ledger : Ledger := [
{String.intercalate ",\n" cells}]

end Corpus
"])

def main : IO UInt32 := do
  let files ← corpusFiles "corpus"
  let entries ← files.mapM parseFile
  let labels := entries.map (·.label)
  for e in entries do
    if (labels.filter (· == e.label)).size > 1 then
      fail e.path s!"duplicate claim label: {e.label}"
  IO.FS.writeFile "Corpus/Generated.lean" (emit entries)
  IO.println s!"gen: {entries.size} claims -> Corpus/Generated.lean"
  return 0
