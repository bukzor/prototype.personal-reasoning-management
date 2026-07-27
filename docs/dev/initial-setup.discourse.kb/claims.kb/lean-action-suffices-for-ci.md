---
status: asserted
sources:
  - ../sources.kb/lean-action-readme.md
date-observed: 2026-07-27
tags: [ci]
---

# lean-action suffices for CI

A single `leanprover/lean-action@v1` step (after checkout) gives standard
CI: elan install, `lake build`, `lake test`, `lake lint` (each
auto-detected from the workspace), `.lake/` caching keyed on manifest +
commit, and Mathlib cache download when applicable. Useful knobs:
`build-args: "--wfail"` to fail on warnings (including `sorry`).
CD (docs to Pages) is a separate later step.
