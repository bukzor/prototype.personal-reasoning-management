# graph-fs — edges in the filesystem

`ideation.graph-fs`: the oldest near-miss, pre-llm-kb. Typed, weighted
edges between files as `.edge/$TYPE/` directories of symlinks — graph
semantics on any POSIX filesystem, no kernel, no FUSE, queryable with
`ls`.

**Gems:**

- The graph legible to every existing tool at zero runtime cost — the
  same wager llm-kb later won with filenames, made one level lower.

**Miss:** the graph lives in the medium, not the content. Symlinks
don't survive grep, diff, or archival the way text does, and an edge
beside a file says nothing inside it — the instinct `HYP_CONTENT`
corrects (a claim's dependencies are part of its statement).
Frontmatter paths won in practice: `llm-discourse-graph` carries
references in the node's own text, and nothing in the fleet ever
adopted `.edge/`.

**Informs:** HYP_CONTENT, SELF_CONTAINED!;
`../../user-stories.kb/ten-year-durability.md`.
