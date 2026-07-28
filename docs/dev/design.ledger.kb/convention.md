# convention

How this artifact is written and read: names, labels, arrows, files. The theory
governing the ledger's markdown image rather than its content.

- `prior:` ledger
- `ontology:` file, label, sigil, arrow, name, reader, index, fidelity, image
- `defeated by:` a different reader — a ledger consumed by a tool rather than by
  an agent reading `ls` and `grep`

- SELF_CONTAINED!: The ledger is more powerful and more valuable the less it must look elsewhere for facts; a line that needs an external lookup before it can be acted on is under-stated -- authority: user
- FRESH_READER+ <- SELF_CONTAINED!: The audience is an agent with no memory of the conversation that produced the line. A line is correct when that reader can act on it without asking, which is why claim text carries its own justification rather than pointing at one
- AFFORDANCE+ <- FRESH_READER+: A file name is a discovery affordance — `ls` is the index. A theory's name must do three jobs at once: say what its claims are about, say when to come check them, and name the ontology they admit
- NAMES_INDEX+ <- AFFORDANCE+: Labels are the ledger's index. `grep LABEL` must find the definition and every reference, which is why sigils trail the label rather than lead it
- SUBTRACT+ <- PARSIMONY+: Fixing a problem by adding text is usually the wrong fix. A claim that goes away with nothing in its place is deleted outright; the diff is the record, and a ledger of tombstones is a ledger nobody reads
- ARROWS!: Premise arrows are permanently informal — motivation, not entailment. Formalizing them is not this artifact's job -- authority: user
- IMAGE+: The ledger is its own first instance — the artifact recording the design is built from the design, at lower fidelity. A term appearing at two fidelities is aligned, not colliding; divergence is the smell. Where the image lacks a feature the design commits to, one of the two is wrong
- NAME_REUSE+ <- PARSIMONY+, NAMES_INDEX+, IMAGE+: A posterior theory reuses a prior name for the closest thing its ontology admits. The expansion refines the meaning; that is the interpretation map made visible, not a collision, and renaming hides it. Disambiguate only where genuinely ambiguous, in the ordinary way — "X in the Y sense"
- ONTOLOGY_MIN+ <- NAME_REUSE+: Adjusting a posterior theory's terms to agree with a prior one's yields an equally strong set of theories over a smaller total ontology. Total ontology across all theories is what gets minimized, not per-theory tidiness
