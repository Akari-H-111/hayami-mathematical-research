# Lean status: Stokes caustic v5 exact core

Toolchain: Lean `4.33.1`, Lake `5.0.0`, Mathlib `v4.33.1`.

| module | status | encoded scope |
| --- | --- | --- |
| `StokesV5.Polynomials` | compiled, no `sorry` | exact definitions of `A`, `B`, `pB`, `R7`, `Q17`; `pB = -A-B` certificate |
| `StokesV5.Geometry` | compiled, no `sorry` | cleared-denominator Jacobian reduction, rational fold-branch identity, radial endpoint identity |
| `StokesV5.ObservationMap` | compiled, no `sorry` | real two-variable observation map on the positive-`Q` chart; square-root denominator positivity/nonvanishing; Fréchet differentiability on the chart |
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

## Deliberately not formalized yet

- A reusable general Sturm variation/root-count theorem.  The fixed root-count consequences needed by v5 are now formalized independently via Bernstein certificates, so this is not a release blocker.
- The full two-variable derivative calculation and its identification with the cleared Jacobian numerator. The real `Q > 0` chart and differentiability prerequisites are now formalized.
- The plane-to-plane Whitney fold recognition theorem, including its smoothness/rank/transversality hypotheses.
- Any physical or spinorial interpretation.

The scope split and release wording are documented in `GEOMETRIC_CLOSURE_BOUNDARY.md`.  These are not failures of the compiled core, but they prevent describing the package as a full Lean proof of the manuscript's Whitney-fold theorem.
