# Bicomplex: handoff prompt for historical claims and open questions

> **Historical snapshot (2026-10-02,before continuation 0.04 and publication of both successors).** v7 block index/v12 comparison below remains reference material,but “currently open questions” is partly outdated:0.04 decided historical moment-assignment realization (no real-analytic readout along C₀;noncanonical C^∞ readout exists),and v7 exceptional-pullback,±1 sectors,log/linear windows (`claims/V7_DRAFT_INDEX.md`,paper one). Current open/refuted-not-proof-target lists: [`README.md`](README.md), “Start here”/“What is genuinely open.” v7 PDF remains private,not for commit/upload.

Prepared:2026-10-02 (Asia/Taipei). This whole document may be pasted into the next window.

---

In the existing local project
`/Users/akari_hayami_64/Documents/hayami-mathematical-research`
continue bicomplex research. The author wants to understand and advance mathematical questions left by the original paper/early drafts,without restoring every historical wording as true or preselecting direction,method,order,final form. Choose worthwhile problems,retest judgments,find constructions,proofs,counterexamples,or sharper formulations autonomously.

This is a reading handoff/evidence index,not a prescribed solution. An unestablished bridge does not mean impossibility under every additional structure;renaming a refuted original does not recover it. Record new theorems separately from historical-model recovery.

## Document/version identities

Main comparison:historical final v12 and author-supplied v7 PDF;local `source_ancestor` TeX is another historical layer. “Original paper,”“ancestor source,”“v7 draft” are distinct versions.

@/Users/akari_hayami_64/Documents/hayami-mathematical-research/AGENTS.md
@/Users/akari_hayami_64/Documents/hayami-mathematical-research/RESEARCH_BOARD.md
@/Users/akari_hayami_64/Documents/hayami-mathematical-research/papers/legacy-geometry/bicomplex-signal-manifolds/README.md
@/Users/akari_hayami_64/Documents/hayami-mathematical-research/papers/legacy-geometry/source-registry/SOURCE_REGISTRY.md
@/Users/akari_hayami_64/Documents/hayami-mathematical-research/papers/legacy-geometry/source-registry/RECOVERED_SOURCE_PROVENANCE.md

Historical originals:

@/Users/akari_hayami_64/Documents/hayami-mathematical-research/papers/legacy-geometry/source-registry/final_pdfs/Geometric_Realization_of_Bicomplex_Signal_Manifolds_v12.pdf
@/Users/akari_hayami_64/Downloads/Geometric_Realization_of_Bicomplex_Signal_Manifolds_v7.pdf
@/Users/akari_hayami_64/Documents/hayami-mathematical-research/papers/legacy-geometry/bicomplex-signal-manifolds/source_ancestor/signal_manifolds_v2.tex

| Material | Identity/check this round |
| --- | --- |
| Final v12 PDF | 43 pages,current historical-claim authority;SHA-256 `4ebb8f0a7d6e88a6c5cd97f65d224b4e938867cabad54f057d3ceafb24167d5a`. First lines of all 66 original claim-map blocks checked on their specified PDF pages |
| Attached v7 PDF | 26 pages,SHA-256 `6cefa5258257f3a23e35b5dd5cbe123b7af0ed3319c3a614b1c8d54c94bd654f`. Text read on all 26 pages;key originals visually read pp.7,11,14,21,25;39 named blocks indexed. Not final v12 or proved generated from local ancestor TeX |
| `signal_manifolds_v2.tex` | 1,908-line historical source,reconstructed to 26 pages;SHA-256 `4c0a5b5a8287ab5559c892b2ee21c170984e5f9649481018f851095118a1f016`. Capacity,arithmetic,symmetry,Poisson,eta limits already present,plus A3/figure-eight/cusp absent in v7. Equal page counts do not identify it as v7 or missing final source |

v7 first page July 2026,footer June 2026 draft;filename,metadata,page count,wording identify material,but alone prove neither version evolution nor publication priority. Equal v7/v12 proposition numbers do not guarantee equal content.

ResearchGate metadata page is author-supplied historical background:
https://www.researchgate.net/publication/408878000_Geometric_Realization_of_Bicomplex_Signal_Manifolds_Spectral_Stability_Whitney_Folds_and_Monodromy_of_the_Observation_Field
No public-page reread,remote PDF download,or platform operation this round;existing records show metadata-abstract/v12 version differences.

Current results/gaps entry points,read as needed:

