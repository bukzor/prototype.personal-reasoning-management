# Frames — hypothetical fiat in Lean4

A stipulation is a `structure Frame where (h1 : P1) ...`, threaded explicitly,
because bare `variable` sections do not compose across imports —
`FRAME_BUNDLE+`'s cost, landing on ledger machinery rather than the authoring
surface. An assertion is `theorem c (f : Frame) : Q`; the trust base is the
bundle's fields plus `#print axioms`.

Never `axiom` for a ledger stipulation — that is `NO_AXIOMS`, and it is the
one rule whose violation is silent.
