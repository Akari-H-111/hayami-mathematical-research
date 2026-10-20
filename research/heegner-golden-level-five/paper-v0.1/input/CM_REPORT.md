# Final report: bounded result and next target

## Best result

The strongest verified mechanism is a **field reconstruction**, not a
numerical coincidence.  From the classical level-5 equation at

\[
 \tau=(1+i\sqrt{163})/2,\qquad t=r(\tau)^5,
\]

the package proves exactly that (P_{163}=A^2-5B^2) with coprime integer
polynomials.  A rational product enclosure selects the analytic sign:

\[
 \frac{A(t)}{B(t)}=-\sqrt5.
\]

It follows that

\[
 \phi=\frac{B-A}{2B},\qquad
 \gamma=-\frac{A+B}{2B},\qquad
 c_0=\frac{3B+A}{2B}.
\]

Thus (\mathbb Q(\sqrt5)\subset\mathbb Q(t)), and the same (c_0) actually
used by HMR's ruled-surface v5 is recovered from the (-163) level-5 CM
value.  The positive real branch (s), with (r=e^{\pi i/5}s), has a
separate degree-12 factor and an independent positive-sign reconstruction;
the phase convention is therefore explicit rather than hidden in a decimal.

## What the controls establish

The universal identity (P_j=t^6G_j(t-t^{-1})) explains why every rational
(j)-fibre has a sextic quotient.  It does not force a golden field:
for (j=1,2), the degree-12 fibre remains irreducible over
$\mathbb Q(\sqrt5)$.  The exact thirteen-control table instead finds a
splitting component for every class-number-one order tested; matching that
component to the analytic q-product is stable at 100 and 200 digits.  Only
the (-163) branch has a rational root/sign certificate in this packet.

The discriminant (-15) formula

\[
 j_{-15}=85995c_0-224505
\]

is a valuable control: it is a more direct classical $\mathbb Q(\sqrt5)$
overlap, but it is an affine shared-field identity, not an intrinsic HMR map.

## What this adds, and what it does not

The local addition is precise: a branch-certified CM-to-(c_0) parameter map
and an obstruction to using existing unmarked Boolean data as its carrier.
The current Information Topology Boolean sequence is identical for all
non-torsion one-coordinate parameters, so it cannot retain the quadratic
field mark of (gamma,c_0), or (t).

This neither proves a new CM/ray-class theorem nor constructs a geometric,
operator, or cohomological map between the CM fibre and the ruled surface.  It
also has no implication for BigBridge or RH; those remain logically separate
and RH remains open.

## Strongest next target

Compute the Shimura-reciprocity stabilizer of the level-5 coordinate selected
by (t=r(\tau)^5).  The concrete question is whether the quadratic character
giving $\mathbb Q(\sqrt5)$ survives exactly for the components in the
control table.  This is falsifiable: one counterexample CM order with an
analytic component irreducible over $\mathbb Q(\sqrt5)$ refutes the proposed
pattern.  If it survives, a separate HMR construction must define a canonical
mark carrying that character and prove compatibility; scalar substitution is
not enough.

## Verification

```sh
/Users/akari_hayami_64/RH_Research_Workspace/.venv/bin/python -B verification/check.py
```

The recorded run passed exact identities, rational branch certificates, all
finite controls, and 100/200-digit product-versus-continued-fraction checks.
See `verification/RESULTS.json` for machine-readable evidence.

## Director's further checked results

The independent director checker and written supplement are in
[DIRECTOR_FINDING.md](DIRECTOR_FINDING.md). For u=t-t^-1 the irreducible
sextic yields the proper tower Q < Q(sqrt(5)) < Q(u), with degrees 2 and 3.
Consequently extracting only the positive golden ratio discards the remaining
cubic data. The identity c0=2-phi also makes their absolute chord responses
equal for every integer q. Preserving this additional arithmetic data is the
stronger HMR-facing target; scalar recovery alone cannot distinguish 163.

The sextic has only two real roots. Its rational regular trace form has
signature (4,2), with multiplication trace-self-adjoint. Therefore a nonzero unital
representation on a finite-dimensional Q-vector space cannot make this same
multiplication positive self-adjoint after extending scalars to R. A selected
real embedding acting as a real scalar is not excluded. This exact finite
model is not an identification with any HMR historical matrix or zeta Weil
form. The conductor-5 ring-class interpretation remains a separate target.

## The strongest exact linkage in this round

[CUBIC_RESOLVENT.md](CUBIC_RESOLVENT.md) gives the explicit irreducible cubic
over F=Q(sqrt(5)) with discriminant -163*(m+n sqrt(5))^2. Hence its splitting
field has S3 Galois group over F and quadratic resolvent
Q(sqrt(5),sqrt(-163)). A fresh exact-model Terra review independently
recomputed the coefficients, discriminant, conjugate and analytic branch.
The resolvent contains both Q(sqrt(-163)) and Q(sqrt(-815)); the original CM
label is needed to choose the former, so no unique unmarked recovery is
claimed. This supplies a concrete two-layer arithmetic connection while
leaving novelty and any intrinsic HMR/RH realization unresolved.

Final local review scope and resolved findings: [REVIEW_RESOLUTION.md](REVIEW_RESOLUTION.md).
