--- # workaround: anthropics/claude-code#13003
requires:
    - Skill(llm-claim-ledger)
---

# Design ledger — maintenance

One file per ledger **level** (`L$N-$scope.md`), rolled up by
`../design.ledger.md`. Each file lists that level's claims, one per line, in
ASCII ledger notation: `- LABEL <- PREMISE, PREMISE: text`, trailing sigil for
standing. Spell the status out when `!` needs unpacking: `-- authority: user`
for fiat, `-- certified(CHECK)` for a re-runnable check.

## What belongs here

- Claims about the _design_ of this system: what a claim is, how status and
  trust are derived, which host encodings are committed to, what the command
  surface is, how the substrate was chosen.
- Findings that amend or defeat such a claim — revise by re-defining the claim
  in place, at its own level, not by adding a new claim elsewhere. A claim that
  goes away with nothing in its place is deleted; the git diff is the record.

## What does not

- **Prose rationale** — `../design-sketch.md`. A ledger line states the
  commitment; it does not argue for it.
- **Empirical/epistemic inquiry** (what's true about Lean, mathlib, CI) —
  `../initial-setup.discourse.kb/`. That graph asks questions; this ledger
  records decisions.
- **Work items** — `.claude/todo.md` (`Skill(llm-subtask)`). An open claim
  carrying weight gets a `discharge` todo there, not a note here.

## Placement

The level is fixed by what the claim _consumes_, not by which turn produced
it: a claim may only cite premises from its own or a lower level. If a new
claim's premises span upward, the claim is misplaced or the premise is —
resolve it rather than recording the violation.

A new level is a new file; the level table in `../design.ledger.md` is the
only place levels are enumerated.

## When a claim outgrows its line

A claim needing more than a line — competing encodings, a cost breakdown, a
decision with rejected alternatives — gets `$LEVEL.kb/$claim-topic.md`. Prose
only, no frontmatter; the claim line in the level file stays authoritative and
links down. Per `Skill(llm-kb)`'s decision-point pattern, a resolved topic
file states the resolution first and keeps alternatives only for why they lost.
