---
status: asserted
likelihood: 0.8
sources:
  - ../sources.kb/design-sketch.md
tags: [design]
---

# The design sketch settles the repo shape

Defeasibility is *not* encoded as non-monotonic proof search: claims are
object-level ledger entries in a `PersistentEnvExtension` (riding in
`.olean`s), authored via five elaborator verbs (`claim`, `describe`,
`stipulate`, `assert`, `#status`/`#stale`/`#trustbase`). Depth is
attested by artifact (shallow → described → proven); stipulations are
hypothesis-bundle `Frame` structures, never `axiom`s; retraction pressure
surfaces as staleness (content-hash mismatch), scanned by metaprogram.

Setup consequences:
- Repo = `Ledger/` library + `Corpus/` modules + `lake exe scan`.
- CI = lean-action **plus** `lake exe scan` (fail on stale) plus a later
  lean4export/lean4checker external-audit step.
- Sketch specifies `lakefile.lean`; `lakefile.toml` would also carry
  these targets — pick at `lake init` time.
- Heavy elaborator metaprogramming from step 3 on; Batteries linter/
  command patterns are the reference material.

Deeper design discussion deferred at bukzor's request (2026-07-27).
