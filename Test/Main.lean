import Test.Basic

/-! Runtime half of the harness: `lake test` fails on a nonzero exit. The two
halves catch different things — `#guard` reduces in the kernel at build time,
this runs compiled code — so the skeleton exercises both. -/

open Lean in
/-- One small tree, parameterized so tests can vary source info and content
independently. `ContentHash.ofSyntax` is `partial`, so it only runs here, not
in the kernel. -/
def sampleTree (info : SourceInfo) (atomVal : String) : Syntax :=
  .node info `sample #[.atom info atomVal, .ident info "x".toRawSubstring `x []]

def main : IO UInt32 := do
  if sampleRow != sampleRow then
    IO.eprintln "ClaimMeta equality broken at runtime: sampleRow ≠ itself"
    return 1
  if sampleRow == { sampleRow with text := "a different claim" } then
    IO.eprintln "ClaimMeta equality broken at runtime: distinct rows compare equal"
    return 1
  if ContentHash.ofSyntax (sampleTree .none "+")
      != ContentHash.ofSyntax (sampleTree (.synthetic ⟨0⟩ ⟨9⟩) "+") then
    IO.eprintln "Syntax hash sees SourceInfo: identical trees hash differently"
    return 1
  if ContentHash.ofSyntax (sampleTree .none "+")
      == ContentHash.ofSyntax (sampleTree .none "-") then
    IO.eprintln "Syntax hash misses content: different atoms hash equal"
    return 1
  return 0
