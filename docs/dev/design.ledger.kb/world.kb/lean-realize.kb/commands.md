# Commands — verbs and queries

Authoring verbs land on the kb surface: each verb is an edit to `.kb/`
frontmatter that the generator ingests (see `translator.md`); there are no
`elab` authoring commands. The LSP still serves the result, because the
generated module is plain Lean.

Queries are functions over `ledger`, exposed as `#status` / `#stale` /
`#trustbase` for the editor and as `lake exe` commands for CI. `#trustbase` is
the claim's hypotheses plus `collectAxioms` over its proof; `#stale` evaluates
the staleness conjunct of `WellFormed` (see `laws.md`). Derived from the
value, per `INTROSPECT`: the ledger cannot disagree with the proofs.
