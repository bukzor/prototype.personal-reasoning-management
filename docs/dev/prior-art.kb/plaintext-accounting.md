# Plain-text accounting — beancount, hledger

Personal financial ledgers as text files checked by a strict decidable
checker (`bean-check`), grep and ls as the query surface, sustained for
decades of daily single-person use. The nearest overall *dynamics* twin:
text authoring surface plus build-failing checker, proven to survive
real life.

**Gems:**

- The existence proof itself: individuals keep text-surface +
  strict-checker systems alive for decades when capture is cheap and the
  checker is fast.
- Two temporal genres coexisting: append-only journal entries beside
  revise-in-place declarations (open/close/price) — a corpus can mix
  both without confusion.
- Plugins as user-defined laws over the parsed ledger value.

**Informs:** SURFACE_SPLIT, BASIS_API!, V1_CHECKERS+, DAILY_CRITERIA!;
`../user-stories.kb/capture-without-ceremony.md`,
`../user-stories.kb/ten-year-durability.md`.
