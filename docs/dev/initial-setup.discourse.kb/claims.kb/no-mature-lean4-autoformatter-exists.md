---
status: asserted
sources:
  - ../sources.kb/lean-formatter-status.md
date-observed: 2026-07-27
tags: [formatting]
---

# No mature Lean 4 autoformatter exists

There is no gofmt-equivalent for Lean 4 as of 2026-07. The official
pretty-printer-based formatter (leanprover/lean4#369) is years-open and
not usable; third-party attempts are toys. Root cause: Lean syntax is
user-extensible, so only Lean itself can parse Lean.
