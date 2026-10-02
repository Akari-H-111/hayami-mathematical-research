from pathlib import Path
import re,json,hashlib
import subprocess
w=Path(__file__).resolve().parents[1]
pdf=w.parent/'source-registry/final_pdfs/Geometric_Realization_of_Bicomplex_Signal_Manifolds_v12.pdf'
assert hashlib.sha256(pdf.read_bytes()).hexdigest()=='4ebb8f0a7d6e88a6c5cd97f65d224b4e938867cabad54f057d3ceafb24167d5a'
s=subprocess.check_output(['pdftotext','-layout',str(pdf),'-'],text=True)
assert s.count('\f')==43
pattern=r'(?m)^[ \t\r\n\f]*(Definition|Theorem|Proposition|Corollary|Lemma|Remark)\s+(\d+\.\d+)\b(?=\s*(?:\(|\.))'
ms=list(re.finditer(pattern,s))
# Each row states a concrete correction and obligation. Never infer certification from a status word.
cases={
'3.1':('DEFINITION GAP','No explicit lift or projection is defined by the momentum constraint.','Use the explicit ruled map as the model; C2 is identified with bicomplex idempotent coordinates only after specifying the algebra.','sec:model','Not formalized; no fabricated C2-to-surface map.','An actual momentum-compatible lift/projection would be additional input.'),
'3.2':('REPAIRED','The introduction uses a different weighted measure.','Fix L2(dx), conjugate-linear first inner product, and the compactly supported core.','sec:mellin','mellin_interval_green; mellin_zero_boundary_pairing','Full Hilbert adjoint/closure and deficiency domains have written proofs; not Lean encoded.'),
'3.3':('WRITTEN PROOF','Use Lebesgue source volume with a smooth positive density if changed.','Retain geometric resolution cost and the explicitly chosen residual.','sec:residual','No integral-volume Lean theorem.','Do not identify Euclidean coefficient with arbitrary source density.'),
'4.1':('REPAIRED / DEPENDENCY LEAN','F is an angular-chart field, not a continuous global boundary field.','Two interior zeros and their actual small-circle indices; separate all five surface rank-loss labels.','sec:field','actual_dipole; actual_source_rank_classification','No index assigned on a physical half-neighbourhood.'),
'4.2':('WRITTEN / PARTIAL LEAN','Two traversals is topological restoration, not an absolute time period.','Use continuous logarithm lifting and uniqueness of continuous square-root branches.','sec:field','square_root_lift; unit_winding_sign_change; local_observation_root_sign','Apply actual dipole winding; uniqueness statement remains written.'),
'4.4':('REPAIRED / DEPENDENCY LEAN','Both N and M are even; the Jacobian is odd.','Correct the parity explanation; degree of actual small circles is inherited with the same orientation.','sec:field','actual_dipole; observation_field_even','General Brouwer homology theory not reimplemented.'),
'5.1':('WRITTEN + LEAN','Derivative depends on monic normalization.','Absolute derivative is sqrt(5) for P(c)=c2-3c+1.','sec:residual','normalized_polynomial_derivative','No invariant derivative of the zero set claimed.'),
'5.3':('WRITTEN PROOF','Only the exponent survives smooth positive density changes.','Exact beta constant for standard fold; explicit two-sided cross-cap bounds and density comparison.','sec:residual','crosscap_residual_positive (algebra only)','Volume integral and dominated convergence are not Lean encoded.'),
'5.5':('WRITTEN NO-GO','No stochastic kernel is supplied.','Constant versus noiseless binary kernels on identical labels have capacities 0 and log(2).','sec:limits','Not formalized.','No physical capacity law.'),
'5.6':('WRITTEN / EXTERNAL THEOREM','Holomorphic branch and local invertible derivative required.','Explicit holomorphic coordinate change; Jacobian/Tjurina algebra dimension 3.','sec:residual','Not formalized.','Exact coordinate check is not a proof of holomorphic IFT.'),
'5.7':('WRITTEN / EXTERNAL THEOREM','Smooth compactification, weighted homogeneous local/global fiber comparison.','Genus-one double cover with two unramified ends and monodromy eigenvalues -i,1,i.','sec:residual','Not formalized.','Riemann-Hurwitz, Milnor fiber comparison and cohomology remain external dependencies.'),
'5.8':('WRITTEN / PARTIAL LEAN','Every r>0 for the specified polynomial, not every actual germ globally.','Connected smooth link, unique double pair, transverse tangents, continuous inverse to lifted embedding.','sec:links','crosscap_actual_fibers; crosscap_lift_injective','Smooth circle classification and immersion proof remain written.'),
'5.9':('WRITTEN PROOF','The orbit is not contained in f=1 except at fourth-root phases.','Primitive weights (2,1); embedding, projection equation, transverse node, reconstruction and oscillator ratio.','sec:links','Not formalized.','No source identification or absolute clock.'),
'5.10':('WRITTEN PROOF','a,b>0 exclude the minimum; it is attained only in the closure.','On nondegenerate orbits the infimum is 2pi; boundary closure minimizes at (0,1); z=1/8 is a maximum.','sec:links','Not formalized.','Keep amplitude domain distinction.'),
'5.12':('WRITTEN / EXACT REBUILD','Finite jet does not prove global germ equivalence.','Rebuilt Euclidean invariant N,M2,R; pedal second/third derivatives prove an ordinary cusp at the double return.','sec:links','cusp_return_square (factorization only)','External principal-curvature pedal identity retained with its actual assumptions.'),
'6.1':('REPAIRED / DEPENDENCY LEAN','P(c)=0 only selects lateral interior singularities.','The completed source has P0, P+, P-, and two Q=0 lower corners.','sec:atlas','actual_source_rank_classification; actual_endpoint_rank','Do not drop t=0 or use angular derivatives at Q=0.'),
'6.2':('REPAIRED / EXTERNAL THEOREM','There are five smooth-extension rank-one germs.','Actual adapted cross-cap determinants: P0=1, lateral=-5 sqrt(sqrt5-2), corner=-epsilon. Physical corner restriction is a quarter-germ.','sec:atlas','Endpoint differentials and full rank set inherited; cross-cap recognition not encoded.','Whitney determinant criterion supplies actual germ equivalence in prose.'),
'7.1':('REPAIRED / ACTUAL INTEGRAL LEAN','Weighted intro and dx domain conflict; formal expression is not adjoint-domain equality.','IBP with endpoint term; formal adjoint parameter 1-sigma only for dx. For x^(2beta-1) dx it is 2beta-sigma.','sec:mellin','mellin_interval_green; mellin_zero_boundary_pairing; formal_coefficient_symmetry','Dense-core to Hilbert adjoint domain remains written.'),
'7.2':('WRITTEN DOMAIN PROOF','Specify H1_0 and H1 after logarithmic unitary.','Half-line -i d/ds has indices (1,0), no SA extension; full-line H1 generator is SA.','sec:mellin','Not formalized.','No closed half-line self-adjoint operator inferred.'),
'7.3':('REPAIRED','For sigma>1/2 the displayed function IS L2 on the half-line.','At sigma=1/2 it is generalized; sigma>1/2 gives L2 but violates the minimal zero trace at x=1.','sec:mellin','Exact differentiation only.','Do not assert non-L2 for every sigma.'),
'7.4':('REPAIRED / ACTUAL INTEGRAL LEAN','Require positive T and frequencies; M=0,1 need no undefined min separation.','Consistent conjugate-first Gram integral, off-diagonal bound, Hermitian spectral enclosure and operator bound.','sec:gram','gram_entry_integral; gram_entry_bound; gram_eigenvalue_enclosure','Hermitian matrix operator-norm translation remains written.'),
'7.6':('STRENGTHENED / WRITTEN PROOF','The threshold is sufficient for conditioning, not necessary for independence.','Distinct finite frequencies are independent for every T>0 by continuity plus Vandermonde derivatives.','sec:gram','Not formalized.','Quantitative positivity with epsilon<1 follows from proved enclosure.'),
'7.8':('WRITTEN PROOF','Define conditioning and log-volume by det G.','Eigenvalue, condition-number, Hadamard upper bound and logdet lower/loss inequalities for epsilon<1.','sec:gram','Eigenvalue enclosure only.','Determinant/product and full norm proof not Lean encoded.'),
'8.1':('WRITTEN / EXTERNAL THEOREM','Full group and half-line realizations differ.','Both logarithmic unitaries and full-line Fourier multiplication operator have explicit domains.','sec:mellin','Not formalized.','Fourier-Plancherel and essential self-adjointness are external standard results.'),
'8.2':('WRITTEN PROOF','At/below boundary evaluation is initially defined on finite Dirichlet polynomials.','Cauchy-Schwarz upper bound and normalized finite evaluation vectors proving unboundedness.','sec:hardy','Not formalized.','Coefficient l2 identification is part of definition.'),
'8.4':('WRITTEN / EXTERNAL THEOREM','Distinct positive integers and prime-exponent vectors.','Product-Haar character orthogonality; direct actual finite-time limit.','sec:hardy','Gram entry bound only.','Infinite product Haar existence and unique factorization retained.'),
'8.6':('WRITTEN / EXTERNAL THEOREM','Topological normalization is a proper finite map on a specified local cross-cap image.','Diagonal constant-sheaf map and quotient j! sign local system with zero pinch stalk.','sec:sheaf','sign_intertwiner_zero only.','Ordinary sheaf category; no mixed-Hodge identification.'),
'8.8':('REPAIRED / ACTUAL NORMAL-FORM LEAN','M(t,1)=-t4/2+O(t6), omitted by old remainder.','Explicit symmetry source/target smooth charts prove genuine fold; full-extension degree zero, not physical boundary index.','sec:field','actual_polar_fold','Local full-extension winding-zero proof remains written.'),
'8.9':('REPAIRED / WRITTEN PROOF','Old Dreg includes degenerate lower corners; source still has corners.','Delete all five rank labels; oriented twice-punctured disk with retained regular boundary corners; H1=Z2.','sec:atlas','Actual rank classification only.','Topology/H1 deformation retraction is not Lean encoded.'),
'8.10':('WRITTEN PROOF','Use the corrected regular source and conforming finite-energy spaces.','Exact sesquilinear pullback for mass and stiffness; no convergence assertion.','sec:capacity','Not formalized.','Integration must be exact.'),
'8.11':('REPAIRED / WRITTEN PROOF','Add both endpoint quarter-germs; closures are form closures, not graph closures.','Explicit area/log-cutoff estimates prove capacity zero at all five; interior-puncture Friedrichs form unchanged.','sec:capacity','Metric algebra only.','No deficiency index conclusion from capacity.'),
'8.12':('STANDARD MODEL PROOF / ACTUAL ESTIMATE OPEN','Model identities and link Wirtinger do not supply the claimed uniform actual parametrix.','Prove standard link length, radial defect, inequality and finite-strip Schur/Poincare; separate transfer estimates.','sec:capacity','Metric determinant only.','Actual weighted derivative bounds in overlap norms; not simply right-left equivalence.'),
'8.13':('REFUTED AS DEFINED / REPLACEMENT CONDITIONAL','Cc interior graph closure does not fix outer Dirichlet data: infinite outer-boundary deficiency spaces.','New boundary-data/resolvent injection proof; replacement A=HF restricted to kernel of a graph-continuous surjective point trace.','sec:green','zero_boundary_core_witness is only a scalar check.','Prove actual point trace and actual parametrix before n=(2,2), Green expansion or U(2) is asserted.'),
'8.14':('CONDITIONAL / FINITE PLANE PROOF','Markov uniqueness is false for the old all-boundaries minimum: outer Robin/Neumann alternatives remain.','No-running-scale isotropic-plane theorem proved; Markov uniqueness restricted to correctly fixed outer boundary and suitable extension hypotheses.','sec:green','Finite-plane proof in prose.','Graph trace + actual Markov extension criterion, not just finite plane algebra.'),
'8.15':('REPAIRED ACTUAL OPERATOR / EXTERNAL THEOREM','The compact-core minimum has infinitely many outer-boundary harmonic modes, not two.','Weighted radial Hardy estimate proves actual compact form embedding and positive Dirichlet gap including corners; actual H0 Krein kernel is infinite-dimensional, reduced positive spectrum discrete.','sec:green','Not formalized.','Two-point Green coordinates require the separately corrected point restriction and actual graph traces.'),
'8.16':('REPAIRED ACTUAL OPERATOR / EXTERNAL THEOREM','Use actual H0 and its actual graph domain; no finite U(2) boundary classification.','Actual density, symmetry, strict positivity and compact Friedrichs resolvent proved; abstract theorem yields the weak buckling equivalence and discrete positive spectrum.','sec:green','Not formalized.','No two-channel zero-energy Robin matrix until actual point traces are established.'),
'8.18':('WRITTEN NO-GO / CONDITIONAL GREEN INTERPRETATION','Sheaf support result holds independently of a claimed actual Green channel.','Ordinary Hom is zero; ray nearby/costalk sign line; model odd-to-even intertwiner is zero.','sec:sheaf','sign_intertwiner_zero only.','Actual scalar point-channel parity still depends on the correctly defined Green theorem.'),
'8.20':('WRITTEN / EXACT CONE MODEL','Conical local endpoint quotient must exclude the regular outer-boundary trace.','Derived -1 flat holonomy; scalar indicial integrability; bounding-spin twist and local endpoint trace on exact cone.','sec:spin','half_integer_pairing only.','Actual Whitney-metric transfer is a separate problem.'),
'8.21':('ACTUAL PARAMETRIX UNPROVED / DOMAIN REPAIR','Outer domain quotient unspecified; cutoff commutators have weight zero under dilation.','Keep exact link spectrum and exact normal inverse identities; replace unsupported promotion by explicit actual graph-norm estimate obligations.','sec:spin','Not formalized.','Construct spaces/cutoffs, patched two-sided bounded inverses, small remainder proof and exclusion of additional actual modes.'),
'8.22':('WRITTEN / EXACT CHECK / PIN DATA REPAIR','Pin+ versus Pin- and metric-compatible reflection must be specified.','Actual kernel norm and four-phase nonsplit Z4 torsor; orthogonal reflection swaps chirality for a chosen Clifford metric.','sec:spin','sign_intertwiner_zero only.','No canonical identification of phase flat line and normalization deck line; no unproved g-isometry.'),
'8.23':('CONDITIONAL TRANSMISSION THEOREM','Pin lift alone does not identify the two phase-line fibers; action variation vanishes on many isotropic domains.','Given unitary Clifford-compatible full-spin U, graph isotropy iff modulus one; Pin restriction gives two signs only after a Pin reduction is chosen.','sec:spin','transmission_unit_modulus_iff; real_transgression_coefficient','Actual trace spaces, line identification, matching map and regular boundary Green theorem hypotheses.'),
'8.25':('WRITTEN NO-GO','Nonempty proper subset is a hypothesis; source lift not constructed.','Transitive left-action invariant subset must be the whole group.','sec:limits','Not formalized.','No physical representation assignment.'),
'8.27':('WRITTEN SCOPE LIMIT','Underlying real topology does not specify algebraic or arithmetic input.','Keep the missing variety/compactification/Frobenius data explicit.','sec:limits','Not formalized.','Not a no-go against independently supplied algebraic models.'),
'8.28':('WRITTEN / EXTERNAL THEOREM','Smooth E and two boundary points, chosen algebraic complexification.','Gysin exact sequence yields weights 1,2, dimensions 2,1 and computed monodromy action.','sec:residual','Not formalized.','Deligne MHS and Gysin theorem remain explicit external dependencies.'),
'8.30':('CONDITIONAL / EXTERNAL THEORY','Weil theory traditionally on smooth projective varieties; open U needs localization extension.','Specified realization with localization and Tate twist gives boundary kernel dimension one.','sec:limits','Not formalized.','No new Weil theory inferred from a curve.'),
'9.1':('WRITTEN DIMENSIONAL CHECK','R>0 and chosen r=c0 R.','Volume/area is a length; normalized ratio is dimensionless only after dividing by R.','sec:limits','Not formalized.','No mass operator or scale selection.'),
'9.3':('WRITTEN / EXACT CHECK','Canonical Kahler/Poisson normalization must be chosen.','Disjoint canonical coordinate pairs Poisson commute for any common conventional scale.','sec:limits','Not formalized.','No induced noncommutative observable algebra.'),
'9.5':('WRITTEN SPECTRAL PROOF','Circle operator domain H1 with specified quasi-periodic endpoint.','Half-integer eigenvalue pairing makes eta zero in its convergent half-plane, hence at zero by continuation.','sec:spin','half_integer_pairing (pairing only)','Analytic continuation and the self-adjoint circle domain are not Lean encoded.'),
}
cases.update({'4.3': ('RESTORATION SCOPE',
         'A loop parameter is not an absolute time clock.',
         'Retain two-traversal sign restoration; no physical spin identification.',
         'sec:field',
         'unit_winding_sign_change',
         'Physical spin requires an independently supplied representation/model.'),
 '5.2': ('DERIVATIVE NORMALIZATION REPAIR',
         'The displayed lateral Jacobian magnitude is not sqrt(5), and its sign must agree with the '
         'chosen orientation.',
         'Keep sqrt(5) only as the monic P derivative; actual Jacobian sign is checked at P+ and P-.',
         'sec:residual',
         'normalized_polynomial_derivative; actual_dipole',
         'No numerical identification with an unrelated caustic intensity.'),
 '5.4': ('WRITTEN SCOPE OBSERVATION',
         'Resolution S=epsilon^-1 is an additional operational definition.',
         'Cost is 3/4 log(S)-log(B)+o(1) in the stated standard model.',
         'sec:residual',
         'No volume Lean theorem.',
         'No Shannon capacity without a channel kernel and constraints.'),
 '5.11': ('WRITTEN SCOPE OBSERVATION',
          'The oscillator and graph vertex have different continuation data.',
          'No spacetime wave equation or graph scattering law follows; action extrema remain '
          'amplitude-domain dependent.',
          'sec:links',
          'Not formalized.',
          'A metric graph would need separately specified vertex matching.'),
 '5.13': ('WRITTEN GEOMETRIC NO-GO',
          'The exceptional cusp is not the real link or the weighted orbit.',
          'Affine ruling plus actual adapted normal-plane invariants force the cusp discriminant and '
          'derivative criterion.',
          'sec:links',
          'cusp_return_square is factorization only.',
          'No global curvature-surface classification or amplitude bridge.'),
 '7.5': ('WRITTEN / ACTUAL INTEGRAL LEAN',
         'Hold the finite frequency set fixed when T grows.',
         'Gram minus identity has Euclidean operator norm O(T^-1).',
         'sec:gram',
         'gram_entry_bound; gram_eigenvalue_enclosure',
         'No uniform growing-set estimate asserted.'),
 '7.7': ('WRITTEN BOHR SCOPE',
         'Finite integer relations must be retained.',
         'Prime-exponent product characters realize the fixed-set limiting Gram matrix.',
         'sec:hardy',
         'Gram integral bound only.',
         'Haar/product-group construction not Lean encoded.'),
 '8.3': ('WRITTEN SCOPE OBSERVATION',
         'Half-density and Hardy evaluation concern different operators/spaces.',
         'Both thresholds are proved separately; their coincidence gives no Deligne weight or physical '
         'critical line.',
         'sec:hardy',
         'formal_coefficient_symmetry only.',
         'No arithmetic or physical identification.'),
 '8.5': ('WRITTEN ARITHMETIC SCOPE',
         'The example 2,4 has exponent-lattice rank one.',
         'Retain relations in the product torus and coefficient Hilbert space.',
         'sec:hardy',
         'Not formalized.',
         'No freely declared rank-M lattice or Weil theory.'),
 '8.7': ('WRITTEN STRUCTURE-SHEAF NO-GO',
         'Underlying topology does not specify stalk rings.',
         'One point supports Q and dual numbers; the chosen A3 affine curve has its separately supplied '
         'coordinate ring.',
         'sec:sheaf',
         'Not formalized.',
         'No condensed smoothness criterion or tangent module inferred.'),
 '8.17': ('REPAIRED OPERATOR SCOPE',
          'A fixed principal symbol does not uniquely fix an arbitrary action or lower-order terms.',
          'The specified Laplace-Beltrami expression fixes its kinetic generator; puncture form '
          'removability is proved, but the old minimum has infinite boundary deficiency.',
          'sec:green',
          'zero_boundary_core_witness is only a scalar check.',
          'Actual corrected point traces remain required; compactness and positivity are proved in '
          'v13.'),
 '8.19': ('WRITTEN BRIDGE OPTIONS',
          'An odd Green or spinor channel is extra analytic structure.',
          'Support and parity obstructions do not rule out a separately defined twisted operator; no '
          'such construction is implicit here.',
          'sec:sheaf',
          'sign_intertwiner_zero only.',
          'A new operator/domain or transverse trivialization must be independently constructed.'),
 '8.24': ('REPAIRED PHASE/PIN SCOPE',
          'Pin spin maps do not identify separate flat phase-line fibers.',
          'Four-phase torsor is local first-order data; conditional regular-cut isotropy requires a '
          'Clifford-compatible U and chosen phase-line map.',
          'sec:spin',
          'transmission_unit_modulus_iff; real_transgression_coefficient',
          'Global singular-cut domains and full transmission data are open.'),
 '8.26': ('AMBIENT REPRESENTATION OBSERVATION',
          'The constrained source lift and inherited action are unspecified.',
          'Ambient Hopf/Borel-Weil resemblance supplies no source representation or mass scale; '
          'retained as a possible guide only.',
          'sec:limits',
          'Not formalized.',
          'No Borel-Weil theorem applied to an unconstructed constrained source.'),
 '8.29': ('WRITTEN COHOMOLOGY SCOPE',
          'Monodromy does not specify specialization/variation maps.',
          'The chosen rank-three A3 local system and rank-one normalization defect remain distinct.',
          'sec:sheaf',
          'Not formalized.',
          'A full nearby/vanishing-cycle package requires separately defined maps.'),
 '9.2': ('WRITTEN PHYSICAL SCOPE',
         'The normalized pure number supplies neither states nor units.',
         'Numerical hierarchy has no mass prediction without a mass operator, state rule and scale.',
         'sec:limits',
         'Not formalized.',
         'No new physical result.'),
 '9.4': ('SEPARATE OBSERVABLE PROGRAM',
         'Full SU(2) moment map differs from the commuting two powers.',
         'The canonical powers commute; a noncommutative observable algebra needs separate selection '
         'and action.',
         'sec:limits',
         'Not formalized.',
         'No deformation-quantization construction in this revision.'),
 '9.6': ('WRITTEN SPECTRAL SCOPE',
         'An elementary sign cover alone does not produce chirality.',
         'The specified half-integer circle spectrum is exactly paired and eta is zero.',
         'sec:spin',
         'half_integer_pairing only.',
         'Nonzero eta needs additional asymmetric operator or boundary data.')})