@/Users/akari_hayami_64/Documents/hayami-mathematical-research/papers/legacy-geometry/bicomplex-signal-manifolds/proofs/ORIGINALITY_AND_GAPS.md
@/Users/akari_hayami_64/Documents/hayami-mathematical-research/papers/legacy-geometry/bicomplex-signal-manifolds/claims/CLAIM_MAP.json
@/Users/akari_hayami_64/Documents/hayami-mathematical-research/papers/legacy-geometry/bicomplex-signal-manifolds/proofs/REFERENCE_AUDIT.md
@/Users/akari_hayami_64/Documents/hayami-mathematical-research/papers/legacy-geometry/bicomplex-signal-manifolds/revision/Bicomplex_Signal_Manifolds_v13_working.tex
@/Users/akari_hayami_64/Documents/hayami-mathematical-research/papers/legacy-geometry/bicomplex-signal-manifolds/revision/Bicomplex_Realization_Point_Trace_v0_02_working.tex
@/Users/akari_hayami_64/Documents/hayami-mathematical-research/papers/legacy-geometry/bicomplex-signal-manifolds/revision/Whitney_Green_Domains_v0_03_working.tex
@/Users/akari_hayami_64/Documents/hayami-mathematical-research/companions/lean/bicomplex-signal-manifolds/COVERAGE.md
@/Users/akari_hayami_64/Documents/hayami-mathematical-research/releases/candidates/bicomplex-green-v0.03-receipt.json

Old `NEXT_THREAD_PROMPT.md` records the previously executed full task. The author now permits free research;do not inherit its fixed order or let a board's “next atomic task” limit selection.

## v7 draft claim index and gaps

Table covers all 39 named blocks by original number:§3 three,§4 four,§5 four,§6 one,§7 eight,§8 sixteen,§9 two,§10 one. Also unnumbered §9.3,abstract,text,figures,conclusion. v7 physical pages equal visible printed pages.

“Existing correction/no-go” means evidence in later sources/audits;“unestablished/reading check pending” does not claim new proofs/counterexamples this round.

