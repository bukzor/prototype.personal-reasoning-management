# Dedukti / Lambdapi as spine

Not an arm — a transport layer under the arms. Considered as the thing that makes
`HUB` plus satellites a trust improvement rather than merely a convenience.

## What it buys

`TRUST_SWAP`, and only that. Without re-checking, a satellite verdict's authority
includes the foreign kernel: we trust Lean's checker. With the exported proof
re-checked in Dedukti, that kernel drops out and is replaced by {Dedukti checker,
logic encoding, translator} — a small checker and published rewrite theories.
Real, and the whole value proposition.

## What it does not buy

- **`ALIGNMENT`** — the hard part, and manual. For an imported proof to certify
  *our* claim, the foreign image and the trunk image must be identified *in
  Dedukti*, up to the rewrite theory. But `ℕ` in set.mm is ω, a specific set; in
  Lean it is an inductive type. Identifying them is a hand-authored map, and
  every map is a trust assumption. The consoling part is that alignment maps are
  stipulations — `STIP` claims with an author, revisable, propagating staleness
  per `STALE_PROP` — so the ontology names the cost honestly. No tool automates
  it. Per-concept, per-pair, forever.
- **`LOGIC_STRENGTH`** — Lean's type theory proves more than ZFC (universes ≈
  inaccessibles), so a Lean certification of an aligned statement is a proof in a
  stronger system. Rarely material for `CORPUS`, but imported verdicts are
  permanently "certified-modulo-embedding" and a trunk-native re-proof stays the
  only thing that discharges to bare ZFC. `FIAT_SHIFT` already drew this
  distinction; here it earns its keep.
- **`DISJOINT_VARS`** — Metamath's disjoint-variable conditions are freshness
  side-conditions that λΠ-modulo does not express natively, so the encoding must
  reify them. Solvable; Hilbert systems encode cleanly otherwise. It is the part
  of the trunk encoding where a bug would be silent, so it is the part to
  desk-check hardest.

## Ecosystem reality

Translator maturity decides which satellites exist *this year*:

- **Solid**: HOL Light (Holide is the showcase), ATP output (TSTP via ekstrakto,
  Zenon and iProver Modulo natively). "Throw the claim at Vampire or E and import
  the certificate" is the most industrialized spoke — a pleasant surprise for a
  claims system.
- **Moderate**: Coq (CoqInE chronically trails Coq versions), Agda
  (Agda2Dedukti, research-grade, partial).
- **Experimental to aspirational**: Lean4. Encoding work exists in Deducteam's
  orbit; a production Lean4→Dedukti pipeline does not. Isabelle export is
  similarly thin. This is the schedule risk — `B3_LEAN` wants the spoke that is
  least built.
- **`BUS_FACTOR`** — the whole ecosystem is research software: small team,
  student-project translators, bit-rot. That is the systemic risk of making it
  load-bearing rather than deferred.

## The competing spine

`MM0_SPINE`: Carneiro's MM0 has verified translation ambitions and native kinship
with the trunk, and MM1 is already being trialled per `T1_ADOPT`. Narrower
satellite coverage than Dedukti, but the MM↔MM0 edge is trustworthy in a way no
Dedukti translator currently matches. Plausibly both — MM0 for trunk-adjacent
transport, Dedukti for foreign logics.
