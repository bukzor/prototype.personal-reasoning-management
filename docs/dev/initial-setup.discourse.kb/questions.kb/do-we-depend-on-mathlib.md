---
candidate-resolutions:
  - ../claims.kb/start-with-batteries-only.md
sources:
  - ../sources.kb/assistant.md
depends:
  - how-does-defeasibility-fit-leans-logic.md
tags: [dependencies]
---

# Do we depend on Mathlib?

The single biggest fork in the setup: it determines CI cache strategy,
build times, and toolchain-upgrade cadence. Depends on the defeasibility
design — if we lean on order/lattice theory for defeat relations,
Mathlib gets attractive.
