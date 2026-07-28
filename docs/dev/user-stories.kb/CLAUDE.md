# User stories — the demands the design must serve

One story per file: a concrete workflow, first person, that the finished
system must make true. The set spans authoring (capture, deepen, revise),
consumption (interrogate = pull, the-right-claims-find-me = push,
the-corpus-binds-my-agents = obligation), and stewardship (migrate,
records-vs-references, durability) — a design that serves only the
authoring stories has built a notebook, not a reasoning system. Stories are demands, not commitments — the
commitments live in `../design.ledger.kb/`; a story cites the claim labels
that serve it, and a label is one grep away (`NAMES_INDEX+`).

## Format

- The story: one short paragraph, first person, present tense.
- **Served by:** the ledger claim labels (with sigils) that discharge it.
- Gaps as `> [!QUESTION]` blocks per `Skill(llm-design-kb)`: a clause the
  spec does not yet serve, with a body naming what would settle it.

## Acceptance semantics

`grep -r '\[!QUESTION\]' .` is the standing answer to "where does the spec
not yet meet my life?" A story goes fully unmarked only when the ledger
serves it; an unmarked kb means every story is served.

Gap *resolutions* never land here: a story records the demand, the fix
lands in the ledger as a claim, and then the QUESTION block is deleted.
Revise stories in place as demands sharpen; this kb states today's
demands, not a log of them.
