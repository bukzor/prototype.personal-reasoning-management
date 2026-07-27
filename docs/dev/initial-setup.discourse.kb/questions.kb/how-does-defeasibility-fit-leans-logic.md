---
sources:
  - ../sources.kb/assistant.md
tags: [design]
---

# How does defeasibility fit Lean's logic?

Open design question, raised during setup because it shapes the repo.
Lean's logic is monotonic: a proved theorem can never be retracted by new
premises. Defeasible reasoning is non-monotonic by definition. So the
framework almost certainly encodes claims, mandates/authority, and defeat
relations as *object-level data* (an inductive argumentation structure —
cf. Dung argumentation frameworks, defeasible logic à la Nute/Governatori),
with Lean's proof layer used for *metatheory*: proving the evaluation
engine sound, terminating, and consistent with its spec.

Consequence for setup: the repo is a library (core calculus) plus likely
an executable/DSL front-end for authoring claims — which is why layout and
test strategy both reference this question.
