# Mathlib and Isabelle's AFP — living verified corpora

The two largest continuously-maintained proof corpora. The gem is their
maintenance practice, not their mathematics: both are decades-old claim
sets that stay green under daily edits and toolchain churn.

**Gems:**

- Linters as laws: `#lint` runs corpus-wide structural checks in CI —
  the community discovered that a corpus needs laws about itself.
- `deprecated` attributes: staleness as first-class data with migration
  messages and grace periods, not deletion.
- The AFP re-checks the entire archive on every Isabelle release:
  durability lived — toolchain churn absorbed by re-verification, never
  by trusting old verdicts.

**Informs:** LAW, VERSION_OUT+, CHURN;
`../user-stories.kb/ten-year-durability.md`,
`../user-stories.kb/revise-and-live-with-fallout.md`.
