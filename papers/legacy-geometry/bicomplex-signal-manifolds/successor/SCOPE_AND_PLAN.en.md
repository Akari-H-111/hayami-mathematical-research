# Bicomplex successor papers: scope inventory and publication plan

> **Status (2026-10-03): published.** §0–§13 are historical prepublication scope plans/editorial records; “ask author to confirm,” “not yet public,” “await author reading,” and “next steps” describe that stage and are superseded. Publication in §14,closeout/handoff in §15;current entry/open questions in [`../README.md`](../README.md), “Start here.”

2026-10-02. Author approved the architecture: two new papers plus a superseded notice on the old ResearchGate page. This is paper one's scope inventory; **author confirmation is required before main-text integration**. Planning only,no added mathematical claims.

## 0. Public-record state (2026-10-02 read-only readback)

This section comes from read-only browser inspection. Signed in as the author,no editing,upload,or hiding controls clicked.

- ResearchGate publication `408878000`:Preprint,2026-7 (July),DOI `10.13140/RG.2.2.17048.15361`,CC BY 4.0.
- Two public files:`…v12.pdf` (default display,internal date August 2026),`…v11.pdf`. Only v12 is local (hash-locked authority). **v11 contents not yet checked locally.**
- **Public description (abstract field) still uses v7-era text,different from v12 main text.** It still claims:
  - Momentum map plus power constraint “derive” the surface;
  - “Exactly two” immersion singularities;
  - Condensed/compactological realization;
  - Connection through Artusa's Weil-étale/Pontryagin duality;
  - 「`i*Ψ^!Z ≅ Z[−1]`」fold smoothness failure；
  - Akari–Hilbert endomorphism of the constant condensed sheaf；
  - `C = √5 ln S` (marked conjectural).

  Continuation 0.04 therefore corrects **currently public content**;cite the public description without publishing the unpublished v7 draft.

## 1. Paper one: corrected successor to the old page

**Positioning:** explain what this signal model can/cannot realize,and correct v12/public description individually.

**Language:** English. **Estimated length:** approximately 18–22 main-text pages plus correction appendix.

### Title candidates (author to choose or revise)

| Candidate | Explanation |
| --- | --- |
| A (recommended) *Realization Limits of the Bicomplex Signal Surface: Analytic Rigidity, Observation Monodromy and Corrections* | Retains “Bicomplex Signal” for discovery from old page;removes refuted “Geometric Realization”;explicit corrections |
| B *The Bicomplex Signal Surface Revisited: What a Moment Map Can and Cannot Realize* | More narrative,but “corrections” absent from title |
| C *Moment-Map Realizations of a Ruled Signal Surface, with Corrections to “Geometric Realization of Bicomplex Signal Manifolds”* | “Bicomplex” not primary noun;directly cites old title |

### Main-text sections and sources

| Section | Content | Sources (relative to bicomplex directory) | Evidence/originality positioning |
| --- | --- | --- | --- |
| 1 | Introduction:old claims,new proofs;relation to Ruled v5,Stokes v5,paper two | — | Expository |
| 2 | Model,completed source,five rank labels;Ψ=(N,M) only defined on D∘ | v13 `prop:atlas`;**cite** Ruled v5 (DOI 10.5281/zenodo.23073642) atlas,five rank singularities,dipole,fold theorems | Published results cited,not counted anew |
| 3 | Realization:quadrature realization,power-coordinate endpoint obstruction,three-Hermitian no-go;phase-invariant/mixed-state no-go;analytic rigidity;C^∞ realization;half source (analytic yes,affine no);edge criterion;bicomplex polynomials also excluded (BC≅C⊕C,multiplication inessential) | 0.02 `thm:realization`,`prop:powerboundary`,`prop:hermitian`;0.04 `prop:gauge`,`lem:analytic`,`thm:rigidity`,`cor:excluded`,`thm:smooth`,`prop:half`,`rem:data` | **Principal new results**;written proofs plus exact/finite replay |
| 4 | Observation monodromy:dipole indices (cite Ruled v5),square-root lifting and return after two circuits;π_*Z of √F cover nonsplit over Z;sign system,normalization defect,fold involution distinct;exceptional-pullback theorem (correct public description) | v13 `thm:dipole`,`sec:sheaf`;0.04 `prop:carrier`,`thm:shriek`,`cor:shift`,`prop:detect` | New decisions plus standard Verdier duality (KNP,Scholze checked) |
| 5 | Residual geometry:sublevel 3/4 and capacity no-go;chosen A3 completion,Milnor fiber,MHS;real link figure-eight;weighted orbit;actual principal-curvature cusp | v13 `sec:residual`,`sec:links`,`prop:cusp`;v12 5.3–5.13 | Mostly standard theory applied to explicit models;cusp model-specific computation |
| 6 | Retained spectral theory (brief):Mellin measure/domain,Gram independence for all T>0 and conditioning,Hardy evaluation,Bohr–Haar;log/linear windows | v13 `sec:mellin`,`sec:gram`,`sec:hardy`;0.04 `prop:windows` | Explicit standard facts,not new |
| 7 | Scope limits:ambient SU(2),length scale in mass ratio,Poisson-commuting power coordinates,sign-circle η=0,Weil realization scope | v13 `sec:limits`;v12 8.25–9.6 | Retain v12's correct limits,not first discoveries here |
| Appendix A | Individual corrections of all 66 v12 blocks/public description (next section) | `claims/CLAIM_MAP.json`,`claims/V7_DRAFT_INDEX.md` | Evidence type per item |
| Appendix B | Verification/formalization scope:verifiers,actual coverage of 33 own Lean theorems | Lean `COVERAGE.md` | No full-text Lean claim |

