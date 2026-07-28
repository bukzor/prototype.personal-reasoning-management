import Ledger
import Corpus.Generated

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

/-! The quotient is mechanical only: trailing whitespace, wrap (with its
indentation), and line endings vanish; internal whitespace is identity. -/

#guard ContentHash.quotient "  a sample  claim \n  wrapped\r\n\n" = "a sample  claim wrapped"
#guard ContentHash.ofText "a claim\nwrapped" = ContentHash.ofText "a claim wrapped"
#guard ContentHash.ofText "a claim" ≠ ContentHash.ofText "a  claim"
#guard ContentHash.ofText "" = ContentHash.fnvOffset

/-! The generated corpus is untrusted (`UNTRUSTED_XLATE`): re-derive its
claims in the kernel — the row is present, and the hash literal `gen` emitted
is what the library's own hash function computes from the emitted text. -/

#guard Corpus.ledger.map (·.row.label) = [`ASSERT, `LEAST_FIX]
#guard Corpus.C.LEAST_FIX.hash = ContentHash.ofText Corpus.C.LEAST_FIX.text
