# Isabelle/HOL

Powerful, not snappy — and the un-snappiness is architectural rather than
incidental.

- **CLI**: every interaction pays JVM + PolyML session startup. `isabelle build`
  amortizes via session images, but cold CI on a real session is minutes. The
  design is a long-running IDE process; "snappy CLI" is structurally
  unavailable, and fighting that is fighting the design.
- **Command surface**: the `CMD_SURFACE` wrapper would live in Isabelle/ML or
  Scala against PIDE — workable, documented, heavy.
- **Authoring**: Sledgehammer is the best automation in the set and would
  genuinely accelerate `CORPUS` authoring. Locales are a natural telescope
  encoding for `VERB_TARGETS`.
- **Trust audit**: oracle and `thm_deps` tracking exist, so `V1_CHECKERS` can
  delegate here rather than build.
