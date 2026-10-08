# Bicomplex: originality, historical differences, and current gaps

> **Status (2026-10-03):** This audit is dated 2026-10-02; both successor papers became public that day. Priority/originality assessments still use candidate-contribution wording. The “currently missing mathematical obligations” table supplies the current open list (first row decided by 0.04, others open); entry: [`../README.md`](../README.md), “Start here.”

2026-10-02. Comparison: ancestor, authoritative final v12, v13 working, continuation 0.02, and this round's new 0.03. This is a local mathematical/source audit, not a certificate of first discovery, peer review, or public release.

The current version is more complete than the ancestor and more reliable than v12, but does not prove every original v12 claim. Recoverable scalar Green conclusions are proved for an explicitly fixed-outer-boundary operator; conclusions refuted for the original definition cannot be retained. Originality belongs to concrete models and verification of actual Whitney-metric hypotheses, not the bicomplex name, standard frameworks, or Lean theorem counts.

## 2026-10-02 paper-two literature comparison update

- **Grieser 2002 full text obtained and read** (author's public scan), resolving earlier retrieval limits. §1 is exactly 0.02's singular-coordinate method, giving only quasi-isometry; 0.03's arclength asymptotics (a−I=O(ρ^{1/2}) and extrinsic-radius normalization) are absent, retaining “candidate contribution.”
- **Closest analogous theorem: Colin de Verdière's 1982 pseudo-Laplacian.** Each smooth-surface point has deficiency 1 and log-plus-constant expansion. Hillairet–Kokotov cone theory gives only a logarithmic channel at angle ≤2π; cross-caps fall in the 2π case.
- Suggested positioning: extend Colin de Verdière's picture to Whitney cross-caps of immersed surfaces. General compact immersed cross-cap surfaces are also possible, but require new global compactness verification. See `successor/PAPER2_LITERATURE.md`.

## 2026-10-02 continuation 0.04 update: ancestor moment assignment and v7 categorical/window bridges

New 7-page note `revision/Moment_Readouts_Exceptional_Pullbacks_v0_04_working.tex` treats two groups: the moment assignment shared by ancestor,v7,v12 (Definition 3.1 at v7 p.2,v12 p.4); and author-supplied v7 draft claims (registered nonauthoritative historical draft, `claims/V7_DRAFT_INDEX.md`): Proposition 8.3,Remarks 8.4/8.16,Definition 8.9 through Corollary 8.11,Proposition 8.13/Remark 8.14. All are new theorems,counterexamples,or noncanonical constructions, **not** recovered historical derivations.

| Question | 0.04 result | Evidence type |
| --- | --- | --- |
| Can ancestor \|z₁\|²=cos t realize S by “projection”? | All states at t=±π/2 lie on circle C₀={z₁=0}; images of the two edges form a noncollinear V. No readout real-analytic along C₀ works, including affine projections, real polynomials, or polynomials in bicomplex variables/conjugates; holds on closed source D and t-open D∘ (with continuity). Phase-invariant and mixed-state readouts fail without regularity assumptions | Written proof + exact/finite replay |
| Obstruction or merely missing data? | Sharp: explicit continuous state family (smooth in completed edge charts) and explicit C^∞ readout realize S (64881-label replay error 1.4e−14); half-source D₊ admits real-analytic readout but still no affine readout | Written proof (C^∞ construction, analytic tubular retraction) |
| Why 0.02 powers (1−u,u) work | Edge criterion: image where a component vanishes must lie in an analytic loop; 0.02's vanishing edges map to circular arcs, whereas ancestor edges form a V | Written remark |
| v7 8.3's i*Ψ^!Z≅Z[−1] | **False**. For every continuous Ψ on a convex domain, Ψ^!Z≅j_!Z_int, with shift 0 at fold points; draft [−1] is i^! for any embedded arc (codimension), unrelated to folds. Q=0 means Ψ=(N,M) is defined only on D∘ | Written proof; KNP Prop. 4.6.9/Rem. 4.6.19,Scholze Def. 5.1 |
| Where a fold is actually detected | At an ordinary fold, comparison map in Scholze Def. 5.1 condition (1) fails, with cokernel i_*Z_L; condition (2), invertibility of f^!Z, still holds. Fold classification cites published Stokes v5 Theorem 2.4 | Written proof |
| v7 8.9–8.11 rank-two ±1 decomposition | On connected spaces End(Z_X)=Z, hence τ=±id for constant sheaf. Correct carrier: π_*Z of √F double cover, nonsplit over Z; only over Z[½] splits as Z⊕𝓛 (𝓛 has monodromy −1 about P±). Fold involution has a fixed curve, deck involution no fixed points; neither implies the other | Written proof; winding/idempotent replay |
| v7 8.13/8.14 log/linear gap | Both bounds are 2/(\|δ\|·window mass), for arbitrary real frequencies; ratio T/log T is just a mass ratio, independent of integers. On the same [1,T], characters x^{−iδ} do not decorrelate under Lebesgue measure (modulus →(1+δ²)^{−1/2}), reversing the order. ℕ is not a subgroup; generated ℚ_{>0} is dense | Exact integrals + finite replay |

Originality: analytic rigidity/edge criterion, explicit C^∞ and half-source constructions, and judgment of the draft f^! formula are new results for this model. Verdier duality,six-functor smoothness definition,discrete zeros of analytic functions,and Weierstrass are standard. No literature search for identical general lemmas, hence no first-discovery claim. 0.04 adds no Lean theorem.

## Sources and comparison baseline

| Source | Acceptable role | Checked this round |
| --- | --- | --- |
| `source_ancestor/signal_manifolds_v2.tex` | Early ancestor: 1,908 lines,26-page reconstruction; not final source | SHA-256 `4c0a5b5a8287ab5559c892b2ee21c170984e5f9649481018f851095118a1f016`; §3 power/moment assignment checked against original |
| `../source-registry/final_pdfs/Geometric_Realization_of_Bicomplex_Signal_Manifolds_v12.pdf` | Mathematical-claim authority: 43 pages,66 named blocks | SHA-256 `4ebb8f0a7d6e88a6c5cd97f65d224b4e938867cabad54f057d3ceafb24167d5a`; physical = printed pages |
| v13 working / companion 0.01 | Corrected main text and partial Lean;17+3 pages | Original 155-payload-file manifest and source/PDF bindings unchanged |
| continuation 0.02 | New realization,actual scalar point traces,resolvent domains of specified A;7 pages | Original 167-payload-file manifest,source/PDF and Lean-input bindings checked; baseline/revision/continuation exact replay PASS this round |
| `revision/Whitney_Green_Domains_v0_03_working.tex` | New actual scalar Green asymptotics,geometric boundary coefficients,and uniqueness;6 pages | Written external scalar Hölder theorem; exact replay checks algebra only; native/pagewise QA/isolated replay recorded separately in 0.03 receipt |

ResearchGate metadata page and PDF abstract are different versions. Public web readback this round found the metadata abstract still claims “exactly two immersion singularities,” power-derived surface,and condensed/Weil bridges; page lists v11,v12, while full v12 withdrew some condensed/Weil language and added later Green/Dirac claims. This tool result is search-index/web extraction, **not a fresh downloaded PDF byte hash or signed-in readback**. Mathematical audit uses local hash-locked v12. Public-metadata synchronization is a separate external action requiring author confirmation.

Source: [ResearchGate metadata page](https://www.researchgate.net/publication/408878000_Geometric_Realization_of_Bicomplex_Signal_Manifolds_Spectral_Stability_Whitney_Folds_and_Monodromy_of_the_Observation_Field). Individual original statements,pages,proof routes,Lean,and obligations in `claims/CLAIM_MAP.json`; 66 historical blocks unchanged, with continuation overlays showing latest evidence.

## Originality assessment

| Content | Assessment | Permissible contribution wording and limitations |
| --- | --- | --- |
| BC idempotent coordinates,unit-power sphere,Bloch sphere | Known structures | BC ≅ C⊕C; proofs use no special multiplication irreplaceable by two complex components. No new bicomplex geometric law claimed |
| Whitney recognition,singular quasi-Euclidean coordinates | Major prior literature | Grieser 2002 analyzed Whitney normalization metric. 0.02's explicit constants are independently derived, not proof of method priority |
| Point restriction,boundary triple,Weyl/Krein resolvent,U(2) | Existing general theorems | Posilicano 2003/2004 graph-bounded surjective τ with dense kernel directly covers this construction. Say “verify actual-model hypotheses and apply,” not “found U(2) extension theory” |
| Planar Green existence,log bounds,reciprocity;Markov uniqueness | Existing fields | Taylor–Kim–Brown 2012 Theorem 4.1 covers planar divergence-system Green/log bounds/reciprocity; Robinson–Sikora 2009/2011 degenerate elliptic Markov uniqueness. New work here proves applicability and coefficients for actual Whitney metric and specified A |
| Mellin half-density,Hardy evaluation,Haar orthogonality,finite exponential independence,A3 Milnor/MHS,Dirichlet form/Krein buckling | Standard theory or explicit-model computation | Tools,teaching derivations,and model comparison,not individually a new unified theory. Corrected T>0 independence strengthens the old sufficient threshold, but finite distinct-exponential independence is classical |
| Actual S five-point atlas,dipole/winding,cusp,etc. | Concrete-model results,partly reusing author's prior work | Ruled/Stokes already treat the same S/field/charts; mark reuse and new obligations, rather than recounting the same result as an independent bicomplex discovery. Public-version priority dates not adjudicated here |
| 0.02 explicit Φ,fixed P,endpoint obstruction,three-Hermitian-observable no-go | Concrete construction and model limitations;candidate contributions | Proved in text. Systematic literature search has not excluded identical constructions/no-go results. State new model's additional phase coupling |
| 0.03 actual Euclidean Whitney germ a−I=O(ρ¹ᐟ²),extrinsic-radius log coefficient,full A* asymptotics and consequences | Candidate analytic contributions | Written proofs exist; general Green/extension frameworks not new. No first-ever claim; Grieser full text not yet obtained, so stronger estimates there are not claimed excluded |

Directly checked primary sources:

- [Grieser,publisher record](https://www.math.uh.edu/~hjm/Vol28-4.html):741–752; indexed primary PDF §1 explicitly resolves Whitney metric. Publisher PDF 403,Citeseer direct retrieval 404; full-text comparison incomplete.
- [Posilicano,primary full text](https://arxiv.org/html/math/0309077):§3 τ hypotheses,Theorem 3.1,Corollary 3.2;§2 Theorem 2.2. Notation/resolvent-sign conventions require conversion;0.02 independently proved its convention.
- [Taylor–Kim–Brown,primary full text](https://arxiv.org/html/1205.1089):Theorem 4.1 gives existence,log bounds,off-pole Hölder regularity,and reciprocity for bounded Lipschitz planar domains,bounded ellipticity/coercivity,mixed boundary. Not directly this extrinsic-radius coefficient or entire degenerate global source; needed local results independently proved this round.
- [Simon,author lecture notes](https://math.stanford.edu/~lms/lecs-on-pde.pdf):2015-03-05,Lecture 18 Theorems 2–3,printed pp.212–216;n=2,F₀∈L³,f₀∈L²⊂L³ᐟ². PDF SHA-256 `e1f1b2f51d2558aa467a8c064fe82e7b9e157ad28c9c75f01e38596cde656870`. Theorem/proof passages checked; scalar regularity not transferred into a Dirac-system theorem.
- [Robinson–Sikora,primary abstract](https://arxiv.org/abs/0912.4536),[publisher metadata](https://journals.sns.it/index.php/annaliscienze/article/view/245):compact core on open Ω,W¹,∞ coefficients,boundary-capacity criterion. Abstract/metadata suffices to identify prior research, **not a claim of reading full text this round or directly applying its theorem to A**.

Searches this round covered Whitney umbrella/cross-cap + Green/Laplacian/point interactions,singular metrics,two-dimensional divergence Green functions,and point restrictions/boundary triples/Markov uniqueness. Failure to find exactly identical results does not prove absence. Current originality positioning is “candidate contributions of model and actual estimates”; first-publication priority remains unestablished.

## What was recovered relative to ancestor and v12

| Historical claim/gap | Actual new-version result | Remaining difference |
| --- | --- | --- |
| Power constraint + μ=(|z₁|²,|z₂|²)=(cos t,1−cos t) derives S | 0.02 gives Φ,fixed phase-sensitive quadratic P,and PΦ=S | New powers (1−u,u) differ from ancestor moment assignment. Compatible ancestor lift/readout and reason for coupling still missing; historical derivation not recovered |
| Singularity determined only by c²−3c+1,two lateral points (or one further boundary point) | v13 completed atlas lists all five;exactly two interior dipoles;actual-germ assumptions checked | Global rank loss and observation zeros differ. “Exactly two immersion singularities” corrected |
| Mellin formal-adjoint wording and introduction weighted measure easily conflated;**v12 7.2/7.3 already correctly stated** half-line indices (1,0),no SA extension,and generalized-eigenfunction scope | v13 specifies Hilbert measure,actual Sobolev closure/adjoint domains,boundary terms;retains v12's correct half/full-line distinction | Half-line self-adjointness already excluded by v12 is not a recovery target. Full line is another domain;σ=1/2 depends on measure |
| Finite-time independence proved only for Tδ>2(M−1) | v13 proves independence for every T>0 and finitely many distinct frequencies;old threshold remains conditioning bound | Stronger correct statement,not a new discovery of exponential linear independence |
| Hmin=graph closure Cc∞(interior) has (2,2),all extensions U(2),Krein kernel=2 | Infinite outer-boundary harmonic modes refute old H₀;0.02 fixes HF outer Dirichlet then τ=0,giving A's (2,2),U(2),rank-two resolvent,Krein kernel=2 | Different minima; every abstract/definition/theorem must state operator replacement. H₀ reduced positive Krein/buckling has separate applicable proof |
| Actual surface Green −log ρe/(2π),A* expansion,2π pairing inferred only from model/front-seam | 0.03 actual-germ arclength coordinates;a−I=O(ρ¹ᐟ²),L³/L² error sources,external Hölder regularity;canonical resolvent Gη identified;all A* expansions ℓ log ρe+b+O(ρe^β) | Specified A's scalar conclusions recovered. No closed numerical Bη formula or claim of complete old front/seam weighted parametrix |
| Markov uniqueness/no-running-scale inferred from finite boundary planes | 0.03 proves actual global domain expansion,then A's Markov uniqueness via bounded resolvent;unique common-reference-length invariant plane under geometric coefficient maps | Fixed outer Dirichlet premise. Reference-length change is notation/boundary convention,not actual surface dilation or physical RG law |
| Equal diagonals in zero-energy Green matrix;sheet-even scalar log channel | 0.03 proves B₀ equal diagonals from actual Euclidean isometry S(−t,u)=J S(t,u);even limiting scalar coefficients on paired branches from equal image radius | Global reflection exchanges poles;local sheet exchange differs. No full Green-function local deck invariance or canonical derived sheaf→operator bridge |
| Actual Dirac chiral quotient/phase-to-Pin action transplanted from exact cone and finite Clifford computation | Exact-cone/regular-cut conditional results retained;actual Lp curvature,Z4/norm/commutator results stated | Actual singular domains/overlaps/fiber transmission missing;scalar 0.03 does not fill them automatically |
| Condensed/Weil,capacity,mass,chirality integration | Constructible sheaf,chosen complex A3/MHS,Hardy/Haar,and no-go results precisely separated | Independent realization theory/noise-resource model/physical dynamics bridges missing. √5,equal dimensions,2π,4π do not recover identifications |

“Is the new version even stronger?” has two measures: yes for valid proofs,explicit domains,checkability,and some stronger statements; not yet for all historical claims,special bicomplex necessity,or first originality. Invalid-claim counts should not be a target to catch up with.

Nor are all correct scope limits due to this revision: v12 7.2/7.3 separated half/full-line and generalized frequencies;5.5 gave Shannon-capacity no-go;8.25,9.1,9.5 restricted ambient SU2 invariance,scaleless mass ratio,and nonzero eta respectively. New version retains these and specifies objects/domains; it did not discover or withdraw all physical/arithmetic analogies this round. Metadata abstract lags full v12;they are especially not one “original version.”

## Scalar gaps closed this round and proof boundaries

New 0.03 proof routes:

| Proposition | Route | Evidence type |
| --- | --- | --- |
| Actual smooth Euclidean Whitney germ arclength homeomorphism,C¹ punctured inverse,tensor/density/radius estimates | `lem:arclength` | Written Taylor bounds,chain rule,dominated differentiation;matrix identity exact check |
| Canonical Gη universal −1/(2π) log ρe with Hölder regular part;real symmetric Bη | `thm:log` | Written weak equation/Lax–Milgram/Caccioppoli/resolvent identification,external scalar Hölder theorem;not numerical fit or Lean proof |
| Unique bounded coefficient maps for all Dom A*,surjectivity,2π Green form,actual maximal isotropic U(2) domains | `thm:boundary` | 0.02 resolvent decomposition + new actual expansion;abstract classification not an original framework |
| Symmetric Bη/B₀ from actual global reflection | `cor:reflection` | Actual Euclidean isometry;S symmetry identity exact replay |
| HF as specified A's unique submarkovian extension | `cor:markov` | Written normal contractions,semigroup-resolvent boundedness,log obstruction |
| Unique common-reference-length invariant plane | `cor:scale` | Actual boundary maps + finite isotropic-plane argument;not a physical scaling law |
| Asymptotically even coefficients for two source branches at one pole | `cor:parity` | Actual equal image radius and Hölder remainder;no assumed deck metric isometry |

These complete 0.02's log normalization/geometric pairing/scalar Markov/coefficient parity and classify two points under explicit outer boundary. They do not recover old H₀'s false conclusions or prove all front/seam normal-family asymptotics,actual spinorial traces,or a sheaf functor. New note adds no Lean theorem;33 own scope and proof inputs unchanged.

## Currently missing mathematical obligations

| Obligation | Concrete gap/current evidence | Closure criterion |
| --- | --- | --- |
| Historical moment-model geometric derivation/canonicity | **Decided by 0.04**: ancestor powers admit no real-analytic readout along C₀;C^∞ readout exists noncanonically;half source has analytic but no affine readout. μ alone does not determine u/phases/P | Only choice remains: historical model must explicitly accept nonanalytic switching readout,half source,or changed powers (0.02),with selection principle. Quadratic readout on D₊ remains open |
| Actual twisted Dirac object/graph domains (v12 8.21) | Exact-cone link modes are not actual Whitney graph quotient;weight-zero partition commutator cannot simply be absorbed;curvature Lp is input only | Specify spin structure,flat sign line,Hilbert density,closed operator/adjoint domains;prove singular conformal/gauge and overlap estimates,parametrix remainders,surjective graph traces,exact channel dimensions |
| Actual phase/Pin transmission (8.22–8.24) | Chosen Clifford metric/norm/Z4 checkable;phase and normalization-deck lines not proved same bundle;no existing proof of singular-cut traces | Define actual cut trace spaces,fiber map,conormal Clifford compatibility;prove graph continuity/maximality/adjoint-domain equality;retain first-order-obstruction no-go if exclusion occurs,without forcing identification |
| New normalization/sheaf→operator bridge (8.18–8.19) | Ordinary scalar support/odd-even obstruction known;0.03 adds actual coefficient parity;matching dimensions insufficient | Supply sign-twisted/form/spinorial target and actual morphism;prove category/parity/analytic-domain compatibility. New research,not a missing proof of current scalar theorem |
| Arithmetic/condensed/physical realization | 8.30 conditional on “supplied realization theory”;real source carries no inherent Deligne/Weil/clock/noise model | Construct objects/maps/functors or physical model and check theorem hypotheses;until then scoped model/observation,no established-bridge claim |
| Originality priority | Proved proposition not literature priority;Grieser full text still unreadable;point-interaction/singular-metric comparison incomplete | Obtain relevant full texts and compare hypotheses/conclusions individually;retain candidate-contribution wording until evidence suffices |

Two completeness gaps are distinct from missing mathematics: new PDE/operator results not Lean-formalized;v13,0.02,0.03 remain separate local manuscripts,whose historical conditional/open wording needs future integration. Sealed checkpoints retained;new proof note/audit provides latest entry. Local acceptance of new 0.03 PDF is not acceptance of a new integrated full text or public version.

## Comparison scope of 66 named blocks

Following ranges are disjoint and cover all 66 blocks of `CLAIM_MAP.json` (including remarks). Original statements/early proof routes remain in original inventory;0.02/0.03 overlays supply latest status,so historical v13 open labels are not today's results.

| Block range | Treatment of originality and gaps |
| --- | --- |
| 3.1 | New realization/historical powers differ/derivation not recovered |
| 3.2–3.3 | Measure/domain corrections;resolution cost a definition,not channel model |
| 4.1–4.4 | Actual dipole/lifting;global rank separate from time/spin interpretations |
| 5.1–5.2 | Monic-polynomial normalization;√5 computation not a new dynamical law |
| 5.3–5.5 | Standard sublevel proofs,density conditions,Shannon no-go |
| 5.6–5.7 | explicit complexification、standard Milnor theorem hypotheses |
| 5.8–5.11 | Actual link/weighted phase model;distinct figure-eights not identified |
| 5.12–5.13 | Actual cusp computation and geometric-bridge no-go |
| 6.1–6.2 | All-five atlas,actual recognition;prior geometry dependencies |
| 7.1–7.8 | Mellin closure／no SA half-line；Gram for all T>0、standard finite bounds |
| 8.1–8.5 | standard Fourier／Hardy／Haar；no unprovided arithmetic bridge |
| 8.6–8.7 | ordinary constructible defect／structure-sheaf scope |
| 8.8–8.10 | Actual fold/completed source/exact Galerkin,not substitutes for PDE |
| 8.11–8.12 | Actual capacity/compactness;0.02 point traces;0.03 metric asymptotics;no complete old front/seam parametrix claim |
| 8.13–8.17 | H₀ counterexample versus corrected A;0.03 coefficients/Markov/reflection;classical Krein/buckling |
| 8.18–8.19 | Scalar support and odd-even no-go;actual limiting parity now supplied;new bridge absent |
| 8.20–8.24 | Exact cone/finite Clifford/regular-cut theorem retained;actual singular Dirac/phase-Pin missing |
| 8.25–8.30 | ambient SU2 no-go、chosen MHS／conditional realization theory |
| 9.1–9.6 | Dimensional/Poisson/eta scope;physical interpretations not promoted |

Actual Whitney scalar theorem should be the reviewable analytic main line,realization/no-go a model chapter,and Dirac/Pin explicitly unfinished research. Next atomic proof task: closed actual twisted-Dirac operator and singular graph-domain estimates;stacking standard frameworks or restoring refuted wording will not close gaps.

## 2026-10-02 successor-paper r2 new mathematics (new results,not historical recovery)

- **Exact deviation rate for standard cross-cap.** For f=(x,xy,y²),arclength coordinates give q·n=(x/2)(2y/√(x²+4y²)−arsinh(2y/|x|)),|q|≤2|y|,hence G−I=O(ρ log(1/ρ)),stronger than general Whitney germ O(ρ^{1/2}). Proof in paper two Remark 3.3;`verify_successor_paper2.py` checks derivative identities/monotonicity symbolically;`build_successor_figures.py` supplies numerical support (slopes approximately 0.91,0.89). Same rate for general germs remains undecided and is an open question in paper two.
- **H₀ Krein/buckling statement.** Paper two Proposition 8.1(3):compact-core closure H₀ strictly positive,Friedrichs extension H_F,Krein kernel ker H₀* (infinite-dimensional),reduced positive spectrum discrete and characterized by weak buckling. Generalized wording of existing v13 working proof;abstract theorem from Ashbaugh et al. (checked in `REFERENCE_AUDIT.md`).
- **Standard-germ radius ratio (r3).** Identity V²−y⁴−x²y²=−¾x²y²+¼x²y√(x²+4y²)·A+(1/16)x⁴A² (A=arsinh(2y/|x|)) gives ρ_e/ρ=1+O(ρ log(1/ρ)),same rate as G−I. Proof in paper two Remark 3.3;verifier checks identity symbolically.
- None changes classification of 66 blocks or concerns historical-model recovery.
