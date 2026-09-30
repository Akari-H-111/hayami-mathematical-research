# Lean status: Stokes caustic v5 manuscript coverage

Verified: 2026-09-30. This working extension is not part of the immutable,
published criterion-level v0.03 archive. The separately sealed v0.04 is now
published on GitHub and Zenodo (record `23057630`, software version DOI
`10.5281/zenodo.23057630`). Public API/download hashes match the sealed assets;
the assigned DOI's `doi.org` resolution is not yet verified.

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
| `StokesV5.LocalNormalForm` | compiled, no `sorry` | smooth two-sided local charts; explicit symmetry-branch coordinates conjugating the observation map to `(x,y^2)` |
| `StokesV5.RationalCoordinates` | compiled, no `sorry` | invertible critical-value parameter; exact quadratic remainder and its strict negative diagonal; smoothness of the remainder |
| `StokesV5.RationalNormalForm` | compiled, no `sorry` | smooth two-sided source and target charts giving `(x,y^2)` on the physical rational branch away from `c=1` |
| `StokesV5.PhysicalLocus` | compiled, no `sorry` | root uniqueness on all `[0,1]`; exact physical interval and endpoints; complete critical-locus decomposition in the open parameter strip; every physical critical point except `(0,0)` has a Whitney normal form |
| `StokesV5.Discriminant` | compiled, no `sorry` | symmetry image, evenness and rational-branch restriction; boundary value; transverse source tangents; critical-value tangent `(0,3)` at `c=1`; quadratic contact with cubic Big-O error |
| `StokesV5.RadialMonotonicity` | compiled, no `sorry` | exact polynomial derivative certificate, positive normalization denominator, strict third-coordinate monotonicity and unique boundary maximum |
| `StokesV5.RadialGeometry` | compiled, no `sorry` | actual unit-vector map, mirror symmetry, both endpoints, link to the `t`-parametrized surface curve, boundary maximum, and nonzero radial derivative `(0,1,0)` at `t=0` |
| `StokesV5.Expansions`, `StokesV5.RadialExpansions` | compiled, no `sorry` | displayed trigonometric, branch, discriminant and radial Taylor expansions with genuine Big-O remainder bounds |
| `StokesV5.ExceptionalJet`, `StokesV5.OrdinaryJet` | compiled, no `sorry` | valid exceptional source chart, explicit smooth inverse, weighted jet, ordinary four-jet, and invertible rescaling to `(x,xy^2+y^4)` |
| `StokesV5.JacobianExpansion`, `StokesV5.PaperGeometry` | compiled, no `sorry` | exceptional Jacobian expansion, second derivative, complete physical discriminant, radial derivative sign, Gauss/radial map separation |
| `StokesV5.SturmData` | compiled, no `sorry` | exact kernel computation of the fixed rational Sturm algorithm and all manuscript variation pairs |
| `StokesV5.Auxiliary` | compiled, no `sorry` | auxiliary curve endpoint, irreducible rational quintic, unique interior maximum outside the physical fold |
| `StokesV5.NumericalBounds`, `StokesV5.Skeleton` | compiled, no `sorry` | exact rational enclosures for every displayed approximation and unique skeleton intersection |
| `StokesV5.FoldObstruction` | compiled, no `sorry` | zero exceptional Jacobian differential contradicts any actual smooth Whitney-fold normal form |
| `StokesV5.Status` | compiled, no `sorry` | import-level smoke checks |
| `StokesV5.Audit` | compiled, no `sorry` | `#print axioms` audit for all current named theorems |

`Audit.lean` reports only Lean/Mathlib's standard `[propext, Classical.choice, Quot.sound]`; no new axioms and no manuscript-specific assumptions were introduced.
The 2026-09-30 replay audits all 258 public named theorems, including the
attribute-marked `rowCLM_apply`; build and status checks also passed.

Reproduce from this directory:

```bash
python3 -B verify_lean.py
```

The verifier checks exhaustive public-theorem audit coverage and rejects
proof holes, extra axioms, `unsafe`, and `native_decide`. On a fresh checkout,
install the pinned dependencies with `lake update` and `lake exe cache get`
first; normal replays need not update them.

## Scope boundaries

- A reusable general Sturm variation/root-count theorem.  The fixed root-count consequences needed by v5 are now formalized independently via Bernstein certificates, so this is not a release blocker.
- No general parametric Morse theorem is assumed or introduced: the coordinate proofs use exact identities for this observation map and Mathlib's smooth inverse function theorem.
- The exceptional point is proved not to have a Whitney normal form, and its ordinary four-jet is proved equivalent to `(x,xy^2+y^4)`. The full germ's classification and versal unfolding remain open, as in the paper. No global injectivity theorem or extension through `Q=0` is claimed.
- Taylor displays have genuine asymptotic remainder proofs; decimals are replaced by exact rational enclosures. Independent CAS/Sturm scripts remain separate evidence, not Lean axioms.
- Any physical or spinorial interpretation.

See `COORDINATE_PROOFS.md` for the construction and theorem map, and
`GEOMETRIC_CLOSURE_BOUNDARY.md` for the working-source/release distinction.
`FULL_PAPER_COVERAGE.md` maps all asserted mathematical results of final v5,
including displayed expansions and certificate data, to Lean declarations.
Open questions, plot samples, historical attribution, bibliography and
unasserted physical interpretations are explicitly excluded.
