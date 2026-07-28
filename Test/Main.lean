import Test.Basic

/-! Runtime half of the harness: `lake test` fails on a nonzero exit. The two
halves catch different things — `#guard` reduces in the kernel at build time,
this runs compiled code — so the skeleton exercises both. -/

def main : IO UInt32 := do
  if sampleRow != sampleRow then
    IO.eprintln "ClaimMeta equality broken at runtime: sampleRow ≠ itself"
    return 1
  if sampleRow == { sampleRow with text := "a different claim" } then
    IO.eprintln "ClaimMeta equality broken at runtime: distinct rows compare equal"
    return 1
  return 0
