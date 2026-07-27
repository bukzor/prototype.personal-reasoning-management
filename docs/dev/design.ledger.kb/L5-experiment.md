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
- SPLIT <- PLEASURE_RANK, LEDGER_BESIDE: Pleasure decomposes along the ledger-beside-engine seam: ledger pleasure is maximized by Metamath by an order of magnitude, authoring pleasure by Lean4 — but only until MM_IMPROVABLE lands, since owned tooling moves Metamath's authoring ceiling
- HYBRID? <- SPLIT, PROCURE: Procurement may have no single-substrate answer — a Lean4-authoring / Metamath-or-Dedukti-checking split, promoting DEDUKTI, is the configuration that would feel good end-to-end
- TRIVIAL_CHECK: Metamath verification is trivial by design — direct substitution, no unification-modulo-reduction, no elaboration in the kernel — so any authoring tool gets a millisecond-latency oracle for proof correctness
- GRAMMAR_AUTO <- TRIVIAL_CHECK: The grammatical layer is mechanically solvable — roughly a third of set.mm-style proof steps are grammar, unambiguously parseable and auto-derived since mmj2 — leaving the logical layer as the only real authoring problem
- UNIFY_ASSIST: The logical layer admits cheap assistance: unify a partial proof with work variables against the database — decidable, fast, fifteen-year-old technology
- MM1_EXISTS: MM0/MM1 is already "own surface syntax + custom LSP over a Metamath-class kernel", built by the person who knows Metamath's internals best — both a design validation and a possible adoption target
- KNIFE: metamath-knife is library-shaped, incremental and parallel, explicitly built to support language-server use — the engine for a custom LSP exists as a crate
- T1_ADOPT <- MM1_EXISTS: Trial MM1/mm0-rs as the authoring surface directly, ~days — answers "could this be pleasant" empirically before any code, at the cost of a dialect and a research tool's bus factor
- T2_WRAP <- KNIFE: A metamath-knife LSP and CLI — diagnostics, hover, goto, unify-on-hole — ~2-3 weeks, keeping raw `.mm` as storage; unconditional, because the CLI half is ledger work regardless
- T3_SURFACE? <- TRIVIAL_CHECK, GRAMMAR_AUTO: A declarative front-end with holes and a small fixed tactic set elaborating to `.mm` proof trees, ~3 person-months; feasible because the target is dumb and the checker instant, but it means permanently maintaining a proof language
- LIB_LEVERAGE <- CORPUS: set.mm's ~40k theorems are what offset Metamath's authoring cost; a bespoke surface keeps them only by round-tripping set.mm conventions, which then leak upward into it — weakened by building an own library either way, not eliminated
- MM_IMPROVABLE <- TRIVIAL_CHECK, MM1_EXISTS, KNIFE: Metamath authoring is improvable to genuinely pleasant — trivial verification makes it the easiest substrate in the set to tool, and MM0/MM1 proves the full design works; ladder is T1_ADOPT, then T2_WRAP, then T3_SURFACE only if the experiment survives that far
- TWO_POLES? <- MM_IMPROVABLE, PLEASURE_RANK: The real head-to-head is Lean4's inherited ecosystem against Metamath-plus-owned-tooling — convenience rented against austerity owned
