# L1 — Ontology

What exists in the system: claims, and nothing else. Substrate-free.

- CLAIMS_ONLY: Claims are the sole node type; the graph is claims and references among claims, nothing else
- STIP: The simplest claim is a stipulation: fiat = the authored decision to assume; authority attaches to the assumption act
- ASSERT: All non-stipulated claims are asserted: proven exactly to the extent their requirements are proven
- WARRANT <- STIP, CLAIMS_ONLY (subsumes WARRANT_NODE): A warrant is a discharged stipulation — stipulation and warrant are one mechanism at two stages; warrants are claims, inheriting full depth/status structure
- CHECKER: Inference-validation lives in checkers — meta-level programs over the claim graph; the Carroll regress terminates in trusted code, not an ontological primitive
- VERDICT <- STIP, CLAIMS_ONLY: Checker verdicts are stipulated claims whose authority is checker+version
- DESIGN_FIAT <- STIP, CHECKER: An underdetermined design choice is legitimately terminated by stipulation with an authority, exactly as CHECKER terminates the inference regress