domains={
 '3.1':'Explicit S on the completed physical rectangle; no unspecified momentum lift.',
 '3.2':'Real sigma; conjugate-first L2(dx), compact core inside (1,infinity).',
 '3.3':'Standard residual and source Lebesgue volume; smooth positive density if changed.',
 '4.1':'F=N+iM on open angular chart; small positively oriented circles inside physical interior.',
 '4.2':'Continuous nonzero closed path; exponential lift; actual winding plus or minus one.',
 '4.4':'Actual planar observation field and source (t,u) orientation.',
 '5.1':'Monic P(c)=c^2-3c+1, c0=(3-sqrt5)/2.',
 '5.3':'Standard fold/cross-cap residuals on R2; epsilon positive; local positive source densities.',
 '5.5':'Finite binary stochastic kernels with identical label spaces; no kernel fixed by residual.',
 '5.6':'Holomorphic cross-cap residual near complex origin; chosen sqrt(1+y^2) branch.',
 '5.7':'Chosen isolated weighted-homogeneous A3 singularity and smooth affine fiber U over C.',
 '5.8':'Standard cross-cap source link K=r^2, every r>0; source plane lift into R4.',
 '5.9':'Positive amplitudes a,b with a^2+b^4=1; phase circle in ambient C2.',
 '5.10':'b^2 in (0,1), with minimizer only in degenerate closure; specified quadratic phase action.',
 '5.12':'Actual lateral Euclidean cross-caps, adapted first/second derivatives; exceptional pedal trace.',
 '6.1':'Completed source -pi/2<=t<=pi/2, 0<=u<=1; smooth r endpoint extension.',
 '6.2':'Actual full smooth extensions; original physical half- or quarter-restrictions retained.',
 '7.1':'Complex C1 functions on a positive compact interval; real sigma,beta and chosen measure.',
 '7.2':'Logarithmic unitary on L2 half-line; minimal H1_0 and maximal H1 derivative domains.',
 '7.3':'x^(-sigma-i omega) on [1,infinity), real parameters; trace one at x=1.',
 '7.4':'Finite distinct real frequencies, T>0; delta>0 for at least two frequencies.',
 '7.6':'Finite distinct real frequencies, every T>0; normalized conjugate-first Gram matrix.',
 '7.8':'Positive Gram matrix, epsilon<1; Euclidean condition number and logdet.',
 '8.1':'Full multiplicative group (0,infinity) with Haar/Lebesgue unitaries; full-line H1.',
 '8.2':'Coefficient l2 Dirichlet space; evaluation initially on finite polynomials.',
 '8.4':'Distinct positive integers and prime-exponent characters; normalized product Haar.',
 '8.6':'Proper local standard cross-cap normalization; ordinary sheaves; locally closed double ray.',
 '8.8':'Actual observation map extended to a full smooth neighborhood of (0,1).',
 '8.9':'Completed source minus all five rank labels; regular boundary corners retained.',
 '8.10':'Nested conforming finite-energy trial spaces with exact sesquilinear integration.',
 '8.11':'Actual induced metric on full/half/quarter germs; fixed outer Dirichlet form closure.',
 '8.12':'Standard front/seam metric; finite strips; separate actual weighted radial form estimate.',
 '8.13':'H0=graph closure of Cc interior Laplacian; fixed-Dirichlet HF; conditional graph-bounded surjective tau.',
 '8.14':'Old H0 with unfixed outer traces; finite complex Lagrangian planes for scale theorem.',
 '8.15':'Actual closed densely defined positive H0; compact Friedrichs HF; no two-channel assumption.',
 '8.16':'Actual Dom H0 with its graph norm; nonzero reduced Krein/buckling spectrum.',
 '8.18':'Ordinary Hom to point support and derived local ray groups; parity action in characteristic zero.',
 '8.20':'Exact round cone, supplied bounding spin structure and sign twist; local tip quotient only.',
 '8.21':'Specified link circle and formal normal inverses; actual Whitney graph spaces not yet constructed.',
 '8.22':'Actual first-order F at lateral labels; chosen positive Clifford metric and Pin convention.',
 '8.23':'Regular paired cut trace spaces, supplied unitary U including phase map, Clifford conormal compatibility.',
 '8.25':'Nonempty proper subset of SU2 under transitive left action; a source lift is extra input.',
 '8.27':'Real topology alone, compared with a separately specified smooth algebraic pair.',
 '8.28':'Explicit E minus two points over C, with Deligne MHS and fixed algebraic monodromy.',
 '8.30':'An already supplied realization theory extended to open varieties with localization and Tate twist.',
 '9.1':'Positive R with chosen r=c0 R; normalized ratio only after division by R.',
 '9.3':'C2 with canonical Kahler/Poisson form and powers in disjoint canonical pairs.',
 '9.5':'Self-adjoint circle derivative, H1 anti-periodic boundary condition; eta series Re(s)>1.'}
