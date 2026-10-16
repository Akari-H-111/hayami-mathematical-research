# Bicomplex successors: partial formal coverage

> **Status (2026-10-16).** Partial coverage of 105 selected statements; build/status/full axiom audit/proof-hole scan PASS. The published 33-statement checkpoint is preserved below.

2026-10-01. Lean `leanprover/lean4:v4.33.1`; Mathlib commit
`0df444a360eaa60ab8c11dca51a86af692955474`, inherited through unchanged
RuledV5/StokesV5 path dependencies. 33 own public named theorems: build/status/full axiom audit/proof-hole scan PASS.
Separate dependency audits: 224 Ruled and 258 Stokes PASS. The full audit result is
recorded in `RESEARCH_STATUS.md` and the checkpoint receipt; count alone is
not whole-paper coverage.

The historical claim inventory is
`papers/legacy-geometry/bicomplex-signal-manifolds/claims/CLAIM_MAP.json`.
It contains all 66 named blocks from the immutable 43-page v12, including
47 definitions/results and 19 remarks. The manuscript is a substantive
v13 working correction, not recovered final-v12 TeX.

| Own theorem, namespace `Bicomplex` | Actual statement / hypotheses | v12 route and limit |
| --- | --- | --- |
| `actual_source_rank_classification` | Completed atlas differential injective iff outside the five labels; angular label lies in closed physical t interval | 6.1 / 8.9; exact same S and completed Ruled atlas, not a dimension analogy |
| `actual_endpoint_rank` | Actual smooth endpoint extension derivative at (0,u), injective iff u is nonzero | 6.2; physical epsilon is ±1; theorem permits any real epsilon |
| `actual_polar_fold` | Actual observation map at (0,1) has a smooth two-sided Whitney normal form | 8.8; inherited Stokes charts and inverse proofs; physical half-domain is distinct |
| `actual_dipole` | Actual local indices at lateral labels are -1,+1, defined by every sufficiently small physical circle | 4.1 / 4.4; inherited genuine winding proof |
| `observation_field_even` | Actual observation map at (-t,u) equals its value at (t,u) | 4.4; corrects the old M-odd explanation |
| `normalized_polynomial_derivative` | Absolute monic polynomial derivative at the algebraic lateral cosine is sqrt(5) | 5.1; normalization matters |
| `crosscap_lift_injective` | Map (x,xy,y²,y) is injective on the entire real source | 5.8; smooth embedding and inverse are written, not inferred from this lemma alone |
| `crosscap_actual_fibers` | Actual standard map equality iff same point or paired (0,y),(0,-y) | 5.8; link circle topology remains written |
| `crosscap_metric_determinant` | Determinant of the actual standard pullback metric | 8.11; capacity is an integral proof outside Lean |
| `crosscap_residual_positive` | Actual cross-cap squared residual vanishes iff x=y=0 | 5.3; no sublevel-volume theorem encoded |
| `square_root_lift` | Continuous actual exp-cover lift, its square equals the nonzero path, and initial value is exp(z/2) | 4.2; initial exponential equality is required |
| `log_lift_endpoint` | Closed nonzero path has actual lifted endpoint z+2πin and winding n | 4.2; exponential covering theorem from Mathlib |
| `unit_winding_sign_change` | Actual root-lift endpoint reverses sign if actual winding is ±1 | 4.2; uniqueness of all continuous branches and double traversal are written |
| `local_observation_root_sign` | On every small physical observation circle, an actual normalized root path squares to F/F(start) and changes sign | 4.2; applies to either `actual_dipole` component, using its index ±1 |
| `mellin_interval_green` | Actual complex interval integral equals endpoint term, with conjugate-first inner-product convention | 7.1; f,g globally differentiable, their given derivatives continuous; bounded C1 functions admit local extension |
| `mellin_zero_boundary_pairing` | Same actual integral is zero when f vanishes at both endpoints | 7.1; compact-core use follows in prose |
| `formal_coefficient_symmetry` | sigma=1-sigma iff sigma=1/2 | 7.1; coefficient identity, not Hilbert adjoint-domain equality |
| `gram_diagonal` | Actual normalized phasor integral equals one on the diagonal | 7.4; T nonzero, manuscript uses T>0 |
| `gram_entry_integral` | Actual off-diagonal integral equals the exponential quotient | 7.4; frequencies unequal |
| `gram_entry_bound` | Actual entry norm is at most 2/(T abs(omega-nu)) | 7.4; T positive, frequencies unequal |
| `gram_eigenvalue_enclosure` | Eigenvalue of the actual finite integral matrix lies within 2(card-1)/(T delta) of one | 7.4; finite index type, T>0, delta>0 and actual separation; operator-norm translation is written |
| `zero_boundary_core_witness` | Integral of constant two on (0,1) is two | 8.13; only the scalar check supporting the written boundary counterexample |
| `transmission_unit_modulus_iff` | Green scalar 1-norm(z)² vanishes iff norm(z)=1 | 8.23; no unbounded Dirac trace operator supplied by this identity |
| `real_transgression_coefficient` | Real coefficient making z+a(conj(z)-z) real for all z is exactly 1/2 | 8.23; variation and actual domain remain separate |
| `sign_intertwiner_zero` | A complex scalar invariant under simultaneous odd/even identification is zero | 8.18; no sheaf-category theorem encoded |
| `cusp_return_square` | Under c≠0 and b²+ac²=0 the actual return numerator is a perfect square | 5.12; actual jets and nonzero second/third determinant independently replayed |
| `half_integer_pairing` | Circle weights n+1/2 and -n-1+1/2 sum to zero | 9.5; eta convergence and continuation are written/external |

