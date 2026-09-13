# Lean status: Stokes caustic v5 exact core

Toolchain: Lean `4.33.1`, Lake `5.0.0`, Mathlib `v4.33.1`.

| module | status | encoded scope |
| --- | --- | --- |
| `StokesV5.Polynomials` | compiled, no `sorry` | exact definitions of `A`, `B`, `pB`, `R7`, `Q17`; `pB = -A-B` certificate |
| `StokesV5.Geometry` | compiled, no `sorry` | cleared-denominator Jacobian reduction, rational fold-branch identity, radial endpoint identity |
| `StokesV5.ObservationMap` | compiled, no `sorry` | real observation map; explicit Fréchet derivative; exact Jacobian factorization; rank-one kernels on the symmetry and rational branches; exceptional-point transversality failure |
| `StokesV5.FoldGeometry` | compiled, no `sorry` | derivative of the Jacobian on the fold locus; exact kernel-direction formula; nonzero transversality on the physical rational branch |
| `StokesV5.WhitneyFold` | compiled, no `sorry` | intrinsic `ℝ² → ℝ²` Jacobian fold criterion and verified certificates for both ordinary branches |
| `StokesV5.Certificates` | compiled, no `sorry` | exact signs of `pB` at `613/1000` and `614/1000`; endpoint nonvanishing of `B` |
| `StokesV5.RootBarriers` | compiled, no `sorry` | over `ℝ`: unique `pBR` zero in `[613/1000,614/1000]`; sign exclusions `R7<0` on `[0,1]`, `B<0` on `[613/1000,1]`, and `Q17>0` on `[3/5,1]`, through exact positive Bernstein expansions |
| `StokesV5.Status` | compiled, no `sorry` | import-level smoke checks |
| `StokesV5.Audit` | compiled, no `sorry` | `#print axioms` audit for all current named theorems |

`Audit.lean` reports only Lean/Mathlib's standard `[propext, Classical.choice, Quot.sound]`; no new axioms and no manuscript-specific assumptions were introduced.

Reproduce from this directory:

```bash
lake update
lake exe cache get
lake -q build StokesV5
lake -q env lean StokesV5/Status.lean
lake -q env lean StokesV5/Audit.lean
rg -n '^[[:space:]]*sorry\\b' StokesV5 StokesV5.lean
```

## Deliberately outside this criterion-level formalization

- A reusable general Sturm variation/root-count theorem.  The fixed root-count consequences needed by v5 are now formalized independently via Bernstein certificates, so this is not a release blocker.
- An explicit construction of local source and target diffeomorphisms carrying the map to `(x, y^2)`. Mathlib has no reusable parametric Morse/Whitney-fold theorem in the pinned version; the package instead proves the standard plane-to-plane Jacobian criterion directly.
- Any physical or spinorial interpretation.

The scope split and release wording are documented in `GEOMETRIC_CLOSURE_BOUNDARY.md`. This candidate closes the manuscript's criterion-level Whitney-fold claim, but it must not be described as a Lean construction of the local normal-form coordinate changes.