external={
 '6.2':['Smooth Whitney cross-cap recognition, primary 1409.0281 Corollary 4.5 proof.'],
 '5.6':['Holomorphic inverse-function theorem; Jacobian algebra of chosen isolated germ.'],
 '5.7':['Milnor weighted-homogeneous fiber comparison; Riemann-Hurwitz; smooth-curve cohomology.'],
 '5.12':['Euclidean Whitney normal form and exceptional pedal trace, primary 2607.21796v1 Prop.2.1 Eq.(2.8).'],
 '7.2':['Sobolev closure/trace and full-line Fourier-Plancherel; deficiency ODE solved in manuscript.'],
 '8.1':['Full-line Fourier-Plancherel; unbounded multiplication operator domain.'],
 '8.4':['Product normalized Haar existence and unique integer factorization.'],
 '8.6':['Ordinary sheaf extension by zero and stalk adjunction, Stacks 009Z.'],
 '8.11':['Actual smooth Whitney equivalence; energy/area comparison and cutoffs proved in manuscript.'],
 '8.12':['Regular-domain Rellich/trace only; singular weighted Hardy estimate independently proved.'],
 '8.13':['Closed form representation and self-adjoint resolvent; von Neumann classification only after tau hypotheses.'],
 '8.14':['Closed Dirichlet-form/submarkovian representation, with actual Dirichlet/Neumann forms distinguished.'],
 '8.15':['Abstract positive Krein/buckling theorem 0907.1439 Hyp.2.2 Thms.2.4,3.4; actual hypotheses proved.'],
 '8.16':['Same abstract buckling equivalence with actual graph domain.'],
 '8.18':['Ordinary sheaf stalk/support and derived ray recollement; no Green-channel existence inferred.'],
 '8.20':['Bounding-spin circle model and local endpoint Sobolev trace; no cone-to-Whitney transfer.'],
 '8.21':['Cone papers are background only; their Whitney hypotheses are not asserted.'],
 '8.22':['Chosen Clifford/Pin double-cover and chirality anticommutation; no induced-metric symmetry assumed.'],
 '8.23':['Regular-boundary Dirac Green formula only under specified traces/U; Pin convention supplied.'],
 '8.28':['Deligne Hodge II 3.2.5 and logarithmic residue/Gysin of explicit smooth pair.'],
 '8.30':['Localization and Tate twist are assumptions of the separately supplied realization theory.'],
 '9.5':['Standard eta continuation; convergent model series is directly paired to zero.']}

