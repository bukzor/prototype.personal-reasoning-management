--- # workaround: anthropics/claude-code#13003
requires:
    - Skill(llm-claim-ledger)
---

# Design ledger — maintenance

One file per **theory** (`$theory.md`), rolled up by `../design.ledger.md`.
Each file opens with a three-line header — `prior:`, `ontology:`,
`defeated by:` — and then lists that theory's claims, one per line, in ASCII
ledger notation: `- LABEL <- PREMISE, PREMISE: text`, trailing sigil for
standing. Spell the status out when `!` needs unpacking: `-- authority: user`
for fiat, `-- certified(CHECK)` for a re-runnable check.

## What belongs here

- Claims about the _design_ of this system: what a claim is, how status and
  trust are derived, which host encodings are committed to, what the command
  surface is, how the substrate was chosen.
- Findings that amend or defeat such a claim — revise by re-defining the claim
  in place, in its own theory, not by adding a new claim elsewhere. A claim that
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

A claim's theory is fixed by **the vocabulary its text needs** — not by the
turn that produced it, and not by where its premises live. A claim may use its
own theory's ontology plus every prior theory's; a word from outside that set
means either the claim is misplaced or the theory's `ontology:` line is
understated. Resolve it rather than recording the violation.

Two carve-outs. Premise arrows are motivation, not entailment (`ARROWS!`), so
an arrow into a prior theory is ordinary and an arrow that skips one is fine —
only the words are checked. And a proper name cited as intellectual provenance
(Carroll, LCF, de Bruijn) is not ontology; ontology is what a claim reasons
*with*.

When a posterior theory needs a word a prior theory already uses, it reuses it
for the closest thing its own ontology admits (`NAME_REUSE+`). The shift in
meaning is the interpretation map, not a collision; do not rename to avoid it.

A new theory is a new file, declaring its own header and added to the table in
`../design.ledger.md`.

## When a claim outgrows its line

A claim needing more than a line — competing encodings, a cost breakdown, a
decision with rejected alternatives — gets `$theory.kb/$claim-topic.md`. Prose
only, no frontmatter; the claim line in the theory file stays authoritative and
links down. Per `Skill(llm-kb)`'s decision-point pattern, a resolved topic
file states the resolution first and keeps alternatives only for why they lost.
