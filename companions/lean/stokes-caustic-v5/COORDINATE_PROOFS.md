# Stokes v5: completed working geometric proofs

2026-09-30 · Lean 4.33.1 / Mathlib v4.33.1 · working source, not a new release.

## Ordinary folds: actual coordinates

Write `F(t,u)=(N,M)`, `c=cos(t)`, `q(c)=sqrt(c(2-c))`, and
`U(c)=-A(c)/B(c)`. The observation chart is `c(2-c)>0`.
`HasWhitneyNormalFormAt F p` means there are smooth source and target maps
`s` and `h`, each with a smooth two-sided local inverse, sending `p` and
`F(p)` to zero and satisfying

\[
h(F(x))=(s_1(x),s_2(x)^2)
\]

throughout a neighborhood of `p`. This is a local coordinate equivalence,
not just a determinant or transversality test. `smoothChart_of_rows` derives
the inverse charts from the proved nonzero determinants using Mathlib's
smooth inverse function theorem.

### Symmetry component

At `p=(0,u0)`, `u0>0`, choose

\[
s(t,u)=\left(1-u_0-M(t,u),\;
2\sin(t/2)\sqrt{u-(1-\cos t)/2}\right),
\quad h(N,M)=(1-u_0-M,-N).
\]

The radicand is positive near `p`. The exact half-angle identity gives
`-N=s2^2`; the source determinant is `-sqrt(u0)` and the target determinant
is `-1`. Both charts are smooth and locally invertible. This proves
`symmetry_hasWhitneyNormalFormAt`, including `u0=1` in the ambient extension.

### Rational component

Let `a0=cos(t0)`, `613/1000<=a0<1`, `sin(t0)!=0`, and `p=(t0,U(a0))`.
Write `n(a)=foldN(a)` and `m(a)=foldM(a)`. The exact derivative is

\[
n'(a)=\frac{2(a-1)R_7(a)}{B(a)^2}>0.
\]

Consequently `n` has a smooth local inverse `r` near `n(a0)`.
Eliminating `u` using `N=x` gives

\[
G(x,c)=\frac{c^4-3c^3+c^2x-cx+3c+x-1}{2(1-c)q(c)}.
\]

`RationalCoordinates.lean` constructs an explicit smooth function `K(c,a)`
and proves the exact identity

\[
G(n(a),c)-m(a)=(c-a)^2K(c,a),\qquad
K(a,a)=-\frac{R_7(a)}{2(1-a)q(a)^3B(a)}<0.
\]

The apparent divided remainder is given a nonsingular explicit expression;
no limit or unproved Taylor factorization is used. The square-root remainder
is obtained by rationalizing `q(c)-q(a)` twice. The negative diagonal ensures
`-K` stays positive near `(a0,a0)`.

Choose the actual charts

\[
s(t,u)=\left(r(N(t,u))-a_0,\;
(\cos t-r(N(t,u)))\sqrt{-K(\cos t,r(N(t,u)))}\right),
\]
\[
h(N,M)=(r(N)-a_0,\;m(r(N))-M).
\]

The inverse identity `n(r(N))=N` and the exact remainder identity give
`h(F)= (s1,s2^2)`. Put `rho=1/n'(a0)` and `k=sqrt(-K(a0,a0))`.
The target determinant is `-rho`; the source determinant is
`k*rho*N_u(p)*sin(t0)`, which is nonzero since `N_u=-2(1-a0)`.
This proves `rationalBranch_hasWhitneyNormalFormAt`. No general Morse lemma
or Whitney normal-form theorem is assumed.

## Geometric theorem map

| Conclusion | Lean declarations |
| --- | --- |
| Unique physical boundary root on all `[0,1]`; rational isolation `[.613,.614]` | `physicalBoundary_spec`, `physicalBoundary_unique_on_unit` |
| Exact physical interval, with `B!=0` explicitly retained for total division | `physical_foldEquation_iff`, `uFoldR_mem_unit_iff`, `uFoldR_at_boundary`, `uFoldR_at_one` |
| Full critical-locus decomposition for `-pi/2<t<pi/2`, `0<=u<=1` | `physical_critical_locus_iff` |
| Every physical critical point other than `(0,0)` has actual fold coordinates | `physical_critical_point_normalForm` |
| Exceptional rank-one kernel and zero transversality; transverse critical-branch tangents | `exceptional_kernel_transversality_fails`, `exceptional_not_isPlaneWhitneyFoldCriterionAt`, `critical_branches_transverse_at_zero` |
| Component-zero and rational-critical curves are distinct | `componentZero_not_rational_branch` |
| Exact symmetry image; signed rational arms have the same observation values | `symmetry_discriminant_image`, `observationMap_even`, `observationMap_rational_branch` |
| Rational discriminant boundary value and regular `c`-tangent `(0,3)` at `c=1` | `rational_discriminant_at_boundary`, `discriminant_hasDerivAt_one` |
| Quadratic contact `N=-(1-M)^2/3+O((1-M)^3)` | `discriminant_quadratic_contact`, `discriminant_contact_cubic_error` |
| Positive radial denominator; normalized vector has unit length; mirror relation | `radialRadiusSquared_pos`, `radialImage_unit`, `radialImage_mirror` |
| Both common spherical endpoints | `radialImage_at_one`, `radialImage_at_boundary` |
| Actual third coordinate strictly decreases with `c`; unique boundary maximum `sqrt(cb/2)` | `radialImage_third_strictAntiOn`, `radialImage_third_boundary_max` |
| Same maximum for the surface curve parametrized by `t` | `curveRadius_eq_radialRadius`, `radialCurve_third`, `radialCurve_third_boundary_max` |
| Regular radial starting point, derivative `(0,1,0)` | `surfaceFold_hasDerivAt_zero`, `radialCurve_hasDerivAt_zero` |

For contact, exact identities `N=(c-1)^2 J(c)` and `M=1+(c-1)H(c)`
have smooth coefficients `J(1)=-3`, `H(1)=3`. Thus
`J+H^2/3=O(c-1)` and `c-1=O(1-M)`, proving the cubic error.
For radial monotonicity, the polynomial identity `P'R-PR'=n Q17`,
`n=-A<0`, `R>0`, `Q17>0` proves strict decrease on `[cb,1]`.

## Verification and boundaries

From this companion directory:

```bash
lake -q build StokesV5
lake -q env lean StokesV5/Status.lean
lake -q env lean StokesV5/Audit.lean
rg -n '^[[:space:]]*sorry\b' StokesV5 StokesV5.lean
```

The last command must find no matches. `Audit.lean` covers the new public
theorems and reports only the standard Lean/Mathlib axioms
`propext`, `Classical.choice`, and `Quot.sound`.
The independent exact-geometry and Sturm verifiers remain under
`papers/legacy-geometry/stokes-caustic/verification/` and were replayed.

The domain restriction `Q>0` is essential. Fold claims at `u=1` concern the
smooth ambient extension, not a boundary-preserving normal form. The
exceptional point is not assigned a finer singularity label. Decimal
approximations, every auxiliary Taylor display, historical claims, global
injectivity, a general Sturm algorithm, and physical/spinorial interpretations
are not promoted to Lean theorems by this extension. The observation
discriminant, radial map, and Gauss map remain distinct.

No authoritative PDF, sealed v0.02/v0.03 archive, receipt, DOI, or external
record is changed. New results require a separately packaged future version.
