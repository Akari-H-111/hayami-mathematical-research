# Theorem-to-source verification map

| PDF item | manuscript content | Lean status | other evidence | release claim |
| --- | --- | --- | --- | --- |
| Thm. 2.1 | full Jacobian factorization and two-component critical locus on `Q>0` | `observationMap_differentiableAt` formalizes the real map and its analytic chart; `jacobianRaw_reduce` proves the cleared numerator under `q^2=c(2-c)` | `verify_exact_geometry.py` proves the full displayed rational factorization | Lean-verified chart/differentiability and numerator reduction; CAS-verified full formula |
| Prop. 2.2 | rational critical branch away from `s=0`, `B(c)=0` | `B_mul_uFold`, `uFold_is_jacobian_root` | exact geometry replay | Lean-verified algebraic branch equation |
| Prop. 2.3 | unique boundary root and physical branch interval | `pB_eq_nFold_sub_B`, endpoint signs, `exists_unique_pBR_zero_in_isolating_interval`, `BR_neg_on_physical` | exact Sturm replay independently gives one root and no pole | Lean-verified isolated unique root and denominator sign; remaining branch inequalities follow at manuscript level |
| Thm. 2.4(1) | symmetry component is an ordinary fold for `u>0` | not formalized as a Whitney normal-form theorem | exact determinant `-2u` in `verify_exact_geometry.py` | CAS-verified nondegeneracy plus cited standard fold criterion |
| Thm. 2.4(2) | physical rational arms are ordinary folds away from the meeting point | `r7R_neg_on_unit`, `BR_neg_on_physical` prove the nonzero polynomial factors | exact transversality identity in `verify_exact_geometry.py` | Lean-verified sign barriers; CAS-verified identity; standard fold criterion invoked |
| Thm. 2.4(3) | exceptional intersection is not an ordinary fold | no local map-germ formalization | exact local expansion and determinant replay | CAS-verified local obstruction; no finer singularity label claimed |
| Def. 2.5 | observation discriminant is the critical-value image | definition not encoded | authoritative PDF | PDF-locked definition |
| Prop. 2.6 | two critical-value branches and tangency | not encoded | exact finite expansion in manuscript/replay | not a global injectivity claim |
| Def. 3.1, Rem. 3.2 | normalized spherical radial map and three-map separation | not encoded | authoritative PDF | scope boundary, not a derived identification |
| Thms. 3.3-3.4 | common endpoints and regular radial starting point | `radial_endpoint_norm_identity` | exact branch expansion in `verify_exact_geometry.py` | mixed Lean/CAS certificate |
| Thm. 4.1 | monotone third spherical component and boundary maximum | `q17R_pos_on_three_fifths` proves a stronger root-free interval | derivative factorization in `verify_exact_geometry.py` | Lean-verified sign barrier plus CAS-verified derivative identity |
| Rem. 4.2 | no automatic caustic/APS/spinorial interpretation | negative statement, not encoded | authoritative PDF | retained scope limitation |

`StokesV5/Audit.lean` prints the axioms of the named Lean theorems.  The
reported dependencies are Lean/Mathlib's standard `propext`,
`Classical.choice`, and `Quot.sound`; there are no manuscript-specific axioms.
