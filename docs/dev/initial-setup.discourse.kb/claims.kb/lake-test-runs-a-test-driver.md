---
status: asserted
sources:
  - ../sources.kb/assistant.md
tags: [testing]
---

# lake test runs a declared test driver

`lake test` invokes whatever the lakefile declares as `testDriver` — a
lean_exe (convention: a `Test/` module tree with a `main`), or a script.
lean-action auto-detects and runs it in CI. For property-based testing,
**Plausible** (née SlimCheck) auto-derives generators and shrinks
counterexamples — a good fit for checking the defeasible-reasoning engine
against its spec.
