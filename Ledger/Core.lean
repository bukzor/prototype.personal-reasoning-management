import Batteries.Tactic.Lint.Simp

/-! # Core types

The registry is an object-language value (`NATIVE!`): `ledger : Ledger` is
ordinary data the laws quantify over. Rows (`ClaimMeta`) stay `Prop`-free so
`DecidableEq` derives and `by decide` can run (`LAW`); the `Prop`s live in
`Depth` artifacts (`DEPTH_ATTEST`), pinned to rows by the generator emitting
them adjacent. -/

/-- Who rendered a verdict (`NAME_THE_JUDGE!`). A checker is one source kind
among the others, carrying mechanical evidence (`SOURCE!`). -/
inductive Source where
  | user
  | agent (name : String)
  | checker (name version : String)
  | imported (doc : String)
  deriving DecidableEq, Repr

/-- Graded standing on three axes. The default is full assent on every axis,
so the common case costs nothing to author (`DEGREE!`). -/
structure Degree where
  /-- How true the judge holds the claim to be. -/
  truth : Rat := 1
  /-- How sure the judge is of that truth assignment. -/
  certainty : Rat := 1
  /-- How much the claim matters to the judge. -/
  utility : Rat := 1
  deriving DecidableEq, Repr

/-- One judgment event (`EVIDENCE_SHAPE+`). `judged` pins the content hash the
verdict saw, so standing is computed from evidence, never stored (`MONOTONE`).
`date` is ISO 8601. -/
structure Verdict where
  /-- Who judged. -/
  source : Source
  /-- The claim's content hash at judgment time (`MONOTONE`). -/
  judged : UInt64
  /-- The graded standing rendered. -/
  degree : Degree := {}
  /-- When judged, ISO 8601. -/
  date : String
  deriving DecidableEq, Repr

/-- The registry row. Premises are motivation, not entailment (`ARROWS!`);
evidence is append-only (`MONOTONE`). -/
structure ClaimMeta where
  /-- Human-facing locus name; no law reads it (`NAME_BLIND`). -/
  label : Lean.Name
  /-- Content hash of the surface statement -- the claim's identity (`HASH_ID`). -/
  hash : UInt64
  /-- The surface statement itself. -/
  text : String
  /-- Labels of the claims this one rests on (`ARROWS!`). -/
  premises : List Lean.Name
  /-- Every verdict rendered on this claim, append-only (`MONOTONE`). -/
  evidence : List Verdict
  deriving DecidableEq, Repr

/-- Attestation depth, as data (`DEPTH_ATTEST`): `described` attaches the
formal statement, `proven` bundles the proof term itself — so deepening
appends an artifact and never migrates the claim. -/
inductive Depth where
  | stated
  | described (stmt : Prop)
  | proven (stmt : Prop) (pf : stmt)

-- The dependent constructor's auto-generated `injEq` is not simp-normal;
-- linter noise, not a law.
attribute [nolint simpNF] Depth.proven.injEq

/-- A registry row paired with its depth artifact. Laws run over the decidable
projection `ledger.map (·.row)` (`PROJECTION`). The field is `row`, not
`meta` -- `meta` is a reserved keyword (module-system declaration modifier). -/
structure Claim where
  /-- The decidable registry row. -/
  row : ClaimMeta
  /-- The depth artifact the generator emitted beside it. -/
  depth : Depth

/-- The registry, an object-language value (`NATIVE!`). -/
abbrev Ledger := List Claim
