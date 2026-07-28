import Ledger.Core
import Corpus.Generated

/-! # Laws (`LAW`)

Laws are kernel-checked theorems about the registry value, quantifying over
the decidable projection `ledger.map (·.row)` (`PROJECTION`). `by decide` is
comfortable to ~10^4 claims; per-law escalation to `native_decide` would be a
recorded trade of the compiler into that law's trust base (`TRUST_COST`),
never a default. -/

/-- The judge is on record (`NAME_THE_JUDGE!`): nothing anonymous. -/
def Source.named : Source → Bool
  | .user => true
  | .agent name => !name.isEmpty
  | .checker name version => !name.isEmpty && !version.isEmpty
  | .imported doc => !doc.isEmpty

/-- Every premise arrow lands on a row of the registry (`ARROWS!`): premises
are motivation, not entailment, but a motivation pointing at nothing is a
dangling reference, not a claim. -/
abbrev premisesResolve (rows : List ClaimMeta) : Prop :=
  ∀ c ∈ rows, ∀ p ∈ c.premises, ∃ d ∈ rows, d.label = p

/-- Every verdict carries its author (`STIP`, `NAME_THE_JUDGE!`): a named
judge and a date. Fiat without a recorded author would be an axiom in
disguise (`NO_AXIOMS`). -/
abbrev stipulationsAuthored (rows : List ClaimMeta) : Prop :=
  ∀ c ∈ rows, ∀ v ∈ c.evidence, v.source.named ∧ v.date ≠ ""

/-- Stale debt is bounded (`FALLOUT!`): a verdict whose `judged` hash is no
longer its claim's current hash is debt. No acknowledgment mechanism exists
yet, so the bound is zero -- every verdict pins the current hash. -/
abbrev staleDebtAcknowledged (rows : List ClaimMeta) : Prop :=
  ∀ c ∈ rows, ∀ v ∈ c.evidence, v.judged = c.hash

/-- Registry well-formedness: the conjunction the corpus must satisfy. -/
abbrev WellFormed (rows : List ClaimMeta) : Prop :=
  premisesResolve rows ∧ stipulationsAuthored rows ∧ staleDebtAcknowledged rows

/-- The corpus is well-formed -- checked by the kernel on every build
(`LAW`): building is checking. -/
theorem corpus_ok : WellFormed (Corpus.ledger.map (·.row)) := by decide
