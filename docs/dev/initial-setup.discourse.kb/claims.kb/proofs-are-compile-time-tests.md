---
status: asserted
sources:
  - ../sources.kb/assistant.md
tags: [testing]
---

# Proofs are compile-time tests

In Lean, a stated-and-proved theorem is verified at build time — for the
properties we formalize, `lake build` *is* the test suite, strictly
stronger than example-based tests. Inline `#guard <decidable-prop>` gives
cheap compile-time unit assertions for executable code. Runtime testing
(see `lake-test-runs-a-test-driver.md`) is only needed for what we don't
prove: IO, parsing, performance.