| `quadrature_unit_power` | Actual four real quadratures have total power one for all real phase and power angles | Continuation 1.1; phase coupling is additional model data |
| `quadrature_readout` | The fixed quadratic readout equals the explicit two-phase formula | Continuation 1.1; no physical measurement interpretation inferred |
| `quadrature_actual_surface` | That readout equals actual `StokesV5.ruledSurface` at u=sin(v)^2 under two explicit phase-coupling identities | Continuation 1.1; existence of the selected phase and endpoint chart smoothness are written |
| `pure_state_bloch_norm` | Bloch-vector squared norm equals total power squared for arbitrary four real quadratures | Continuation 1.3; Hermitian no-go proof itself is written |
| `actual_crosscap_energy_lower` | Actual standard metric energy is at least half the diagonal reference energy when y^2<=1/2 | Continuation 2.1; homeomorphism and actual-germ transfer are written |
| `actual_crosscap_energy_upper` | Actual standard metric energy is at most four times that reference energy under the same hypothesis | Continuation 2.1; PDE regularity is external, not formalized |

## Extension of written results, 2026-10-16

This working tree has **partial coverage of 105 selected statements**: the
33 preserved statements plus the 72 rows below. The complete build, status,
axiom audit and proof-hole scan passed. The published software 1.0 and paper 1,
Appendix D, still describe their immutable 33-statement checkpoint. No paper,
PDF, release, receipt, manifest, sibling source or toolchain configuration is
changed by this extension. Neither paper is Lean-formalized.

**Mathematical qualification: nonzero frequency.** Paper 1 `prop:windows`
says the decay bound holds for every real delta. It requires **delta != 0**
(and positive window mass). At delta=0 the actual average is one; the printed
right side divides by zero. `window_zero_frequency_counterexample` also
checks that the inequality fails under Lean's totalized division. The
log-scale identity has a separate zero-frequency theorem, and the Lebesgue
formula/limit hold for every real delta. This condition is explicit,
not a silent weakening of the printed statement.

**Multiplicity qualification.** In paper 2 `thm:romanB`, the dimensions
1,2,3 describe the three invariant blocks. Exact eigenspace multiplicities
require their eigenvalue formulas to be distinct. For example, gamma_perp =
gamma_circle = 0 gives rI, whose r-eigenspace is six-dimensional. The formal
basis and block-dimension theorems preserve this distinction; the claim of
at most three eigenvalues is unaffected.

