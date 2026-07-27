---
last-updated: 2026-07-27
---

# Design ledger

The claim ledger for this project's design, per `Skill(llm-claim-ledger)`:
labelled claims, premise arrows, standing marked in place. One file per
**level** in `design.ledger.kb/`.

## Stratification

Levels are the ledger's own layering discipline: **each level consumes only
lower levels.** A premise arrow pointing upward is a defect, not a variant.

| Level | Scope | Substrate-free? |
|---|---|---|
| L0 | Process — how the discourse itself is conducted | yes |
| L1 | Ontology — what a claim is | yes |
| L2 | Derived structure — status, identity, trust, staleness | yes |
| L3 | Architecture — the host-encoding commitments | one commitment |
| L4 | Command surface — the intended-frozen cross-substrate object | yes |
| L5 | Experiment — disposable configuration | no |

L5 is meant to be thrown away; L4 is meant to be frozen; L0–L2 should survive
any substrate change.

## Reading and amending

Claim set = union over the levels, **last wins**. Revise a claim by re-defining
it in its level file; the prior version is superseded, and every claim carrying
it as a premise is revisited.

Provenance: `chatfs/claude/Created=2026/07/26/19:25:08-05:00/Personal reasoning
management system across proof assistants/chat.md`.
