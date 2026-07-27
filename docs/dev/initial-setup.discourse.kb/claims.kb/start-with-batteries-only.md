---
status: asserted
likelihood: 0.7
sources:
  - ../sources.kb/assistant.md
tags: [dependencies]
---

# Start with Batteries only, not Mathlib

Recommendation: depend on Batteries (std-lib extensions: data structures,
lint framework) and defer Mathlib. Mathlib would buy us order/lattice
theory and `Finset` machinery — plausibly useful for defeat relations and
preference orders — but costs a multi-GB dependency, slower CI (even with
`lake exe cache get` prebuilt binaries), and pressure to track its monthly
toolchain churn. Adding it later is one lakefile line; removing it later
is surgery. Confidence is 0.7 because the defeasibility design
(`../questions.kb/how-does-defeasibility-fit-leans-logic.md`) may want
Mathlib's order theory sooner than expected.