rows=[]
for k,m in enumerate(ms):
    start=m.start(); end=ms[k+1].start() if k+1<len(ms) else s.index('10     Conclusion')
    # Last formal/remark boundary is before Conclusion. Remove accidental reversed end.
    if end<start: end=len(s)
    text=s[start:end].strip()
    orig=text.split('Proof.',1)[0]
    # Bound to the statement before the next numbered section/figure if there is no proof.
    orig=re.split(r'\n(?:Figure \d+:|\d+(?:\.\d+)?\s{2,}[A-Z])',orig)[0].strip()
    orig=re.sub(r'\n\s*\d+\s+Academic Submission Draft\. August 2026\.\s*\f?','\n',orig)
    page=s[:m.end()].count('\f')+1
    result=cases[m[2]]
    rows.append(dict(id=m[2],kind=m[1],physical_page=page,printed_page=page,original_statement=orig,
                     status=result[0],issue=result[1],corrected_statement=result[2],written_proof='revision/Bicomplex_Signal_Manifolds_v13_working.tex#'+result[3],
                     domain_and_hypotheses=domains.get(m[2],result[1]+' '+result[5]),
                     external_theorems=external.get(m[2],['Written proof or scoped observation; imported Mathlib dependencies listed in COVERAGE.md.']),
                     exact_replay=('Actual derivative/jet/metric/scalar formulas only: verification/verify_revision.py and unchanged historical scripts. No analytic/category claim inferred.' if m[2] in {'4.1','4.4','5.1','5.3','5.6','5.7','5.9','5.10','5.12','6.1','6.2','7.1','7.3','7.4','7.8','8.8','8.10','8.11','8.12','8.13','8.20','8.21','8.22','8.23','8.28','9.1','9.3','9.5'} else 'No finite computation substitutes for this proof/category/domain statement.'),
                     lean=result[4],remaining_obligation=result[5]))
