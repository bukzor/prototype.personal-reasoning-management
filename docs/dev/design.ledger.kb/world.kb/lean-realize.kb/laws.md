# Laws — `by decide`

A law is a theorem about the ledger value:

```lean
theorem corpus_ok : WellFormed ledger := by decide
```

The staleness scanner is the first law — a conjunct of `WellFormed` — so the
scanner is a theorem: no checker to trust, only the kernel evaluating a
decidable proposition (`CHECKER_COLLAPSE` realized).

`by decide` is comfortable to roughly 10⁴ claims. Per-law escalation to
`native_decide` trades the compiler into that law's trust base — a recorded,
per-law choice (`TRUST_COST`), never a default.

Meta-theorems over all well-formed ledgers — e.g. warranted standing is
monotone under discharge — are ordinary Lean theorems quantifying over
`Ledger`: `SELF_APPLY`'s payoff, bounded by `REFLECT_LIMIT` to the graph and
never the engine.
