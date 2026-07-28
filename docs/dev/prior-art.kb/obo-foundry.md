# OBO Foundry — formal ontologies under CI

Roughly two hundred biomedical ontologies (Gene Ontology, Uberon, Mondo,
HPO, ChEBI …) maintained for two decades as OWL text in git, edited by
pull request, with CI generated from the Ontology Development Kit. The
strongest existence proof that a formal corpus with generated artifacts,
CI-enforced laws, and permanent identity survives daily editing at
10⁴–10⁵ terms.

**Gems:**

- `robot reason` — a whole-corpus reasoner (usually ELK) in CI that
  *infers* — materializes derived subsumptions into the release artifact
  — and thereby also *validates*, failing the build on inconsistency or
  unsatisfiable classes. Inference with validation as its special case,
  deployed at scale.
- `robot report` — SPARQL queries as severity-graded laws (ERROR / WARN /
  INFO) over the corpus.
- Obsoletion, never deletion — `owl:deprecated true` plus replaced-by /
  consider pointers: a monotone record, a migration path, and a lived
  answer to acknowledged staleness.
- Orthogonality and the BFO → COB → domain tower — a term belongs to
  exactly one ontology and everyone else imports it: a theory poset with
  confinement, arrived at independently.
- The EL-profile trade — restrict to a polynomial fragment so the
  whole-corpus check stays CI-cheap; their 10⁴-terms-under-CI is direct
  evidence for the decidable-law scale estimate.

**Informs:** LAW, MONOTONE, HASH_ID, NAME_REUSE+, the theory poset;
`../user-stories.kb/revise-and-live-with-fallout.md` (obsoletion vs
build failure), `../user-stories.kb/the-system-tells-me-what-i-didnt-say.md`.