All finite proofs use ordinary `decide` or kernel-checked algebra. The analytic
arguments use actual integrals, derivatives and normed spaces; the curve proof
uses Mathlib's identity theorem. The allowed logical axioms remain `propext`,
`Classical.choice`, `Quot.sound` only.

| Lean name in `Bicomplex` | Actual statement and hypotheses | Paper label and what stays written |
| --- | --- | --- |
| `norm_sq_derivative_at_zero` | A complex-valued function differentiable within a set at a zero has a zero norm-square derivative there. | Paper 1 `prop:twoobs` (1); arbitrary within set, no two-sided extension assumed. |
| `norm_sq_derivative_at_zero_two_sided` | The same conclusion for a two-sided differentiable complex-valued function. | Paper 1 `prop:twoobs` (1). |
| `no_differentiable_power_endpoint` | For epsilon positive and norm-square equal to u on [0,epsilon), differentiability within [0,infinity) at zero is impossible. | Paper 1 `prop:twoobs` (1); the endpoint hypothesis is explicitly one-sided. |
| `no_differentiable_power_endpoint_one` | For epsilon positive and norm-square equal to 1-u on (1-epsilon,1], differentiability within (-infinity,1] at one is impossible. | Paper 1 `prop:twoobs` (1). |
| `actual_surface_four_values` | The actual StokesV5 ruled surface has the four stated values (1,0,0), (0,1,0), (0,-1,0), (1,0,1). | Paper 1 `prop:twoobs` (2); literal predecessor surface. |
| `actual_polar_segment` | For every real u the actual surface at (0,u) equals (1,0,u). | Paper 1 `prop:twoobs` (2). |
| `no_affine_sphere_realization` | No real 3x3 matrix, translation and unit-vector family reproduce the actual surface on the closed physical domain. | Paper 1 `prop:twoobs` (2); the four values force surjectivity, then the polar midpoint contradicts the sphere. The Hermitian-to-Bloch reduction stays written. |
| `actual_edge_values` | Both actual edge formulas are (2u,1-u,0) and (2u,u-1,0), for every real u. | Paper 1 `prop:gauge`, `thm:rigidity` (1). |
| `actual_edge_injective` | The actual surface restricted to either edge is injective in u. | Paper 1 `prop:gauge`; no regularity of a state family is assumed. |
| `phase_invariant_constant_on_circle` | A readout invariant under every actual exponential global phase takes the value P(0,1) at every (0,w) of norm one. | Paper 1 `prop:gauge`; arbitrary output type. |
| `moment_edge_circle` | The two original moment equations at either edge imply z1=0 and norm(z2)=1. | Paper 1 `prop:gauge`; includes normalization through the second moment. |
| `phase_invariant_edge_obstruction` | A phase-invariant readout cannot realize two distinct points of either actual edge with moment-compatible states. | Paper 1 `prop:gauge`; arbitrary distinct real edge labels, hence also every stated subset of the physical edge. |
| `rank_one_density_phase_invariant` | Every function of the actual rank-one matrix zz* is invariant under all exponential global phases. | Paper 1 `prop:gauge`; rankOneDensity is the actual two-component outer product. |
| `rank_one_density_edge_obstruction` | No function of that actual rank-one matrix can realize two distinct points of either actual edge with moment-compatible states. | Paper 1 `prop:gauge`; the pure-density consequence is formal, not an assumed phase-factorization proxy. |
| `density_matrix_edge_unique` | An actual positive semidefinite complex 2x2 matrix with trace one and top-left entry zero equals diag(0,1). | Paper 1 `prop:gauge`; positivity is Matrix.PosSemidef, not a substitute scalar assumption. |
| `density_matrix_edge_obstruction` | No function of trace-one positive semidefinite density matrices with the original diagonal moment can realize two distinct actual edge points. | Paper 1 `prop:gauge`. |
| `analytic_zero_set_countable_or_identically_zero` | A real-analytic normed-vector-valued function on a preconnected real set is identically zero there or has a countable zero set there. | Paper 1 `lem:analytic`; Mathlib identity/isolated-zeros theorem and discrete-subset countability. |
| `distinct_real_lines_intersection_countable` | Two distinct actual affine lines in real three-space have countable intersection (proved subsingleton). | Paper 1 `lem:analytic`; lines are ranges of a+t*d. |
| `analytic_curve_line` | An analytic curve on a preconnected real set has image entirely in a given affine line of nonzero direction, or countable intersection with it. | Paper 1 `lem:analytic`; covers open intervals and the periodic real lift of a circle. |
| `analytic_curve_not_two_lines` | For two distinct affine lines of nonzero direction, at least one intersection with an analytic curve image is countable. | Paper 1 `lem:analytic`; excludes uncountable subsets of both lines. |
| `analytic_curve_cannot_cover_actual_edges_on` | An analytic curve on a preconnected real parameter set cannot contain both actual closed edge segments. | Paper 1 `thm:rigidity` (1); uses uncountability of [0,1] and the actual edge formulas. |
| `analytic_curve_cannot_cover_actual_edges` | The preceding edge obstruction for a curve analytic on all of the real line. | Paper 1 `thm:rigidity` (1); applies to the periodic circle parametrization. |
| `no_analytic_moment_readout` | No readout realizing the actual surface with the original moments on the full closed domain is analytic on its actual circle phase lift. | Paper 1 `thm:rigidity` (1); the interior-domain compactness/continuity argument in (2) stays written. |
| `no_analytic_readout_on_connected_phase_interval` | No readout analytic on a preconnected phase interval containing all actual edge states can realize both edges. | Paper 1 `thm:rigidity` (1); the arc is stated via its real phase parametrization and explicit state membership. |
| `window_kernel_zero` | The actual exponential integral kernel equals one at zero frequency and nonzero window length. | Paper 1 `prop:windows`; separates the excluded zero-frequency case. |
| `window_kernel_bound` | For nonzero real delta and positive L, the actual kernel norm is at most 2/(abs(delta)*L). | Paper 1 `prop:windows`; the printed every-real-delta claim needs delta nonzero. |
| `window_kernel_formula` | For nonzero delta the actual kernel equals its exponential endpoint quotient. | Paper 1 `prop:windows`; the displayed sine-modulus simplification stays written. |
| `logarithmic_window_identity` | For T>1 and delta nonzero, the actual dx/x average of exp(-i*delta*log(x)) equals K(delta,log(T)). | Paper 1 `prop:windows` (1); logarithmicPhasor is this exponential, i.e. x^(-i*delta) for x positive. |
| `logarithmic_window_zero` | The same log-scale identity at delta=0 and T>1. | Paper 1 `prop:windows` (1). |
| `lebesgue_logarithmic_window` | For every real delta and T>1, the Lebesgue average equals (exp((1-i*delta)*log(T))-1)/((1-i*delta)*(T-1)). | Paper 1 `prop:windows` (2); T^(1-i*delta) is written as its positive-real exponential definition. |
| `window_zero_frequency_counterexample` | At delta=0 and L=1, the printed decay inequality is false with Lean's totalized division. | Paper 1 `prop:windows`; in ordinary notation its right side divides by zero, while K=1. |
| `lebesgue_window_modulus_limit` | For every real delta, the modulus of the actual Lebesgue average tends to inverse sqrt(1+delta^2) as T tends to infinity. | Paper 1 `prop:windows` (2); exactly the stated positive-real power (1+delta^2)^(-1/2). |
| `additive_phasor_haar_bound` | For delta nonzero and T>1, the dx/x average of exp(-i*delta*x) has modulus at most 2/(abs(delta)*log(T)). | Paper 1 `prop:windows` (3); integration by parts and an actual integral norm bound. |
| `roman_surface_derivative` | The actual map (yz,zx,xy) has the stated continuous linear differential at every real point. | Paper 2 `prop:roman`; no abstract matrix surrogate. |
| `roman_differential_apply` | The actual Frechet derivative applied to v is (z*v2+y*v3,z*v1+x*v3,y*v1+x*v2). | Paper 2 `prop:roman`. |
| `roman_coordinate_values` | A real coordinate has square 1/2 iff it is plus or minus 1/sqrt(2). | Paper 2 `prop:roman`; identifies the written twelve-point coordinates exactly. |
| `roman_tangent_singular_iff` | On the unit sphere there is a nonzero tangent vector killed by the actual derivative iff one coordinate is zero and the other two have square 1/2. | Paper 2 `prop:roman`; all twelve sphere points, hence six projective lines. |
| `roman_tangent_plane_dimension` | The kernel of the actual sphere normal covector has real dimension two at every unit point. | Paper 2 `prop:roman`; proves the tangent plane dimension used by the literal rank test. |
| `roman_tangent_rank_iff` | On the unit sphere the actual differential restricted to that tangent plane has rank below two exactly at the stated singular set. | Paper 2 `prop:roman`; literal finite-dimensional range rank. |
| `roman_normalized_chart_formula` | For a^2=b^2=1/2, the actual normalized chart composed with the Roman map equals the explicit rational formula for every s,t. | Paper 2 `prop:roman`; actual normalization by the Euclidean norm. |
| `roman_normalized_chart_frame` | For those a,b the chart equals (p+s*xi+t*eta)/norm(p+s*xi+t*eta), with p=(0,a,b), eta=(0,b,-a), xi=p cross eta. | Paper 2 `prop:roman`; the chosen frame is explicit. |
| `roman_chart_s_derivative` | The actual normalized-chart s derivative at s=0 is (0,-(b-ta)/(1+t^2),-(a+tb)/(1+t^2)). | Paper 2 `prop:roman`; a^2=b^2=1/2. |
| `roman_chart_st_derivative` | The mixed derivative of the actual normalized chart at the origin is (0,a,-b). | Paper 2 `prop:roman`; a^2=b^2=1/2. |
| `roman_chart_tt_derivative` | The second t derivative of the actual normalized chart at the origin is (-4ab,0,0). | Paper 2 `prop:roman`; a^2=b^2=1/2. |
| `roman_normalized_whitney_jets` | For all four sign choices at zero first coordinate, ft=0, Euclidean norm(fs)=1 and det(fs,fst,ftt)=plus or minus 2. | Paper 2 `prop:roman`; derivative expressions refer to the actual normalized chart. |
| `roman_rotation_symmetry` | All three cyclic coordinate permutations commute with the actual Roman map and preserve the actual Euclidean norm. | Paper 2 `prop:roman`; exact coordinate symmetry used to transport the jets. |
| `roman_all_chart_frames` | Each cyclically transported chart is literally the normalized p+s*(p cross eta)+t*eta chart at its corresponding singular point. | Paper 2 `prop:roman`; a^2=b^2=1/2 and all three coordinate positions. |
| `roman_singular_chart_parameters` | Every point of the actual sphere singular set lies in one of the three cyclic chart families with a^2=b^2=1/2. | Paper 2 `prop:roman`; with roman_coordinate_values this is the twelve-point list. |
| `roman_all_normalized_whitney_jets` | For all three cyclic charts and all four sign choices, ft=0, norm(fs)=1 and the actual mixed/second-jet determinant is plus or minus 2. | Paper 2 `prop:roman`; all twelve points. The smooth Whitney recognition theorem and RP2 manifold construction stay written/external. |
| `roman_action_on_representatives` | Each of the 48 signed coordinate permutations sends each listed homogeneous cross-cap representative to the representative selected by the six-point action, up to global sign. | Paper 2 `thm:romanB` finite part; integer representatives are the actual projective labels, not unrelated six-element data. |
| `roman_action_transitive` | The signed-coordinate-permutation action is transitive on the six cross-cap labels. | Paper 2 `thm:romanB` finite part; ordinary decide, no native_decide. |
| `roman_ordered_pair_orbits` | Every distinct matching pair or nonmatching pair is obtained from its stated canonical ordered pair by a signed coordinate permutation. | Paper 2 `thm:romanB` finite part. |
| `roman_ordered_pair_counts` | There are exactly six ordered orthogonal pairs and twenty-four remaining ordered pairs. | Paper 2 `thm:romanB` finite part. |
| `roman_pair_angles` | Distinct matching homogeneous representatives have dot product zero; nonmatching ones have dot-product square one. | Paper 2 `thm:romanB`; representatives have squared length two, so the latter projective lines have absolute cosine 1/2. |
| `roman_representatives_squared_length` | Each of the six actual homogeneous representatives has squared Euclidean length two. | Paper 2 `thm:romanB`; supplies the angle normalization. |
| `roman_action_preserves_pair_type` | The signed permutation action preserves whether two labels have the same missing coordinate. | Paper 2 `thm:romanB`; together with its permutation property and the canonical-pair theorem, these are exactly the two orbits. |
| `roman_invariant_matrix` | Every real 6x6 matrix invariant under the actual six-point action equals rI+gamma_perp*P_perp+gamma_circle*P_circle. | Paper 2 `thm:romanB` finite implication; symmetry need not be assumed separately. Existence and analytic invariance of B_eta stay written. |
| `roman_eigenvector_actions` | The six displayed vectors have eigenvalues r+gamma_perp+4gamma_circle, r+gamma_perp-2gamma_circle, r-gamma_perp in blocks of sizes 1,2,3. | Paper 2 `thm:romanB`; actual matrix multiplication. |
| `roman_eigenbasis` | Those six vectors form a basis of the full real six-coordinate space. | Paper 2 `thm:romanB`; proves completeness and independence. |
| `roman_block_dimensions` | The spans of the constant, matching-even sum-zero, and matching-odd displayed vectors have dimensions 1,2,3. | Paper 2 `thm:romanB`; these are invariant block dimensions even if eigenvalues coincide. |
| `roman_invariant_spectral_basis` | Every invariant real matrix admits a full basis with the stated three eigenvalue formulas. | Paper 2 `thm:romanB` finite part; exact eigenspace multiplicities require distinct formulas, otherwise coincident blocks merge. |
| `reference_length_identity` | For positive d and lambda, ell*log(d)+b equals ell*log(d/lambda)+(b+ell*log(lambda)). | Paper 2 `cor:scale`; actual complex scalar coefficients and real logarithms. |
| `reference_length_vector_identity` | For finitely many positive distances and reference lengths, the coefficient change is exactly b+diag(log(lambda_i))*ell. | Paper 2 `cor:scale`; actual diagonal matrix multiplication. |
| `invariant_isotropic_has_zero_log` | An isotropic complex subspace invariant under all real common shifts b->b+t*ell has ell=0 on every element. | Paper 2 `cor:scale`; uses the actual conjugate-first Hermitian boundary pairing. |
| `friedrichs_plane_isotropic` | The actual coefficient plane ell=0 is isotropic for that pairing. | Paper 2 `cor:scale`; does not assert an operator-domain theorem. |
| `friedrichs_plane_shift_invariant` | The plane ell=0 is invariant under each real common reference-length shift. | Paper 2 `cor:scale`. |
| `friedrichs_plane_maximal` | Every isotropic subspace containing ell=0 equals ell=0. | Paper 2 `cor:scale`; proves maximal isotropy. |
| `invariant_lagrangian_is_friedrichs` | A maximal isotropic subspace invariant under every common shift equals ell=0. | Paper 2 `cor:scale`; self-adjoint extension/plane correspondence stays written/external. |
| `friedrichs_plane_dimension` | On C^k direct-sum C^k with the standard Hermitian pairing, the plane ell=0 has complex dimension k, including k=0. | Paper 2 `cor:scale`; combined with isotropy and maximality, this is the Lagrangian statement. |
| `logarithmic_cutoff_derivative` | For epsilon and rho positive, the actual logarithmic annular cutoff has derivative -1/(rho*log(1/epsilon)). | Paper 2 `prop:capacity`, scalar model only. |
| `logarithmic_cutoff_energy` | For 0<epsilon<1, the actual derivative-squared radial energy integral from epsilon^2 to epsilon equals 2*pi/log(1/epsilon). | Paper 2 `prop:capacity`, model energy identity, not zero capacity. |
| `logarithmic_cutoff_energy_tends_to_zero` | The explicit model energy tends to zero as epsilon approaches zero from above. | Paper 2 `prop:capacity`; smoothing, actual-metric transfer and form-core density stay written. |

