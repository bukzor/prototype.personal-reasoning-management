# Lean4 — the substrate bought

`DECISION` bought this one. The deciding fact is `NATIVE`: Lean4 is the only
candidate whose metalanguage is its object language, so the ledger can be
*written in the thing it is a ledger of* rather than wrapped around it from
outside.

## What NATIVE actually means here

- `structure ClaimMeta` for the ledger row; `inductive Depth` for
  `DEPTH_ATTEST`'s three artifact levels.
- A `PersistentEnvExtension` keyed by claim hash is the registry. It rides in
  the `.olean`s, so it survives imports and module boundaries with no external
  file — `NO_SIDECAR` holds by construction rather than by discipline.
- `CMD_SURFACE` verbs are `elab` commands in `Lean.Elab.Command`, so the LSP
  gives hover, goto and completion on them for free.
- `INTROSPECT`: `#trustbase` is `collectAxioms` plus a walk over the hypothesis
  bundles; `#stale` is a metaprogram over the environment. Both are *derived*,
  so the ledger cannot disagree with the proofs.

`HYP_FIAT` encodes idiomatically: a stipulation is a `structure Frame where
(h1 : P1) ...`, an assertion is `theorem c (f : Frame) : Q`, and the trust base
is the bundle's fields plus `#print axioms`. Never `axiom` for a ledger
stipulation — that is `NO_AXIOMS`, and it is the one rule whose violation is
silent.

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
- `HASH_FORMAL` — hash the pre-elaboration `Syntax` tree, not the elaborated
  term. Instances, universe metavariables and literal desugaring make elaborated
  identity version-unstable, and cross-version stability is unsolvable at the
  term level. Accept re-verification on toolchain bumps rather than fighting it.
- `TRUST_COST` — the verdict machinery runs in the elaborator, not the kernel,
  so the tooling sits inside the thing being audited. `AUDIT_SPOKE`
  (lean4export + lean4checker in CI) is the hedge, and the only one available
  since `TRUST_SWAP` is forfeit.
