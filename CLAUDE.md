--- # workaround: anthropics/claude-code#13003
git-caution: personal
requires:
    - Skill(llm-discourse-graph)
    - Skill(llm-claim-ledger)
depends:
    - Skill(llm-subtask)
---

# prototype.personal-reasoning-management

A framework for defeasible claims and their mandates/authority/proofs,
built in Lean 4.

- Design rationale, in prose: `docs/dev/design-sketch.md`
- Design ledger — the labelled claims the design commits to, by level:
  `docs/dev/design.ledger.md`
- Setup discourse — questions and claims about the toolchain:
  `docs/dev/initial-setup.discourse.kb/`

## Current Work

Check `.claude/todo.md` and `.claude/todo.kb/` for active efforts. Load `Skill("llm-subtask")` for maintenance.
