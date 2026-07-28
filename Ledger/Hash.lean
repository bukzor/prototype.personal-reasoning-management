/-! # Content hashing (`HASH_ID`)

Claim identity is a content hash of the surface statement. Informal text
hashes after the mechanical quotient -- encoding, trailing whitespace, line
wrap, nothing else (`QUOTIENT!`). Formal content hashes the pre-elaboration
`Syntax` tree (`HASH_FORMAL`): elaborated terms are version-unstable, so
toolchain bumps re-baseline and re-verify (`VERSION_OUT`).

The hash is FNV-1a 64 over Unicode codepoints -- specified here, not borrowed
from the toolchain, so informal hashes never re-baseline on a Lean bump.
Unicode normalization (NFC/NFD) is not applied: visually identical but
differently-composed text is a different statement until an equivalence claim
says otherwise (`EQUIV_CLAIM!`). -/

namespace ContentHash

/-- FNV-1a 64-bit offset basis. -/
def fnvOffset : UInt64 := 0xcbf29ce484222325

/-- FNV-1a 64-bit prime. -/
def fnvPrime : UInt64 := 0x100000001b3

/-- One FNV-1a step: xor the datum in, multiply by the prime. -/
def mix (h x : UInt64) : UInt64 := (h ^^^ x) * fnvPrime

/-- Fold a string into the hash, one Unicode codepoint per step -- hashing
codepoints, not bytes, is what makes the encoding quotient trivial. -/
def mixString (h : UInt64) (s : String) : UInt64 :=
  s.foldl (fun h c => mix h c.val.toUInt64) h

/-- Fold a name into the hash, by its dot-joined rendering. -/
def mixName (h : UInt64) (n : Lean.Name) : UInt64 :=
  mixString h n.toString

/-- The mechanical quotient (`QUOTIENT!`): each line trimmed (killing
trailing whitespace, wrap indentation, and CR), empty lines dropped, the
rest joined by single spaces. Nothing lexical, nothing semantic -- any
other edit a diff would show is an identity change. -/
def quotient (text : String) : String :=
  let lines := text.splitOn "\n" |>.map (·.trimAscii.copy) |>.filter (· ≠ "")
  String.intercalate " " lines

/-- Hash of an informal surface statement: FNV-1a over the quotiented text. -/
def ofText (text : String) : UInt64 :=
  mixString fnvOffset (quotient text)

/-- Hash of formal content: the pre-elaboration `Syntax` tree
(`HASH_FORMAL`). `SourceInfo` -- positions and surrounding whitespace -- is
outside identity; node kinds, atom values, and identifiers are inside. An
identifier hashes as written, before resolution. Constructor tags are mixed
in so `.atom "x"` and an ident `x` cannot collide structurally. -/
partial def ofSyntax (stx : Lean.Syntax) : UInt64 :=
  go fnvOffset stx
where
  /-- Prefix fold over the tree, `SourceInfo` skipped. -/
  go (h : UInt64) : Lean.Syntax → UInt64
    | .missing => mix h 0
    | .atom _ val => mixString (mix h 1) val
    | .ident _ _ name _ => mixName (mix h 2) name
    | .node _ kind args => args.foldl go (mixName (mix h 3) kind)

end ContentHash
