import Ledger

/-! Compile-time half of the harness. A false `#guard` is an elaboration
error, so it fails `lake build` before the runtime driver ever starts.

The samples push the derived `DecidableEq` through every core type —
`ClaimMeta` embeds `Verdict`, `Degree` (Rat), `Source`, and `Lean.Name` —
reducing in the kernel exactly as the `Ledger/Laws.lean` `by decide` will. -/

def sampleVerdict : Verdict :=
  { source := .user, judged := 0xa3f0, date := "2026-07-28" }

def sampleRow : ClaimMeta :=
  { label := `SAMPLE, hash := 0xa3f0, text := "a sample claim",
    premises := [`OTHER], evidence := [sampleVerdict] }

#guard sampleRow = sampleRow
#guard sampleRow ≠ { sampleRow with text := "a different claim" }
#guard sampleVerdict.degree = { truth := 1, certainty := 1, utility := 1 }

/-- A depth artifact bundling its own proof term elaborates and type-checks. -/
def sampleClaim : Claim :=
  { row := sampleRow, depth := .proven (1 + 1 = 2) (by decide) }
