---
candidate-resolutions:
  - ../claims.kb/design-sketch-settles-repo-shape.md
sources:
  - ../sources.kb/assistant.md
tags: [design]
---

# How does defeasibility fit Lean's logic?

Lean's logic is monotonic: a proved theorem can never be retracted by new
premises; defeasible reasoning is non-monotonic by definition, so the
tension needs a design answer.

The design sketch (`../claims.kb/design-sketch-settles-repo-shape.md`)
answers the setup-relevant parts: claims live as object-level ledger
entries in an environment extension, and defeasibility surfaces as
staleness/provisionality metadata rather than non-monotonic proof search.
Not marked resolved: bukzor deferred detailed design discussion
(2026-07-27), and the sketch itself is unreviewed.
