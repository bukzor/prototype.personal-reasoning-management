# L4 — Command surface

The object intended to be frozen: an abstract set of verbs, instantiated once
per substrate. What a user of the system actually touches.

- CMD_SURFACE <- NATIVE, DESIGN_FIAT: The fixed cross-substrate object is an abstract command surface — claim / describe / stipulate / assert / warrant / status / stale — instantiated via each host's extension or embedding mechanism
- VERB_TARGETS <- HYP_FIAT, DEPTH_ATTEST: Verb targets: shallow → ledger-only; described → statement object; stipulate → telescope extension (Lean bundled structures, Isabelle locales, Agda module parameters, Metamath `$e`-frames or antecedent form, ACL2 `encapsulate`); assert → warrant-application term submitted to the kernel; proven → host theorem
- NO_AXIOMS <- CHECKER, VERDICT: Verdict-claims live in the ledger only, never as host axioms
- IMPORT_FITS <- NO_AXIOMS, VERDICT, CHECKER: A certification imported from another system is a verdict-claim already — authority = {foreign kernel + version, translator + version, alignment map, proving logic} — so foreign proofs never contaminate the host, and no new node type is needed to accept them
- V1_CHECKERS <- CHECKER, DELEGATE, INTROSPECT: v1 checkers = host kernel + staleness scanner; TRUST_BASE delegates to native assumption tracking where present, and under NATIVE the scanner is a metaprogram over the environment rather than an external diff tool
- NO_SIDECAR <- NATIVE: Persistence is host-native state, no external sidecar in v1
