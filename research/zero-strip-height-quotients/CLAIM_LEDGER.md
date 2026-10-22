# Claim ledger

Labels: **PROVED** means a complete written proof from cited classical inputs;
**LEAN VERIFIED** means the exact named declaration was kernel-compiled;
**CONDITIONAL** explicitly states a hypothesis; **OPEN** is not settled here;
**REFUTED** is an attempted model contradicted by the stated proof;
**EXACT CHECK** is finite rational diagnostic only.

| ID | Claim | Label | Evidence and limits |
|---|---|---|---|
| A1 | `xi` is entire, has the nontrivial zeros with orders, and obeys functional/conjugation symmetry | PROVED (classical) | S1 plus standard analytic continuation/real structure; `MATHEMATICS §1` |
| A2 | `C,F,R` preserve the full divisor, square to identity, commute, and form faithful ambient `V_4` | PROVED; LEAN VERIFIED (elementary identities/distinctness) | `MATHEMATICS §1`; `ZeroStripCore.C_sq`, `F_sq`, `R_sq`, `C_comp_F`, `F_comp_C`, `ambient_maps_pairwise_distinct` |
| A3 | Restricted zero action is faithful | CONDITIONAL / not asserted | Under RH `R` fixes every marked point. No unconditional faithfulness of `V_4` on `Z` is claimed. |
| A4 | `det C=det R=-1`, `det F=+1` | LEAN VERIFIED for displayed matrices | `ZeroStripCore.det_C`, `det_F`, `det_R`; the derivative identification and orientation character are written arguments, not formalized |
| A5 | A fixed `T>0` preserves the full zero divisor | REFUTED | `MATHEMATICS §2`: local finiteness + cell count + RvM.  Includes multiplicities and half-open endpoint accounting. |
| A6 | A half-twisted height glide preserves the divisor | REFUTED | Its square is vertical translation by `2T`; written proof and `ZeroStripSupplement.glide_square` |
| A7 | Unweighted support is nonperiodic | OPEN | The divisor proof cannot discard multiplicity; no unsupported claim made. |
| A8 | Ordinary finite-height quotient is a closed cylinder; twisted one a closed Mobius band | PROVED (standard topology) | `MATHEMATICS §3`, S7; invariants tabulated |
| A9 | Full ordinary quotient is `R × AddCircle T` and has an abelian compatible topological group | PROVED model; LEAN VERIFIED for model operations | `ZeroStripSupplement` supplies `AddCommGroup`, continuity, projection/deck/addition.  Quotient-homeomorphism itself is not Lean formalized. |
| A10 | Either closed-band quotient can be a topological group | REFUTED | Boundary/interior local-homology distinction conflicts with homogeneity. |
| A11 | Open Mobius band can be a topological group in its given topology | REFUTED | Hilbert fifth (S5) makes it a Lie group; Lie groups orientable, open Mobius is not. |
| A12 | Full cylinder/Mobius: connectedness, compactness, boundary, `pi_1`, `H_1`, center, orientation cover | PROVED (standard topology) | Complete comparison table in `MATHEMATICS §3`; no claim that these invariants alone determine a group law. |
| A13 | Pushforward of all zeros to a compact strip quotient is Radon | REFUTED | Total mass is infinite on the compact quotient; `MATHEMATICS §4`. |
| A14 | A deck-invariant locally finite divisor descends | CONDITIONAL | True under actual invariance; A5/A6 say that hypothesis fails for height decks. |
| A15 | `Gamma={t:zeta(1/2+it)=0}` is an additive subgroup | REFUTED | `0` is absent, while every subgroup contains zero.  Abstract lemma is LEAN VERIFIED by `not_setOf_addSubgroup_of_zero_not_mem`. |
| A16 | The `Z`-span of `Gamma` recovers its marked set | REFUTED as an inference | A generated subgroup retains no distinguished generating subset; no density/independence claim is used. |
| A17 | Reflection quotient by `R` is a legitimate finite symmetry quotient | PROVED | It is an unconditional half-plane quotient of the divisor.  “Every mark fixed” is merely RH restated. |
| E1 | Deck/group/relation finite samples | EXACT CHECK | `python3 -B verification/check_exact.py`; exact `Fraction`, assertions, not analytic evidence. |
| A18 | No eventual translation/glide period of the full divisor | PROVED, written | `SUPERVISOR_NO_GO.md`; fixed-width cell masses cannot be uniformly bounded on a tail |
| A19 | Symmetry, main-term counting and critical-line markings force RH | REFUTED for this list of abstract inputs | `SUPERVISOR_COUNTERMODEL.md`; the auxiliary xi times polynomial has an off-line quartet, with no Euler product asserted |
| A20 | Actual zeta zero support in the open strip is invariant under conjugation and the two functional reflections | LEAN VERIFIED | Five `ZeroStripZeta.stripZero_*` theorems in `Lean/ZetaCompatibility.lean`; no multiplicity claim |
| E2 | Polynomial roots, evenness, conjugation and expansion at exact rational inputs | EXACT CHECK | `verification/supervisor_countermodel.py`: 330 finite checks; universal parameter proof is written separately |

## Formalization map and axiom report

| Lean source | Declarations | Axiom output on the tested environment |
|---|---|---|
| `Lean/ZeroStripCore.lean` | A2, A4, A15 algebraic core | `propext`, `Classical.choice`, `Quot.sound` for the map/matrix facts; the subgroup lemma uses only `propext` (reported by `#print axioms`); no `sorry`, `admit`, or user axiom |
| `Lean/SupervisorStructures.lean` | A6 generic square; A9 group model; abstract constant-cell/growth lemma | same three kernel/library axioms, printed by the file; no `sorry`, `admit`, or user axiom |
| `Lean/DivisorCells.lean` | A5 combinatorial core: half-open cells, disjointness, translation, finite cell-mass preservation, bounded-cell/superlinear contradiction | same three kernel/library axioms, printed by the file; no `sorry`, `admit`, or user axiom |
| `Lean/ZetaCompatibility.lean` | A20 actual zeta support, including strip hypotheses | same three kernel/library axioms, printed for all five named declarations |

None of the four sources formalizes `xi`, the Riemann–von Mangoldt theorem, isolation of
analytic zeros, manifold local homology, orientability of Lie groups, or a deck
quotient homeomorphism.  The `CellDivisor` structure takes finite cell supports
and multiplicity preservation as fields; it does not construct them from xi.
Consequently A5's analytic no-go is a checkable written theorem connected to
its named analytic inputs, rather than a false claim of full Lean verification.
