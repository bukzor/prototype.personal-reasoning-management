---
managed-by: Skill(llm-subtask)
---

Setup spine (each item ≈ one small commit; sequenced so each verifies the previous):

- [x] Breadth-first setup discourse graph (`docs/dev/initial-setup.discourse.kb/`)
- [x] elan via brew; Brewfile
- [ ] `lake init`: `lean-toolchain` pin (latest stable), root module `Ledger`, `.gitignore` (`.lake/`); `lake build` green
  - lakefile.toml — decided 2026-07-28 (community default per core-team RFC
    leanprover/lean4#4106; all our lakefile needs are declarative;
    `lake translate-config` makes reversal one command)
- [ ] Add Batteries dependency (or record core-only decision); commit `lake-manifest.json`
- [ ] lean.nvim in nvim config (lives in dotfiles repo — breadcrumb only here)
  - verify: infoview shows goals in a scratch theorem; `\forall` → `∀` abbreviation works
- [ ] CI: `.github/workflows/ci.yml` with `leanprover/lean-action@v1` (`build-args: "--wfail"`); push, verify green on origin
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
- [ ] doc-gen4 API docs → GitHub Pages from CI
- [ ] lean4export + lean4checker external-audit CI step over `Corpus/`
- [ ] InfoView claim-graph widget (`Ledger/Widget.lean`)
- [ ] Revisit autoformatting if the official formatter ships (leanprover/lean4#369)
- [ ] Reservoir publishing / versioned releases
