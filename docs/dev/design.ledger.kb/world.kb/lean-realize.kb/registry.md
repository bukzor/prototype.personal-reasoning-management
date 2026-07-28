# Registry — the ledger as a value

The registry is an object-language value: `ledger : Ledger`, ordinary data —
per-claim id, surface text, content hash, premises, authority, standing — in a
generated module (`Corpus/Generated.lean`, see `translator.md`). A value can be
quantified over — `∀ c ∈ ledger, …` is a theorem statement — which is what
`LAW` and `SELF_APPLY` require.

`structure ClaimMeta` is the row; `inductive Depth` carries `DEPTH_ATTEST`'s
artifact levels, and depth is data: described attaches `stmt : Prop`, proven
bundles `pf : stmt`. The term contains its proofs, so deepening appends an
artifact to a hash and never migrates the claim — `MONOTONE` by construction.

Persistence is the source file itself: the generated module lives in version
control and compiles to `.olean`s like any definition — `NO_SIDECAR` with no
runtime state at all. The rejected branch, a `PersistentEnvExtension` keyed by
claim hash, survived imports but was elaborator state: queryable by
metaprograms, not quantifiable as a term, and invisible to lean4export.
