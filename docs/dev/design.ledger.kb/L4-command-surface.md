# L4 — Command surface

The object intended to be frozen: the verbs a user of the system actually
touches. Abstract by design, but with `DECISION` closed it has exactly one
realization, and the claims below state it.

- CMD_SURFACE <- NATIVE, DESIGN_FIAT: The frozen object is four authoring verbs — claim / describe / stipulate / assert — plus three query commands — `#status` / `#stale` / `#trustbase`. Warranting is not a verb: it is what the kernel accepting a proof, or an authority tag on a stipulation, already does. Realized as `elab` commands in `Lean.Elab.Command`, so the LSP serves them like any other syntax
- VERB_TARGETS <- HYP_FIAT, DEPTH_ATTEST: Verb targets: `claim` → ledger row only (shallow); `describe` → a `def stmt : Prop` that elaborates, hash stored, no proof demanded; `stipulate` → a hypothesis-bundle `structure Frame`, each field registered as an STIP claim with an authority; `assert` → `theorem c (f : Frame) : Q`, with dependency edges walked out of the proof term (proven)
- NO_AXIOMS <- CHECKER, VERDICT: Verdict-claims live in the ledger only, never as host axioms
- IMPORT_FITS <- NO_AXIOMS, VERDICT, CHECKER: A certification imported from another system is a verdict-claim already — authority = {foreign kernel + version, translator + version, alignment map, proving logic} — so foreign proofs never contaminate the host, and no new node type is needed to accept them
- V1_CHECKERS <- CHECKER, DELEGATE, INTROSPECT: v1 checkers = host kernel + staleness scanner; `#stale` compares each dependent's recorded hash against its dependency's current one, exposed both as a metaprogram and as `lake exe scan` for CI, and `#trustbase` is `collectAxioms` over the bundle fields
- NO_SIDECAR <- NATIVE: Persistence is host-native state — a `PersistentEnvExtension` keyed by claim hash, riding in the `.olean`s, so the ledger survives imports with no external file
