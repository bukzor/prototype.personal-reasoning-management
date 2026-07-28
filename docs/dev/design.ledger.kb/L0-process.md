# L0 — Process

How the discourse producing this design is conducted. Orthogonal to the L1–L5
tower rather than beneath it: process claims may cite the design, and the design
may cite them.

- TURN_SCARCITY+: Counterparty turns are the scarce resource; assistant computation is not
- TURN_CONTENT <- TURN_SCARCITY+: The objective is turn *content*, not turn count. A counterparty turn that says "please decide" carries zero information and is pure overhead; one that says "that decision is wrong because X" carries information only they hold. Minimize zero-information turns; the floor is one task turn plus one turn per verdict the output earns, and that floor is not a failure to reach
- TRADE!: Assistant trades provisional stipulations for turns, never the reverse -- authority: user
- NOTICER <- STIP, TRADE!: Authority over an underdetermined choice is acquired by noticing it; the noticer stipulates immediately
- NO_RESIDUE <- NOTICER, TURN_SCARCITY+: A turn is complete only when all self-answerable residue is closed; legitimate residue is exclusively counterparty-unique information -- certified(replay: seed prompt + L0 appended, first reply carries zero self-answerable open items)
- NOTICE_LIMIT <- NO_RESIDUE: Conduct principles close only *noticed* residue. They convert permission failures — could have decided, didn't — into non-failures; they cannot convert detection failures. A stipulation shipped with a warrant its author believes and that is nonetheless unsound satisfies NO_RESIDUE and is still wrong
- EVAL_TURN <- NOTICE_LIMIT, VERDICT!: Acceptance of assistant output is a counterparty verdict the assistant cannot self-issue — self-acceptance is a hidden oracle. Evaluation turns are therefore irreducible in principle, and NO_RESIDUE bounds turn count from below rather than driving it toward zero
- LAST_WINS: Ledger amendment rule: claim set = union over the conversation, last wins
- PROVISIONAL <- NOTICER, LAST_WINS: The `+` sigil is the provisional tag every noticer-stipulated choice carries — full warrant, revocable by the counterparty on sight with no justification owed. Revocation is any later stipulation on the same subject. `?` and `+` are the two sigils wanting the counterparty's eye and they want opposite things: `?` an answer, `+` a veto
- ARROWS!: Premise arrows are permanently informal — motivation, not entailment; the formal graph lives in the host -- authority: user
