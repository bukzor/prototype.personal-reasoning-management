---
author: Claude Fable
reviews: null #  TODO
---

# Personal Reasoning Management — Design Sketch

One concrete realization of the ledger's commitments, drawn whole. A
label tag (`NATIVE!`, `HYP_FIAT!`, …) means the ledger decides that point
there; every unlabelled
concrete choice — names, key spellings, hash width, frame granularity — is
arbitrary, replaceable without a ledger edit. Where a choice is arbitrary
the sketch still makes one: a sketch that refuses to pick is a list of
options, not a design.

## The spine

Five decisions are minimally unique to this design; everything below is
their consequence.

1. The registry is an object-language *value* the engine quantifies over,
   not engine state beside the corpus (`NATIVE!`) — so laws about the
   claim set are kernel-checked theorems (`LAW`, `META_DEPTH`).
2. A stipulation is a hypothesis, never an axiom (`HYP_FIAT!`,
   `NO_AXIOMS`) — trust base sits inside the claim's own statement.
3. Identity is a content hash of the surface statement; every verdict pins
   the hash it judged, and all standing is computed from that evidence,
   never stored (`HASH_ID`, `MONOTONE`, `PROJECTION`).
4. Authoring is markdown; the record is Lean; the translator between them
   is untrusted and audited by round-trip (`SURFACE_SPLIT`,
   `UNTRUSTED_XLATE`).
5. The substrate is Lean4, all-in (`DECISION!`), with one external
   re-check as the hedge (`AUDIT_SPOKE`).

## Repo skeleton

```
lean-toolchain            -- pinned release
lakefile.toml             -- decided: all our lakefile needs are declarative
Ledger/Core.lean          -- Source, Degree, Verdict, ClaimMeta, Depth
Ledger/Laws.lean          -- WellFormed conjuncts; corpus_ok
Ledger/Query.lean         -- status / stale / trustBase, + #command wrappers
Gen/Main.lean             -- lake exe gen: corpus/ → Corpus/*.lean
Gen/Print.lean            -- lake exe roundtrip: value → kb text, for the diff
Corpus/Generated.lean     -- ledger : Ledger   (generated, committed)
Corpus/Frames.lean        -- stipulation frames (generated alongside)
corpus/                   -- authoring surface: llm-kb theories, one dir each
```

## Core types (`Ledger/Core.lean`)

```lean
inductive Source where                    -- NAME_THE_JUDGE!: judge recorded
  | user
  | agent    (name : String)
  | checker  (name version : String)      -- SOURCE!: one kind, mechanical evidence
  | imported (doc : String)

structure Degree where                    -- DEGREE!: default full costs nothing
  truth : Rat := 1
  certainty : Rat := 1
  utility : Rat := 1

structure Verdict where                   -- EVIDENCE_SHAPE+
  source : Source
  judged : UInt64                         -- hash at judgment time (MONOTONE)
  degree : Degree := {}
  date   : String                         -- ISO 8601; arbitrary

structure ClaimMeta where                 -- the registry row: Prop-free,
  label    : Lean.Name                    --   so DecidableEq derives and
  hash     : UInt64                       --   `by decide` can run (LAW)
  text     : String
  premises : List Lean.Name               -- motivation, not entailment (ARROWS!)
  evidence : List Verdict                 -- append-only (MONOTONE)
  deriving DecidableEq, Repr

inductive Depth where                     -- DEPTH_ATTEST: artifacts, as data
  | stated
  | described (stmt : Prop)
  | proven    (stmt : Prop) (pf : stmt)   -- the term contains its proof

structure Claim where
  row   : ClaimMeta                       -- `meta` is a reserved keyword
  depth : Depth

abbrev Ledger := List Claim
```

Laws run over `ledger.map (·.row)`, the decidable projection; the pin
between a row and its `Depth` artifact is the elaborator's job — the
generator emits them adjacent, and a missing artifact is a build failure,
which is already a kernel-grade check.

Hashing: formal content hashes the pre-elaboration `Syntax` tree
(`HASH_FORMAL`); informal text hashes the string after the mechanical
quotient — encoding, trailing whitespace, line wrap, nothing else
(`QUOTIENT!`). No law reads labels (`NAME_BLIND`).

## Frames (`Corpus/Frames.lean`)

One frame per theory, extending its priors' frames along the poset —
granularity arbitrary, the mechanism not (`HYP_FIAT!`, `FRAME_BUNDLE+`):

