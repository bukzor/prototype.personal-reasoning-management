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

- [ ] `Ledger/Core.lean`: `Ledger`, `ClaimMeta`, `Depth` types
- [ ] Content hash over `Syntax` tree (pre-elaboration)
- [ ] `Generator/`: `lake exe gen` — `.kb/` frontmatter → `Corpus/Generated.lean` (committed, diffable)
- [ ] `Ledger/Laws.lean`: `WellFormed` + `theorem corpus_ok := by decide` — vertical slice end to end over one kb file
- [ ] Round-trip printer (`Generator/Print.lean`) + CI diff check — the generator is untrusted
- [ ] Depth artifacts: `stmt : Prop` attachment (described), `pf : stmt` bundling (proven); staleness conjunct in `WellFormed`
- [ ] `stipulate` frames (hypothesis bundles, never `axiom`)
- [ ] Dependency edges walked from proof terms; `#trustbase` = frame fields ∪ `collectAxioms`
- [ ] `Ledger/Query.lean`: `#status` / `#stale` / `#trustbase` over the value; `lake exe` twins for CI
- [ ] `Corpus/`: port prior theories (`stance`, `ledger`, `conduct`, `convention`) — system describes itself

## Later

We haven't (yet) decided where to place these in the task queue.
Please read and consider slotting them.

- [ ] doc-gen4 API docs → GitHub Pages from CI
- [ ] lean4export + lean4checker external-audit CI step over `Corpus/`
- [ ] InfoView claim-graph widget (`Ledger/Widget.lean`)
- [ ] Revisit autoformatting if the official formatter ships (leanprover/lean4#369)
- [ ] Reservoir publishing / versioned releases
