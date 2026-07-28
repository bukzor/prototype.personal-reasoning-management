# Truth Maintenance Systems

Doyle's JTMS (1979) and de Kleer's ATMS (1986): dependency-tracked
belief stores where retracting an assumption propagates non-belief to
everything resting on it. The revise-and-fallout dynamic, solved
mechanically forty years ago.

**Gems:**

- `in` / `out` status: the system keeps operating with `out` beliefs
  present — retraction reclassifies, never halts.
- ATMS environments: every conclusion carries its minimal supporting
  assumption sets — `#trustbase`, computed, in 1986.
- Justification records double as explanations: the dependency edge is
  both the staleness mechanism and the answer to "why do I believe this."

**Informs:** FIAT_SHIFT, TRUST_BASE, INTROSPECT;
`../user-stories.kb/revise-and-live-with-fallout.md` (the
acknowledged-stale QUESTION),
`../user-stories.kb/interrogate-before-acting.md`.