ids=[x['id'] for x in rows]
assert len(ids)==len(set(ids))
assert set(cases)==set(ids),(set(cases)-set(ids),set(ids)-set(cases))
continuation_source='revision/Bicomplex_Realization_Point_Trace_v0_02_working.tex#'
continuation=[
 dict(original_claims=['3.1','8.25'],status='Explicit supplied realization proved; historical power-only implication remains unsupported',
      result='A continuous unit-power bicomplex lift and fixed phase-sensitive quadratic readout satisfy P Phi=S. Power-coordinate C1 boundary lifts and three fixed Hermitian pure-state observables are ruled out.',
      written_proofs=[continuation_source+x for x in ['thm:realization','prop:powerboundary','prop:hermitian']],
      evidence='Written proofs; exact continuation replay; scoped quadrature/Bloch Lean identities. No historical recovery or canonical quantum-measurement claim.'),
 dict(original_claims=['8.11','8.12','8.13'],status='Actual graph-continuous two-point traces proved',
      result='An explicit singular homeomorphism resolves the actual Whitney scalar metric to bounded uniformly elliptic coefficients. External scalar Holder regularity gives graph-bounded, surjective tau with dense kernel.',
      written_proofs=[continuation_source+x for x in ['lem:metric','cor:actualmetric','thm:trace']],
      evidence='Written metric/form argument plus external De Giorgi-Nash theorem; exact/Lean standard metric bounds. Explicit logarithmic coefficients remain open.'),
 dict(original_claims=['8.13','8.15','8.16'],status='Corrected point restriction has actual (2,2)/U(2) and exhaustive resolvent domains',
      result='A=HF restricted to ker tau has an actual boundary triple, rank-two resolvent formula, compact self-adjoint-extension resolvents and a two-dimensional Krein kernel. Old H0 still has infinite deficiency and kernel.',
      written_proofs=[continuation_source+x for x in ['cor:indices','thm:triple','cor:resolvent','cor:krein']],
      evidence='Written Hilbert-space proofs, fixed-Dirichlet hypotheses and external positive-operator Krein theorem. Not Lean formalized; no asserted log/parity normalization.'),
 dict(original_claims=['8.20','8.21','8.23'],status='Actual curvature input proved; singular Dirac/Pin domains remain open',
      result='Actual cross-cap curvature is locally Lp for 1<=p<3/2 with integral O(epsilon). This does not establish conformal/gauge estimates or singular-cut transmission.',
      written_proofs=[continuation_source+'prop:curvature'],
      evidence='Written actual-germ bound and independent exact standard curvature formula. Cone calculations retain model scope.')]
