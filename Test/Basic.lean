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

#guard Corpus.ledger.map (·.row.label)
  = [`DEMO_DESCRIBED, `DEMO_PROVEN, `ASSERT, `LEAST_FIX]
#guard Corpus.C.LEAST_FIX.hash = ContentHash.ofText Corpus.C.LEAST_FIX.text

/-! Depth artifacts (`DEPTH_ATTEST`): each generated cell carries the depth
its authored `stmt:`/`proof:` keys pay for, and a proven claim's proof term
re-checks in the kernel against its statement. -/

/-- Constructor tag of a `Depth`, for guards -- `Depth` itself carries
proof terms, so it has no `DecidableEq`. -/
def depthKind : Depth → String
  | .stated => "stated"
  | .described _ => "described"
  | .proven _ _ => "proven"

#guard Corpus.ledger.map (fun c => depthKind c.depth)
  = ["described", "proven", "stated", "stated"]

example : Corpus.C.DEMO_PROVEN.stmt := Corpus.C.DEMO_PROVEN.pf
example : Corpus.C.DEMO_DESCRIBED.stmt := fun n => Nat.add_zero n
