# planning-framework — tiered ADRs with MCDA

`bukzor.planning-framework`: the oldest full-taxonomy attempt,
pre-llm-kb. Six tiers from vision to features linked by bidirectional
five-whys, each ADR posing a question whose alternatives are candidate
answers, decided by requirements (boolean disqualifiers) then criteria
(weighted MCDA scoring).

**Gems:**

- The requirements/criteria split — pass/fail filters vs tie-breaking
  orderings — is `UNDOMINATED`'s exact shape, found years earlier.
- Bidirectional navigation (why? up, how? down) stated as a hard
  requirement on any corpus an LLM must reason over.
- "Each ADR poses a question; alternatives are possible answers" — the
  decision-point pattern before it had a home in llm-kb.

**Miss:** taxonomy-first ceremony. Six tiers, ID registries, and
scoring matrices demanded before any content pays its way; capture
cost killed daily use — the failure
`../../user-stories.kb/capture-without-ceremony.md` legislates
against. And MCDA arithmetic *adjudicates* between authorities, where
the ledger records verdicts and refuses to adjudicate (`ACCEPTED`).

**Informs:** UNDOMINATED, DECISION!, ACCEPTED (by contrast);
`../../user-stories.kb/capture-without-ceremony.md`,
`../../user-stories.kb/record-decisions-with-reopeners.md`.
