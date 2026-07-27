---
status: asserted
sources:
  - ../sources.kb/assistant.md
tags: [breadth-pass]
---

# The full setup surface is enumerable now

Beyond bukzor's original five (ci/cd, test, dev cycle, neovim LSP,
autoformatting), a Lean 4 repo needs:

- **Toolchain pinning** — elan + committed `lean-toolchain` file; Lean
  releases monthly with breaking changes, so upgrade cadence is a policy
  decision, not an afterthought.
- **Build/deps** — Lake (`lakefile.toml`) + committed `lake-manifest.json`
  lockfile; `leanprover-community/lean-update` action can automate bumps.
- **Dependency policy** — Batteries vs Mathlib decision
  (see `../questions.kb/do-we-depend-on-mathlib.md`).
- **Linting** — `lake lint` with the Batteries `@[lint_driver]` framework;
  this substitutes for autoformatting (see
  `adopt-linters-not-a-formatter.md`).
- **API docs** — doc-gen4 rendering docstrings, deployable to GitHub Pages
  from CI; Verso for prose docs later if wanted.
- **Project layout** — library root module name / namespace (load-bearing;
  hard to rename later once files import it).
- **Hygiene** — `.gitignore` (`.lake/`), README, license.
- **Learning path** — bukzor has never used Lean; *Functional Programming
  in Lean* is the right first book for building a framework (vs *Theorem
  Proving in Lean 4*, which is proof-centric).
- **Design shape** — how defeasibility embeds in Lean's monotonic logic
  (see `../questions.kb/how-does-defeasibility-fit-leans-logic.md`);
  affects whether the repo is library-only or library + DSL/executable.
- **Deferred** — publishing to Reservoir (Lean package registry),
  versioned releases.
