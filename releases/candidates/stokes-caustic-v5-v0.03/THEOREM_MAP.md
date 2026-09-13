# Theorem-to-source verification map

| PDF item | manuscript content | Lean status | other evidence | release claim |
| --- | --- | --- | --- | --- |
| Thm. 2.1 | full Jacobian factorization and two-component critical locus on `Q>0` | `observationMap_hasExplicitFDerivAt`, `observationMap_fderiv_eq`, and `observationJacobian_factorization` prove the real derivative and displayed determinant; `jacobianRaw_reduce` retains the independent cleared-polynomial certificate | `verify_exact_geometry.py` independently replays the displayed rational factorization | Lean-verified explicit derivative and full Jacobian formula, with independent CAS replay |
| Prop. 2.2 | rational critical branch away from `s=0`, `B(c)=0` | `B_mul_uFold`, `uFold_is_jacobian_root` | exact geometry replay | Lean-verified algebraic branch equation |
| Prop. 2.3 | unique boundary root and physical branch interval | `pB_eq_nFold_sub_B`, endpoint signs, `exists_unique_pBR_zero_in_isolating_interval`, `BR_neg_on_physical` | exact Sturm replay independently gives one root and no pole | Lean-verified isolated unique root and denominator sign; remaining branch inequalities follow at manuscript level |
| Thm. 2.4(1) | symmetry component is an ordinary fold for `u>0` | `symmetry_isPlaneWhitneyFoldCriterionAt` proves differentiability, rank one, a nonzero kernel vector, zero Jacobian, and nonzero kernel-direction Jacobian derivative | exact determinant derivative independently replayed | Lean-verified intrinsic plane-to-plane Whitney-fold Jacobian criterion; no coordinate normal-form construction claimed |
| Thm. 2.4(2) | physical rational arms are ordinary folds away from the meeting point | `rationalBranch_kernel_and_nonzero`, `kernelJacobianDerivative_uFoldR`, and `rationalBranch_isPlaneWhitneyFoldCriterionAt` prove the full intrinsic criterion under the displayed physical hypotheses | exact transversality identity independently replayed | Lean-verified intrinsic criterion and sign barriers; no coordinate normal-form construction claimed |
| Thm. 2.4(3) | exceptional intersection is not an ordinary fold | `exceptional_kernel_transversality_fails` and `exceptional_not_isPlaneWhitneyFoldCriterionAt` prove zero transversality and failure of the encoded fold criterion | exact local expansion and determinant replay | Lean-verified criterion failure; no finer singularity label claimed |
| Def. 2.5 | observation discriminant is the critical-value image | definition not encoded | authoritative PDF | PDF-locked definition |
| Prop. 2.6 | two critical-value branches and tangency | not encoded | exact finite expansion in manuscript/replay | not a global injectivity claim |
| Def. 3.1, Rem. 3.2 | normalized spherical radial map and three-map separation | not encoded | authoritative PDF | scope boundary, not a derived identification |
| Thms. 3.3-3.4 | common endpoints and regular radial starting point | `radial_endpoint_norm_identity` | exact branch expansion in `verify_exact_geometry.py` | mixed Lean/CAS certificate |
| Thm. 4.1 | monotone third spherical component and boundary maximum | `q17R_pos_on_three_fifths` proves a stronger root-free interval | derivative factorization in `verify_exact_geometry.py` | Lean-verified sign barrier plus CAS-verified derivative identity |
| Rem. 4.2 | no automatic caustic/APS/spinorial interpretation | negative statement, not encoded | authoritative PDF | retained scope limitation |

`StokesV5/Audit.lean` prints the axioms of the named Lean theorems.  The
reported dependencies are Lean/Mathlib's standard `propext`,
`Classical.choice`, and `Quot.sound`; there are no manuscript-specific axioms.
