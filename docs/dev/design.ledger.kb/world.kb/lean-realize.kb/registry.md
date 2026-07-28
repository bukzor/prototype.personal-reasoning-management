# Registry — data model and persistence

`structure ClaimMeta` is the ledger row; `inductive Depth` carries
`DEPTH_ATTEST`'s three artifact levels.

The registry is a `PersistentEnvExtension` keyed by claim hash. It rides in
the `.olean`s, so it survives imports and module boundaries with no external
file — `NO_SIDECAR` holds by construction rather than by discipline.
