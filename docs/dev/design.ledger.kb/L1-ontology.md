# L1 — Ontology

What exists in the system: claims, and nothing else. Substrate-free.

- CLAIMS_ONLY!: Claims are the sole node type; the graph is claims and references among claims, nothing else -- certified(review 089)
- STIP: The simplest claim is a stipulation: fiat = the authored decision to assume; authority attaches to the assumption act
- ASSERT!: All non-stipulated claims are asserted: proven exactly to the extent their requirements are proven -- certified(review 089)
- LEAST_FIX+ <- ASSERT!: Provenness is the *least* fixpoint of ASSERT. ASSERT is a recursive definition over a graph that permits cycles, and a cycle of mutually-asserting claims satisfies it both as all-proven and as all-unproven; least makes provenness an inductive predicate — cycles are unproven, and every substrate computes it cheaply
- WARRANT! <- STIP, CLAIMS_ONLY!: A warrant is a discharged stipulation — stipulation and warrant are one mechanism at two stages; warrants are claims, inheriting full depth/status structure -- certified(review 089)
- CHECKER: Inference-validation lives in checkers — meta-level programs over the claim graph. Carroll's regress admits two exits: make inference a primitive *in* the ontology, or a procedure *over* it. This is the second — the LCF/de Bruijn choice, the one that won historically — so the regress terminates in trusted code, and the ontology gains no node type
- VERDICT! <- STIP, CLAIMS_ONLY!: Checker verdicts are stipulated claims whose authority is checker+version -- certified(review 089)
- DESIGN_FIAT <- STIP, CHECKER: An underdetermined design choice is legitimately terminated by stipulation with an authority, exactly as CHECKER terminates the inference regress
