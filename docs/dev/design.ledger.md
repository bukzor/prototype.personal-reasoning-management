---
last-updated: 2026-07-28
---

# Design ledger

The claim ledger for this project's design, per `Skill(llm-claim-ledger)`:
labelled claims, premise arrows, standing marked in place. One file per
**theory** in `design.ledger.kb/`.

## Theories

A theory is a named set of claims over a fixed **ontology** — the vocabulary
its claims are allowed to use. A theory names zero or more **prior** theories
and admits their ontologies along with its own, so the theories form a poset by
ontology inclusion rather than a tower.

```
                    ┌─► conduct
stance ──► ledger ──┼─► convention
                    └─► purpose ──► host ──► world
```

| Theory | Admits | Defeated by |
|---|---|---|
| `stance` | acts, authors, judgment, parsimony | a foundation that is a truth rather than an act |
| `ledger` | claims, checkers, verdicts, hashes, trust | a second node type |
| `conduct` | turns, counterparties, residue | a change in what is scarce |
| `convention` | files, labels, sigils, readers | a reader that is a tool, not an agent |
| `purpose` | the user, the corpus, daily use | a different user, corpus or utility function |
| `host` | engines, kernels, elaborators, environments | a host missing one of those parts |
| `world` | Lean4, mathlib, Metamath, version numbers | any of them changing |

The poset is **assigned, not computed**: a theory declares its priors in its
own header, and that declaration is the commitment. Two rules keep it honest.

**Confinement.** A claim may use only the vocabulary its theory admits — its
own ontology plus every prior's. This is what fixes placement: a claim's theory
is chosen by the words it needs, not by the turn that produced it. It is also
greppable, which is why it is the rule that gets enforced.

**Conservativity.** A theory may not defeat what it extends. Admitting new
ontology adds claims; it never changes the standing of a claim in a prior
theory. Where it appears to, the prior theory was wrong and gets fixed there.

`world` is meant to be thrown away and `host` to be frozen; `stance`, `ledger`
and `convention` should survive any substrate change.

Nothing in `stance` or `convention` is specific to this project, and the
medium-independent form of both is carried in `Skill(llm-claim-ledger)`,
whose `design.ledger.kb/` is itself a ledger in theories: `stance.kb/` and
`purpose.kb/` for what the notation is for, `good-smells.kb/` for the
criteria, `notation.kb/` for the decisions. Thirteen claims are the same
commitment on both sides and **carry the same label on both sides**, so
the correspondence is a grep rather than a table: `REGRESS_ACT`,
`AUTHOR_ACTS`, `PARSIMONY`, `ARROWS`, `IMAGE`, `LEAST_FIX`,
`CLAIMS_ONLY`, `STIP`, `WARRANT`, `SELF_CONTAINED`, `FRESH_READER`,
`PROVISIONAL`, `TRICHOTOMY`. Stated there for any claim notation, here
for this one. The rest
do not correspond and are not meant to: `ledger` is this project's rung
and has no counterpart there, `good-smells` is the skill's and has none
here, and the two `purpose` theories share only a name (`NAME_REUSE+`).
`NAME_THE_JUDGE!` is stated there inside `AUTHOR_ACTS` rather than as
its own claim, since nothing over there cites it.

Neither copy is a pointer to the other: divergence across the overlap is
the drift check, and a defect in one of the two.

## Reading and amending

Claim set = union over the theories, **last wins**. Revise a claim by
re-defining it in its theory file; the prior version is superseded, and every
claim carrying it as a premise is revisited.

Provenance: `chatfs/claude/Created=2026/07/26/19:25:08-05:00/Personal reasoning
management system across proof assistants/chat.md`.
