# Primary-reference and hypothesis audit

## Continuation 0.04: moment readouts, exceptional pullback, windows

| Primary source | Checked content / retrieval boundary | Application |
| --- | --- | --- |
| [Scholze, *Six-Functor Formalisms*, arXiv:2510.26269v2](https://arxiv.org/abs/2510.26269) (v2 22 Jan 2026) | Full PDF retrieved, 111 pages, SHA-256 `bef0355115fd4faa0e0adb8014e330399582c1e2b41efdab75ca7992c4eb8276`. Definition 5.1 (p.32): cohomological smoothness needs (1) the comparison `f^!1 ⊗ f^* → f^!` to be an isomorphism, (2) `f^!1` invertible, (3) both stable under base change. Remark 5.4: maps in I (open immersions in Example 5.9) are smooth with `f^*=f^!`. Example 5.9 (p.36): finite-dimensional LCH spaces, `D(Ab(X))`. | Shows the v7 paraphrase `f^!Z≅Z[d]` records only condition (2). The 0.04 fold proposition exhibits failure of condition (1) at ordinary folds while (2) holds. |
| [Krause–Nikolaus–Pützstück, *Sheaves on Manifolds*](https://www.uni-muenster.de/IVV5WS/WebHop/user/nikolaus/Papers/sheaves-on-manifolds.pdf) (lecture notes, 7 Nov 2024) | Full PDF retrieved, 205 pages, SHA-256 `fefce7361b323ec38ff589131ba251c6d18f6f6e01b0d233f0c7aaf709ee25ee`. Prop. 4.6.9(3): `f^! D F = D f^* F`. Def. 4.6.8: `ω_X=t^!S`. Rem. 4.6.19: stalk of ω at x is local homology `H_*(X,X\x)`. Cor. 4.6.20: homology manifolds are cohomologically smooth. Thm. 1.1.10: ω of an n-manifold is the n-shifted orientation sheaf. Spectrum coefficients; D(Z) by the base change of Lemma 4.6.17. | Proves `f^!Z ≅ or_X⊗f^*or_Y[n−m]`, and `Ψ^!Z ≅ j_!Z` on the interior for every continuous Ψ on a convex planar domain. Boundary stalks vanish because D′\x is star-shaped. |
| Kashiwara–Schapira, *Sheaves on Manifolds*, Ch. III | Standard reference, **not retrieved this round**; cited at chapter level only | Classical D(Ab) form of the same Verdier-duality statements |
| Stokes v5 final PDF (registered), Theorem 2.4 | Re-read from the hash-locked registry PDF: the symmetry segment (u>0) and the physical rational branch (c_b≤c<1) consist of ordinary folds; the fold condition fails at (0,0) | Supplies the ordinary-fold points used in the fold-detection proposition; Jacobian factorization and `N_tt(0,u)=-2u` replayed |

The analytic-rigidity, smooth-construction, half-source and window results use no
external theorem beyond the following standard facts: zeros of a nonzero
real-analytic function on an interval are discrete; the real-analytic inverse
function theorem for the normal-bundle map; and Weierstrass approximation.
Downloads of the two lecture-note PDFs were read-only retrievals of public files.
They are kept in session scratch only, not in the repository.

## Continuation 0.03: originality and actual scalar Green normalization

| Primary source | Checked content / retrieval boundary | Application |
| --- | --- | --- |
| [Posilicano, math/0309077 full text](https://arxiv.org/html/math/0309077), Sections 2--3, Theorems 2.2/3.1, Corollary 3.2 | Graph-bounded surjective tau with dense kernel; actual adjoint-domain decomposition, boundary triple and resolvent formula checked | This is prior general theory, not a new Bicomplex extension framework. Actual model hypotheses and convention are proved separately. |
| [Simon, author notes](https://math.stanford.edu/~lms/lecs-on-pde.pdf), updated 2015-03-05, Lecture 18 Theorems 2--3, printed pp.212--216 | Primary theorem and proof inspected; locally H1 scalar solution, real bounded uniformly elliptic coefficients, divergence source Lq, scalar source L(q/2), q>n. PDF SHA-256 e1f1b2f51d2558aa467a8c064fe82e7b9e157ad28c9c75f01e38596cde656870 | n=2, q=3. The actual arclength tensor error times grad(log rho) is O(rho^(-1/2)), hence L3; scalar/mass source is L2, hence L(3/2). The regular part is Holder. This strengthens the 0.02 source retrieval with a checked worked proof; no Dirac-system theorem follows. |
| [Taylor--Kim--Brown, 1205.1089 full text](https://arxiv.org/html/1205.1089), Theorem 4.1 | Bounded Lipschitz planar domain, mixed boundary/coercivity, bounded ellipticity: Green existence, logarithmic upper bound, off-pole Holder estimate and reciprocity | Prior planar Green theory; not imported as a global Whitney/source-boundary theorem or as an extrinsic-radius coefficient formula. |
| [Robinson--Sikora, primary abstract](https://arxiv.org/abs/0912.4536), [publisher record](https://journals.sns.it/index.php/annaliscienze/article/view/245) | Compact core on open Euclidean domain, W1,infinity coefficients and boundary capacity criterion; 2011 journal volume 10(3), pp.683--710. Full theorem proof not read this round | Related Markov uniqueness literature, not directly applied to the fixed-Dirichlet A or the resolved coefficients. The 0.03 bounded-resolvent proof is given explicitly. |

Grieser publisher PDF again returned 403; direct Citeseer retrieval returned
404. The earlier primary indexed Section 1 comparison remains the retrieval
limit; priority of the new refinement is not established. See
`ORIGINALITY_AND_GAPS.md` for the ancestor/v12/current comparison and the
remaining actual Dirac/Pin, historical moment and realization obligations.
The 0.03 scalar logarithmic/limiting-parity proofs supersede the applicable
open statements below; the earlier checkpoint records remain historical.

## Continuation 0.02: actual scalar regularity and corrected domains

| Primary source | Checked content / retrieval boundary | Application |
| --- | --- | --- |
| [Grieser, Quasiisometry of singular metrics](https://www.math.uh.edu/~hjm/Vol28-4.html), Houston J. Math. 28 (2002), 741--752 | Publisher metadata and indexed primary-paper Section 1 excerpt checked: Whitney-umbrella metrics admit a singular quasi-Euclidean coordinate change. Publisher full-PDF retrieval returned 403; no full-paper readback is claimed. | This coordinate method is prior work. Continuation independently proves its explicit homeomorphism and both metric inequalities, then transfers them through the actual smooth germs. No novelty claim for the method. |
| [Gilbarg--Trudinger, Chapter 8](https://link.springer.com/chapter/10.1007/978-3-642-61798-0_8), Theorem 8.24 | Publisher edition/chapter metadata checked; full subscription chapter was not retrieved. Cited as the standard external inhomogeneous scalar Holder theorem, not as a Lean axiom. | Real bounded measurable uniformly elliptic coefficients; bounded positive density; scalar source in L2 with 2>n/2=1. Apply to real/imaginary parts. |
| [Silvestre, author boot-camp notes](https://math.uchicago.edu/~luis/preprints/bootcamp.pdf), 2017-09-29, Questions 52 and 58 | Primary full PDF inspected: homogeneous Holder estimate and inhomogeneous Lp source for p>n/2. These are stated exercises, not worked proofs. Local PDF SHA-256: 51909729e466570e60f63997d47718e4b978bdf21c598a0b11ab61ecf0d96bbd. | Corroborates the precise regularity hypotheses. Continuation provides the weak-equation/form-capacity argument and explains subtraction of the zero-boundary inhomogeneous solution for the local estimate. The regularity theorem remains external. |
| [Ashbaugh et al., 0907.1439v2](https://arxiv.org/html/0907.1439), Theorem 2.1, equations (2.8), (2.10) | Primary domain/kernel formulas checked under closed, dense, symmetric, strictly positive hypotheses. Complete authors include Roman Shterenberg. Theorem 2.4 is a spectral statement, not this domain formula. | Actual corrected A=HF|ker(tau) satisfies these hypotheses. Its Krein domain is Dom A plus ker A*, and its kernel has dimension two. This is a different extension from the historical H0 Krein operator with infinite kernel. |
| [Szymanski--Zyczkowski, 1804.06191v1](https://arxiv.org/html/1804.06191v1), Section II | Primary pure-state Bloch sphere versus mixed-state ball distinction checked. | The actual four noncoplanar S values and straight ruling independently prove the three-fixed-Hermitian-observable obstruction. It does not rule out the constructed phase-sensitive readout or mixed states. |

The fixed-boundary point-interaction construction of Noja--Raso Stoia below is
now applied with the actual trace hypothesis supplied by this continuation.
Its regular H2 estimate has not been transferred to the Whitney metric.
The earlier v13 audit below retains its checkpoint scope; entries calling point
regularity open are superseded by this scalar result. Explicit logarithmic
normalization and singular Dirac/Pin domains remain open. Originality of the
complete application requires a broader literature comparison.

## Preserved v13 reference audit

2026-10-01. A retrieved reference supports only the stated theorem with its
hypotheses. Bibliographic metadata is not a full theorem readback. No external
theorem below is installed as a custom Lean axiom.

| Primary source | Inspected content / input hypotheses | Application and limit |
| --- | --- | --- |
| [Hasegawa et al., 1409.0281](https://arxiv.org/html/1409.0281), §4 / Corollary 4.5 proof | Smooth corank-one plane-to-three-space map with adapted nonzero triple determinant | Actual S and B_epsilon derivatives checked at all five labels; supplies smooth cross-cap germ recognition. Its intrinsic metric theorem supplies no Green parametrix. |
| [Martins–Saji–dos Santos–Shimada, 2607.21796v1](https://arxiv.org/html/2607.21796v1), Prop.2.1 / Eq.(2.8) | Euclidean S-type/Whitney cross-cap, adapted orientation, curvature-parabola invariants and exceptional pedal trace | Actual projected derivatives independently rebuilt; second/third derivative determinant proves ordinary cusp. No whole curvature-surface classification or link identification. |
| [Noja–Raso Stoia, 2607.04349v1](https://arxiv.org/html/2607.04349v1), Prop.2.1 / Thm.2.2 | Regular-domain Dirichlet operator restricted by graph-bounded point evaluation | Clarifies the correct restriction A_D on ker(tau), rather than graph closure of Cc interior. Its regular H2 estimate does not apply to the Whitney degeneracy. |
| [Ashbaugh et al., 0907.1439](https://arxiv.org/html/0907.1439), Hyp.2.2 / Thms.2.4,3.4 | Closed densely defined symmetric operator with strictly positive lower bound; discrete Friedrichs spectrum for discrete positive Krein spectrum | V13 proves these hypotheses for actual H0 via weighted Hardy/compactness. Krein kernel is infinite from the regular boundary. A two-point Robin matrix still needs actual traces. |
| [Fucci et al., 2102.00685](https://arxiv.org/abs/2102.00685) | Metadata/abstract checked; positive-operator extension context | Supplemental Krein reference. Detailed application uses the preceding inspected theorem, not the abstract alone. |
| [Pacini, 1005.3511](https://arxiv.org/html/1005.3511) | Conifold metrics and weighted-space hypotheses | Cannot silently transfer uniform estimates to a Whitney seam. V13 instead proves elementary actual weighted radial compactness; point regularity remains open. |
| [Bär–Ballmann, 1307.3021v1](https://arxiv.org/html/1307.3021v1) | Dirac-type operators, specified regular-boundary trace spaces, Green form and elliptic boundary conditions | Used only on regular cut banks under a supplied Clifford-compatible unitary map. Does not construct a singular-cut domain. |
| [Krainer–Mendoza, 1611.06526](https://arxiv.org/abs/1611.06526) | Metadata/abstract checked; HTML full-text retrieval failed | Cone framework is background only. No actual Whitney ideal-domain theorem imported. |
| [Hedenmalm–Lindqvist–Seip, math/9512211](https://arxiv.org/html/math/9512211) | Coefficient Hilbert space and Dirichlet-series evaluation | V13 independently proves upper/unbounded evaluation estimates with finite coefficient vectors; prime-character relations retained. |
| [Deligne, Hodge II](https://www.numdam.org/articles/10.1007/BF02684692/), §§3.1–3.2, especially (3.2.5) | Primary PDF inspected locally, printed pp.31–36: smooth separated complex variety, smooth compactification with normal-crossing divisor; logarithmic residues and mixed Hodge structure | Explicit E is smooth projective genus one and D consists of two smooth points. Residue/Gysin boundary kernel has dimension one and Tate twist; does not give weights to the real source or sigma. |
| [Peters–Steenbrink, Mixed Hodge Structures](https://link.springer.com/book/10.1007/978-3-540-77017-6) | Publisher metadata checked; full book not retrieved | Supplemental textbook citation; the application uses the explicitly constructed algebraic pair and Deligne residue construction. |
| [Stacks, Tag 009Z](https://stacks.math.columbia.edu/tag/009Z) | Extension by zero for an open immersion, stalk/adjunction conventions | Factor the locally closed ray inclusion through its closed support. Normalization quotient has zero pinch stalk; ordinary Hom to point support is zero. Derived nearby/costalk is a separate ray calculation. |
| [Brezis, Functional Analysis/Sobolev/PDE](https://link.springer.com/book/10.1007/978-0-387-70914-7) | Publisher metadata checked; standard Rellich and trace theorem cited externally | Applied only on bounded regular Lipschitz subdomains, where actual metric is uniformly elliptic. Singular neighborhoods use the new explicit radial Hardy estimate, not an unverified weighted Rellich theorem. |

Milnor's *Singular Points of Complex Hypersurfaces*, Dimca's *Singularities and
Topology of Hypersurfaces*, Reed–Simon I, Kirby–Taylor on Pin structures and
Atiyah–Patodi–Singer remain standard external references; their complete books
or papers were not retrieved in this run. The manuscript states their exact
roles. For the chosen isolated weighted-homogeneous A3 model, the coordinate
change, critical point, compactification, branch points, ends and monodromy
action are independently checked before invoking Milnor comparison or MHS.
For eta the convergent circle series is paired directly; no asymmetric eta
formula is imported. The conditional Pin argument uses only the selected
double-cover convention and Clifford anticommutation.

The two registered ancestor PDFs were visually inspected. The monodromy
figure is a finite trajectory display with traversal angle, not a clock law;
the golden-rectangle figure concerns the monic polynomial root. Neither is
used as proof. The revised standalone source contains a formula-based source
label diagram and a three-construction comparison table. Coordinates are
rounded for drawing; rank labels and all equations are specified exactly.
