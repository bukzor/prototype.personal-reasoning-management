# Lean4 — the substrate bought

`DECISION` bought this one. The deciding fact is `NATIVE`: Lean4 is the only
candidate whose metalanguage is its object language, so the ledger can be
*written in the thing it is a ledger of* rather than wrapped around it from
outside.

How each `host` commitment lands in Lean4 is `LEAN_REALIZE+`'s job, one facet
per file in `lean-realize.kb/`. This file stays the assessment: what the
substrate scores, and what it costs.

## Against DAILY_CRITERIA

- **CLI**: `elan` + `lake` is the only genuinely modern toolchain in the set —
  reproducible pins, real package manager, incremental `.olean` builds.
- **Syntax**: the command surface is *actual Lean syntax*, staleness a `lake`
  facet.
- **CI**: fast without mathlib; tolerable with it via `lake exe cache get`.
- **Snappiness**: good incremental, mediocre cold — `PERF`, the cost everyone
  warns about and the one that matters least at ledger scale.

## The price

- `CHURN` — point releases break metaprograms, and `elab` commands plus
  environment extensions are exactly the exposed surface. Mitigation is
  structural: keep the command layer thin, put the logic in the core and scanner
  modules where the API is stable.
- `HASH_FORMAL` — accept re-verification on toolchain bumps rather than
  fighting for cross-version identity (mechanics: `lean-realize.kb/hashing.md`).
- `TRUST_COST` — the verdict machinery runs in the elaborator, not the kernel,
  so the tooling sits inside the thing being audited. `AUDIT_SPOKE`
  (lean4export + lean4checker in CI) is the hedge, and the only one available
  since `TRUST_SWAP` is forfeit.
