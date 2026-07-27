# Agda

The inversion of Metamath: best editor loop in the set, worst everything around
the editor. Fails `DAILY_CRITERIA` on CLI and CI outright.

- **Editing**: holes, `C-c C-c` case splits, interactive refinement — arguably
  the most pleasurable proof-authoring loop of the five. Module parameters are
  the cleanest telescope encoding for `VERB_TARGETS`.
- **CLI / build**: no real build system or package manager; the "standard library
  version × Agda version" matrix is a chronic sore.
- **CI**: batch checking is slow and memory-hungry, `.agdai` invalidation
  cascades aggressively, and there is no good caching story — minutes of
  rechecking on any nontrivial development.
- **Trust audit**: no per-theorem postulate-dependency query, only `--safe` at
  module granularity or external tooling. This is `AGDA_AUDIT`: the arm needs a
  bespoke trust and staleness scanner, which is real cost on the axis the system
  cares most about.