| v7 original location | Draft claim | Existing results,gaps,or open questions |
| --- | --- | --- |
| §§2–3;Definitions 3.1–3.3,pp.2–3 | Unit power,moment map,`(X,Y)=(cos t,1−cos t)` derive ruled surface;4D→3D projection;information-geometric capacity | No explicit compatible state family/projection. 0.02 uses different powers,not historical derivation recovery. Capacity lacks stochastic channel/noise/resource constraint |
| Theorem 4.1,Corollary 4.4,pp.3–4;Proposition 6.1,p.6 | Exactly two lateral observation zeros,indices ∓1,Jacobian formula;singularities controlled by `c²−3c+1` | Interior dipoles verified,distinct from “exactly two global immersion singularities.” Completed source has five rank-loss points including boundary. v7 8.5 discusses a polar zero;do not mix interior/full-source/original-angle/observation zero sets |
| Theorem 4.2,Remark 4.3,p.3 | `sqrt(F)` changes sign around dipole,returns after two circuits;Whitney-sheet exchange with Spin-1/2 analogy | Square-root monodromy proved;does not identify normalization deck,fold,phase cover,physical spin representation. Later Z4/Pin analysis retains incompatibility/additional-data issues |
| Lemma 5.1,Remark 5.2,p.5 | `|P′(c0)|=sqrt(5)` linked to Jacobian/Stokes-intensity numerical/constants recurrence | Monic-polynomial identity known;coefficients depend on normalization. Shared constants supply no capacity,mass,dynamics bridge |
| Conjecture 5.3,Remark 5.4,p.5 | `C=sqrt(5) ln S`,Bekenstein/holographic entropy compatibility,`ΔC=1/C` | Explicit v7 conjecture. Ancestor/v12 adopt sublevel `3/4` resolution law and geometry-does-not-determine-Shannon-capacity no-go;resolution-cost definition does not prove old capacity law. Independent operational models remain researchable |
| Theorem 7.1,Remark 7.2,pp.6–7;Proposition 8.1,pp.9–10 | Formal adjoint under `dx` is `T_(1−σ)`,σ=1/2 symmetric;full-line Mellin/Plancherel interpretation | v7 7.2 correctly gives half-line `(1,0)`,no self-adjoint extension,not a newly discovered counterexample. 8.1 nevertheless calls full-line Haar to half-line Lebesgue `W` an “isometry,”without full domain. Later full/half-line separation/domain corrections exist;introduction weighted measure differs from `dx` theorem |
| Corollary 7.3,p.7 | `Tσ x^(−σ−iω)=−ω x^(−σ−iω)`,formal self-adjointness implies Hilbert orthogonality at σ=1/2 | Differential eigenfunction calculation retained;not Hilbert vectors in half-line `L²(dx)` at σ=1/2. Ancestor withdraws formal-symmetry→orthogonality;full-line distributional spectral realization is a separate explicit object |
| Theorem 7.4,Remark 7.5,Proposition 7.6,Corollary 7.8,pp.8–9 | Finite-phasor Gram norm,`O(T⁻¹)`,sufficient positivity threshold,conditioning/logdet bounds | Results hold for finite positive integers/distinct frequencies/specified inner product. New independence all `T>0`;old threshold quantitative conditioning. No automatic uniform growing-frequency/infinite-dimensional stable reconstruction |
| Remark 7.7,pp.8–9;Remark 8.2,p.10;Figure 6,p.11 | Rank-M free group/perfect Pontryagin pairing;normalized time average→Dirac δ-kernel;Artusa Weil-étale duality connection | Exact results:fixed finite distinct-frequency Gram limit/Bohr–Haar orthogonality. Multiplicative integer relations differ from linear phasor independence;no free multiplicative rank M assertion. Kronecker versus distributional Dirac normalization/measure differ;Weil-group/cohomology correspondence unsupplied |
| Proposition 8.3,Remark 8.4,pp.10–12 | Whole fold locus `i* Ψ! Z ≅ Z[−1]`;total dipole index/Verdier duality;unique cohomology theories from tensor/pullback coherence alone | Local-cohomology sketch lacks category,six operations,dualizing complex,base-change hypotheses,shifts;ancestor drops formula. Normalization-defect theorem is not exceptional-pullback theorem. Whether all `det DΨ=0` is fold,including boundary exceptions,requires reading checks,not Figure 10 |
| Proposition 8.5,Remark 8.6,pp.12–13 | Polar observation zero rank-one Whitney fold,smooth-extension local degree zero;total signed count not χ(D) | Corrected polar-fold/full-extension degree-zero proofs exist;physical half-neighborhood does not inherit full-circle index. Surface cross-cap differs from planar observation fold;auxiliary-field signed count not unconditional Poincaré–Hopf/Verdier result |
| Proposition 8.7,Remark 8.8,p.13;Figure 7,p.14 | Compactological/quasi-separated condensed realization;two dipoles exactly structure-sheaf nonfree/nonmanifold defects | Compact Hausdorff image defines condensed set;particular compact-family axioms/equivalence need identification. Underlying condensed set supplies no canonical ringed structure,tangent module,singularity detector;ancestor scope no-go. Normalization quotient has concrete constructible-sheaf alternative |
| Definition 8.9,Proposition 8.10,Corollary 8.11,Remark 8.12,pp.14–15;Figure 8,p.16 | Canonical τ on constant condensed sheaf,± sectors,rank-two charpoly `t²−1`,weight-zero purity,Akari–Hilbert operator;Mellin domain even observable sector | Finite τ²=1 algebra supplies no undefined carrier,two actual eigenspaces,functorial map. Rank-one constant sheaf,double-cover pushforward,sign local system,operator domain differ. Phase monodromy not Frobenius purity;`n` independent of Whitney coordinates,no Mellin-space→sheaf/Dirac-space map. Bridges unsupplied |
| Proposition 8.13,Remark 8.14,pp.15–17;Figure 9,p.17 | Log-window `O(1/log T)` versus linear-window `O(1/T)` gap from integer sparsity/log aliasing/Frobenius analogy | Displayed integral computable;must identify same interval,signal,variable change,normalization to compare same experiment. Positive integers N not multiplicative subgroup. Upper-bound ratios not actual decorrelation ratios;no arithmetic-geometric mechanism established. Bohr completion does not recover stronger reading |
| Proposition 8.15,Remark 8.16,pp.17–18;Figure 10,p.18 | σ=k/2 Deligne-weight correspondence,cohomological midpoint | v7 calls it analogy,with stronger conclusion wording. Ancestor/v12 limit real geometry's Deligne/Weil data. Chosen complex residual `X²+Y⁴` has MHS results,not from σ=1/2 or identifying phase eigenvalues/Frobenius weights |
| Remark 9.1,p.21;§9.1,pp.19–21 | Volume/area dimensionless impedance;`m=μ_eff η^n ΔC`,fundamental-group rank generation labels | Explicit v7 ansatz. Ancestor/v12 prove ratio retains length scale;`R=1` chooses units,not mass law. State/image π1,state selection,mass operator,scales lack physical correspondence |
| Conjecture 9.2;§9.2,p.21 | Synchronized observations induce nonzero commutator,`ℏ_eff∝1/ν0`,Jacobian/Berry-curvature correction | Canonical powers `{X,Y}=0` no-go exists;draft lacks determinant of nonsquare `dμ`,quantum-observable domain,deformation product,actual Berry bundle. New observables/dynamics are a new model,not original-power-projection noncommutativity |
| Remark 10.1,p.21;Listing 1,pp.21–24 | Lean targets marked proved/calc done | Listing includes `sorry`,`True := trivial`,scalar-inequality/finite-algebra proxies. Not full machine certificate;not built this round. Actual companions/coverage/receipts determine usable formal scope |
| §9.3,p.21 (unnumbered) | Asymmetric dipole indices chirality seed;eta of suitable elliptic family open | Sign-holonomy circle has eta=0,excluding spectral asymmetry there,not separately supplied asymmetric operator/boundary dynamics;actual-surface Dirac remains open |

