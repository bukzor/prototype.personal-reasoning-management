# Translator — llm-kb in, Lean out

The authoring surface is literally the llm-kb pattern: claims live as `.kb/`
markdown frontmatter. A generator parses them into `Corpus/Generated.lean` —
generation, not elab-time IO, so the artifact is diffable in review and export
tools see plain Lean.

The generator is untrusted (`UNTRUSTED_XLATE`): CI prints the ledger value
back to kb form and diffs it clean — the round-trip check, present from v1. A
generator bug therefore cannot silently misstate a claim; it either
round-trips or fails the build.
