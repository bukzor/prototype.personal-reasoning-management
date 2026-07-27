# L5 — Experiment

Disposable configuration: why the system is being built at all, on what
corpus, and against which substrates. Every claim here is expected to be
superseded once the procurement question closes.

- PROCURE: Purpose is procurement — selecting a daily substrate for the user's own reasoning system -- authority: user
- CORPUS: The claim corpus is dependently-typed-programming-language (DTPL) metatheory and verified implementation -- authority: user
- UNDOMINATED <- PROCURE: Candidate-set membership = undominated ∧ prima facie viable; dominated arms buy no procurement information
- ARM_SET <- UNDOMINATED, CORPUS: v1 arms = {Lean4, Isabelle/HOL, Metamath, Agda, ACL2}; Rocq excluded as dominated
- AXES <- CMD_SURFACE, ENC_CHOICE: Comparison axes: native absorption of CMD_SURFACE; meta-language identity (self- vs foreign-meta); native-twin density; proof relevance; telescope-composition ergonomics; trust-audit tooling
- MM_DESCRIBE <- VERB_TARGETS: Metamath has no native unproven-statement object; described = a wff whose grammar-parse is itself a proof, appearing in no `$a`/`$p` — so `describe` has a materially different realization there
- AGDA_AUDIT <- V1_CHECKERS: Agda has no per-theorem postulate-dependency query; that arm needs a bespoke trust and staleness scanner
- FREEZE_GATE <- AXES, MM_DESCRIBE: CMD_SURFACE freeze gate: desk-check all verbs against in-set corners (Metamath) and out-of-set ones (currently F\*) before freezing
- V2_SHORTLIST: v2 shortlist = {F\*}; {Rocq} contingent on revoking its dominance claim
- DEDUKTI <- CHECKER: Dedukti/Lambdapi recorded as candidate shared spine for cross-substrate hashing; deferred
- BUILD_ORDER <- TURN_SCARCITY, MM_DESCRIBE: Build order Lean4 → Metamath → Agda → Isabelle → ACL2; Metamath second because it falsifies CMD_SURFACE assumptions more cheaply than any other arm
- DAILY_CRITERIA <- PROCURE: The utility function is daily pleasure of use — snappy CLI, clean syntax, easy and fast CI, general snappiness -- authority: user
- PLEASURE_RANK <- DAILY_CRITERIA, CMD_SURFACE: Only Lean4 satisfies all of DAILY_CRITERIA, because it absorbs CMD_SURFACE as native syntax and inherits the LSP; ranking is Lean4 > Metamath > Isabelle > ACL2 > Agda (see L5-experiment.kb/)
- SPLIT <- PLEASURE_RANK, LEDGER_BESIDE: Pleasure decomposes along the ledger-beside-engine seam: ledger pleasure is maximized by Metamath by an order of magnitude, authoring pleasure by Lean4; no single arm maximizes both
- HYBRID? <- SPLIT, PROCURE: Procurement may have no single-substrate answer — a Lean4-authoring / Metamath-or-Dedukti-checking split, promoting DEDUKTI, is the configuration that would feel good end-to-end
