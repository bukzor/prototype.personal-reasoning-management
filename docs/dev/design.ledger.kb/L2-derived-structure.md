# L2 — Derived structure

What follows from the ontology once claims accumulate: standing, identity,
trust, and the propagation of change. Substrate-free.

- HYP_CONTENT: A claim's hypotheses are part of its statement content, not an annotation on it
- DEPTH_ATTEST <- VERDICT: Depth-verdicts attest artifact existence — shallow = no verdict, described = elaborator/parser verdict on a statement object, proof = kernel verdict
- STATUS <- VERDICT, DEPTH_ATTEST: A claim's status is the set of authorities of accepted verdicts about it; the shallow/described/proof depth ladder is a special case
- HASH_ID: Claim identity is a content hash of the surface statement; names are mutable pointers; staleness = a dependent proven against a superseded hash
- TRUST_BASE <- HYP_CONTENT, VERDICT: Trust base = the claim's hypotheses ∪ host-environment boundary axioms ∪ ledger verdict authorities; the first component is kernel-enforced
- STALE_PROP <- HYP_CONTENT, HASH_ID: Stipulation revision propagates staleness automatically, since hypotheses are statement content
