# L2 — Derived structure

What follows from the ontology once claims accumulate: standing, identity,
trust, and the propagation of change. Substrate-free.

- HYP_CONTENT: A claim's hypotheses are part of its statement content, not an annotation on it
- DEPTH_ATTEST <- VERDICT!: Depth-verdicts attest artifact existence — shallow = no verdict, described = elaborator/parser verdict on a statement object, proof = kernel verdict
- HASH_ID: Claim identity is a content hash of the surface statement; names are mutable pointers; staleness = a dependent proven against a superseded hash
- MONOTONE <- HASH_ID, VERDICT!: The verdict record is append-only and monotone, and this is derived rather than imposed: a verdict attaches to a content hash, so "checker C accepted claim #a3f" is a historical fact nothing later falsifies. A claim's *change* repoints a name to a new hash — that is staleness, not revocation — and an authority's *fall from trust* is a filter applied at query time, not a mutation of the record. Revocation is thus not forbidden but unrepresentable
- ACCEPTED <- MONOTONE: A verdict is *accepted* iff it is recorded; presence is acceptance. Nothing adjudicates between authorities, so there is no global "accepted" — a claim can be simultaneously proven-per-kernel and retracted-per-user, and reporting both unreconciled is the point. Adjudicating would be the ledger evaluating a proposition
- STATUS <- VERDICT!, DEPTH_ATTEST, ACCEPTED: A claim's status is the set of authorities of accepted verdicts about it. Set-valued rather than a ladder because real checkers disagree — a host runs typechecking, termination and positivity separately and one definition can pass some and fail others — so the shallow/described/proof ladder is a special case of the checker set, not the general shape
- TRUST_BASE <- HYP_CONTENT, VERDICT!: Trust base = the claim's hypotheses ∪ host-environment boundary axioms ∪ ledger verdict authorities; the first component is kernel-enforced
- STALE_PROP <- HYP_CONTENT, HASH_ID: Stipulation revision propagates staleness automatically, since hypotheses are statement content
