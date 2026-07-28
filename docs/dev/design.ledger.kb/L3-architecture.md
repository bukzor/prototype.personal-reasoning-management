# L3 — Architecture

How the ledger meets a host proof engine. The level that makes the encoding
commitments (`HYP_FIAT`, `HASH_FORMAL`, `NATIVE`); everything above it is
substrate-free by construction.

- HOST_DB: "Claim S has status P" is always encodable as further host declarations; the host environment is already a persistent claim database
- DELEGATE!: All proving is delegated to the host engine; the system never evaluates entailment -- authority: user
- FIAT_FORMS <- STIP: Stipulations admit two host encodings — global (environment-level fiat) and hypothetical (context-level: telescopes, sections, locales, frames); hypothetical fiat makes TRUST_BASE kernel-visible in the claim itself
- HYP_FIAT! <- FIAT_FORMS, HYP_CONTENT: Hypothetical fiat is the sole encoding for ledger-authored stipulations, all substrates; host-library global axioms are boundary conditions in TRUST_BASE, out of scope -- authority: user
- FIAT_SHIFT <- HYP_FIAT!, VERDICT: A ledger stipulation is never proven in the host, only assumable — provenness-by-fiat is a ledger status, not a host fact; recorded as a deliberate reinterpretation of "proven by fiat"
- HASH_FORMAL <- HASH_ID: Hashing formal content is a per-substrate commitment, made here; L2 identity stays surface-only. In Lean4 the hashed object is the pre-elaboration `Syntax` tree, since elaborated terms are version-unstable; cross-version stability is unsolvable at the term level, so toolchain bumps re-baseline and re-verify
- TRUST_SWAP <- TRUST_BASE: Re-checking an exported proof drops the foreign kernel out of the trust base, replacing it with {re-checker + logic encoding + translator}; since that checker is small and the encodings are published, it is a strict trust improvement
- NATIVE! <- DELEGATE!, HOST_DB, HASH_ID: The ledger is not bookkeeping beside the engine but objects inside it — claims are host declarations, the registry is a host environment extension, verdicts are metaprograms over real proof terms; HOST_DB stops being an analogy and becomes the implementation. Available only in a self-hosting metalanguage, hence only in Lean4 -- authority: user
- INTROSPECT <- NATIVE!: Status, trust base and staleness are computed from the environment rather than maintained alongside it, so the ledger cannot drift from the proofs; TRUST_BASE and STALE_PROP get stronger under NATIVE, not weaker
- TRUST_COST <- NATIVE!, TRUST_SWAP: NATIVE forfeits TRUST_SWAP — verdict machinery runs in the elaborator, not the kernel, so a bug in it can misreport (it cannot fake a proof), and the tooling sits inside the thing being audited
- AUDIT_SPOKE <- TRUST_COST, CHECKER: One backward-pointing spoke caps TRUST_COST: export the corpus and re-check it under an external kernel in CI (lean4export + lean4checker today), as an archival and audit channel rather than a workflow component
- ENC_CHOICE <- HOST_DB: An unforced encoding choice selects which experiment runs; it must be explicit and recorded with an author