**Excluded from paper one:** scalar Green/point-interaction theory (paper two);Dirac/Pin (paper two open questions);v7 draft itself (not public;cite public description and v12 only).

## 2. Paper-one appendix A correction classes (66 v12 blocks)

Classification: `claims/CLAIM_MAP.json` audit +0.02–0.04 overlays;individual proof locations added during writing.

| Class | v12 blocks |
| --- | --- |
| Valid (retain,possibly supply domain/assumptions) | 3.2,3.3,4.2,4.3,5.1,5.3–5.13,7.2,7.4,7.5,7.7,7.8,8.1–8.7,8.10,8.16,8.18,8.19,8.25–8.30,9.1–9.6 |
| Statement correction (retain after correction) | 4.1 (F domain),4.4 (incorrect parity interpretation),5.2 (Jacobian sign/orientation),6.1,6.2 (three→five rank labels),7.1 (measure conflict),7.3 (σ>1/2 statement),7.6 (threshold sufficient only;independence all T>0),8.8 (missing remainder),8.9 (corners),8.11 (omitted endpoint),8.17 (scope) |
| Refuted under original definition | 8.13 (H_min (2,2)/U(2)),8.14 (old minimum Markov uniqueness),8.15 (Krein kernel infinite-dimensional,not two-dimensional) |
| Unproved,open questions | 8.12 (actual uniform front/seam estimates),8.21 (actual parametrix);8.20,8.22–8.24 retain only conditional/model results |
| Definition gap,decided here | 3.1 (no analytic readout;noncanonical C^∞ construction exists) |

**Additional public-description corrections:**

| Description claim | Correction |
| --- | --- |
| Momentum map derives surface | Analytic-rigidity theorem |
| “Exactly two” immersion singularities | Five rank labels |
| Condensed/Weil-étale/Pontryagin bridge | No such bridge;v12 7.7,8.5,8.7 limits |
| `i*Ψ^!Z≅Z[−1]` | False;0.04 `cor:shift` |
| Akari–Hilbert endomorphism | End(Z)=Z;0.04 `prop:carrier` |
| `C=√5 ln S` | Withdraw;3/4 resolution law plus capacity no-go |
| “Independent when T>2(M−1)/δ” | Independent for all T>0;threshold controls conditioning only |

> Note: paper-one main text continues v12 3.1–8.9 and 8.25–9.6. Proofs/replacement theory for 8.10–8.24 (Galerkin,capacity,Green/Markov/Krein,Dirac/Pin open questions) in paper two;appendix A lists decisions and points ahead only.

## 3. Paper two (outline,next stage)

- **Provisional title:** *Point Interactions at Whitney Cross-Caps: Logarithmic Green Domains on the Orthogonal-Circle Ruled Surface*.
- **Content:**
  - Capacity,compactness,positive Dirichlet gap (v13 `thm:capacity`,`thm:compact`);
  - Old H₀ infinite-deficiency counterexample (`thm:outer`);
  - Actual point traces/corrected A (0.02);
  - Logarithmic Green coefficients,Markov uniqueness,reference-length uniqueness,parity (0.03);
  - Krein extension。
