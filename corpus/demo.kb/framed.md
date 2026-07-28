---
claim: DEMO_FRAMED
premises: [DEMO_STIPULATED]
text: Some natural number is positive.
stmt: ∃ n : Nat, 0 < n
proof: exact ⟨1, f.DEMO_STIPULATED⟩
---

Demonstration of a frame-threaded proof: the tactic reaches the stipulation
through `f`, so the claim's trust base includes `DEMO_STIPULATED` --
granted, not proven. This theory is scaffolding -- delete it once real
theories port with their own assertions.
