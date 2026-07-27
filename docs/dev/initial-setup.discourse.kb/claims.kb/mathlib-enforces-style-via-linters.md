---
status: asserted
sources:
  - ../sources.kb/assistant.md
tags: [formatting, linting]
---

# Mathlib enforces style via linters, not a formatter

The largest Lean project solves the no-formatter problem with text-based
style linters (line length, indentation rules; `lint-style-action` in CI)
plus semantic environment linters (`@[lint_driver]`, `lake lint` from
Batteries). This is the ecosystem's proven substitute for autoformatting.
