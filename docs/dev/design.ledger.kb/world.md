# world

Named things: which engines exist, what they cost, and which one was chosen.
Disposable by design — the procurement question is closed (`DECISION`), and
what survives is the answer, its price, and the pole that lost.

- `prior:` host
- `ontology:` proper names — Lean4, mathlib, Batteries, Metamath, set.mm,
  MM0/MM1, metamath-knife, Dedukti/Lambdapi, Isabelle, ACL2, Agda — and version
  numbers
- `defeated by:` any of them changing — a release, a rewrite, a project dying

- PLEASURE_RANK <- DAILY_CRITERIA!, BASIS_API!: Only Lean4 satisfies all of DAILY_CRITERIA, because it absorbs BASIS_API! as native syntax and inherits the LSP; ranking is Lean4 > Metamath > Isabelle > ACL2 > Agda
- DAILY_LOOP <- DAILY_CRITERIA!, NATIVE!: The Lean4 loop is the best available in interactive theorem proving — sub-second incremental feedback, LSP hover/goto/completion on the ledger's own verbs for free, `exact?`/`simp`/`aesop`/`duper`, InfoView widgets for claim-graph rendering; a fully-built bespoke Metamath surface's ceiling is roughly Lean's floor
- ECOSYSTEM <- CORPUS!: Lean4 is where DTPL metatheory is currently done at scale, so for CORPUS the best-suited system was going to be Lean regardless; mathlib, Batteries, doc-gen and `lake` CI templates come with it
- CHURN <- NATIVE!: The rent on NATIVE is toolchain churn — the elaborator API is exactly the surface that moves. The registry-as-value realization keeps most machinery off it: no `elab` commands, no environment extensions, no widgets in the trunk; what rides the moving API is `Syntax` hashing and the generator. Budget 1-2 days per quarter of maintenance, indefinitely. Metamath's rent was zero, which was its entire pitch
- PERF <- CORPUS!: Elaboration latency is the cost most warned about and the one that matters least here — a corpus of thousands of small claims with light mathlib dependence is minutes cold, seconds incremental, and `lake exe cache` covers CI
- TRIVIAL_CHECK: Metamath verification is trivial by design — direct substitution, no unification-modulo-reduction, no elaboration in the kernel — so any authoring tool gets a millisecond-latency oracle for proof correctness
- MM1_EXISTS: MM0/MM1 is already "own surface syntax + custom LSP over a Metamath-class kernel", built by the person who knows Metamath's internals best — both a design validation and a possible adoption target
- KNIFE: metamath-knife is library-shaped, incremental and parallel, explicitly built to support language-server use — the engine for a custom LSP exists as a crate
- MM_IMPROVABLE <- TRIVIAL_CHECK, MM1_EXISTS, KNIFE: Metamath authoring is improvable to genuinely pleasant — trivial verification makes it the easiest substrate in the set to tool, and MM0/MM1 proves the full design works; the cost is permanently maintaining a proof language solo (see `world.kb/metamath.md`)
- BUS_FACTOR: The Dedukti translator ecosystem is research software — small team, student-project translators, bit-rot — which is why any design making it load-bearing carries systemic risk
- DEDUKTI? <- AUDIT_SPOKE, BUS_FACTOR: Dedukti/Lambdapi is deferred, not load-bearing: a possible future AUDIT_SPOKE target alongside MM0 if the Lean4 translators mature (see `world.kb/dedukti-spine.md`)
- TWO_POLES <- MM_IMPROVABLE, PLEASURE_RANK, ALIGNMENT: There are exactly two poles and no third. Metamath-trunk = own everything, rent nothing — zero churn, canonical hashing, minimal trust, UX built by hand to a ceiling of responsive austerity. Lean4-native = rent the best tooling in the field — claims as first-class objects, ledger derived from ground truth, inherited LSP and automation — paying perpetual maintenance rent, fuzzy identity, and a larger trust base. Every hybrid between them buys ALIGNMENT back
- DECISION! <- TWO_POLES, DAILY_LOOP, CHURN: The decision variable is time horizon over maintenance tolerance, not taste: a system that must still verify untouched in 2036 is dominated by Metamath's zero-rent property; a system that earns its keep by daily use over the next three years is dominated by Lean4's UX compounding. For a daily-driver personal system with a sole maintainer, UX compounding beats the rent — all-in Lean4, with AUDIT_SPOKE as the hedge -- authority: user
- LEAN_REALIZE+ <- DECISION!, HASH_FORMAL, FRAME_BUNDLE+, LAW, UNTRUSTED_XLATE, NO_SIDECAR: Every `host` commitment's Lean4 realization, collected so `host` stays substrate-free — registry: `ledger : Ledger`, a value in a generated module; laws: `by decide` theorems, per-law `native_decide` a recorded trade; translator: llm-kb frontmatter → Lean source, round-tripped in CI; hashing: pre-elaboration `Syntax` tree; frames: explicit `structure`s; audit: lean4export + lean4checker. One facet, one file: `world.kb/lean-realize.kb/`
- SELF_HOST! <- DECISION!, CORPUS!: The first corpus is this ledger itself — port the prior theories (`stance`, `ledger`, `conduct`, `convention`) before any DTPL content, so the verb ergonomics get shaken out on claims whose content is already settled -- authority: user
- EXPT_COLLAPSE <- DECISION!, UNDOMINATED: The multi-arm experiment collapses rather than reframes — under DECISION, UNDOMINATED's own logic eliminates every arm but Lean4, so there is no arm set, no comparison axes, no build order and no freeze gate against foreign substrates. Lean4 is not arm one of five; it is the system
