---
status: asserted
sources:
  - ../sources.kb/assistant.md
tags: [toolchain]
---

# elan pins the toolchain

elan is Lean's rustup: it reads the repo's `lean-toolchain` file and
transparently installs/selects that exact Lean+Lake version. It is the only
toolchain manager; every tool in the ecosystem (lean-action, lean.nvim
docs, Mathlib) assumes it. Not yet installed on this machine.
