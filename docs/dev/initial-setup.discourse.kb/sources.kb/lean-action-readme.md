---
kind: article
title: "leanprover/lean-action: GitHub action for standard CI in Lean projects"
url: https://github.com/leanprover/lean-action
---

Official Lean CI action. Installs elan, runs `lake build` / `lake test` /
`lake lint` (auto-detected from the Lake workspace), caches `.lake/`, and
runs `lake exe cache get` automatically for projects downstream of Mathlib.
Verified current 2026-07-27.
