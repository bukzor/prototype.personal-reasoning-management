---
status: asserted
likelihood: 0.9
sources:
  - ../sources.kb/assistant.md
tags: [formatting, linting]
---

# Adopt linting instead of autoformatting

We should drop autoformatting from the requirements list and rely on
`lake lint` (+ optionally Mathlib's style linters) for consistency.
Supported by `../deductions.kb/linting-over-formatting.md`. Revisit if
the official formatter ships.
