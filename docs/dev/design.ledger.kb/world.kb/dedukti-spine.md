# Dedukti / Lambdapi — deferred

Not a substrate — a transport layer between substrates. It was load-bearing
under the hub-and-spoke design; `DECISION` deleted the spokes, so `DEDUKTI` is
now deferred. Kept because `AUDIT_SPOKE` is a re-checking channel and Dedukti is
one of the two candidate targets for it, and because the costs below are what a
future multi-substrate design would have to re-buy.

## What it buys

`TRUST_SWAP`, and only that. Without re-checking, a foreign verdict's authority
includes the foreign kernel. With the exported proof re-checked in Dedukti, that
kernel drops out and is replaced by {Dedukti checker, logic encoding,
translator} — a small checker and published rewrite theories. Real, and the
whole value proposition. Under `NATIVE` the same shape applies inward:
lean4export + lean4checker is the available instance of it today, which is why
`AUDIT_SPOKE` names that pair and treats Dedukti as an alternative target.

## What it does not buy

- **`ALIGNMENT`** — the hard part, and manual. For an imported proof to certify
  *our* claim, the foreign image and the trunk image must be identified *in
  Dedukti*, up to the rewrite theory. But `ℕ` in set.mm is ω, a specific set; in
  Lean it is an inductive type. Identifying them is a hand-authored map, and
  every map is a trust assumption. The consoling part is that alignment maps are
  stipulations — `STIP` claims with an author, revisable, propagating staleness
  per `STALE_PROP` — so the ontology names the cost honestly. No tool automates
  it. Per-concept, per-pair, forever. This is the line item a single-substrate
  design deletes, and the reason `TWO_POLES` admits no hybrid.
- **Logic strength** — Lean's type theory proves more than ZFC (universes ≈
  inaccessibles), so a Lean certification of an aligned statement is a proof in a
  stronger system. Imported verdicts are permanently
  "certified-modulo-embedding"; only a native re-proof discharges to the host's
  own logic. `FIAT_SHIFT` already drew this distinction.
- **Disjoint variables** — Metamath's disjoint-variable conditions are freshness
  side-conditions that λΠ-modulo does not express natively, so the encoding must
  reify them. Solvable; Hilbert systems encode cleanly otherwise. It is the part
  of a Metamath encoding where a bug would be silent.

## Ecosystem reality

Translator maturity is why this is deferred rather than scheduled:

- **Solid**: HOL Light (Holide is the showcase), ATP output (TSTP via ekstrakto,
  Zenon and iProver Modulo natively). "Throw the claim at Vampire or E and import
  the certificate" remains the most industrialized route, and `IMPORT_FITS`
  means the ontology can already accept it with no new machinery.
- **Moderate**: Coq (CoqInE chronically trails Coq versions), Agda
  (Agda2Dedukti, research-grade, partial).
- **Experimental to aspirational**: Lean4. Encoding work exists in Deducteam's
  orbit; a production Lean4→Dedukti pipeline does not. This is decisive — the
  one spoke `NATIVE` would want is the one least built.
- **`BUS_FACTOR`** — the whole ecosystem is research software: small team,
  student-project translators, bit-rot. That is the systemic risk of making it
  load-bearing rather than deferred.

## The alternative target

MM0: Carneiro's MM0 has verified translation ambitions and native kinship with
Metamath-class kernels. Narrower coverage than Dedukti, but a trustworthier
edge. If `AUDIT_SPOKE` ever moves past lean4checker, MM0 and Dedukti are the two
candidates, and neither is close to ready for a Lean4 source.
