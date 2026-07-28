# Metamath — the pole that lost

Maximal on every ledger criterion and minimal on authoring. `TWO_POLES` is
essentially this file against `lean4-native.md`, and `DECISION` went the other
way. Kept because a rejected candidate's file is the record of what the decision
cost, and because the exit ramp runs back through here if `CHURN` ever exceeds
tolerance.

## Against DAILY_CRITERIA

- **Snappiness**: in a class of its own — `metamath-knife` verifies all of
  set.mm (~40k theorems) in low single-digit seconds; a ledger corpus verifies in
  milliseconds.
- **CI**: `cargo install metamath-knife` plus one command. No heaps, no caches,
  no toolchain pinning. This is the zero-rent property `TWO_POLES` names.
- **CLI**: native tools are austere, but everything is text and everything is
  instant, so a thin wrapper of our own would feel telepathic. The best possible
  substrate for the ledger operations themselves — status, stale, verdict
  queries.
- **Authoring**: where pleasure dies *as it ships*. No holes, no elaboration, no
  automation; proof construction means mmj2 or metamath-lamp. `CORPUS` is real
  proofs, not bookkeeping, and writing real proofs in raw Metamath is a
  discipline. `MM_IMPROVABLE` is the claim that this is fixable, below.

## What it gets right that Lean4 does not

Plain-text database, so `NO_SIDECAR` persistence and `HASH_ID` are trivially
stable — concrete syntax *is* canonical here, which is exactly what
`HASH_FORMAL` cannot promise under Lean4, where the hash re-baselines on
toolchain bumps.

The command surface bends in one place: an unproven assertion is `$a`, which
asserts, so `described` has to be encoded as a wff whose grammar-parse is itself
a proof. That parse is a genuine elaborator verdict, so it satisfies
`DEPTH_ATTEST` rather than working around it. Under `NATIVE` the question does
not arise — but it was the cheapest available falsification test for
`BASIS_API!`'s substrate-independence, and that test is now unrun.

## Why the authoring floor is raisable

Metamath is unusually *tractable* to build tooling for, and the tooling largely
exists:

- `TRIVIAL_CHECK` — the kernel does direct substitution checking, so a tool has
  a millisecond oracle for "is this proof correct". Lean's LSP fights elaboration
  latency; a Metamath LSP has none to fight.
- `GRAMMAR_AUTO` — a third of proof steps are grammatical and mechanically
  derivable; mmj2 has done it since the 2000s. A modern tool makes them invisible.
- `UNIFY_ASSIST` — mmj2's unify already completes logical steps from work
  variables. The floor for hole-driven editing was set fifteen years ago in a
  Java Swing app; the ceiling is untested with modern tooling.
- `MM1_EXISTS` — Mario Carneiro's MM0/MM1 is the existence proof: a human-facing
  authoring language with a tactic layer, served by `mm0-rs` with a real language
  server, compiling to a Metamath-class kernel. It exists because the person who
  knows Metamath's internals best judged raw `.mm` authoring inadequate and
  judged the fix to be a front-end, not a kernel change.
- `KNIFE` — `metamath-knife` is the verifier behind the sub-second set.mm checks,
  built library-shaped for language-server use. A custom LSP means writing the
  protocol layer, not the engine.
- metamath-lamp is evidence of demand and a UX reference (web-based,
  hole-oriented), but not the architecture to copy.

The ladder, had this pole won: adopt MM1/mm0-rs directly to calibrate (~days);
a metamath-knife LSP and CLI (~2-3 weeks); a declarative front-end with holes
and a small fixed tactic set elaborating to `.mm` proof trees (~3 person-months).
The risk was never feasibility — it was permanently maintaining a proof language
solo, which is the same maintenance class as `CHURN` but over a stabler
substrate.

`LIB_LEVERAGE` is the strategic catch: set.mm is the asset that offsets the
authoring cost, and a bespoke surface keeps it only by honoring set.mm's
conventions — deduction style, the wff/class discipline — which then leak into
the "clean" syntax.
