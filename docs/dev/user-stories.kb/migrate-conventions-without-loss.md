# Migrate conventions without loss

My corpora recurrently change shape while their content survives:
entries promote into sub-kbs, names get renamed aggressively, schemas
drift and get reconciled (my `migrations.kb` exists because this keeps
happening). A convention migration touching every file must not disturb
any claim's identity, standing, or verdicts — reorganization is not
revision, and the system must know the difference.

**Served by:** HASH_ID (identity is content, so pure re-housing changes
nothing), SURFACE_SPLIT, UNTRUSTED_XLATE (the round-trip is the
migration's correctness check: same value in, same value out).

> [!QUESTION] what does the content hash quotient out?
> If the hash covers surface incidentals — formatting, file location,
> frontmatter ordering — every corpus-wide migration re-baselines every
> claim: mass identity churn, verdicts orphaned, the record poisoned by
> a rename. HASH_ID's "identity is content" needs a stated quotient:
> what counts as content, what is incident. Settles in `ledger`
> (HASH_ID sharpened) and `host` (HASH_FORMAL's hashing surface).