### Verification of this extension

From `companions/lean/bicomplex-signal-manifolds/`:

```text
python3 -B verify_lean.py
PASS 105 public named theorems; build/status/full axiom audit/proof-hole scan
```

The baseline passed with 33 public named theorems before the extension. All
new modules were compiled serially before the final project verifier; every
new public theorem has both a status entry and a full axiom-audit entry.
Both `verify_successor_paper1.py` and `verify_successor_paper2.py` passed their
existing consistency/exact/finite replays, and repository navigation passed.
No new Python mathematical replay was added.

This verification reuses the same-host pinned package/build caches. The
separate 224 Ruled and 258 Stokes full audits and independent-host replay were
not repeated. The existing verifier is unchanged. Build/status/axiom logs are
in `.lake/build/verification/`; intermediate failed development builds do not
count as successful verification.

## Written proofs and external dependencies

The v13 manuscript proves the actual completed-source rank set and invokes
the applicable smooth Whitney recognition criterion after checking adapted
determinants. It proves sublevel integrals, link topology, the principal-curvature
cusp criterion, the Mellin closure/adjoint domains, finite-frequency independence,
conditioning/logdet estimates, Hardy evaluation, Haar orthogonality, zero
capacity, weighted radial compactness and the positive fixed-Dirichlet gap.
The actual compact-core minimum has infinite outer-boundary deficiency and
harmonic spaces. Applicable abstract Krein/buckling results give its discrete
reduced positive spectrum, while correcting the false two-channel conclusion.
These analytic results are not certified by the scoped Lean inventory.

