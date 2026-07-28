---
claim: DEMO_PROVEN
text: Two and two make four.
stmt: 2 + 2 = 4
proof: decide
---

Demonstration of the `assert` verb: `proof:` discharges `stmt`, and the
proof term rides in the ledger as `Depth.proven` -- the term contains its
proof. Frame-free until `Corpus/Frames.lean` lands. This theory is
scaffolding -- delete it once real theories port with their own formal
artifacts.
