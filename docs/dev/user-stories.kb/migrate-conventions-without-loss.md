# Migrate conventions without loss

My corpora recurrently change shape while their content survives:
entries promote into sub-kbs, names get renamed aggressively, schemas
drift and get reconciled (my `migrations.kb` exists because this keeps
happening). A convention migration touching every file must not disturb
any claim's identity, standing, or verdicts — reorganization is not
revision, and the system must know the difference.

**Served by:** HASH_ID (identity is content, so pure re-housing changes
nothing), SURFACE_SPLIT, UNTRUSTED_XLATE (the round-trip is the
migration's correctness check: same value in, same value out),
QUOTIENT! (the quotient is stated: mechanical only — encoding,
trailing whitespace, wrap — so formatting churn within it is free),
ID_BOUNDARY! + HASH_RENDER (file location, frontmatter ordering,
labels, and arrows sit outside the statement entirely — re-housing and
renaming touch no hash), EQUIV_CLAIM! (a migration that must reword
statements asserts sameness as ordinary claims — the migration
script's residue, consumable by scoped normalization laws).
