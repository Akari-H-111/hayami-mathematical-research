# Stokes v5: manuscript-to-Lean coverage

2026-09-30. Authority: the unchanged ten-page final-v5 PDF, SHA-256
`4e48c805c1550dbaee9171a56264bf4ff5275ef5ff5b64f9cd116803283c11c0`.
The recovered TeX is content-aligned, not the lost original source.

This is a statement-by-statement map, not permission to call an arbitrary
module build a proof of the entire document. All real-domain hypotheses are
retained. In particular the observation map is used on `Q>0`; ordinary folds
at `u=1` are ambient-extension statements, not boundary-chart classifications.

| Manuscript item | Lean declarations / modules |
| --- | --- |
| Surface and observation definitions | `ruledSurface`, `observationN`, `observationM`, `observationMap` |
| Thm. 2.1: derivative, Jacobian, full critical locus | `observationMap_hasExplicitFDerivAt`, `observationJacobian_factorization`, `physical_critical_locus_iff` |
| Prop. 2.2: rational branch versus component zero | `physical_foldEquation_iff`, `component_zero_iff`, `componentZero_not_rational_branch` |
| Prop. 2.3: unique boundary root and full physical interval | `physicalBoundary_unique_on_unit`, `uFoldR_mem_unit_iff`, `uFoldR_at_boundary`, `uFoldR_at_one` |
| Thm. 2.4(1–2): ordinary Whitney folds | `symmetry_hasWhitneyNormalFormAt`, `rationalBranch_hasWhitneyNormalFormAt`, `physical_critical_point_normalForm`; actual smooth two-sided source/target charts, not only recognition certificates |
| Thm. 2.4(3): exceptional rank, transversality, and no fold normal form | `observationDerivative_symmetry_kernel`, `exceptional_not_isPlaneWhitneyFoldCriterionAt`, `exceptional_not_hasWhitneyNormalFormAt`, `critical_branches_transverse_at_zero` |
| Displayed symmetry second derivative and determinant | `observationN_second_deriv_symmetry`, `symmetry_second_order_fold_determinant` |
| Displayed exceptional Jacobian error and branch expansion | `exceptional_jacobian_expansion`, `uFold_t_expansion`, `AB_delta_identities`, `cos_taylor_quartic` |
| Def. 2.5 / Prop. 2.6: discriminant and two images | `physicalDiscriminant`, `full_physical_discriminant`, `symmetry_discriminant_image`, `observationMap_even` |
| Prop. 2.6: delta expansions, quadratic contact, endpoint | `uFold_delta_expansion`, `foldN_delta_expansion`, `foldM_delta_expansion`, `discriminant_contact_cubic_error`, `rational_discriminant_at_boundary` |
| Def. 3.1 / Rem. 3.2: radial map and map separation | `radialImage`, `radialImage_unit`, `surfaceFold_is_ruledSurface`, `gauss_translation_invariant`, `radial_translation_changes_map` |
| Thm. 3.3: both common endpoints | `radialImage_at_one`, `radialImage_at_boundary` |
| Thm. 3.4: regular starting point and three Taylor components | `radialCurve_hasDerivAt_zero`, `radialCurve_first_expansion`, `radialCurve_second_expansion`, `radialCurve_third_expansion` |
| Thm. 4.1: strict third-coordinate monotonicity, maximum, no interior critical point | `radialImage_third_strictAntiOn`, `radialImage_third_boundary_max`, `radialThird_no_interior_critical` |
| Disposition table: auxiliary endpoint / irreducible quintic / maximum outside physical fold | `auxiliary_endpoint`, `chiralityPolynomial_irreducible_rational`, `auxiliaryThird_boundary_max`, `auxiliaryImage_third`, `auxiliaryMaximum_outside_physical` |
| Figure 4 numerical skeleton intersection | `exists_unique_skeleton_intersection`, `skeleton_fold_intersection_iff` |
| Conclusion: valid exceptional source coordinates and weighted jet | `exceptionalSource_isSmoothChart`, `exceptionalInverse_contDiffAt_zero`, `exceptional_inverse_left`, `exceptional_inverse_right`, `exceptional_weighted_expansions`, `exceptional_coordinate_jet`, `exceptional_coordinate_identity` |
| Conclusion: ordinary four-jet and real rescaling equivalence | `exceptional_ordinary_four_jet`, `exceptional_four_jet_rescaling`, `jetScalingSource_isSmoothChart`, `jetScalingTarget_isSmoothChart` |
| Appendix: Q17 coefficients, derivative identity, fixed Sturm variations | `certificateQ17_eval`, `radial_derivative_certificate`, `sturm_variations_pB`, `sturm_variations_r7`, `sturm_variations_q17`; root consequences are separately proved over ℝ in `RootBarriers` |
| Displayed numerical approximations | rational enclosures in `NumericalBounds`, `auxiliaryMaximum_spec`, and `exists_unique_skeleton_intersection`; never floating-point proof evidence |

## Explicit exclusions

- The final paragraph leaves the full exceptional germ's A-classification,
  symmetry-preserving classification, and versal unfolding open. A four-jet
  proof does not close those research problems. Kabata's recognition paper is
  a reference, not a Lean axiom: <https://arxiv.org/abs/1503.08544>.
- No general Whitney/Morse recognition theorem or general Sturm root-count
  theorem is assumed. Fixed ordinary coordinate changes and fixed real root
  consequences are proved directly; the variation table is exact kernel
  computation of the documented finite algorithm.
- Plot sampling, camera projections, citations, historical attribution,
  and the lateral-immersion-zero annotation imported from the separate
  ruled-surface paper are not v5 theorem targets. No theorem about the full
  immersion-zero set of that other paper is attributed to this companion.
- Jones, Hopf, spinorial, quantum, APS and global injectivity claims remain
  unasserted. None is produced by normalization or by formalizing v5.

Run `python3 -B verify_lean.py` in this directory. It checks every public named
theorem against the axiom audit, rejects proof holes and extra axioms, and
replays the pinned build and status checks. Independent CAS and standard-library
Sturm scripts remain separate evidence in the release package.