The chosen holomorphic A3 completion, Milnor comparison, smooth-curve
Gysin/MHS theorem, ordinary sheaf/recollement statements and Clifford/Pin
theorems remain explicit external mathematical dependencies. See
`papers/legacy-geometry/bicomplex-signal-manifolds/proofs/REFERENCE_AUDIT.md`.

Continuation 0.02 supplies an explicit continuous unit-power lift and fixed
quadratic readout, boundary obstruction and Hermitian no-go. Its actual Whitney
metric/form reduction and external scalar Holder theorem establish graph-bounded,
surjective point traces. The corrected restriction A=HF|ker(tau) has (2,2)
indices, an exhaustive actual resolvent boundary triple, U(2) extensions, compact
extension resolvents and a Krein kernel of dimension two. These operator/PDE
proofs are written/external, not Lean. Old H0 still has infinite deficiency and
harmonic spaces. Actual curvature is locally Lp for p<3/2; this does not supply
singular Dirac domains.

## Actual open obligations

The dated checkpoints below retain their historical theorem counts and receipts.
The 2026-10-16 extension proves the selected results in the new table, without
promoting the following written/external or open claims to Lean coverage.

1. The actual singular Dirac/Pin problem is still open: a two-sided parametrix,
   graph-space overlap bounds, remainder resolvent continuity, exclusion of
   extra modes, singular-cut spin domains, the Pin convention, phase-line
   identification and Clifford-compatible transmission remain to be supplied.
