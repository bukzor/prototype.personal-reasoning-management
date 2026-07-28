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

## Reading and amending

Claim set = union over the theories, **last wins**. Revise a claim by
re-defining it in its theory file; the prior version is superseded, and every
claim carrying it as a premise is revisited.

Provenance: `chatfs/claude/Created=2026/07/26/19:25:08-05:00/Personal reasoning
management system across proof assistants/chat.md`.
