# Whitney-fold formalization status

Updated: 2026-09-12.

## Completed milestone

`StokesV5.ObservationMap` now supplies the analytic object that the original
exact-polynomial companion deliberately omitted:

- the positive-`Q` chart;
- the real two-coordinate observation map;
- positivity and nonvanishing of its square-root denominator;
- Fréchet differentiability throughout the chart.

These declarations compile without `sorry` and are included in the axiom audit.
They extend the working source only; the sealed v0.01 release remains immutable.

## Next proof obligation

Give the derivative as an explicit continuous linear map and derive

`det(D F) = -2 sin(t) (A(cos(t)) + u B(cos(t))) / qChart(t)^3`.

The proof should reuse the existing `A` and `B` definitions and discharge the
square-root denominators from `qChart_pos`, rather than introducing the
factorization as a new axiom.

## Closing criterion

The full Whitney-fold line may be called complete only after Lean checks:

1. the explicit Jacobian factorization;
2. rank one and kernel transversality on each claimed ordinary-fold branch;
3. the exceptional status of the common initial point;
4. a precisely stated plane-to-plane fold recognition theorem or an equivalent
   proved local normal-form result.
