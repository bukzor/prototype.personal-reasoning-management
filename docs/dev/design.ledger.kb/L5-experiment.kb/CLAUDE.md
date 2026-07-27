# Substrate assessments — maintenance

One file per candidate the procurement question weighs: each arm in `ARM_SET`,
plus any transport or spine considered alongside them. The evidence behind
`L5-experiment.md`'s claim lines lives here; the claim lines stay authoritative.

## What belongs here

- How one candidate scores against `DAILY_CRITERIA` and `AXES`, with the
  concrete facts that decide it — tooling that exists, measured or estimated
  latency, what authoring actually feels like.
- The cost a candidate imposes if chosen, priced.
- Why a rejected candidate lost — kept after the decision closes, since that is
  the only thing a rejected file is still good for.

## What does not

- **Claim lines.** A finding that other claims cite as a premise is a line in
  `../L5-experiment.md`, labelled. This file gives its evidence.
- **Toolchain facts we depend on** (does `lake` do X, is mathlib pinned) —
  `../../initial-setup.discourse.kb/`. That graph is about the toolchain we
  use; these files are about substrates we are choosing between.

## When to add or revise

A candidate gets a file once anything is claimed about it beyond membership in
`ARM_SET`. Revise in place as evidence lands — the file states today's
assessment, not a log of assessments. When the procurement question closes,
losers keep their files and the winner's file becomes the record of what was
bought and at what price.
