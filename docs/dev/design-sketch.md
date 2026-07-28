---
author: Claude Fable
reviews: null #  TODO
---

## Personal Reasoning Management: A Design Sketch

Note: this is agent-authored and not yet reviewed in detail by user. The
"oddest" parts are likely from the user -- it's the "obvious" bits that tend to
be agent-supplied.

**Goal**: A personal reasoning system where the claim ledger is a first-class
Lean value generated from llm-kb markdown, laws about the claim set are
theorems the kernel checks, and the authoring surface is plain `.kb/` files.

The governing move (ledger: `NATIVE!`, `LAW`): a registry that is an
*environment extension* can be queried by metaprograms but not quantified over
as a term, so every claim about the claim set caps below proof and every
invariant is a script. A registry that is a *value* — `ledger : Ledger` — can
be quantified over, so the invariants are theorems and the only checker left
in the trust base is the kernel.

**Repo skeleton**

```
lakefile.lean           -- lake project, pin toolchain in lean-toolchain
Ledger/Core.lean        -- Ledger, ClaimMeta, Depth types
Ledger/Laws.lean        -- WellFormed + laws, with Decidable instances
Ledger/Query.lean       -- #status / #stale / #trustbase over the value
Generator/              -- lake exe gen: .kb frontmatter -> Corpus/Generated.lean
Generator/Print.lean    -- round-trip printer: value -> kb form, for the CI diff
Corpus/Generated.lean   -- ledger : Ledger  (generated, committed, diffable)
```

The authoring surface is not in the skeleton because it is not code: claims
are authored as llm-kb `.kb/` frontmatter, wherever the corpus lives.

**Core datatypes** (`Core.lean`)

- `structure ClaimMeta`: id, surface text, content hash (hash the `Syntax`
  tree pre-elaboration, not the elaborated term), premises, authority,
  standing.
- Depth is *data on the claim*: described attaches `stmt : Prop`; proven
  bundles `pf : stmt`. The term contains its proofs — deepening appends an
  artifact to a hash, never migrates the claim.
- Stipulations: hypothesis bundles — `structure Frame where (h1 : P1) ...` —
  and asserted claims as theorems over the bundle: `theorem c (f : Frame) : Q`.
  Trust base = bundle fields ∪ `collectAxioms`. Never `axiom` for ledger
  stipulations.

**Laws** (`Laws.lean`)

- `theorem corpus_ok : WellFormed ledger := by decide`. The staleness scanner
  is a conjunct of `WellFormed` — the scanner is a *theorem*, and `lake build`
  failing is the scan failing.
- Meta-theorems quantify over all ledgers: `theorem discharge_monotone :
  ∀ (l : Ledger), WellFormed l → ...` — ordinary Lean, no metaprogramming.
- `by decide` is comfortable to ~10⁴ claims. Per-law escalation to
  `native_decide` admits the compiler into that law's trust base — a recorded,
  per-law trade, never a default.

**Generator** (`Generator/`)

- `lake exe gen`: parse `.kb/` frontmatter, emit `Corpus/Generated.lean`.
  Generation rather than elab-time IO, so the artifact is committed, diffable
  in review, and export tools see plain Lean.
- The generator is *untrusted*: CI prints the ledger value back to kb form and
  diffs it clean (`Print.lean`). A generator bug cannot silently misstate a
  claim; it either round-trips or fails the build.

**CI** (one workflow)

1. `lake exe gen` + `git diff --exit-code` — generated module is current.
2. `lake build` — building *is* checking `corpus_ok`.
3. Round-trip: print the value back to kb form, diff clean.
4. Audit spoke: `lean4export` + `lean4checker` over `Corpus/` — external
   kernel re-check; the generated module is ordinary declarations, so the
   export sees the corpus whole.

**Build order for the agent**

1. Toolchain pin + empty lake project + CI green (half a day).
2. `Ledger/Core.lean` types + hash function over `Syntax` (day).
3. **Vertical slice**: generator over one `.kb/` file → `Generated.lean` +
   `WellFormed` + `by decide` + round-trip check in CI, end to end (1–2 days).
4. Depth artifacts: `stmt` attachment, `pf` bundling; staleness conjunct
   (1–2 days).
5. Frames + dependency edges walked from proof terms + `#trustbase` (2 days).
6. Port the prior theories of the actual ledger (`stance`, `ledger`,
   `conduct`, `convention`) as the first corpus — the system describes itself;
   this shakes out the surface ergonomics before DTPL content arrives.
7. Query polish, widgets, `duper`/`exact?` integration notes — after daily use
   begins, not before.

**Known hazards to encode as comments now**: syntax-tree hashing re-baselines
on toolchain bumps — re-verifying acquires fresh verdicts, it never repairs
records (`VERSION_OUT+`); the generator is the churn surface — keep it small;
never let a verdict become an `axiom`; `native_decide` is per-law and
recorded, never reached for by reflex.

Point estimate to a usable daily system: **under two focused weeks** for steps
1–6 — the value-based design deletes the environment-extension and elab-verb
metaprogramming that dominated the old estimate. Start at step 3: the vertical
slice proves the architecture before you've spent anything.
