# v5 geometric-closure boundary

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

The interval statement for `Q17` is stronger than the manuscript's physical
interval.  Each result is an exact Lean proof with no manuscript axiom.

## Remaining stronger statement

The pinned Mathlib version contains no reusable parametric Morse lemma or
Whitney-fold local-normal-form theorem. This candidate therefore closes
the intrinsic criterion used in the manuscript, not the stronger construction
of local source and target diffeomorphisms conjugating the map to `(x, y^2)`.
This coordinate-level distinction must remain explicit in release wording.

## Release decision

The next release may say that the ordinary branches satisfy a Lean-verified
plane-to-plane Whitney-fold Jacobian criterion. It must not say that Lean
constructs the local normal-form coordinates.

## Next research line

Keep the coordinate-level normal-form construction as a separate research
line. Publication of this verified candidate is a separate external action.
