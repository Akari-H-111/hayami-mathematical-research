# Ruled surface v5: full claimwise mathematical coverage

2026-10-01 (Asia/Taipei). The corrected illustrated article is
`papers/legacy-geometry/orthogonal-circle-ruled-surface/revision_v5/working_fullproof/Orthogonal_Circle_Ruled_Surface_v5_fullproof_working.tex`.
Its standalone companion is `Ruled_Surface_v5_Companion_v0_03.tex`.
**PASS: 224 public named RuledV5 theorems**, complete build/status/axiom audit
and proof-hole scan. The **258 StokesV5 dependency theorems** are a separate
inventory. The final native/PDF/portable acceptance is recorded separately;
a theorem count alone is not the full-paper acceptance criterion.

Every asserted mathematical result of the corrected article has a manuscript
proof and the formal coverage below. This is claimwise coverage of actual
mathematical objects, with the listed hypotheses, not literal encoding of all
prose, arbitrary-coordinate curvature invariance, or a general homological
Brouwer-degree library. Definitions, private lemmas and imported theorems used
by public results are included in their kernel dependencies. Figure samples
are finite displays, never mathematical certificates.

| Historical v4 final PDF | Corrected article | Problem, actual result and manuscript proof | Independent exact replay | Lean statements (RuledV5 unless prefixed) and retained hypotheses |
| --- | --- | --- | --- | --- |
| p.2 Defs.1.1/1.3 | Def.1.1; Thm.1.2 | Entire paired-circle surface retained; constraint gradient nonzero; actual endpoint atlas, global label homeomorphism and genuine smooth manifold with corners | Circle/Q identities, signed inverses, positive radicands, endpoint/overlap derivatives; corrected global q radicand | `pairing_constraint_hasFDerivAt`, `pairing_constraint_regular`, `boundary_coordinate_homeomorphism`, `boundaryAngle_surface_inverse`, `angular_transition_isSmoothChartAt`, `global_surface_actual`, `global_base_map_bijective`, `global_domain_homeomorphism`, `global_domain_isManifold`, `global_surface_contMDiff`, `global_angular_overlap_isSmoothChartAt`, `global_boundary_overlap_isSmoothChartAt`, `global_boundary_surface_actual`. Physical labels ∣t∣≤π/2, 0≤u≤1; signed inverse 0≤r<1; smooth extension ∣r∣<1; product model `(𝓡∂ 1).prod(𝓡∂ 1)` |
| pp.4–5 Thm.2.3 boundary | Thm.1.2; Prop.1.3; Thm.2.2 | Two additional rank-one corners. Exact incompatible area/tangent limits rule out a C1 embedded regularization, through a genuine ambient-flattening obstruction | Actual boundary derivatives, scaled area/r limits on u=0/u=r and determinant of three limiting tangent directions | `boundary_hasFDerivAt`, `boundary_regular_iff`, `boundary_corner_kernel`, `boundary_actual_tangent_basis`, `corner_scaled_tangent_actual`, `corner_scaled_tangent_limit`, `corner_scaled_area_limit`, `corner_paths_eventually_regular`, `no_continuous_corner_normal_local`, `no_regular_corner_level_set`, `no_corner_flattening_chart`. ε≠0 (physical ±1), arbitrary 0<δ≤1/2, physical 0<r<δ and 0≤u≤δ. No theorem merely assumes a normal on the whole surface |
| p.3 Thm.2.1 | Prop.2.1 | Actual mixed second derivative, scalar triple product, fundamental forms and Gaussian curvature; K≤0, negative exactly away from specified angular labels; explicit regular negative witness; non-developable. Second-order chain rule proves actual atlas overlap consistency; all regular Q=0 edges have K=0 | Actual derivatives, Gram/triple identities and separated-coordinate curvature cancellation with nonzero rate; boundary second derivatives | `ruled_second_u`, `scalar_triple_product`, `ruled_unit_normal`, `ruled_second_eq_iterated`, `ruled_second_symmetric`, `gaussian_curvature_ruled`, `gaussian_curvature_negative_iff`, `curvature_zero_iff_parameter`, `negative_curvature_witness`, `ruled_not_developable`, `patch_second_comp`, `gaussian_curvature_separated`, `gaussian_curvature_boundary_overlap`, `boundary_second_u`, `gaussian_curvature_boundary_edge`. Actual fderiv-based first/second forms, Euclidean dot product, Q>0 and actual immersion; separated transition T'≠0; edge u≠0. Curvature at rank singularities is not claimed |
| p.4 Prop.2.2 | Prop.2.1 | Correct E/F/G and swapped endpoint values G(1)=1, G(0)=5 | Preserved shared core plus actual boundary G | `first_form_E`, `first_form_F`, `first_form_G`, `ruling_metric_range`, `ruling_metric_endpoint_values`. Old angular E uses Q>0; endpoint G is the actual boundary ruling metric, not evaluation of an invalid old chart |
| pp.4–5 Thm.2.3 interior | Thm.2.2; Rem.2.3 | Exactly five physical rank-singular source labels; every other label immersed. Paired u=1 labels have equal images but are retained separately | Interior zero elimination, unique core root and boundary differential | `differential_injective_iff_cross`, `interior_regular_iff`, `interior_singular_parameters`, `completed_singular_parameters`, `singularParameters_card`, `singularParameters_physical`, `paired_label_image_at_u_one`, `paired_boundary_images_at_u_one`. Completed differential selects valid angular or endpoint chart; cardinality is of source labels, not distinct image points |
| p.6 Rem.3.1 | Prop.2.1; Prop.3.2 | P(c) occurs in the actual triple product and complete rank/zero systems | Baseline and corrected zero elimination | `scalar_triple_product`, `numerator_on_N_zero`, `coreP_root_iff`, `observation_zero_iff`. No additional invariant interpretation claimed |
| pp.6–7 Eqs.13–15 | Def.3.1; Eq.(field-transform) | Projection Jθ distinct from det DF. Source-area field transforms by dt/dr; actual old-field residue/divergence and boundary-field limit | Actual projection/area derivatives, transport and one-sided boundary limits | `actual_projection_jacobian`, `boundary_transition_hasFDerivAt`, `boundary_actual_area_transform`, `boundary_actual_observation_transform`, `boundary_angle_rate_physical`, `angular_field_boundary_residue`, `angular_field_boundary_diverges`, `boundary_observation_limit`. ε=±1, 0<r<1; divergence requires u>0. No invariant global scalar-field convention asserted |
| p.7 Prop.4.1 | Prop.3.2 | Skeleton range, side signs, actual complex phase 0/π only on nonzero real skeleton; off-skeleton phase not on the real axis | Rational identity, D>0 and exact range factors | `phaseD_pos`, `skeleton_equation_iff`, `skeleton_height_physical`, `observationM_positive_iff`, `observationM_negative_iff`, `skeleton_nonzero_phase_classification`, `off_skeleton_phase_not_axis`. Q>0; phase statements retain nonzero field |
| pp.8–9 Thm.4.2 | Thm.3.3 | Two nondegenerate lateral zeros with genuine all-small-physical-circle winding indices −1,+1; polar boundary zero is separate, has zero Jacobian and no interior index | Exact actual Jacobians, parity and physical lateral bounds. Winding/homotopy is mathematical proof, not CAS/numerics | `lateral_jacobian`, `lateral_jacobians_nonzero`, `lateral_actual_local_inverses`; Degree module `winding_lift_actual`, `loop_winding_integral`, `winding_value_initial_independent`, `loop_winding_free_homotopy`, `ellipse_loop_winding`, `linear_circle_winding`, `nondegenerate_zero_small_homotopy`, `nondegenerate_zero_circle_winding`; actual application `observation_zero_circle_winding`, `observation_index_of_nondegenerate_zero`, `lateral_observation_indices`, `local_observation_index_unique`, `lateral_dipole_indices`, `polar_observation_index_none`. Index defined by actual winding on every sufficiently small source circle inside Ioo(−π/2,π/2)×Ioo(0,1), never defined as determinant sign |
| pp.9–10 Thm.4.3 | Thm.4.1 | Full critical locus includes t=0; strict c_b interval; cubic asymptote excluded from physical critical set | J factorization, exact monotone Bernstein expansion, root isolation and triple-angle identity | `StokesV5.observationJacobian_factorization`, `StokesV5.physical_critical_locus_iff`, `StokesV5.physical_foldEquation_iff`, `StokesV5.uFoldR_mem_unit_iff`, `physical_boundary_strict_bounds`, `asymptote_cos_bounds`, `asymptote_cos_cubic`, `asymptote_unique_cubic_root`, `asymptote_not_critical`. Open angular t interval and 0≤u≤1, no division by sin(t) removing symmetry |
| p.11 Lemma5.1 | Thm.4.2 | Actual ordinary fold charts and two-sided smooth inverses on both branches; exceptional (0,0) not a fold | Exact R7 Bernstein positivity, kernel derivative and symmetry-chart identity | `StokesV5.physical_critical_point_normalForm`, `StokesV5.symmetry_hasWhitneyNormalFormAt`, `StokesV5.ordinary_physical_rational_normalForm`, `StokesV5.exceptional_not_hasWhitneyNormalFormAt`. Open extension near u endpoints; no full two-sided physical fiber or further exceptional classification claimed |
| p.10 Thm.4.4 | Thm.4.3 | Entire skeleton–critical intersection: polar plus two rational points. Strict c** bounds; rational intersections are surface regular | Exact quintic equality, derivative Bernstein expression, unique root and strict interval | `entire_skeleton_critical_intersection`, `intersection_cos_bounds`, `intersection_cos_unique`, `rational_intersection_surface_regular`, plus `StokesV5.exists_unique_skeleton_intersection`. Complete physical domain, not only rational branch |
| p.11 Prop.5.2 | Prop.5.1 | Prescribed input in fixed Whitney chart, positive period, cubic error, actual Fourier coefficient dominance and odd/sine cancellation | Exact squared-cosine identity and leading coefficient/dominance-gap algebra; all-mode claims are integral proofs | `phase_response_positive_period`, `phase_response_error_bound`, `chart_phase_actual`, `cosine_coefficient_error`, `cosine_leading_coefficient`, `chart_phase_sine_coeff_zero`, `chart_phase_odd_cosine_coeff_zero`, `chart_phase_doubled_harmonic_dominates`, `uniform_remainder_sine_coefficient_zero`. ξ≠0, ω≠0; dominance 0<∣κ∣≤1/2; all prescribed input stays in chosen chart. No arbitrary-trajectory spectrum |
| p.12 Thm.5.3 | Thm.5.2; Prop.5.3; Table 1 | Common open-neighborhood actual fiber iff same ξ and η equal/opposite; repeated nonzero observation needs phase lock; two independent counterexamples | Preserved transverse crossing plus unlocked nonreal rotation counterexample | `local_fold_common_neighborhood`, `whitney_fiber_iff`, `transverse_crossing_observation_injective`, `transverse_crossing_derivative`, `repeated_nonzero_signal_iff_phase_lock`, `phase_lock_iff`, `phase_locked_retracing`, `uniform_rotation_phase_lock`, `zero_signal`, `unlocked_rotation_counterexample_nonreal`. Actual HasWhitneyNormalFormAt + continuity, all pairs in one open U, repeated z≠0 for lock iff. No existence of matching times for arbitrary trajectories |

