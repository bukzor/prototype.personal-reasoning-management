---
managed-by: Skill(llm-subtask)
---

Setup spine (each item ≈ one small commit; sequenced so each verifies the previous):

- [x] Breadth-first setup discourse graph (`docs/dev/initial-setup.discourse.kb/`)
- [x] elan via brew; Brewfile
- [ ] `lake init`: `lean-toolchain` pin (latest stable), root module `Ledger`, `.gitignore` (`.lake/`); `lake build` green
  - decide `lakefile.lean` (per design sketch) vs `lakefile.toml` at init time
- [ ] Add Batteries dependency (or record core-only decision); commit `lake-manifest.json`
- [ ] lean.nvim in nvim config (lives in dotfiles repo — breadcrumb only here)
  - verify: infoview shows goals in a scratch theorem; `\forall` → `∀` abbreviation works
- [ ] CI: `.github/workflows/ci.yml` with `leanprover/lean-action@v1` (`build-args: "--wfail"`); push, verify green on origin
- [ ] Test skeleton: `Test/` module + `testDriver` in lakefile; one trivial `#guard` + one runtime assertion; `lake test` green locally and in CI
- [ ] Lint skeleton: Batteries `@[lint_driver]`; `lake lint` green locally and in CI
- [ ] README + license

Framework build order (from `docs/dev/design-sketch.md`; vertical slice first — prove the architecture before widening):

- [ ] `Ledger/Core.lean`: `ClaimMeta`, `Depth` types
- [ ] Content hash over `Syntax` tree (pre-elaboration)
- [ ] `Ledger/Ext.lean`: `PersistentEnvExtension` claim registry
- [ ] `Ledger/Cmds.lean`: `claim` + `#status` — shallow-only vertical slice, end to end
- [ ] `describe` verb + hash storage
- [ ] `Ledger/Scan.lean`: `#stale` + `lake exe scan`
- [ ] CI: add `lake exe scan` step (fail on stale)
- [ ] `stipulate` frames (hypothesis bundles, never `axiom`)
- [ ] `assert` verb + dependency-edge extraction from proof terms
- [ ] `Corpus/`: port L0–L2 of the actual ledger (system describes itself)

## Later

We haven't (yet) decided where to place these in the task queue.
Please read and consider slotting them.

- [ ] doc-gen4 API docs → GitHub Pages from CI
- [ ] lean4export + lean4checker external-audit CI step over `Corpus/`
- [ ] `#trustbase` query command
- [ ] InfoView claim-graph widget (`Ledger/Widget.lean`)
- [ ] Revisit autoformatting if the official formatter ships (leanprover/lean4#369)
- [ ] Reservoir publishing / versioned releases
