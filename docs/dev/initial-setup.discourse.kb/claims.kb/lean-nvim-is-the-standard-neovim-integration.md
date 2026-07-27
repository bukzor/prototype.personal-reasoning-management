---
status: asserted
sources:
  - ../sources.kb/assistant.md
tags: [editor, lsp]
---

# lean.nvim is the standard Neovim integration

`Julian/lean.nvim` wraps the Lean language server (spawned via
`lake serve`, so it uses the repo-pinned toolchain) and adds the two
things raw lspconfig can't: the **infoview** (live goal-state panel —
essential, not optional) and **unicode abbreviations** (`\forall` → `∀`;
Lean source is unicode-heavy). Requires nvim ≥ 0.10; installed nvim is
0.12.4. Caveat: most tutorials/docs assume VS Code, so expect to
translate occasionally.
