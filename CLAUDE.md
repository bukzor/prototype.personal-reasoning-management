--- # workaround: anthropics/claude-code#13003
git-caution: personal
requires:
    - Skill(llm-discourse-graph)
depends:
    - Skill(llm-subtask)
---

# prototype.personal-reasoning-management

A framework for defeasible claims and their mandates/authority/proofs,
built in Lean 4.

- Design: `docs/dev/design-sketch.md`
- Setup discourse: `docs/dev/initial-setup.discourse.kb/`

## Current Work

Check `.claude/todo.md` and `.claude/todo.kb/` for active efforts. Load `Skill("llm-subtask")` for maintenance.
