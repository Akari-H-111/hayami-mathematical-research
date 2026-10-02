# Bicomplex v13 and continuations 0.02/0.03: partial formal coverage

> **Status (2026-10-03).** Partial coverage of 33 selected statements; the successor papers cite it. A fresh in-place verification passed on 2026-10-02; see the last section, “Successor publication”.

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

Continuation 0.03 now proves actual extrinsic logarithmic normalization, full
corrected A* geometric boundary coefficients, Green pairing, Markov and
reference-length uniqueness, global reflection and limiting sheet parity.
These are written/external scalar proofs, not new Lean theorems. No proof
source, public inventory, lake configuration or axiom audit was changed.
The originality/model-gap comparison is `proofs/ORIGINALITY_AND_GAPS.md`
under the Bicomplex paper directory. Historical moment compatibility and
publication priority remain unresolved.

1. Prove a two-sided actual Dirac parametrix, graph-space overlap bounds,
   resolvent continuity for a Dirac remainder and exclusion of extra Dirac
   modes. Dilation alone gives a weight-zero cutoff commutator. Scalar resolvents
   and exactly two defect directions are established for corrected A.
2. Supply the singular-cut spin domains, Pin convention, phase-line fiber map
   and Clifford-compatible unitary transmission map before global self-adjoint
   interface claims. The spin Pin map alone does not identify the phase line.
3. Encode the remaining written/external results in Lean if full formal
   coverage is required. Neither the theorem count nor dependency audit closes
   these mathematical or formal gaps.

## Replay

From this project: `python -B verify_lean.py`. It checks all public named
theorems, rejects proof holes/custom axioms/unsafe/native_decide, builds,
checks status, and parses every axiom audit entry. Only `propext`,
`Classical.choice`, `Quot.sound` are allowed. Dependencies are audited
separately using each unchanged project's `verify_lean.py`; own 33,
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
