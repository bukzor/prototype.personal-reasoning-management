# llm-discourse-graph — typed epistemic nodes over llm-kb

`Skill(llm-discourse-graph)`: five collections — questions, claims,
deductions, sources, definitions — wired by typed frontmatter paths
(`candidate-resolutions`, `conclusion`, `premises`), scoped by the
`$ITEM.md` + `$ITEM.kb/` nesting convention. The mechanized descendant
of Chan's practice (`../discourse-graphs.md`); this repo's own
discourse kbs run on it.

**Gems:**

- The wiring pattern — question → candidate-resolution claims ←
  deductions ← premise claims — puts reference topology in data,
  greppable without a runtime.
- Parent-as-summary roll-up: when a sub-scope resolves, the parent node
  absorbs the answer — revision has a direction.
- The path-resolution ADR: plain file-relative paths superseded clever
  lexical scoping — simplicity won a migration, worth remembering
  when designing claim identity.

**Miss:** edges are typed but walked only by eye — corrected and
improved incidentally as agent and operator browse, with existence the
sole systematic check (`llm.kb-validate-links`). No computed standing,
no staleness, no propagation — the dashes in the epistemics realm's
ladder row for repo weight. And five node types where the ledger needs one:
the other four are librarianship riding in the ontology, exactly what
`CLAIMS_ONLY!` deletes.

**Informs:** CLAIMS_ONLY!, STALE_PROP (by its absence), SPAN!;
`../../user-stories.kb/records-and-references-coexist.md`,
`../../user-stories.kb/revise-and-live-with-fallout.md`.
