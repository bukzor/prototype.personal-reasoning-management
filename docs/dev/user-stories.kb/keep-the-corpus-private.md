# Keep the corpus private

Health, career, and money claims cannot require a public forge to get
checked. The whole check runs locally — `lake build` *is* the check, the
round-trip included — and hosted CI is an optional hedge a corpus opts
into, never the load-bearing verifier. One design serves both a public
corpus (this repo's own ledger) and corpora no one else ever sees.

**Served by:** V1_CHECKERS+ (kernel + well-formedness law + round-trip,
all local), NO_SIDECAR (the corpus is ordinary source — private means a
private directory, nothing more), AUDIT_SPOKE (the hedge, per corpus).