- **Open questions:** actual singular Dirac/Pin (v13 `sec:spin` conditional results,0.02 curvature Lᵖ).
- **Before publication:** obtain Grieser 2002 full text;compare point-interaction literature on singular surfaces/cones and degenerate Markov uniqueness;choose originality wording accordingly.

## 4. Public workflow (separately per paper)

1. Integrated manuscript → rebuilt claim map/verifier → editorial review (Ruled r1/r2 precedent) → pagewise QA/hash binding → author final-file approval.
2. New Zenodo paper DOI;GitHub source-only release,separate software DOI for Lean/verifier;new ResearchGate entry;all require public readback.
3. Old page `408878000`:retain title,date,DOI,original description,v11/v12 files;prepend superseded notice pointing to new paper and brief main corrections. No deletion/overwrite.
4. Git:after paper-one acceptance,extend branch `research/bicomplex-continuation-0.04`,then decide push scope.

## 5. Author decisions needed

1. Paper-one title:A,B,C,or custom.
2. Include section 5 residual geometry (A3,MHS,link,cusp)? Recommended:these are correct published v12 results and successor should address them.
3. v11 file:correction of public record should check v11's actual claims. Author to supply or permit read-only ResearchGate download of `…v11.pdf` into nonauthoritative `source-registry/historical_drafts/`.


## 6. Author decisions (2026-10-02) and v11 comparison

Author agreed to all recommendations:
- Paper-one title A:*Realization Limits of the Bicomplex Signal Surface: Analytic Rigidity, Observation Monodromy and Corrections*;
- Include section 5 residual geometry;
- Approve v11 download.

v11 obtained/registered under authorization;see `../claims/V11_COMPARISON.md`. Public v12 confirmed byte-identical to local authority.

Conclusion:v11/v12 agree blockwise in 3.1–8.20 except 4.2. v11 equates √F sign reversal with Whitney fold-sheet exchange;needs correction supported by 0.04 `prop:carrier`(3). v11 treats Dirac only in a remark,more cautious than v12. Appendix A therefore uses v12's 66 blocks plus “v11 4.2” and “public description” corrections.

## 7. Paper-one working draft complete (2026-10-02)

`Realization_Limits_Bicomplex_Signal_Surface.tex`/`.pdf`,15 pages,title A. Three exports with zero diagnostics;all 15 pages inspected;hashes in `qa/VISUAL_QA.json`. `../verification/verify_successor_paper1.py` passes,checking:
- v12,v11 hashes;
- Each of 66 v12 blocks appears once in appendix A.3,with classification matching audit;
- All cross-references/citations resolve;
- Chained v13,0.02,0.04 exact-verifier replays.

Appendix A.3 main-text classification:H 43,C 13,S 1,R 3,O 2,M 3,D 1. Initial section 2 grouping shifted:5.10 to C,8.10/8.16 to H,8.17 to C.

Status:**working draft,not editorially reviewed or author-approved for publication**. Next:
1. Editorial r1 (reader perspective:language,paragraphs,proof readability,citation checking);
2. Author reading;
3. Paper-two literature comparison/integration.

## 8. Editorial r1 complete (2026-10-02)

Author supplied analysis and writing direction (inspiring,humble,not defensive),with final judgment delegated to Claude. r1 changes:
- Reinforced Thm 3.8 decoder table,Lemma 3.9 analytic retraction,full Prop 4.3/4.6 arguments,Thm 5.1/5.2 details,Prop 5.3(3) jet calculation;
- Rewrote bicomplex positioning;
- Positive narrative throughout.

Itemwise assessment:`EDITORIAL_R1.md`. 17 pages;verifier,export,pagewise QA PASS. Next:author reading,r2 if needed,then final acceptance. Paper-two literature comparison can proceed alongside.

## 9. First paper-two literature comparison (2026-10-02)

See `PAPER2_LITERATURE.md`. Main results:
- Grieser full text confirms 0.02 coordinates are prior work,0.03 arclength refinement absent;
- Position as cross-cap extension of Colin de Verdière pseudo-Laplacian;
- Suggest general theorem for “compact immersed surfaces with Whitney cross-caps,”S as main example;first prove general global compactness.