```lean
structure Frame.stance where
  REGRESS_ACT : C.REGRESS_ACT.stmt        -- one field per stipulation
  DECREE : True                           -- informal stipulation: named, no force

structure Frame.ledger extends Frame.stance where
  LAST_WINS : C.LAST_WINS.stmt

theorem C.STALE_PROP.pf (f : Frame.ledger) : C.STALE_PROP.stmt := …
```

Every proof threads its theory's frame, used or not, so a claim's shape
never changes when a frame dependency appears. An informal stipulation
(no `stmt:`) fields as `True` — named in the trust base, carrying no
propositional force until described.

Trust base of an assertion = its frame's fields ∪ `collectAxioms` over its
proof — computed, never listed by hand (`TRUST_BASE`, `INTROSPECT`).

## Laws (`Ledger/Laws.lean`)

```lean
def WellFormed (rows : List ClaimMeta) : Prop :=
  premisesResolve rows ∧ stipulationsAuthored rows ∧ staleDebtAcknowledged rows

theorem corpus_ok : WellFormed (ledger.map (·.row)) := by decide
```

The staleness scanner is the third conjunct — a verdict whose `judged`
hash is no longer its claim's current hash is debt, reported by the query
and bounded by the law (`FALLOUT!`, `V1_CHECKERS+`). `by decide` is
comfortable to ~10⁴ claims; per-law escalation to `native_decide` is a
recorded trade of the compiler into that law's trust base (`TRUST_COST`),
never a default. Meta-theorems — `∀ rows, WellFormed rows → …` — are
ordinary Lean over the same types.

## Pipeline and CI

```
corpus/**.kb/*.md ──lake exe gen──► Corpus/*.lean ──lake build──► corpus_ok ✓
        ▲                                │
        └────── lake exe roundtrip ◄─────┘        diff clean, or the build dies
```

CI is four steps: (1) `gen` + `git diff --exit-code`, (2) `lake build` —
building *is* checking `corpus_ok`, (3) round-trip diff
(`UNTRUSTED_XLATE`), (4) lean4export + lean4checker over `Corpus/` — the
generated module is ordinary declarations, so the external kernel sees the
corpus whole (`AUDIT_SPOKE`).

## Verbs (`BASIS_API!`, `VERB_TARGETS`)

Authoring is editing frontmatter; the generator does the rest. Keys are
arbitrary; the four verbs are not.

| verb | frontmatter delta | generated |
|---|---|---|
| claim | `claim:`, `text:` | registry row, `Depth.stated` |
| describe | + `stmt:` (Lean prop) | `abbrev X.stmt : Prop` — elaborates, no proof owed; reducible so proofs see through the name |
| stipulate | + `authority:` | field in its theory's frame, authored (`STIP`) |
| assert | + `proof:` (tactic block) | `theorem X.pf (f : Frame.θ) : X.stmt`; premises walked from the proof term |

Queries `#status` / `#stale` / `#trustbase` are functions over `ledger`,
with `lake exe` twins for CI.

End to end, porting this ledger's own `LEAST_FIX!` (`SELF_HOST!`):

```yaml
--- # corpus/ledger.kb/least-fix.md
claim: LEAST_FIX
authority: user
premises: [ASSERT]
text: Provenness is the least fixpoint of ASSERT — cycles are unproven.
---
```

```lean
-- Corpus/Generated.lean (generated; do not edit)
def C.LEAST_FIX : ClaimMeta :=
  { label := `LEAST_FIX, hash := 0xa3f0c2e1d4b59876, text := "Provenness is …",
    premises := [`ASSERT],
    evidence := [{ source := .user, judged := 0xa3f0c2e1d4b59876,
                   date := "2026-07-28" }] }
```

## Hazards, encoded as comments from day one

Toolchain bumps re-baseline `Syntax` hashes — re-verifying acquires fresh
verdicts under the new authority, it never repairs records
(`VERSION_OUT`). The generator is the churn surface — keep it small
(`CHURN`). A verdict never becomes an `axiom` (`NO_AXIOMS`). Persistence
is the source file; if a feature wants runtime state beside the
declarations, it is the rejected branch returning (`NO_SIDECAR`).

## Where the rest lives

- The commitments themselves: `design.ledger.md` + `design.ledger.kb/`
- Per-mechanism rationale: `design.ledger.kb/world.kb/lean-realize.kb/`
- Build order: `.claude/todo.md` — vertical slice first
