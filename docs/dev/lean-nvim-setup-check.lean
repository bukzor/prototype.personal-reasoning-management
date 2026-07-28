import Ledger.Basic
/- Editor setup check: verifies a lean.nvim installation end to end against
   this repo. Run `lake build` once, then open from the repo root:

     nvim docs/dev/lean-nvim-setup-check.lean

   Assumes Julian/lean.nvim with `mappings = true`. Key notation: `\i` etc.
   means LocalLeader + key -- LocalLeader is backslash unless you've set
   `maplocalleader`. Work top to bottom; each pace says what to do and what
   you should see. (This file lives outside the lakefile's globs, so lake
   and CI never build it; only `lake serve` ever elaborates it.) -/

-- Pace 1: attach. The infoview should open on its own within a few seconds
-- (first attach spawns `lake serve`; give it a moment). `\i` toggles it.
-- `:checkhealth lean` should show no errors and an attached client.
-- The import above already proves project integration: `Ledger.Basic` only
-- resolves if the server is the repo-pinned toolchain via lake.
#eval hello  -- cursor here: infoview's Messages section shows "world"

-- Pace 2: live goal state. Walk the cursor line by line through this proof
-- and watch the infoview: 1 goal at `by`, 2 goals after `constructor`,
-- then 1, then "No goals" (marked with a checkmark) at the end.
example (p q : Prop) (hp : p) (hq : q) : p ∧ q := by
  constructor
  · exact hp
  · exact hq

-- Pace 3: unicode abbreviations. On the blank line below, in insert mode,
-- type this literally:   example : \forall n : Nat, n + 0 = n := fun n => rfl
-- `\forall` becomes `∀` as you keep typing. Then put your cursor on the `∀`
-- and press `\\` (LocalLeader + backslash): a popup shows how to type it.


-- Pace 4: diagnostics. Uncomment the next line (`gcc` if you have commenting
-- set up, else delete the `-- `): expect a "declaration uses 'sorry'"
-- warning inline, and the unsolved goal `2 + 2 = 5` in the infoview.
-- example : 2 + 2 = 5 := by sorry

-- Pace 5: LSP table stakes, on `Nat.add_comm` below:
--   K            hover docs
--   gd / <C-]>   jump to its definition in the toolchain source (tagfunc)
--   <C-x><C-o>   in insert mode after typing `Nat.ad` -- completion
example (a b : Nat) : a + b = b + a := Nat.add_comm a b

-- Pace 6: infoview extras (optional). `\x` pins the current position's goal
-- so it stays put while you move; `\c` clears pins. `\<Tab>` jumps into the
-- infoview window (q or `\<Tab>` again to come back). `\r` restarts the
-- server for this file if it ever wedges.
