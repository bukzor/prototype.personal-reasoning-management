# Lean4

The only arm that can absorb `CMD_SURFACE` as native syntax rather than wrap it
from outside. That single fact decides most of its scoring.

## Against DAILY_CRITERIA

- **CLI**: `elan` + `lake` is the only genuinely modern toolchain in the set —
  reproducible pins, real package manager, incremental `.olean` builds.
- **Syntax**: the command surface can be *actual Lean syntax* — `claim`,
  `stipulate`, `assert` as `elab` commands, `#status` as a query command,
  staleness as a `lake` facet. Hover, go-to-definition and completion come free
  from the LSP because the verbs are language constructs.
- **CI**: fast without mathlib; tolerable with it via `lake exe cache get`.
- **Snappiness**: good incremental, mediocre cold. Elaboration is the slow part;
  a ledger-scale corpus — thousands of small claims, not mathlib — stays in the
  seconds range.

## Against AXES

Self-hosting metaprogramming makes it the only arm where the meta-language is
the object language. Bundled structures make `VERB_TARGETS`' telescope encoding
idiomatic rather than contorted.

## Cost

Toolchain churn. Point releases break syntax and metaprograms with some
regularity, and custom `elab` commands are exactly the exposed surface. The arm
with the best `ENC_CHOICE` has the worst hash stability — the `HASH_FORMAL`
hazard lands hardest here.