2. The scalar PDE/operator, sheaf, topology and Whitney recognition arguments
   remain written/external. In particular, existence and analytic invariance of
   the actual Green matrix B_eta, the self-adjoint-domain/boundary-plane
   correspondence, smoothing and actual-metric transfer of the cutoff, and
   zero capacity itself have no certificate here.
3. Paper 1 `thm:rigidity` (2), its interior compactness/continuity argument,
   smooth readout construction, intrinsic circle/arc atlas formulation,
   Hermitian-to-Bloch reduction and the sine-modulus simplification of the
   window quotient remain written. The requested periodic real lift and
   connected phase-interval versions of part (1) are formalized.
4. Optional targets `thm:sublevel`, `prop:half` (1), and `cor:excluded` are not
   added in this extension. Their written results retain their prior status.
5. Historical moment compatibility, a sheaf-to-operator bridge, singular
   Dirac/Pin analysis and publication priority remain unresolved in their
   previously recorded senses; no finite theorem inventory resolves them.

## Replay

From this project: `python3 -B verify_lean.py`. It checks all public named
theorems, rejects proof holes/custom axioms/unsafe/native_decide, builds,
checks status, and parses every axiom audit entry. Only `propext`,
`Classical.choice`, `Quot.sound` are allowed. Dependencies are audited
separately using each unchanged project's `verify_lean.py`; current own 105,
Ruled 224 and Stokes 258 inventories must not be added into a whole-paper count.

