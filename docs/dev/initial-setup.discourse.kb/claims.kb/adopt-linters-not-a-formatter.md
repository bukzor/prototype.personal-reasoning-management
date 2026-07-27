---
status: asserted
sources:
  - ../sources.kb/assistant.md
  - ../sources.kb/bukzor.md
tags: [formatting, linting]
---

# Adopt linting instead of autoformatting

Drop autoformatting from the requirements list and rely on `lake lint`
(+ optionally Mathlib's style linters) for consistency.
Supported by `../deductions.kb/linting-over-formatting.md`; approved by
bukzor 2026-07-27. Revisit if the official formatter ships.
