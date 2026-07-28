# ledger

What a claim is, and what follows once claims accumulate: standing, identity,
trust, and the propagation of change. The theory the system is a ledger *of*.

- `prior:` stance
- `ontology:` claim, stipulation, assertion, warrant, authority, checker,
  verdict, depth, status, hypothesis, hash, trust base, staleness
- `defeated by:` a second node type — anything that must be represented and is
  not a claim

- CLAIMS_ONLY! <- PARSIMONY+: Claims are the sole node type; the graph is claims and references among claims, nothing else -- certified(review 089)
- STIP <- REGRESS_ACT+, AUTHOR_ACTS+: The simplest claim is a stipulation: fiat = the authored decision to assume; authority attaches to the assumption act
- ASSERT!: All non-stipulated claims are asserted: proven exactly to the extent their requirements are proven -- certified(review 089)
- LEAST_FIX+ <- ASSERT!: Provenness is the *least* fixpoint of ASSERT. ASSERT is a recursive definition over a graph that permits cycles, and a cycle of mutually-asserting claims satisfies it both as all-proven and as all-unproven; least makes provenness an inductive predicate — cycles are unproven, and the predicate stays cheap to compute
- WARRANT! <- STIP, CLAIMS_ONLY!: A warrant is a discharged stipulation — stipulation and warrant are one mechanism at two stages; warrants are claims, inheriting full depth/status structure -- certified(review 089)
- CHECKER <- REGRESS_ACT+, PARSIMONY+: Inference-validation lives in checkers — meta-level programs over the claim graph. Carroll's regress admits two exits: make inference a primitive *in* the ontology, or a procedure *over* it. This is the second — the LCF/de Bruijn choice, the one that won historically — so the regress terminates in trusted code, and the ontology gains no node type
- VERDICT! <- STIP, CLAIMS_ONLY!, NAME_THE_JUDGE+: Checker verdicts are stipulated claims whose authority is checker+version -- certified(review 089)
- DESIGN_FIAT <- STIP, CHECKER, REGRESS_ACT+: An underdetermined choice is legitimately terminated by stipulation with an authority, exactly as CHECKER terminates the inference regress
- LAST_WINS: Restating a claim supersedes its prior version; the claim set is the union, last wins
- HYP_CONTENT: A claim's hypotheses are part of its statement content, not an annotation on it
- DEPTH_ATTEST <- VERDICT!, CHECKER: Depth-verdicts attest artifact existence — shallow = no verdict, described = a checker verdict on a statement object, proof = a checker verdict on a proof object
- HASH_ID: Claim identity is a content hash of the surface statement; names are mutable pointers; staleness = a dependent proven against a superseded hash
- MONOTONE <- HASH_ID, VERDICT!: The verdict record is append-only and monotone, and this is derived rather than imposed: a verdict attaches to a content hash, so "checker C accepted claim #a3f" is a historical fact nothing later falsifies. A claim's *change* repoints a name to a new hash — that is staleness, not revocation — and an authority's *fall from trust* is a filter applied at query time, not a mutation of the record. Revocation is thus not forbidden but unrepresentable
- ACCEPTED <- MONOTONE: A verdict is *accepted* iff it is recorded; presence is acceptance. Nothing adjudicates between authorities, so there is no global "accepted" — a claim can be simultaneously proven-per-checker and retracted-per-user, and reporting both unreconciled is the point. Adjudicating would be the ledger evaluating a proposition
- STATUS <- VERDICT!, DEPTH_ATTEST, ACCEPTED: A claim's status is the set of authorities of accepted verdicts about it. Set-valued rather than a ladder because real checkers disagree — typechecking, termination and positivity are separate checkers, and one definition can pass some and fail others — so the shallow/described/proof ladder is a special case of the checker set, not the general shape
- TRUST_BASE <- HYP_CONTENT, VERDICT!: Trust base = the claim's hypotheses ∪ the axioms admitted at the corpus boundary ∪ the authorities of its verdicts; the first component is checker-enforced
- STALE_PROP <- HYP_CONTENT, HASH_ID: Stipulation revision propagates staleness automatically, since hypotheses are statement content
