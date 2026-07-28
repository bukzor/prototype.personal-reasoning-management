# LEAN_REALIZE facets — maintenance

One file per realization facet: the Lean4 mechanism discharging one cluster of
`host` commitments. The `LEAN_REALIZE+` claim line in `../../world.md` stays
authoritative and carries the headline mapping; these files carry the
mechanics.

## What belongs here

- The concrete Lean feature chosen for a `host` commitment, the shape of its
  use, and the defect or cost that forced the choice.
- The rejected Lean-level alternative, when a reader would otherwise re-propose
  it.

## What does not

- **Why Lean won** — `../lean4-native.md` (the substrate assessment).
- **Substrate-free commitments** — `../../host.md`. If a sentence holds for any
  engine, it is a `host` claim, not a facet.
- **Toolchain facts we depend on** (does `lake` do X) —
  `../../../initial-setup.discourse.kb/`.

## When to add or revise

A facet file per mechanism, not per claim — one file may discharge several
`host` claims. Revise in place as the realization changes; each file states
today's realization, not a log of them.
