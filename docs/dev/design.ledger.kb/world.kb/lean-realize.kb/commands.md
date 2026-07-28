# Commands — verbs and queries

`CMD_SURFACE` verbs are `elab` commands in `Lean.Elab.Command`, so the LSP
serves hover, goto and completion on them like any other syntax. `stipulate`
yields a `structure Frame`; `assert` a `theorem c (f : Frame) : Q`
(see `frames.md`).

Queries are derived, per `INTROSPECT`: `#trustbase` is `collectAxioms` over
the frame's fields; `#stale` is a metaprogram over the environment, also
exposed as `lake exe scan` for CI. Derived means the ledger cannot disagree
with the proofs.