Still to obtain:Albeverio et al. classical literature on 2D point-interaction scale/Markov properties.

## 10. Paper two:first general-theorem version complete (2026-10-02)

Author approved expansion and freely using local files,web search,original research. New `Pseudo_Laplacians_Whitney_Cross_Caps.tex`/`.pdf`,9 pages,title *Pseudo-Laplacians at Whitney Cross-Caps: Point Interactions on Surfaces Mapped into Three-Space*.

- **General theorem.** Compact surface mapped to ℝ³,immersed except finitely many Whitney cross-caps;Dirichlet (D) and closed (N) cases. Conclusions:
  - compactness；
  - point traces；
  - (k,k),U(k) extension family,Krein resolvent formula;
  - Universal Green-vector leading term −(1/2π)log d_g (also extrinsic radius);
  - Geometric boundary coordinates,2π pairing;
  - Markov uniqueness,reference-length uniqueness,equal sheet coefficients;
  - Outer boundary must be fixed (counterexample).

  Whitney's theorem includes generic maps.
- **New proofs.**
  - General compactness:sector Hardy estimates plus Rellich;
  - Intrinsic distance d_g=ρ(1+O(ρ^{1/2})),matching Colin de Verdière normalization;
  - Steiner Roman surface:6 cross-caps checked exactly,Whitney determinant ±2;
  - Symmetry gives B_η=rI+γ⊥P⊥+γ∘P∘,at most 3 eigenvalues with multiplicities 1,2,3.
- **Ruled S as example**,with boundary-sector germs;reflection gives 2×2 B_η.
- **Verification.** `verify_successor_paper2.py`,export,all 9 pages QA PASS;records in `qa_paper2/`.
- **Paper-one synchronization.** Companion bibliography updated to new title;only page 17 changed and rechecked.

**Status:**first version,not editorially reviewed. Next:paper-two editorial r1;Albeverio classical references;consider Weyl-law/open questions.

## 11. Paper-two editorial r1 complete (2026-10-02)

r1 changes:
- Clarify Lemma 3.1 kernel;
- Closed-form standard-cross-cap arclength coordinates (exactly verified);
- Complete Dom A* decomposition argument;
- Add Corollary 5.3 (|N_H−N_{H_F}|≤k);
- Add Remark 6.2 (total angle 2π);
- Adjust introduction tone,condense appendices.

Still 9 pages;verifier,export,pagewise QA PASS. Itemwise `EDITORIAL_P2_R1.md`. Both r1s complete;await author reading before publication-scope choice.

## 12. Implementing feedback and figures:both r2 (2026-10-02)

Author forwarded “Realization Limits feedback,”delegated improvement judgment to Claude,and required enough figures,so publication did not begin yet. r2 results:

- **Paper one (20 pages,7 figures,2 tables).** Title *Realization Limits of the Bicomplex Signal Surface: Analytic Rigidity, Smooth Flexibility and Observation Monodromy*;“and Corrections” moved to introduction. Abstract/introduction ask directly,centering analytic rigidity versus smooth flexibility. Rigidity figure (one C₀ state circle/two lines) in §3.2. Old §6 spectral theory/§7 reuse scope moved to appendices B,C,with Organization entry. Precision corrections:D∘ continuity,“sharp distinction,”correction-table 8.10–8.17 concrete paper-two references or direct identities.
- **Paper two (13 pages,4 figures,1 table).** Add “complete”;generic wording “when present,are isolated cross-caps”;emphasize arclength lemma. Setting places operator on source Σ. Theorem 6.1 expanded to four steps including annulus estimate. Proposition 8.1 adds H₀ Krein/buckling statement/proof. Channel-comparison table and refined standard germ G−I=O(ρ log(1/ρ)) (Remark 3.3),a new finding during figure construction.
- **Figures.** `verification/build_successor_figures.py`;hashes in `figures/FIGURES_MANIFEST.json`;both verifiers check them.
- **Verification.** Verifier,export,pagewise QA PASS;`qa/`,`qa_paper2/`. Itemwise assessment:`EDITORIAL_R2.md`.

**Status:**both r2 await author reading,not public. Scope/timing follows §4,§6:two manuscripts,Zenodo DOI,GitHub sources only,new RG entries,old-page superseded notice. Each step follows author final-file approval.

