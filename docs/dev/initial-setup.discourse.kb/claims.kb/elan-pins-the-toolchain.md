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
docs, Mathlib) assumes it. Installed 2026-07-27 via linuxbrew (formula
`elan-init`, elan 4.2.3, recorded in the repo Brewfile); no default
toolchain configured, which is correct — the repo's `lean-toolchain`
file will drive selection.