Abstract p.1,§8.7 comparison p.19,Figure 11 p.20,conclusion pp.24–25,Table 2 p.25 chain bridges into stronger conclusions. They inherit object/hypothesis gaps above;“Proven”/“Framework” labels add no evidence. Table 2 is not full 39-block inventory;retain remarks,definitions,scope conflicts.

## Limits and additions already in final v12/ancestor

All 66 v12 blocks/pages are in `CLAIM_MAP.json`. Main table retains v13-checkpoint status;latest conclusions require continuation overlays. Do not extract an early “open” field and redo completed scalar results.

Ancestor no longer adopts every v7 strong claim:sublevel `3/4`,capacity no-go,full-line Plancherel/Dirichlet–Hardy/Bohr–Haar,normalization-defect sheaf,ambient SU(2)/arithmetic scope,mass-scale obstruction,power Poisson commutation,circle eta=0 added. Also explicit complex A3 residual,Milnor fiber/MHS,two distinct figure-eights,weighted-phase amplitude/clock no-go,actual principal-curvature cusp obstruction. Not already v7 results;not all no-go statements newly withdrawn now.

Later final-v12 Green,Krein,twisted-Dirac,Pin claims particularly need separation:

| Final-v12 location | Existing evidence/open gap |
| --- | --- |
| §§3–6,pp.4–13 | Actual global atlas,interior dipole,square-root lifting,chosen complexification,cusp/phase scope corrected. Historical moment-compatible realization unrecovered;no proved necessity of “bicomplex” structure irreplaceable by two complex components |
| §§7,8.1–8.7,pp.14–19 | Scoped Mellin measure/domain,finite Gram,Hardy/Haar,ordinary normalization defect results. v12 7.2 correctly denies half-line SA extension,7.3 limits generalized eigenfunctions,8.7 canonical condensed structure |
| 8.8–8.11,pp.20–21 | Polar fold,completed source,specified Galerkin,capacity/fixed-Dirichlet form corrected. Finite Galerkin/zero capacity do not replace graph-domain/Dirac proofs |
| 8.12,p.22 | Standard cross-cap front/seam computations scoped;0.03 does not prove all original actual weighted-overlap coercivity/full front-seam normal-family/parametrix. A different actual scalar metric/Green proof exists;old incomplete method does not mean specified scalar theorem unproved |
| 8.13–8.17,pp.23–28 | Original `Hmin` compact-support graph closure has infinite outer-boundary modes;original `(2,2)`/exhaustive U(2)/two-dimensional kernel invalid. 0.02–0.03 prove classification,Green coefficients,Markov/reference-length selection,zero-energy data for distinct fixed-outer-Dirichlet restriction `A=HF restricted to ker τ`;do not conflate operators |
| 8.18–8.19,pp.28–30 | Ordinary normalization-defect→point-Green sheaf support/odd-even obstruction;0.03 scalar limiting parity. New sign-twisted/spinorial/derived bridge unsupplied |
| 8.20–8.21,pp.30–32 | Sign-twist/exact-cone model computations;actual Whitney twisted-Dirac closed domains,graph estimates,overlap/gauge control,extra-mode exclusion,chiral/full quotient dimensions unfinished. Scalar metric/cone-channel counts insufficient |
| 8.22–8.24,pp.32–35 | Finite first-order kernel/Z4/Clifford data,regular-cut conditional Green algebra retained;actual singular-cut trace spaces,phase-line fiber identification,Pin transmission,self-adjoint/adjoint domains open. Green identity does not remove central Pin sign/overall action multiplier |
| 8.25–8.30,pp.35–36 | Constrained-source SU(2) scope,real arithmetic no-go retained. Chosen A3 weight dimensions `(2,1)` belong to rank-three H1,not v7 rank-two ± model. Full nearby/vanishing-cycle maps not determined by monodromy alone;Weil theory extra functorial input |
| 9.1–9.6,pp.36–37 | Scale obstruction,power-coordinate Poisson commutation,sign-circle eta=0 exist;physical mass,clock,capacity,chirality,noncommutative dynamics lack independent realization |

