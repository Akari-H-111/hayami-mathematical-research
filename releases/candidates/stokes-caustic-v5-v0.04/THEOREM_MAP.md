# Manuscript-to-Lean verification map

The exhaustive statement-level map is
[`formalization/FULL_PAPER_COVERAGE.md`](formalization/FULL_PAPER_COVERAGE.md).
It lists every asserted mathematical result of the unchanged final-v5 paper,
including theorem/proposition statements, displayed Taylor/Big-O remainders,
exceptional four-jet, auxiliary curve/quintic, fixed Sturm table and rational
numerical enclosures.

`formalization/COORDINATE_PROOFS.md` explains the actual ordinary coordinate
changes. `HasWhitneyNormalFormAt` requires smooth source and target charts,
smooth two-sided local inverses, and the exact local identity `(x,y^2)`.
`exceptional_not_hasWhitneyNormalFormAt` proves the exceptional obstruction;
it is stronger than merely failing a recognition predicate.

The exceptional ordinary four-jet and its invertible real rescaling to
`(x,xy^2+y^4)` do not classify the full germ. The paper's open
A-classification, symmetry-preserving classification and versal unfolding
remain open. Plot samples, bibliography, historical attribution, and
unasserted physical/APS/spinorial interpretations are excluded.

`verify.py` separately replays exact CAS, standard-library Sturm computation,
the unchanged PDF hash/geometry and the recovered-source alignment.
`formalization/verify_lean.py` builds the pinned project and verifies exhaustive
audit coverage for all 258 public named theorems, rejecting holes and extra
axioms. The only allowed logical dependencies are Lean/Mathlib's standard
`propext`, `Classical.choice`, and `Quot.sound`.
