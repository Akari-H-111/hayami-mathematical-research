# Whitney-fold formalization status

Updated: 2026-09-13.

## Completed milestone

The working Lean source now closes L1–L5 at the intrinsic Jacobian-criterion
level:

- the positive-`Q` chart;
- the real two-coordinate observation map;
- positivity and nonvanishing of its square-root denominator;
- an explicit Fréchet derivative throughout the chart;
- the exact displayed Jacobian factorization;
- exact rank-one kernels and Jacobian transversality on both ordinary branches;
- zero transversality and failure of the fold criterion at the exceptional
  common initial point;
- an intrinsic plane-to-plane Whitney-fold criterion, satisfied by both
  ordinary branches.

These declarations compile without `sorry` and are included in the axiom audit.
They extend the working source only; the sealed v0.02 release remains immutable.

## Candidate status

The separate v0.03 candidate is sealed locally under
`releases/candidates/stokes-caustic-v5-v0.03/`. Its local and extracted replays
pass, and GitHub release `stokes-v5-companion-v0.03` is public with its ZIP,
receipt, and authoritative PDF hash-verified after download. Zenodo publication
is pending only because the official record/UI/API was unreachable on
2026-09-13. The sealed v0.02 remains unchanged.

## Closing criterion

The criterion-level Whitney-fold line is complete because Lean checks:

1. the explicit Jacobian factorization;
2. rank one and kernel transversality on each claimed ordinary-fold branch;
3. the exceptional status of the common initial point;
4. the precisely stated intrinsic plane-to-plane Jacobian fold criterion on
   each ordinary branch.

The stronger coordinate-level statement remains separate: no theorem here
constructs local diffeomorphisms conjugating the map to `(x, y^2)`.
