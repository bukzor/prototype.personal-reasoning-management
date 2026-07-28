# llm-collab — ADRs and devlogs for agent swarms

`Skill(llm-collab)`: documentation patterns for long-running human-LLM
collaboration — ADRs for why, devlogs for when, audience-separated
files, tiered detail for just-in-time context loading. The homegrown
instance of `../adr-practice.md`, adapted to the regime that actually
obtains here: twenty agent sessions a day landing partial work.

**Gems:**

- Temporal conflict resolution as a first-class concern: when parallel
  sessions disagree, recency needs a discipline — last-wins demands
  timestamps, and the skill supplies the convention.
- Audience separation (users / contributors / agents) — the
  `FRESH_READER+` stance applied to a whole repo's documentation.

**Miss:** all convention, no checker. Supersession is a social pointer;
nothing fails a build when two ADRs conflict or when code outlives the
decision that justified it.

**Informs:** LAST_WINS, MONOTONE (supersession-as-pointer, never
deletion);
`../../user-stories.kb/record-decisions-with-reopeners.md`,
`../../user-stories.kb/migrate-conventions-without-loss.md`.
