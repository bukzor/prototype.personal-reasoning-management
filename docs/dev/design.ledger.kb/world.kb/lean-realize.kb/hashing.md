# Hashing — HASH_FORMAL in Lean4

The hashed object is the pre-elaboration `Syntax` tree, never the elaborated
term. Instances, universe metavariables and literal desugaring make elaborated
identity version-unstable, and cross-version stability is unsolvable at the
term level. Toolchain bumps therefore re-baseline: per `VERSION_OUT+`,
re-verifying acquires fresh verdicts under the new kernel's authority rather
than repairing records.
