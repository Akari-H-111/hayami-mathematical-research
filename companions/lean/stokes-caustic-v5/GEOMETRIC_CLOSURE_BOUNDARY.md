# v5 geometric-closure boundary

Updated: 2026-09-30. Working source and published archives have different scope.

## What is now Lean-verified

The project proves the exact polynomial layer and the fixed real interval
consequences used in the fold discussion:

- the cleared numerator reduces to `A(c) + u B(c)` under `q^2=c(2-c)`;
- the rational branch solves that numerator wherever `B(c) != 0`;
- the physical isolating interval contains exactly one real `pB` root;
- `R7 < 0` on `[0,1]`, `B < 0` on `[613/1000,1]`, and `Q17 > 0` on
  `[3/5,1]`.
- the real map `observationMap : R^2 -> R^2` is defined using
  `qChart(t)=sqrt(cos(t)(2-cos(t)))`, and its denominator is positive and the
  map has an explicit Fréchet derivative at every point of the positive-`Q`
  chart;
- the determinant of that derivative is exactly
  `-2 sin(t)(AR(cos t)+u BR(cos t))/qChart(t)^3`;
- both ordinary branches have rank one and nonzero Jacobian derivative along
  their kernel direction, while the common initial point has zero
  transversality;
- `IsPlaneWhitneyFoldCriterionAt` records the intrinsic plane-to-plane
  Jacobian criterion, and both ordinary branches satisfy it.
- `HasWhitneyNormalFormAt` additionally records actual smooth source and
  target coordinates with smooth two-sided local inverses, taking the
  observation map to `(x,y^2)` on both ordinary branches;
- the physical critical locus in `-pi/2<t<pi/2`, `0<=u<=1` consists exactly
  of the symmetry segment and `cb<=cos(t)<=1`, `u=uFoldR(cos(t))`;
- the discriminant has the stated quadratic contact with a cubic Big-O
  error, while the two source branches have independent tangents at `(0,0)`;
- the separate normalized radial image has unit length, the stated common
  endpoints, initial derivative `(0,1,0)`, and a strictly decreasing third
  coordinate as `c` increases, with its unique maximum at `cb`.
- the exceptional point admits no actual Whitney normal form; its valid
  source coordinates have the displayed weighted jet and ordinary four-jet,
  with invertible rescaling to `(x,xy^2+y^4)`;
- the remaining displayed Taylor errors, fixed Sturm variations, auxiliary
  quintic/maximum, skeleton intersection and rational decimal enclosures are
  encoded. See `FULL_PAPER_COVERAGE.md` for statement-level coverage.

The interval statement for `Q17` is stronger than the manuscript's physical
interval.  Each result is an exact Lean proof with no manuscript axiom.

## How the former coordinate gap was closed

Exact special-map identities replace the need for a general parametric Morse
lemma. On the symmetry branch a half-angle identity gives the square directly.
On the rational branch one inverts the critical-value coordinate `foldN` and
factors the remaining component as an exact square times a strictly negative
smooth remainder. The smooth inverse function theorem verifies the two-sided
chart inverses. See `COORDINATE_PROOFS.md`; no new axiom is introduced.

## Release decision

The working source may now be described as constructing the local ordinary
Whitney-fold coordinates. The published v0.03 remains criterion-level and
must retain its original wording. The new scope covers all asserted
mathematical results mapped in `FULL_PAPER_COVERAGE.md`, not the paper's open
full-germ classification/unfolding or physical/spinorial interpretations.

## Next research line

There is no remaining coordinate-level proof blocker for the ordinary
branches. The new v0.04 is sealed, independently replayed and published on
GitHub with API/download hash readback. Its Zenodo publication requires
author login; this is an external prerequisite, not a missing mathematical
proof. Do not overwrite v0.02, v0.03,
their receipts/manifests, or the authoritative PDF.
