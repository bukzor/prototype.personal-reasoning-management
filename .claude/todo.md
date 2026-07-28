---
managed-by: Skill(llm-subtask)
---

Setup spine (each item ≈ one small commit; sequenced so each verifies the previous):

- [x] Breadth-first setup discourse graph (`docs/dev/initial-setup.discourse.kb/`)
- [x] elan via brew; Brewfile
- [x] `lake init`: `lean-toolchain` pin (latest stable), root module `Ledger`, `.gitignore` (`.lake/`); `lake build` green
  - lakefile.toml — decided 2026-07-28 (community default per core-team RFC
    leanprover/lean4#4106; all our lakefile needs are declarative;
    `lake translate-config` makes reversal one command)
  - pinned v4.32.2; `lib.toml` template. Scaffold also dropped
    `.github/workflows/lean_action_ci.yml` and an empty `lake-manifest.json`,
    both committed as generated — the CI item below rewrites the workflow.
  - `Ledger/Basic.lean` is scaffold placeholder; `Ledger/Core.lean` replaces it
- [x] Add Batteries dependency; re-commit `lake-manifest.json`
  - accepted 2026-07-28 (user's call). The lint item below already
    presupposes it (`@[lint_driver]` is Batteries', not core), and the
    trust base stays honest either way — Batteries is `sorry`-free and
    `#trustbase` computes from `collectAxioms`, never from the manifest.
  - pinned `rev = "v4.32.0"` (the tag matching `lean-toolchain`), not `main`
  - verified out of tree: `trash/batteries-smoke.lean` elaborates a
    Batteries-only datum and tactic. Nothing under `Ledger/` imports it yet.
- [ ] lean.nvim in nvim config (lives in dotfiles repo — breadcrumb only here)
  - verify: infoview shows goals in a scratch theorem; `\forall` → `∀` abbreviation works
- [x] CI: `.github/workflows/ci.yml` with `leanprover/lean-action@v1` (`build-args: "--wfail"`); push, verify green on origin
  - scaffold's `lean_action_ci.yml` renamed; `--wfail` verified locally
  - green on origin at f3fcf3e in 25s; log confirms both flags took effect
    (`BUILD_ARGS: --wfail`, "Using bundled leanchecker from the active Lean
    toolchain") rather than being silently ignored
  - also turned on `leanchecker: true` now rather than at the AUDIT_SPOKE
    item — the action bundles the checker for toolchains ≥ v4.28.0-rc1, so
    the hedge costs one line today instead of a build step later
- [ ] Test skeleton: `Test/` module + `testDriver` in lakefile; one trivial `#guard` + one runtime assertion; `lake test` green locally and in CI
- [ ] Lint skeleton: Batteries `@[lint_driver]`; `lake lint` green locally and in CI
- [x] README + license — Apache-2.0 by reference to the canonical online
      copy (user's call, 2026-07-28); note GitHub's license auto-detection
      wants the full text and won't badge a by-reference LICENSE

Framework build order (from `docs/dev/design-sketch.md`; vertical slice first — prove the architecture before widening):

- [ ] `Ledger/Core.lean`: `Source`, `Degree`, `Verdict`, `ClaimMeta`, `Depth`, `Claim`, `Ledger`
- [ ] Content hash: formal over the pre-elaboration `Syntax` tree; informal over
      the text after the mechanical quotient (encoding, trailing whitespace, wrap)
- [ ] `Gen/Main.lean`: `lake exe gen` — `corpus/**.kb/*.md` frontmatter →
      `Corpus/Generated.lean` (committed, diffable)
- [ ] `Ledger/Laws.lean`: `WellFormed` + `theorem corpus_ok := by decide` — vertical slice end to end over one kb file
- [ ] `Gen/Print.lean`: `lake exe roundtrip` + CI diff check — the generator is untrusted
- [ ] External audit over `Corpus/` — the fourth CI step, and spine decision
      #5's only hedge against all-in Lean (`AUDIT_SPOKE`), so it is committed
      work, not a might-never. `leanchecker: true` is already on; what remains
      is deciding whether that is enough. It re-checks with Lean's own kernel
      code, so it cannot catch a kernel bug — `lean-action`'s `nanoda: true`
      (independent Rust type checker, `nanoda-allow-sorry: false`) is the
      genuinely independent re-check, at the cost of a Rust toolchain in CI.
      Revisit once `Corpus/` is real enough that the run time is measurable.
- [ ] Depth artifacts: `stmt : Prop` attachment (described), `pf : stmt` bundling (proven); staleness conjunct in `WellFormed`
- [ ] `Corpus/Frames.lean`: `stipulate` frames, generated alongside the rows
      (hypothesis bundles, never `axiom`)
- [ ] Dependency edges walked from proof terms; `#trustbase` = frame fields ∪ `collectAxioms`
- [ ] `Ledger/Query.lean`: `#status` / `#stale` / `#trustbase` over the value; `lake exe` twins for CI
- [ ] `corpus/`: port prior theories (`stance`, `ledger`, `conduct`, `convention`) — system describes itself

Ledger hygiene:

- [ ] Certification review pass over the remaining bare/`+` claims — pure
      derivations and world empiricals are agent reasoning with no recorded
      review; certify or contest each in fresh context, landing
      `-- certified(review NNN)` trailers. The implied-ratification set
      (HYP_CONTENT, HASH_ID, SURFACE_SPLIT, ACCEPTED, DEPTH_ATTEST,
      PROJECTION, MONOTONE, CHECKER, DEFEAT) counts as settled by
      restatement inside user-ruled texts unless the user rejects that device.

## Later

We haven't (yet) decided where to place these in the task queue.
Please read and consider slotting them.

- [ ] Law candidate: citation integrity — every claim-label mention across
      corpus surfaces (stories, facets, prose) resolves to a defined claim
      and bears its current sigil. Manual grep today (done twice by hand,
      2026-07-28); a `WellFormed` conjunct once the translator ingests
      prose mentions. Sigil flips then surface every stale citation.
- [ ] Pre-Lean projection tool over `docs/dev/design.ledger.kb/` — small
      Python: hash statements, derive sigils, staleness + well-formedness
      checks; its parser/hasher is the translator's front half, reusable.
      Frontier and rationale:
      `docs/dev/prior-art.kb/bukzor.kb/hypothetical-python-prms.md`
- [ ] doc-gen4 API docs → GitHub Pages from CI
- [ ] InfoView claim-graph widget (`Ledger/Widget.lean`)
- [ ] Revisit autoformatting if the official formatter ships (leanprover/lean4#369)
- [ ] Reservoir publishing / versioned releases