The 2026-10-01 working-tree complete replay passed, including isolated rebuild
of both native-checked PDFs and all 20 page-render hashes. Frozen package
acceptance belongs to `releases/candidates/bicomplex-v13-working-v0.01-receipt.json`;
it is same-host replay with disclosed dependency/build cache reuse.
Both frozen original and ZIP extraction complete replays passed. The receipt
binds their logs, 155-file manifest, 156-member ZIP/CRC and both PDF hashes.
That immutable receipt has 27 own theorems and 20 PDF pages. Current continuation
acceptance is recorded separately; its six added formal results are listed above
and do not expand into whole-paper coverage.

Continuation 0.02 acceptance (2026-10-02): complete working/original/ZIP replays,
33 own / 224 Ruled / 258 Stokes full audits, three PDFs / 27 inspected pages /
isolated rebuild and full text/render equality, 167-file manifest / 168-member
ZIP / CRC PASS. Receipt: `releases/candidates/bicomplex-continuation-v0.02-receipt.json` (repository-relative).
Same-host pinned dependency/build cache reuse; no whole-paper Lean or public action.

Continuation 0.03 acceptance (2026-10-02): six new inspected pages, four PDFs /
33-page isolated full-text/render replay, current exact/claim/baseline and
original/ZIP replay passed; 180 payload files / 181 ZIP members / CRC passed.
All 66 unchanged Lean proof/config/verifier inputs are bound to the prior
complete separate 33/224/258 audit log; no fresh build and no added theorem.
Receipt: `releases/candidates/bicomplex-green-v0.03-receipt.json`
(repository-relative). New scalar PDE/operator proofs remain written/external.

