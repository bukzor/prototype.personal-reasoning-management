---
status: asserted
kind: entailment
conclusion: ../claims.kb/adopt-linters-not-a-formatter.md
premises:
  - ../claims.kb/no-mature-lean4-autoformatter-exists.md
  - ../claims.kb/mathlib-enforces-style-via-linters.md
sources:
  - ../sources.kb/assistant.md
---

# Linting over formatting

Since no usable formatter exists, insisting on autoformatting means either
building one (a known months-scale research problem) or adopting a toy.
The ecosystem's largest project already demonstrates that linters achieve
the goal (consistent, machine-checked style) at near-zero cost. Therefore
adopt linting and treat autoformatting as unavailable.
