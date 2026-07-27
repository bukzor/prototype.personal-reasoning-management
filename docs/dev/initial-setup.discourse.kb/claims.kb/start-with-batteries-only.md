---
status: asserted
likelihood: 0.95
sources:
  - ../sources.kb/bukzor.md
  - ../sources.kb/assistant.md
tags: [dependencies]
---

# Start with Batteries only, not Mathlib

Depend on Batteries (std-lib extensions: data structures, lint framework,
and the linter/command patterns the design sketch says to steal) and skip
Mathlib. The no-Mathlib half is bukzor's decision (2026-07-27): "No
mathlib. I won't be using it, not soon." Residual uncertainty (0.95) is
only whether Batteries itself is needed at all — conceivably core-only
suffices at first; decide at `lake init` time. Adding either later is one
lakefile line.