## Currently open for free exploration

No priority order or requirement to finish each item. Choose one,study connections,refute assumptions,or find a better problem in originals.

- **Historical geometric origin/canonicity.** Can a `(cos t,1−cos t)`-compatible state family/independent readout realize S? What phase/coupling/regularity data are additional? 0.02 `(1−u,u)` does not answer historical compatibility;retain scopes of endpoint/three-Hermitian no-go.
- **Essential bicomplex structure.** Main constructions currently use two complex components. Useful provable propositions genuinely dependent on bicomplex multiplication/involution/zero divisors beyond renaming remain to investigate.
- **v7 categorical/arithmetic bridges.** Exact compactology/ringed condensed realization,fold exceptional pullback,canonical deck carrier,Mellin observable sector,six-functor coherence,Frobenius/Weil/weights:which have substantive reasonable corrections,which lack objects or cannot follow? Normalization defect,Bohr–Haar,chosen A3/MHS remain separate,not the unified bridge.
- **Actual singular Dirac/Pin.** Closed operators,maximal/minimal domains,boundary channels for actual Whitney metric after choosing spin/flat phase line/Hilbert density;singular-cut traces,Clifford-compatible fiber maps,gluing,adjoint-domain equality. Exact-cone/regular-cut conditional theorems not completion evidence.
- **Normalization/sheaf–analytic-operator bridge.** Ordinary scalar has support/parity obstructions. Can a meaningful new carrier/morphism make sheaf data compatible with actual graph traces? Matching nearby/cohomological ranks not identity. Chosen A3 specialization/variation maps still incomplete.
- **Fuller actual front/seam analysis.** Beyond established scalar theorem,full weighted-overlap/normal-family/parametrix required by 8.12/8.21 may be studied independently for validity/use. No closed numerical Bη/B0 formula is not a missing scalar-classification proof.
- **Stronger analytic/arithmetic reconstruction.** Finite distinct-frequency Gram/Bohr limit known;infinite families,growing bandwidth,resource-fair reconstruction,log/linear sampling need separately explicit questions. v7 sparsity/aliasing/Weil readings not proved thereby.
- **Independent signal/physical realization.** Capacity/entropy/noise/resources,mass/state selection/units,absolute clock,quantization,genuine spectral asymmetry need testable models. Existing no-go concerns specified data/simple models,not all modeling;shared constants/double covers do not supply particle physics.
- **Originality/prior-work comparison.** Model realizations/actual Whitney metric/Green estimates may be candidate contributions,not established priority. Abstract extension/singular coordinates have literature;identify reuse of author's Ruled/Stokes S. Existing retrieval limits such as Grieser full-text comparison persist;no-match search is not originality certificate.

## Existing results,evidence scope,and operational boundaries

By 0.03 checkpoint:actual scalar point traces,corrected A `(2,2)`/U(2),compact extension resolvents,Krein kernel dimension two,extrinsic log Green normalization,2π pairing,Markov uniqueness,common-reference-length invariant-plane uniqueness,global reflection-matrix symmetry,limiting sheet-even coefficients have written proofs/explicit external theorems. Reference length not physical dilation/RG law;global reflection not local deck isometry;limiting parity not whole-Green deck invariance.

0.03 receipt:180 payload files/181 ZIP members,four PDFs 33 pages rebuilt,in-place/extracted replays. Own Lean 33 named theorems;0.03 adds none,66 unchanged proof/config/verifier inputs bind earlier separate 33 own/224 Ruled/258 Stokes audits,no fresh Lean build. This prompt does not treat historical receipt results as new tests this round.

Preparation only analyzed source/PDF claims,checked source hashes/66 page-first-lines,and generated this prompt;no new proof,main-text modification,mathematical baseline/Lean rerun,PDF rebuild,existing board/claim-map/package change. Attachments not copied/modified;sealed/unrelated work preserved.

Next window chooses methods/topics. Check actual sources/evidence;replay commands in README/board/receipt. Update board at milestones;separate proof,assumption,external theorem,exact computation,finite/numerical evidence,Lean,historical recovery. Preserve unrelated work/immutable archives;formal public actions still require separate author confirmation.