## 13. Captions,labels,pagination:both r3 (2026-10-02)

Author forwarded figure/label suggestions,still delegating judgment to Claude. All adopted after checks;itemwise `EDITORIAL_R3.md`.

- Paper-one Figure 5 colored by actual preimage count. Ψ is even in t,so old “two preimages” applies only near one fold.
- Paper-two Figure 1(b) coordinate explanation corrected.
- Paper-two Figure 2 marks fitted slope and fitting interval.
- Remark 3.3 proves radius ratio ρ_e/ρ=1+O(ρ log(1/ρ)).
- Color scale,arrows,axes,cusp zoom,font size,contents,and float placement corrected.

Page counts unchanged (20,13). Verifier,export,QA PASS. Await author reading,not public.

## 14. Public release complete (2026-10-02)

Author:“Full authorization;follow all of Claude's recommendations.” Both papers/software companion public;authority `releases/candidates/bicomplex-successor-v1-publication.json`,acceptance logs `releases/candidates/bicomplex-successor-v1-acceptance/`.

- **Finalization.** Both `\date`:“October 2026” plus “Version 1”;paper one retains “corrected successor.” Mutual/software DOI citations filled;both evidence appendices cite software. Rebuilt PDFs 20/13 pages;three exports without diagnostics;33 pages rerendered/pagewise inspected;both `VISUAL_QA.json` source,pdf,pdftotext,page-PNG hashes renewed. Four verifiers PASS.
- **Release files.** `releases/candidates/bicomplex-successor-v1/`:two PDFs,two article-source ZIPs,software-source ZIP,SHA256SUMS,deterministically generated by `verification/build_successor_release.py`. Extracted software SHA256SUMS match;`verify.py` replays both successor verifiers and their earlier dependencies PASS;extracted rebuilds of both PDFs match release `pdftotext -layout`,and ten figure hashes match manifest. v7 PDF absent from release files/pushed commits. `verify_continuation_0_04.py` now checks v7 hash if file exists,otherwise prints “not published” and continues;remaining checks unchanged.
- **Lean.** Fresh in-place `verify_lean.py` PASS:33 own theorems,build,status,full axiom audit,proof-hole scan. Partial selected-statement coverage,not formalization of either paper. Depends on same-repository `ruled-surface-v5`,`stokes-caustic-v5`;not rebuilt from software ZIP alone.
- **GitHub.** Only `publish/bicomplex-successor` pushed to `origin/main` (fb9e1c1→aceb055,fast-forward);research branch unpushed. Source-only `bicomplex-successor-v1.0` tag/release attaches software ZIP/SHA256SUMS,not paper PDFs;anonymous-download SHA-256 matches local.
- **Zenodo.** Paper one `10.5281/zenodo.23103026` (concept `…23103025`),paper two `10.5281/zenodo.23103056` (concept `…23103055`),software `10.5281/zenodo.23103299` (concept `…23103298`). Metadata shown before publish. Official API,anonymous-download SHA-256 of six files (matches local),doi.org resolution (six DOIs all 200) read back.
- **ResearchGate.** New `415154912` (paper one),`415164048` (paper two):Preprint,CC BY 4.0,single Jian-Yu Huang (removed automatically extracted duplicate alias),Zenodo DOI,public PDF only. Terms author-approved contemporaneously. Official signed-in PDF downloads match Zenodo SHA-256. Old `408878000`:prepend superseded-by only (two DOIs,two entries,four corrections);title,date,DOI,v11/v12,original description retained.

### Failures and handling (honest record)

- New DOI line caused one Overfull hbox in paper-one rebuild;export failed under rules. Breakable DOI typesetting repaired it;three exports passed.
- Zenodo background-tab buttons did not refresh;resource-type/DOI controls ineffective. Signed-in session used official REST to create draft/reserve software DOI,equivalent to buttons. Two previously rejected operations (DOI reservation,Git history) executed only after contemporaneous author permission.
- First publish blocked by validation (missing publisher);added `Zenodo`,corrected rights format;three records published.
- Python `urllib` had one IncompleteRead on download readback;`curl` retry completed,not a file issue.

### Scope and limitations

