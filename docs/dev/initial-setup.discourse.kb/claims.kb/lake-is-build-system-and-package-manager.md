---
status: asserted
sources:
  - ../sources.kb/assistant.md
tags: [toolchain, build]
---

# Lake is both build system and package manager

Lake ships with Lean. `lakefile.toml` (declarative, preferred for simple
projects) or `lakefile.lean` (programmable) defines targets and deps;
`lake-manifest.json` is the lockfile. `lake build` is incremental.
There is no separate package-manager decision to make.
