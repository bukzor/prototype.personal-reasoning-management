# llm-design-kb — normative towers

`Skill(llm-design-kb)`: layered design documentation — numbered layers
from mission to deliverables, each entry linked to its motivation by
`why:` frontmatter, gaps marked as `[!QUESTION]` blocks. The normative
complement to the discourse graph: content that is held or desired
rather than true or false. This repo's `user-stories.kb/` uses its gap
convention today.

**Gems:**

- `why:` as the premise arrow for norms: every entry names what
  motivates it, so design content has authorship and lineage —
  `AUTHOR_ACTS+` applied to requirements.
- `[!QUESTION]` with a death rite: `grep -r '\[!QUESTION\]'` is the
  standing "where does the spec run out" query, and a gap dies only
  when a ledger claim lands — a lifecycle, not an annotation.

**Miss:** motivation edges are navigation, not obligation. Nothing
detects an entry whose `why:` target was superseded; norms have no
staleness, so a tower can silently rest on a retracted mission.

**Informs:** DESIGN_FIAT, STIP, STALE_PROP (norms want it too),
GENERIC_BASE! (the llm-kb / llm-design-kb separation is its stated
image: generic substrate below the line, domain vocabulary above);
`../../user-stories.kb/record-decisions-with-reopeners.md`,
`../../user-stories.kb/legislate-against-my-failure-modes.md`.