- Same-machine/interpreter readback,not independent-host evidence.
- RG readback requires login;no anonymous-access claim.
- Local `main` (5803d6a) neither merged nor pushed,with other windows' uncommitted work;author must separately synchronize (`git fetch`,then handle origin/main divergence).
- Repository `CITATION.cff` preferred-citation remains Stokes companion,unchanged.
- Open:actual singular Dirac/Pin,historical moment-map derivation (new construction only,not recovery),originality priority (paper two extends CdV pseudo-Laplacian to cross-caps;coordinates are Grieser prior work).

### Supplement:ResearchGate galleries (2026-10-02,author request)

Both new galleries complete,following Ruled `415049397`:paper one `415154912` has 7 images (RG auto-extracted 6,7 captions cleaned of PDF extraction errors;1–5 newly uploaded),paper two `415164048` has 4. Original `successor/figures/` converted at 300 dpi to PNG;captions entered individually. Signed-in old/new-page readback confirms order,captions,URL slugs. Record:`releases/candidates/bicomplex-successor-v1-figures-publication.json`. First batch paper-one figure 5 discarded without caption,reuploaded.

**Unfinished:**old `408878000` opening wording and new-entry Unicode-description polish blocked by “Edit limit reached,”not bypassed;pending text `releases/candidates/bicomplex-successor-v1-researchgate-pending-edits.md`. Existing correct notice can remain.

## 15. Closeout and handoff (2026-10-03)

Documents/Git only;no proofs,PDFs,figures,release files,QA records,sealed archives changed. Current entry/open questions:[`../README.md`](../README.md), “Start here.”

### 15.1 Final state (actual source,public readback,download hashes;2026-10-03 recheck)

| Item | State | Evidence |
| --- | --- | --- |
| Zenodo paper one `10.5281/zenodo.23103026` (concept `…23103025`) | Published (`state=done`,`submitted=true`),v1,CC-BY-4.0 | Official API;anonymous PDF/source-ZIP SHA-256 matches `releases/candidates/bicomplex-successor-v1/SHA256SUMS.txt` |
| Zenodo paper two `10.5281/zenodo.23103056` (concept `…23103055`) | Same | Same |
| Zenodo software 1.0 `10.5281/zenodo.23103299` (concept `…23103298`) | Published,Apache-2.0 + CC-BY-4.0 | ZIP/SHA256SUMS download SHA-256 hashes match |
| Six DOIs | All doi.org 200 to correct Zenodo records | 2026-10-03 |
| GitHub tag/release `bicomplex-successor-v1.0` | Published,not draft/prerelease,target `aceb055`,source-only | Two asset digests/anonymous SHA-256 match local |
| ResearchGate new `415154912`,`415164048` | Public;title,October 2026,Zenodo DOI,CC BY 4.0,single author readback (2026-10-03);galleries 7+4 (2026-10-02);signed-in PDF SHA-256 matches Zenodo (2026-10-02) | Signed-in public pages;`bicomplex-successor-v1-publication.json`,`…-figures-publication.json` |
| ResearchGate old `408878000` | Title,July 2026,DOI,v11,v12,original description retained;superseded-by first (2026-10-03). Wording polish **unfinished** | RG Edit limit (2026-10-02,10-03);text in `releases/candidates/bicomplex-successor-v1-researchgate-pending-edits.md` |
| Private drafts,reserved unpublished DOIs | None. Two unrelated older unpublished account drafts untouched (22668482:Inverse-Leibniz draft,2026-09-09;22664115:untitled,2026-09-08) | Account `is_published:false` list |

Failures/handling:§14 export Overfull,background Zenodo buttons,first publish missing publisher,`urllib` IncompleteRead;also paper-one RG figure 5 discarded without caption (reuploaded),RG Edit limit (**unresolved**),and accidental file truncation below.

