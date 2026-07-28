---
status: asserted
likelihood: 0.8
sources:
  - ../sources.kb/design-sketch.md
tags: [design]
---

# The design sketch settles the repo shape

Defeasibility is *not* encoded as non-monotonic proof search: the ledger is a
first-class value — `ledger : Ledger` in `Corpus/Generated.lean` — generated
from llm-kb markdown frontmatter (the authoring surface) by an untrusted
generator whose output CI round-trips. Depth is attested by artifact
(described attaches `stmt : Prop`, proven bundles `pf : stmt`); stipulations
are hypothesis-bundle `Frame` structures, never `axiom`s; retraction pressure
surfaces as staleness, a conjunct of `WellFormed ledger` proven `by decide` —
the scanner is a theorem, and `lake build` failing is the scan failing.

Setup consequences:
- Repo = `Ledger/` library + `Generator/` exe + generated `Corpus/` module;
  the `.kb/` authoring surface is content, not code.
- CI = lean-action (building proves `corpus_ok`) **plus** generated-module
  currency check **plus** round-trip diff **plus** a later
  lean4export/lean4checker external-audit step.
- Sketch specifies `lakefile.lean`; `lakefile.toml` would also carry these
  targets — pick at `lake init` time.
- Light elaborator metaprogramming only: `Syntax` hashing and the generator.
  No environment extensions, no `elab` verbs.

Supersedes the earlier env-extension shape (`PersistentEnvExtension` + five
elaborator verbs): a registry that can be queried but not quantified over
caps every law below proof. Design discussion un-deferred and settled
2026-07-28; see the design ledger (`NATIVE!`, `LAW`, `UNTRUSTED_XLATE`).