## External theorem and proof-optimization audit

- Ishikawa, *Recognition Problem of Frontal Singularities*,
  [arXiv:1808.09594v2, Thm.3.4(1)](https://arxiv.org/html/1808.09594v2):
  smooth plane-to-plane germ, corank one and nonzero kernel derivative are
  proved before invoking it in prose. Lean independently constructs actual
  charts and inverse maps through pinned StokesV5; recognition is not a custom axiom.
- The actual smooth inverse-function theorem and exponential covering/homotopy
  lifting theorems are Mathlib kernel dependencies, with their hypotheses proved.
- Milnor, *Topology from the Differentiable Viewpoint*, section 6, is background
  for the planar winding index convention. The local-index sign conclusion is
  now independently kernel-proved, not a remaining external theorem obligation.
- The corner proof replaces auxiliary Taylor/Big-O expansions by exact
  derivatives and actual one-sided limits. The curvature non-developability
  proof uses an explicit regular negative witness. The arctangent bound uses
  derivatives/monotonicity. These optimize supporting proofs without removing
  any asserted geometric, topological or signal result, or discarding Q=0.

## Research questions outside the article's asserted results

Further exceptional-germ classification, global identifications of the regular
image, and an invariant boundary-observation convention remain independent
open research questions. The closed image already has a negative C1 embedding
obstruction, and paired u=1 labels are not quotiented. No positive whole-image
embedding conjecture, arbitrary-trajectory oscillator law, general homological
Brouwer-degree construction or arbitrary-coordinate curvature theorem is claimed.
There is no remaining formalization gap in the mathematical claims listed above.

The immutable v0.01 (51) and v0.02 (77) packages retain their genuinely partial
coverage. They are not retrospectively relabeled full-paper packages. Historical
baseline replay still reproduces old failed claims; passing that replay does
not certify v4. Public scope is ResearchGate and Zenodo, with final confirmation
of the concrete candidate required. No public release or new DOI is implied.
