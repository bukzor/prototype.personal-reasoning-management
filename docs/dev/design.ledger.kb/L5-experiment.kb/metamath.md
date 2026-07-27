# Metamath

Maximal on every ledger criterion and minimal on authoring. The split in `SPLIT`
is essentially this file.

## Against DAILY_CRITERIA

- **Snappiness**: in a class of its own — `metamath-knife` verifies all of
  set.mm (~40k theorems) in low single-digit seconds; a ledger corpus verifies in
  milliseconds.
- **CI**: `cargo install metamath-knife` plus one command. No heaps, no caches,
  no toolchain pinning.
- **CLI**: native tools are austere, but everything is text and everything is
  instant, so a thin wrapper of our own would feel telepathic. The best possible
  substrate for the ledger operations themselves — status, stale, verdict
  queries.
- **Authoring**: where pleasure dies. No holes, no elaboration, no automation;
  proof construction means mmj2 or metamath-lamp. `CORPUS` is real proofs, not
  bookkeeping, and writing real proofs in raw Metamath is a discipline.

## Against AXES

Plain-text database, so `NO_SIDECAR` persistence and `HASH_ID` are trivially
stable — concrete syntax *is* canonical here, which is exactly what
`HASH_FORMAL` cannot promise elsewhere.

`MM_DESCRIBE` is the one place the command surface bends: an unproven assertion
is `$a`, which asserts, so `described` has to be encoded as a wff whose
grammar-parse is itself a proof.
