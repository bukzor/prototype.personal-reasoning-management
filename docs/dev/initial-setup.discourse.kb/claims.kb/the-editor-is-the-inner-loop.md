---
status: asserted
sources:
  - ../sources.kb/assistant.md
tags: [dev-cycle]
---

# The editor is the inner loop

Lean's tight dev cycle is not edit→run: the LSP re-elaborates the file as
you type, showing goal states, errors, and `#eval` output inline. So LSP
setup (see `lean-nvim-is-the-standard-neovim-integration.md`) *is* the
dev-cycle work; there's no separate watch-mode tooling to build.
`lake build` incrementally for the outer loop; if a CLI watch loop is ever
wanted, plain watchexec suffices — Lake has no built-in watcher.
Caveat: full-file re-elaboration gets slow in big proof files; the cure is
small modules, which we control.