green_source='revision/Whitney_Green_Domains_v0_03_working.tex#'
green_continuation=[
 dict(original_claims=['8.12','8.13'],status='Actual logarithmic Green coefficients proved for the corrected fixed-Dirichlet restriction',
      result='An actual Euclidean Whitney arclength coordinate gives a-I=O(rho^(1/2)) and extrinsic radius ratio 1+O(rho^(1/2)). A planar logarithmic parametrix has L3 divergence/L2 scalar remainders; external scalar Holder regularity and a graph-domain testing argument identify the canonical resolvent Green vectors.',
      written_proofs=[green_source+x for x in ['lem:arclength','thm:log','thm:boundary']],
      evidence='Written proof plus external Simon Lecture 18 Theorems 2-3. Exact matrix identities only; no PDE Lean proof or full historical front/seam parametrix certification.'),
 dict(original_claims=['8.13','8.14','8.15'],status='Actual geometric boundary pairing, Markov uniqueness and reference-length uniqueness proved for A',
      result='All Dom A* vectors have unique ell log(rho_e)+b+Holder remainder, with actual 2pi Green pairing. HF is the unique submarkovian extension of A and the only common-reference-length invariant self-adjoint plane. Actual source reflection gives equal diagonal entries of the real Green regular-part matrix.',
      written_proofs=[green_source+x for x in ['thm:boundary','cor:reflection','cor:markov','cor:scale']],
      evidence='Written actual coefficient/domain proofs and classical operator theory. Old compact-core H0 remains infinite-deficiency and has multiple submarkovian extensions; no physical dilation law.'),
 dict(original_claims=['8.18','8.19'],status='Actual scalar limiting sheet parity proved; a new sheaf-to-operator bridge is not supplied',
      result='Paired source points with identical image have equal extrinsic radii. Logarithmic terms cancel and their function-value difference is a Holder remainder, so limiting scalar coefficients are sheet-even.',
      written_proofs=[green_source+'cor:parity'],
      evidence='Written asymptotic parity, not full Green-function deck invariance or a canonical derived-category/fiber identification.'),
 dict(original_claims=['3.1','8.20','8.21','8.22','8.23','8.24','8.30'],status='Originality and remaining model/Dirac/Pin/realization gaps audited',
      result='The new realization powers (1-u,u) differ from ancestral (cos(t),1-cos(t)). The historical moment-map implication is not recovered. Actual singular Dirac graph domains and phase/Pin fiber transmission remain open. Boundary triples/Green/Markov frameworks are prior theory; model-specific candidate contributions have no established priority.',
      written_proofs=[green_source+'sec:comparison'],
      evidence='Primary-reference and full historical comparison: proofs/ORIGINALITY_AND_GAPS.md. No whole-paper Lean or first-ever claim.')]
