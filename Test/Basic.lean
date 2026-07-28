import Ledger

/-! Compile-time half of the harness. A false `#guard` is an elaboration
error, so it fails `lake build` before the runtime driver ever starts. -/

#guard hello = "world"
