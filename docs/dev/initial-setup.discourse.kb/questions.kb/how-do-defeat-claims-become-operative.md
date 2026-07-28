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

Answered in the design ledger (`../../design.ledger.kb/ledger.md`:
DEFEAT, LINK_CLAIM!, PROJECTION, UNFORCED!). Defeat needs no
recognition step because it needs no propagation step:

- Machine-recognizable: a rebuttal *is* a contrary-degree verdict on
  the target claim, an undercut the same on the support-step claim —
  structured evidence the engine reads natively. The argued defeat
  exists as an ordinary claim besides; asserting it issues the verdict.
- Claimed vs computed: verdicts are the record; every standing readout
  is a projection computed from them (PROJECTION). Propagating claimed
  defeat into computed status is query-time computation, permitted
  under any semantics (UNFORCED!) while the record itself never rules
  (ACCEPTED).
- Defeat-of-defeat: an undercut on a defeat's own support step is the
  same mechanism one level up; fixpoint semantics are readings —
  computable, never forced.
