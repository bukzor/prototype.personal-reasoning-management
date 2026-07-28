---
author: Claude Fable
reviews: null #  TODO
---

## Personal Reasoning Management: A Design Sketch

Note: this is agent-authored and not yet reviewed in detail by user. The "oddest" parts are likely from the user -- it's the "obvious" bits that tend to be agent-supplied.

**Goal**: A personal reasoning system where claims are first-class Lean objects, the ledger is an environment extension derived from ground truth, and CS verbs are native elaborator commands.

**Repo skeleton**

```
lakefile.lean          -- lake project, pin toolchain in lean-toolchain
Ledger/Core.lean       -- Claim structure, status types
Ledger/Ext.lean        -- environment extension (persistent claim registry)
Ledger/Cmds.lean       -- elab commands: the CS surface
Ledger/Scan.lean       -- staleness + trust-base metaprograms
Ledger/Widget.lean     -- (later) InfoView claim-graph rendering
Corpus/                -- the actual claims, one module per topic
```

**Core datatypes** (`Core.lean`)

- `structure ClaimMeta`: name, surface text, content hash (hash the `Syntax` tree pre-elaboration, not the elaborated term — this is the CHX mitigation), authority tag, timestamp, provisional flag (PV).
- `inductive Depth | shallow | described | proven` — with the DT repair baked in: depth is _attested by artifact_: shallow = ledger row only; described = a `def stmt : Prop` that elaborates; proven = a theorem the kernel accepted.
- Stipulations (ST/UH): encode as hypothesis bundles — `structure Frame where (h1 : P1) (h2 : P2)` — and asserted claims as theorems taking the bundle: `theorem c (f : Frame) : Q`. Trust base = bundle fields ∪ `#print axioms` output. Never `axiom` for ledger stipulations.

**Environment extension** (`Ext.lean`)

- `initialize ledgerExt : PersistentEnvExtension ...` keyed by claim hash. This is what makes the ledger survive across modules and imports — it rides in the `.olean`s. No sidecar files (PB holds).

**Command surface** (`Cmds.lean`) — the five verbs:

- `claim "CN" : "surface text"` → shallow: registers ledger entry only.
- `describe CN : Prop := ⟨statement⟩` → elaborates statement, stores hash, no proof demanded.
- `stipulate Frame with (h1 : P1) ...` → emits the structure, registers each field as an ST claim with authority.
- `assert CN (f : Frame) : Q := proof` → wraps `theorem`, records dependency edges from the proof term (walk `ConstantInfo` for references to other claims).
- `#status CN` / `#stale` / `#trustbase CN` → query commands over the extension + `collectAxioms`.
  All via `elab` in `Lean.Elab.Command`; steal patterns from mathlib's `#check`-style commands and `Batteries` linters.

**Staleness scanner** (`Scan.lean`)

- On `describe`/`assert`, store the content hash each dependent was proven against. `#stale` = walk the graph, flag any edge where the current hash of the dependency ≠ recorded hash. Runs as a metaprogram; also expose as `lake exe scan` for CI.

**CI** (one workflow)

1. `lake build` (with `lake exe cache get` iff you take the mathlib dep — decide early; for DTPL metatheory you likely want it).
2. `lake exe scan` — fail on staleness.
3. Audit spoke (ARCH): `lean4export` + `lean4checker` over `Corpus/` — external kernel re-check, caps TRUST.

**Build order for the agent**

1. Toolchain pin + empty lake project + CI green (half a day).
2. `ClaimMeta`, `Depth`, hash function over `Syntax` (day).
3. Environment extension + `claim`/`#status` — the shallow-only vertical slice, end to end (1–2 days).
4. `describe` + hashing + `#stale` (2 days).
5. `stipulate`/`assert` with frame bundles + dependency extraction via proof-term walk (3–4 days).
6. Port the prior theories of the actual ledger (`stance`, `ledger`, `conduct`, `convention`) as the first corpus — the system describes itself; this shakes out the verb ergonomics before DTPL content arrives.
7. `#trustbase`, widget rendering, `duper`/`exact?` integration notes — after daily use begins, not before.

**Known hazards to encode as comments now**: syntax-tree hashing re-baselines on toolchain bumps (accept re-verification, don't fight it); elab API churn lands in `Cmds.lean` — keep it thin, logic in `Core`/`Scan`; never let a verdict become an `axiom` (VL).

Point estimate to a usable daily system: **two focused weeks** for steps 1–6 with an agent doing the metaprogramming grunt work. Start at step 3 — the vertical slice proves the architecture before you've spent anything.
