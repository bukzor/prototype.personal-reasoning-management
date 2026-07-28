import Test.Basic

/-! Runtime half of the harness: `lake test` fails on a nonzero exit. The two
halves catch different things — `#guard` reduces in the kernel at build time,
this runs compiled code — so the skeleton exercises both. -/

def main : IO UInt32 := do
  if hello != "world" then
    IO.eprintln s!"expected hello = \"world\", got {hello}"
    return 1
  return 0
