---
sources:
  - ../sources.kb/bukzor.md
  - ../sources.kb/assistant.md
depends:
  - how-does-defeasibility-fit-leans-logic.md
  - ../claims.kb/design-sketch-settles-repo-shape.md
tags: [design]
---

# How do defeat claims become operative?

Defeat statements ("A rebuts B", "authority X outranks Y") are ordinary
ledger claims, reified over claim identifiers, with the full claim
lifecycle and the right properties: defeat assertions are themselves
defeasible, authored, and contestable — which a hardcoded structural
edge could not be. So representation is free.

The open question is operational: the sketch's status machinery computes
from structural facts; a defeat claim is inert to it until recognized
and propagated. Sub-questions for when design opens:

- What makes defeat claims machine-recognizable?
- Claimed vs computed status: the sketch makes staleness *computed*
  (trustworthy) while defeat would be *claimed* (human judgment) —
  the machinery's job is propagating claimed defeat into computed
  status. Same axis for priority orderings.
- Defeat-of-defeat: once defeat claims are defeasible, adjudication
  needs a fixpoint semantics — relocated by reification, not dissolved.