New closeout error:script opened a file for writing before reading it,emptying working-tree `papers/legacy-geometry/source-registry/SOURCE_REGISTRY.md` (including another window's uncommitted Ruled paragraphs). Restored from publish branch plus prior displayed 32-line `git diff` hunk. `git diff -U0 publish/bicomplex-successor -- this-file` now has only original `@@ -18,0 +19,32 @@` hunk;first paragraph byte-identical to sealed Ruled v0.03 payload copy,latter two restored verbatim from displayed diff with no second comparison source. Ruled window should `git diff` this file for related unsaved changes. Lesson in `LESSONS.md`.

### 15.2 Git (state at closeout start)

- `main` at `5803d6a` (local-only unrelated SAMT-record commit);`origin/main`,`publish/bicomplex-successor` at `5959e1e`;`bicomplex-successor-v1.0` tag at `aceb055`;local-only `research/bicomplex-continuation-0.04` at `2997135`,private v7 PDF,never push.
- `main`,`origin/main` diverge from `fb9e1c1` (main 1 extra,origin 11). `git merge-tree --write-tree main origin/main` has no conflicts;working tree blocks synchronization;see “Local main synchronization” in `../../../../EXTERNAL_ACTIONS.md`.
- Working tree has 93 `git status --short` items,approximately 47 unrelated to bicomplex (`git status --short | grep -vi bicomplex | wc -l`;includes shared other-series text,Ruled,information topology,SAMT,SA-MGHP). None staged,committed,moved,deleted;shared docs changed only in bicomplex blocks. Another window changed `AGENTS.md`;untouched here.
- Isolated closeout commit (temporary `GIT_INDEX_FILE`,`git commit-tree`,`git update-ref`) on `publish/bicomplex-successor`,scope bicomplex files/shared bicomplex text,pushed to `origin/main` under existing author approval. No new tag/release.
- **v7 check beyond working tree:**v7 blob `30dec24d…` absent from reachable objects of `origin/main`,all remote tags,`publish/bicomplex-successor`;remote only main/five tags;all member SHA-256 in three release ZIPs differ from v7 `6cefa525…`. Only local `research/bicomplex-continuation-0.04` contains it.

### 15.3 Checks this round (2026-10-03)

- legacy baseline（`verification/legacy-reconstruction/verify_all.py`）PASS。
- Eight bicomplex verifiers (revision,continuation,0.04,successor 1/2,local algebra,spectral algebra,crosscap models) PASS on both interpreters (`PY_LEGACY`,`PY_TAGD`);rebuilt `build_claim_map.py` leaves `CLAIM_MAP.json`/`.md` SHA-256 unchanged.
- Document checks:new/modified-line links/paths resolve in working and publish trees (exceptions `V/` abbreviation,branch names,intentionally private v7 path);three DOIs/two RG entries correspond;Start here has no current “unpublished”/“publication hold” wording,only one explicitly quoted old receipt label.
- Not rerun:Lean (last fresh in-place PASS 2026-10-02,not this round),PDF/figure rebuilds (2026-10-02),old sealed-checkpoint `verify.py`. Files unchanged,no new PDF/QA/hash bindings needed.

### 15.4 Document changes this round

Bicomplex:`README.md` (“Start here”,historical labels),this file (top status/this section),`PUBLICATION_HANDOFF_PROMPT.md`,`../NEXT_THREAD_PROMPT.md`,`../HISTORICAL_CLAIMS_NEXT_THREAD_PROMPT.md`,`EDITORIAL_R2.md`,`EDITORIAL_R3.md` (history labels),`claims/LEDGER.md`,`claims/MODULE_INDEX.md`,`proofs/ORIGINALITY_AND_GAPS.md` (status);Lean:`COVERAGE.md`,`RESEARCH_STATUS.md`;shared:`RESEARCH_BOARD.md`,root `README.md`,`ESTABLISHED_WORKS.md`,`EXTERNAL_ACTIONS.md`,`LEAN_ROADMAP.md`,`RESEARCH_DIRECTIONS.md`,`papers/legacy-geometry/source-registry/SOURCE_REGISTRY.md`,`LESSONS.md`.

Deliberately unchanged:`claims/CLAIM_MAP.json`/`.md` (generated,stable hashes),`SPECTRAL_AUDIT.md`,`REFERENCE_AUDIT.md`,`V7_DRAFT_INDEX.md`,`V11_COMPARISON.md`,all PDFs,figures,`qa*/VISUAL_QA.json`,receipts,sealed packages/published files,`CITATION.cff` (repository preferred-citation remains Stokes companion).

### 15.5 Still pending

1. Old RG `408878000` superseded-by wording polish after Edit limit lifts;optionally Unicode math in two new descriptions.
2. Local `main`/origin/main synchronization by author,after committing/stashing other windows' work.
3. No mandatory mathematical task. Open questions in README “What is genuinely open”;refuted originals are not targets.
