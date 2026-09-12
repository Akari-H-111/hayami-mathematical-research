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
  map Fréchet differentiable at every point of the positive-`Q` chart.

The interval statement for `Q17` is stronger than the manuscript's physical
interval.  Each result is an exact Lean proof with no manuscript axiom.

## What is deliberately not yet called a Lean theorem

The v5 source defines a two-variable observation map using `c = cos t`,
`s = sin t`, and `Q = sqrt(c(2-c))`.  Its displayed formula

`J_F = -2 s (A(c)+u B(c)) / Q^3`

has a reproduced exact CAS verification on the chart `Q != 0`. The real map,
its positive-square-root domain lemmas, and its differentiability are now
implemented in `StokesV5.ObservationMap`. The remaining bridge is the explicit
multivariate derivative calculation and proof of the displayed Jacobian
factorization. Separately, the
last implication from rank one plus kernel transversality to the local Whitney
normal form requires a formal statement of the plane-to-plane fold criterion.

Those are analysis/differential-topology developments, not missing numerical
or polynomial evidence.  They must remain labelled **CAS-verified geometric
bridge** and **standard fold criterion invoked**, respectively, until they are
formally implemented.  In particular, the current Lean package must not be
advertised as a full formalization of Theorem 2.4.

## Release decision

The v5 paper itself may close as an algebraically certified reconstruction and
can be the first public Lean companion, provided its release table says
exactly that.  A claim of a fully Lean-certified Whitney-fold theorem requires
a separate follow-up formalization project.

## Next research line

Compute the Fréchet derivative of the now-formalized chart map and prove the
displayed Jacobian factorization. Only after that should the standard fold
criterion be encoded and applied.
