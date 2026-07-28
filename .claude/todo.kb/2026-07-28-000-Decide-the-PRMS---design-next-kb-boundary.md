---
managed-by: Skill(llm-subtask)
status: open
---

# Decide the PRMS / design-next.kb boundary

**Priority:** medium — collision risk grows as either side ships
**Complexity:** discussion + a few ledger/story edits once ruled
**Context:** `~/.claude/skills/llm-discourse-graph/docs/dev/design-next.kb/`
(llm-discourse-graph v2) is live, concurrently developed, and
co-extensive with PRMS in places. Discovered during the 2026-07-28
prior-art mining sweep.

## Problem Statement

Two live designs of the same operator claim overlapping territory.
Nothing on record says which system owns which organ, so both may build
the same thing incompatibly.

## Open Questions

- [ ] Wake/staleness ownership: PRMS `#stale` (STALE_ACK+, LAW) vs the
      llm-triggers sweep design-next assumes. One mechanism or two, and
      who is upstream?
- [ ] Translator target: if v2 ships `kb-spec.md` / `kb doctor`,
      should UNTRUSTED_XLATE ingest that spec rather than invent a
      parallel one?
- [ ] Identity mapping: design-next's dated-record newest-wins vs PRMS
      content-hash + LAST_WINS — reconcilable projections of one
      identity scheme, or genuinely different?

## Success Criteria

- [ ] A ruled boundary claim (user authority) in the ledger or a
      stories note, naming which side owns each of the three organs
- [ ] design-next.kb informed of the ruling (its side of the seam)

## Notes

The mining handoff's Part 7 flagged skill-side debt separately
(CLAIMS_ONLY fiat→certified discharge in llm-claim-ledger's own
design ledger); that is the other repo's work, tracked here only as a
reminder that the seam has two sides.