moment_source='revision/Moment_Readouts_Exceptional_Pullbacks_v0_04_working.tex#'
moment_continuation=[
 dict(original_claims=['3.1'],status='Ancestral moment derivation decided: no analytic readout; smooth and half-source realizations constructed',
      result='Under |z1|^2=cos(t), every state at t=+-pi/2 lies on the circle z1=0, whose image must contain two non-collinear edge segments. Hence no readout real-analytic along that circle (affine, polynomial, bicomplex-polynomial) realizes S on the closed or open-in-t source, and phase-invariant or mixed-state readouts fail outright. An explicit continuous state family with an explicit C-infinity readout does realize S; each half source admits a real-analytic but no affine readout.',
      written_proofs=[moment_source+x for x in ['prop:gauge','lem:analytic','thm:rigidity','cor:excluded','thm:smooth','prop:half','rem:data']],
      evidence='Written proofs; exact identities and a 64881-label finite replay of the smooth readout in verification/verify_continuation_0_04.py. A new negative theorem plus a non-canonical construction, not a recovery of the historical derivation; no Lean.'),
 dict(original_claims=['8.6','8.7'],status='Exceptional-pullback identity decided negatively; fold detected by the smoothness comparison map',
      result='For every continuous map from a convex parameter domain to the plane, Psi^!Z is the extension by zero of the constant sheaf on the interior. The registered v7 draft shift Z[-1] on the fold locus therefore holds nowhere, and i^! gives [-1] on every embedded arc. At ordinary folds the comparison map required for cohomological smoothness has cokernel i_*Z_L. A constant sheaf on a connected space has endomorphism ring Z; the square-root cover of F gives an indecomposable rank-two carrier splitting only after inverting 2.',
      written_proofs=[moment_source+x for x in ['thm:shriek','cor:shift','prop:detect','prop:carrier']],
      evidence='Written proofs from cited Verdier-duality statements (Krause-Nikolaus-Putzstuck Prop. 4.6.9, Rem. 4.6.19; Scholze Def. 5.1) and the published Stokes v5 Theorem 2.4 fold classification. Winding/idempotent finite replay only; no Lean.')]