Continuation 0.04 (2026-10-02): no proof source, lake configuration or verifier
in this Lean project changed, and no theorem was added. The moment-readout
rigidity, C∞ construction, exceptional-pullback and log-window results are
written proofs with cited external duality statements. Exact and finite checks
are in `papers/legacy-geometry/bicomplex-signal-manifolds/verification/verify_continuation_0_04.py`.
The winding inputs reuse `actual_dipole` only as stated scope. The own
inventory remains 33.

## Successor publication (2026-10-02 to 2026-10-03)

The two published papers (Zenodo `10.5281/zenodo.23103026` and `10.5281/zenodo.23103056`)
and the software companion 1.0 (`10.5281/zenodo.23103299`) cite this project as partial
coverage of 33 selected statements; Appendix D of paper 1 lists them. Nothing in the proofs,
`lakefile.toml`, `lake-manifest.json` or `lean-toolchain` changed. A **fresh in-place
`verify_lean.py` run on 2026-10-02 passed**: 33 own public named theorems; build, status,
full axiom audit and proof-hole scan, with only `propext`, `Classical.choice` and
`Quot.sound` (logs: `releases/candidates/bicomplex-successor-v1-acceptance/lean-*.txt`).
The 224 Ruled and 258 Stokes dependency audits were not re-run in that session.

The software zip carries these sources without `.lake`, but it cannot build Lean on its
own: `lakefile.toml` requires the sibling `../ruled-surface-v5`, which requires
`../stokes-caustic-v5`, which requires Mathlib `v4.33.1`. Build inside a checkout of the repository. No PDE, operator, sheaf or
topology argument of either paper is formalized, and neither paper is Lean-formalized. The
tables above are unchanged; the published zip contains this file as it was before this section was added.
