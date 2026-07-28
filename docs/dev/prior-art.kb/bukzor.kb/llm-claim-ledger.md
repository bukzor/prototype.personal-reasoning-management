# llm-claim-ledger — the conversational rung

`Skill(llm-claim-ledger)`: labelled claims in chat — trailing sigils
for standing (bare / `?` / `+` / `!`), `<-` premise arrows, one-line
governance (`claim accept: X`), theories over fixed ontologies when the
ledger outgrows one list. The direct ancestor of this project's
notation: thirteen claims are the same commitment on both sides
(`../../design.ledger.md` names them), and the invariant — every claim
sound, open, or retracted — is the RN axiom every rung realizes.

**Gems:**

- Standing priced at one glyph, trailing a grep-stable label — and the
  observation that `?` and `+` want opposite counterparty attention (an
  answer vs a veto), which `PROVISIONAL` inherits verbatim.
- Theories with declared priors, confinement by vocabulary — the poset
  structure `../../design.ledger.md` reuses wholesale.
- Warrant-mix at point of use: `XY <- AB! CD?` shows what the claim
  rests on exactly where weight is placed.
- good-smells.kb/ as an audit battery: standing-visible-at-point-of-use,
  bare-form-stays-legal, cheaper-to-use-than-to-ignore,
  survives-dumb-media — each a test any PRMS surface must also pass
  (the first is an InfoView-hover demand, the second a checkable
  BASIS_API! law).

**Miss:** standing is eyeballed, never computed. No checker runs;
`certified(CHECK)` names a re-runnable check that nothing re-runs; the
ledger lives and dies with the conversation unless hand-flushed. The
notation is PRMS at the fidelity a chat window supports — `IMAGE!` says
exactly this — and the fidelity gap is the project.

**Informs:** ARROWS!, IMAGE!, LAST_WINS!, NAME_THE_JUDGE!, LEAST_FIX!;
`../../user-stories.kb/veto-scan-agent-claims.md`,
`../../user-stories.kb/the-corpus-binds-my-agents.md`.