continuation+=green_continuation+moment_continuation
obj=dict(source_sha256='4ebb8f0a7d6e88a6c5cd97f65d224b4e938867cabad54f057d3ceafb24167d5a',date='2026-10-02',page_convention='physical=printed; page 1 is title/abstract',claims=rows,continuation=continuation,
         originality_audit='proofs/ORIGINALITY_AND_GAPS.md',
         additional_prose_claims=['Abstract and conclusion: repeated results inherit each repaired status, especially Green/Dirac withdrawals.','Section 2.2: the stated two-variable fold form applies to plane-to-plane germs, not arbitrary Rn-to-Rm maps.','Section 3.1 and Definition 3.1: a momentum constraint alone does not define S, its lift or a projection.','Figure/Table claims are illustrative repetitions; original Table 1 proof labels are replaced by these audited statuses.'])
(w/'claims/CLAIM_MAP.json').write_text(json.dumps(obj,ensure_ascii=False,indent=2)+'\n')
lines=['# Full v12 claim map: current audit','',f"2026-10-01. {len(rows)} named definitions, results and remarks. Original statements are retained in `CLAIM_MAP.json`, pinned to the immutable 43-page PDF. Physical pages equal printed pages. No claim is accepted from the historical Table 1 status alone.",'','The companion is partial. Written/external results and open actual operator obligations are explicitly separate. Sections 8.13--8.16 and 8.21--8.23 require material repairs; there is no full-paper acceptance or publication authorization.','','| Original | Page | Audited status | Correction / actual domain | Proof / Lean | Remaining obligation |','| --- | ---: | --- | --- | --- | --- |']
for x in rows:
    cells=[f"{x['kind']} {x['id']}",str(x['physical_page']),x['status'],x['issue']+' '+x['corrected_statement'],x['written_proof']+'; '+x['lean'],x['remaining_obligation']]
    lines.append('| '+' | '.join(v.replace('|','\\|').replace('\n',' ') for v in cells)+' |')
lines+=['','Additional abstract/conclusion, model-definition, fold-dimension and figure/table assertions are listed in the JSON inventory. Exact replay establishes only the displayed computations, never an unbounded operator domain, sheaf category or cohomological realization.']
lines[0]='# Full v12 claim map: v13 inventory and active continuation'
lines.insert(4, 'The table retains accepted v13 proof routes and checkpoint obligations. The continuation overlay below supersedes corresponding open obligations without altering historical statements or the frozen checkpoint. Current Lean coverage is partial; publication requires author approval.')
lines+=['','## Preserved continuation 0.02 results','', 'These entries retain the 0.02 scope. The 0.03 overlay below now closes actual scalar logarithmic normalization and limiting parity for A; singular Dirac transmission remains open.','']
for result in continuation[:-len(green_continuation)-len(moment_continuation)]:
    lines += ['- **'+', '.join(result['original_claims'])+': '+result['status']+'.** '+result['result']+' '+result['evidence'],
              '  Proof routes: '+', '.join('`'+route+'`' for route in result['written_proofs'])+'.']
lines+=['','## Preserved continuation 0.03: actual scalar Green domains','',
        '2026-10-02. Originality, ancestral/v12 comparison and current known gaps: `proofs/ORIGINALITY_AND_GAPS.md`. The 66-row table above retains v13 checkpoint routes; these overlays supersede its applicable open labels. Original source statements are unchanged.','']
for result in green_continuation:
    lines += ['- **'+', '.join(result['original_claims'])+': '+result['status']+'.** '+result['result']+' '+result['evidence'],
              '  Proof routes: '+', '.join('`'+route+'`' for route in result['written_proofs'])+'.']
lines+=['','## Active continuation 0.04: moment readouts and exceptional pullbacks','',
        '2026-10-02. New negative theorems and non-canonical constructions for the historical moment assignment and the registered v7 draft categorical/window claims. They do not recover a historical derivation. The v7 39-block index is `claims/V7_DRAFT_INDEX.md`.','']
for result in moment_continuation:
    lines += ['- **'+', '.join(result['original_claims'])+': '+result['status']+'.** '+result['result']+' '+result['evidence'],
              '  Proof routes: '+', '.join('`'+route+'`' for route in result['written_proofs'])+'.']
(w/'claims/CLAIM_MAP.md').write_text('\n'.join(lines)+'\n')
print(f'Wrote {len(rows)} uniquely page-pinned named blocks; {sum(x["kind"]!="Remark" for x in rows)} non-remark blocks.')
