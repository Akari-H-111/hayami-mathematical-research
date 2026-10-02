# Bicomplex signal manifolds

## Start here (current as of 2026-10-03)

**Status: published.** The 2026 ResearchGate preprint *Geometric Realization of
Bicomplex Signal Manifolds* (record 408878000, files v11 and v12) has been
corrected and succeeded by two preprints and a verification companion, all public
since 2026-10-02. The old record is kept; its page now opens with a
superseded-by note. To learn the current mathematics, read the two papers below;
this README is the map. Suggested order for a new window:
[`../../../RESEARCH_BOARD.md`](../../../RESEARCH_BOARD.md) → this section → paper 1
→ paper 2 → [`successor/SCOPE_AND_PLAN.md`](successor/SCOPE_AND_PLAN.md) §14–15 →
[`proofs/ORIGINALITY_AND_GAPS.md`](proofs/ORIGINALITY_AND_GAPS.md) (open obligations).

### Published items

| Role | Item | Source in this repository | Public identifiers |
| --- | --- | --- | --- |
| Paper 1 | *Realization Limits of the Bicomplex Signal Surface: Analytic Rigidity, Smooth Flexibility and Observation Monodromy*, v1 (20 pp., 7 figures, 2 tables) | [`successor/Realization_Limits_Bicomplex_Signal_Surface.tex`](successor/Realization_Limits_Bicomplex_Signal_Surface.tex), `.pdf` | Zenodo `10.5281/zenodo.23103026`; ResearchGate 415154912 |
| Paper 2 | *Pseudo-Laplacians at Whitney Cross-Caps: Point Interactions on Surfaces Mapped into Three-Space*, v1 (13 pp., 4 figures, 1 table) | [`successor/Pseudo_Laplacians_Whitney_Cross_Caps.tex`](successor/Pseudo_Laplacians_Whitney_Cross_Caps.tex), `.pdf` | Zenodo `10.5281/zenodo.23103056`; ResearchGate 415164048 |
| Software 1.0 | *Verification Companion for Realization Limits and Pseudo-Laplacians at Whitney Cross-Caps*: verifiers, figure generator with hash manifest, claim map, Lean project (33 theorems, partial coverage) | `releases/candidates/bicomplex-successor-v1/bicomplex-successor-v1.0-software-source.zip` | Zenodo `10.5281/zenodo.23103299`; GitHub release `bicomplex-successor-v1.0` (source-only, no paper PDFs; the tag dereferences to commit `aceb055`) |
| Old record | ResearchGate 408878000 (v11/v12 files and original description kept) | — | `10.13140/RG.2.2.17048.15361` |

Zenodo concept DOIs (all versions): `10.5281/zenodo.23103025`, `…23103055`, `…23103298`.
All six DOIs resolve (checked 2026-10-03).

Release files and records:

- `releases/candidates/bicomplex-successor-v1/` — the published PDFs, the two article source zips, the software zip and `SHA256SUMS.txt`.
- `releases/candidates/bicomplex-successor-v1-publication.json` — Zenodo, GitHub and ResearchGate readback, download SHA-256 values, DOI resolution and the authorization record.
- `releases/candidates/bicomplex-successor-v1-figures-publication.json` — the ResearchGate figure galleries (7 + 4 figures).
- `releases/candidates/bicomplex-successor-v1-acceptance/` — replay logs (in-place, extracted zip, Lean).
- `releases/candidates/bicomplex-successor-v1-researchgate-pending-edits.md` — the one unfinished platform edit.
- [`successor/SCOPE_AND_PLAN.md`](successor/SCOPE_AND_PLAN.md) §14–15 — narrative, failures, limits and the closeout.

### How the versions relate

| Material | What it is | Status | Where |
| --- | --- | --- | --- |
| Ancestor TeX `signal_manifolds_v2.tex` | 1,908-line early source; rebuilds to 26 pages | historical; not the final source and not v7 | `source_ancestor/` |
| v7 draft | author-supplied 26-page PDF, SHA-256 `6cefa5258257f3a23e35b5dd5cbe123b7af0ed3319c3a614b1c8d54c94bd654f` | non-authoritative; **private, never distributed** (hash and 39-block index are public) | `claims/V7_DRAFT_INDEX.md` |
| v11 | public ResearchGate file | non-authoritative; equals v12 on 3.1–8.20 except 4.2 | `../source-registry/historical_drafts/`, `claims/V11_COMPARISON.md` |
| v12 | 43-page final PDF with 66 named blocks | the historical claim authority; immutable; SHA-256 `4ebb8f0a7d6e88a6c5cd97f65d224b4e938867cabad54f057d3ceafb24167d5a` | `../source-registry/final_pdfs/` |
| v13 working + companion 0.01 | corrected re-derivation of v12 (17 + 3 pp.); 27 Lean theorems | sealed local checkpoint | `revision/`, `releases/candidates/bicomplex-v13-working-v0.01*` |
| continuation 0.02 | explicit unit-power realization, actual scalar point traces, corrected restriction A (7 pp.); 33 Lean theorems | sealed | `revision/Bicomplex_Realization_Point_Trace_v0_02_working.tex`, `releases/candidates/bicomplex-continuation-v0.02*` |
| continuation 0.03 | actual Whitney Green domains, Markov and reference-length uniqueness (6 pp.) | sealed | `revision/Whitney_Green_Domains_v0_03_working.tex`, `releases/candidates/bicomplex-green-v0.03*` |
| continuation 0.04 | moment-readout rigidity, C∞ construction, exceptional pullbacks, log/linear windows (7 pp.) | unsealed working note; folded into paper 1 | `revision/Moment_Readouts_Exceptional_Pullbacks_v0_04_working.tex` |
| **successor v1** | papers 1–2 and software 1.0 | **published; current** | `successor/`, `releases/candidates/bicomplex-successor-v1*` |

Paper 1 draws on the v13 material (completed atlas, Mellin/Gram appendices,
residual geometry), the 0.02 quadrature realization and all of 0.04; atlas, dipole
and fold results are cited from the published Ruled v5 and Stokes v5 papers. Paper 2 absorbs the v13
compactness results, 0.02 and 0.03, and generalizes them from the ruled surface to
any compact surface mapped into ℝ³ with Whitney cross-caps. The sealed checkpoint
receipts keep their original statuses ("unpublished", "publication hold"); those
words describe their own date only. The v13/0.0x manuscripts are working notes kept in
the repository; they were never published as papers.

### Where the mathematics stands

The 66 named blocks of v12, classified in paper 1, Appendix A.3. The table agrees
with `claims/CLAIM_MAP.json` and is checked by `verification/verify_successor_paper1.py`.

| Class | n | Blocks | Meaning |
| --- | ---: | --- | --- |
| H | 43 | 3.3 4.2 4.3 5.1 5.3–5.9 5.11–5.13 7.2 7.4 7.5 7.7 7.8 8.1–8.7 8.10 8.16 8.18 8.19 8.24–8.30 9.1–9.6 | holds, with the domain or hypothesis made explicit where needed |
| C | 13 | 3.2 4.1 4.4 5.2 5.10 6.1 6.2 7.1 7.3 8.8 8.9 8.11 8.17 | statement corrected; the corrected form is proved |
| S | 1 | 7.6 | strengthened: independence holds for every T>0; the old threshold only controls conditioning |
| R | 3 | 8.13 8.14 8.15 | refuted as defined: the compact-core minimum H₀ has infinite deficiency, its Markov uniqueness fails, its Krein kernel is infinite-dimensional |
| O | 2 | 8.12 8.21 | open: uniform front/seam estimate for the actual germ; actual Dirac parametrix |
| M | 3 | 8.20 8.22 8.23 | model-level or conditional (exact cone, chosen Pin conventions, regular cut) |
| D | 1 | 3.1 | definition missing; settled in paper 1 (no analytic readout exists; C∞ readouts exist and are not canonical) |

Other refuted or withdrawn statements (v7 draft, v11, public description): `i*Ψ^!Z ≅ Z[−1]`
on the fold locus; the ±1 sector decomposition of the constant sheaf; v11 4.2
(sign reversal of √F equals exchange of the sheets of a fold); "exactly two immersion
singularities" (there are five rank labels); `C = √5 ln S` (replaced by the 3/4
resolution law plus a capacity no-go).

New results in the papers (evidence codes are defined below):

| Result | Where | Evidence |
| --- | --- | --- |
| Analytic rigidity: for the original assignment `|z₁|²=cos t` no readout real-analytic along `C₀={z₁=0}` realizes S; this excludes affine, polynomial and bicomplex-polynomial readouts; phase-invariant and mixed-state readouts fail with no regularity | paper 1: Lemma 3.5, Prop. 3.4, Thm 3.6, Cor. 3.7 | W, E |
| Smooth flexibility: an explicit C∞ readout realizes S; each half of the source has a real-analytic readout but no affine one; other powers admit a quadratic readout | Thm 3.8, Lemma 3.9, Prop. 3.10, Thm 3.2 | W, N, L |
| Interior dipole with two-traversal restoration of √F; polar fold of local degree zero | Thm 4.1, Prop. 4.2 | W, E, L |
| Carriers of the monodromy: `End(ℤ)=ℤ`; `π_*ℤ` is indecomposable over ℤ and splits over ℤ[½]; distinct from the fold involution and from the normalization defect | Prop. 4.3 | W, E |
| Exceptional pullback `Ψ^!ℤ` of a continuous planar map on a convex domain is the extension by zero; folds are seen by the comparison map of cohomological smoothness | Thm 4.4, Cor. 4.5, Prop. 4.6 | W, X |
| Residual geometry: 3/4 sublevel law, explicit A₃ completion with Milnor and Hodge data, node/node/cusp trichotomy | Thm 5.1, 5.2, Prop. 5.3 | W, X, E, N |
| Metric at a Whitney cross-cap is Euclidean up to `O(ρ^{1/2})` in an arclength coordinate (`O(ρ log(1/ρ))` for the standard germ) | paper 2: Lemma 3.2, Cor. 3.4, Rem. 3.3 | W, E, N |
| Zero capacity, compactness and positive gap for the Friedrichs Laplacian | Prop. 4.1, Thm 4.2 | W, X |
| Point traces; point-restricted Laplacian with deficiency indices (k,k), U(k) extensions, Krein resolvent formula, eigenvalue counting | Thm 5.1, 5.2, Cor. 5.3 | W, X |
| Green vectors with leading term `−(1/2π) log d_g`; geometric boundary coordinates with the 2π pairing; Friedrichs is the unique Markov and the unique reference-length-invariant extension; sheet-even coefficients | Thm 6.1, 6.3, Cor. 7.1–7.3 | W, X |
| The outer boundary must be fixed: the compact-core closure H₀ has infinite deficiency; Krein/buckling description | Prop. 8.1 | W, X |
| Examples: Steiner's Roman surface (six cross-caps, Green matrix with at most three eigenvalues); the ruled surface S | Prop. 9.1, Thm 9.2, §9.2 | W, E |

Evidence codes. **W** written proof in the papers or in the `revision/` notes, not
machine-certified. **X** published external theorem used with its hypotheses
checked (`proofs/REFERENCE_AUDIT.md`). **E** exact or symbolic computation by the
verifiers; it checks the algebra the proofs rely on, not the analysis. **N**
numerical or finite replay and figure panels; illustrations, not proofs. **L** Lean
4 / Mathlib: 33 own theorems on selected statements
(`../../../companions/lean/bicomplex-signal-manifolds/COVERAGE.md`); the PDE,
operator, sheaf and topology arguments are not formalized and neither paper is Lean-formalized.
**H** historical recovery: none claimed. The new constructions are not the missing
derivation of the 2026 draft, and a matching dimension, rank or filename never
identifies them with it.

### Replay

Two interpreters are registered. Never use Python `-O`: the verifiers rely on assertions.
`PY_LEGACY` = `local/cache/python/legacy-reconstruction-venv/bin/python` (Python 3.9.6,
sympy 1.14.0, mpmath 1.3.0; no numpy or matplotlib). `PY_TAGD` =
`/Users/akari_hayami_64/TAGD_Master_Paper/.agent-venv/bin/python` (Python 3.14.6, numpy 2.5.2,
matplotlib 3.11.1, sympy 1.14.0, mpmath 1.3.0). From the repository root; in the table `V/` stands for
`papers/legacy-geometry/bicomplex-signal-manifolds/verification/`:

| Purpose | Command | Interpreter | Last confirmed |
| --- | --- | --- | --- |
| Legacy baseline | `verification/legacy-reconstruction/verify_all.py` | `PY_LEGACY` | 2026-10-03 PASS |
| Successor papers 1 and 2: consistency and exact replay (they also replay the earlier exact verifiers) | `V/verify_successor_paper1.py`, `V/verify_successor_paper2.py` | either | 2026-10-03 PASS on both |
| Earlier verifiers one by one | `V/verify_revision.py` (v13), `V/verify_continuation.py` (0.02), `V/verify_continuation_0_04.py` (0.04), `V/verify_local_algebra.py`, `V/verify_spectral_algebra.py`, `V/verify_crosscap_models.py` | either | 2026-10-03 PASS on both |
| Claim map (deterministic; rewrites `claims/CLAIM_MAP.*` byte-identically) | `V/build_claim_map.py` | `PY_LEGACY` | 2026-10-03, hashes unchanged |
| Rebuild the two PDFs (three-pass pdflatex; fails on Overfull, Underfull, warnings, undefined references; overwrites `successor/*.pdf`, so renew `successor/qa/` and `successor/qa_paper2/` if the PDF changes) | `V/build_successor_paper1_pdf.py`, `V/build_successor_paper2_pdf.py` | any, with pdflatex | 2026-10-02 |
| Regenerate the ten figures and `successor/figures/FIGURES_MANIFEST.json` | `V/build_successor_figures.py` | `PY_TAGD` only | 2026-10-02 (hashes reproduced in a clean extraction) |
| Assemble the release files (deterministic zips; standard library only) | `V/build_successor_release.py` | any python3 | 2026-10-02, run with `PY_TAGD` |
| Standalone replay | unzip the software zip, then `python -B verify.py` | either | 2026-10-02 PASS |
| Lean (Lean 4.33.1; needs the sibling `ruled-surface-v5` and `stokes-caustic-v5` projects) | `companions/lean/bicomplex-signal-manifolds/verify_lean.py` | any python3 | 2026-10-02 fresh in-place PASS, 33 theorems |
| Sealed checkpoints (v13 0.01, 0.02, 0.03) | from the candidate root `releases/candidates/<checkpoint>/`: `python -B verify.py` (`--lean` adds fresh complete Lean audits) | `PY_LEGACY` (the receipts record Python 3.9.6, sympy 1.14.0) | recorded in their receipts (2026-10-01/02); not re-run in the 2026-10-03 closeout |

The 2026-10-02 and 2026-10-03 runs are the same machine; they are not independent-host evidence. The documentation closeout of
2026-10-03 changed no proof, PDF, figure or sealed artifact.

### What is genuinely open

No priority order; none of these is a required next step.

- **Singular Dirac and Pin problem.** A closed twisted Dirac operator on the actual Whitney surface: spin structure, flat sign line, Hilbert density, graph domains, singular-cut trace spaces, Clifford-compatible transmission. The exact-cone and regular-cut results are model cases (blocks 8.20–8.23); blocks 8.12 and 8.21 are the open parts.
- **A sheaf-to-operator bridge.** The normalization defect and the sign carriers of paper 1 have no map to analytic boundary data. The scalar version has an odd/even obstruction. A bridge needs a new sign-twisted or spinorial target, and that is new research.
- **Paper 1 questions.** Does a quadratic readout realize S on a half source under the original powers? Is there a natural principle that selects a non-analytic readout?
- **Paper 2 questions.** Explicit regular parts `B_η`. Whether `ρ log(1/ρ)` is the rate for every Whitney germ and whether the Whitney invariants appear in the next term. A Weyl law and the heat-trace contribution of each cross-cap for `H_F`. Cuspidal edges and `S_k^±` singularities.
- **A use of bicomplex multiplication.** The proved results are statements about two complex components (`BC ≅ ℂ⊕ℂ`); a theorem that truly needs the bicomplex structure is not known.
- **Independent signal or physical models.** Capacity, mass, clock and chirality need models of their own; the coincidences `√5`, dimensions, `2π`, `4π` supply no bridge.
- **Priority and novelty.** The literature comparison is incomplete (`proofs/ORIGINALITY_AND_GAPS.md`); the results are candidate contributions only.
- **Formal coverage.** The analytic and operator proofs have no Lean certificate.

**Closed negatives: not targets.** Existence of an analytic readout for the original assignment;
`i*Ψ^!Z ≅ Z[−1]`; the ±1 sector decomposition of the constant sheaf; the (2,2) classification, Markov
uniqueness and two-dimensional Krein kernel of the old compact-core H₀; "exactly two immersion
singularities"; sheet exchange equals sign reversal; `C = √5 ln S`; the old independence threshold. Any
revival needs new hypotheses, not a repair of the old statement. The historical moment-map derivation is
not recovered and the C∞ readout is not canonical.

### Boundaries and unfinished items

- **Immutable:** the final v12 PDF, sealed ZIPs, receipts and manifests of v13 0.01, 0.02 and 0.03, and the published release files with their `SHA256SUMS.txt`.
- **Private material:** the v7 PDF stays in the untracked `../source-registry/historical_drafts/`; it is never committed, zipped or uploaded. Every commit reachable from `origin/main`, the release assets and the three zips were checked for it on 2026-10-03.
- **Git:** `publish/bicomplex-successor` is the public line and equals `origin/main`; commits are made with a temporary `GIT_INDEX_FILE`, `git commit-tree` and `git update-ref`, without touching `main`'s index or working tree. `research/bicomplex-continuation-0.04` is local only and contains v7: never push it. Local `main` has not been merged with `origin/main`; before syncing, the author must commit or stash the other windows' work (see `EXTERNAL_ACTIONS.md`).
- **Platform tail:** the superseded-by paragraph on 408878000 works but its wording is blunt; a gentler text is saved in `releases/candidates/bicomplex-successor-v1-researchgate-pending-edits.md`. ResearchGate refused the edit with "Edit limit reached" on 2026-10-02 and 2026-10-03. The two new records' descriptions may also be polished with Unicode mathematics.
- **Limits:** ResearchGate pages need a login, so no anonymous access is claimed. The software zip does not build Lean by itself. The repository-level `CITATION.cff` is unchanged.

## Historical snapshots

The sections below are kept as written. Their statements of "next step", "publication hold",
"awaiting author reading" or "not published" described their own dates and are superseded
by the section above.

### Successor papers: pre-publication description (editorial r3, 2026-10-02)

2026-10-02. The author decided to replace the ResearchGate record `408878000`
rather than upload a same-title version. The replacement consists of two new
papers plus a superseded-by notice on the old page. The plan and scope are in
[successor/SCOPE_AND_PLAN.md](successor/SCOPE_AND_PLAN.md).

- **Paper 1**, [successor/Realization_Limits_Bicomplex_Signal_Surface.tex](successor/Realization_Limits_Bicomplex_Signal_Surface.tex):
  *Realization Limits of the Bicomplex Signal Surface: Analytic Rigidity,
  Smooth Flexibility and Observation Monodromy*. It runs to 20 pages, with
  7 figures and 2 tables. It contains the realization theory, the monodromy
  carriers, the exceptional pullbacks and the residual geometry. It cites
  published Ruled v5 and Stokes v5 for the atlas, dipole and fold results.
  The appendices correct all 66 v12 blocks, v11 Theorem 4.2 and the record's
  public description, and collect the classical spectral estimates and the
  scope statements.
- **Paper 2**, [successor/Pseudo_Laplacians_Whitney_Cross_Caps.tex](successor/Pseudo_Laplacians_Whitney_Cross_Caps.tex):
  13 pages, 4 figures and 1 table. It proves the general cross-cap
  pseudo-Laplacian theorem, with the Roman surface and the ruled surface as
  examples. New in r2/r3: the Krein/buckling statement for the compact-core
  closure, and the sharper rates G−I=O(ρ log(1/ρ)) and
  ρ_e/ρ=1+O(ρ log(1/ρ)) for the standard germ.
- Figures are generated by `verification/build_successor_figures.py` (TAGD
  venv: numpy, matplotlib), and their hashes are recorded in
  `successor/figures/FIGURES_MANIFEST.json`. Both verifiers check every
  included figure against the manifest.
- `verification/verify_successor_paper1.py` and
  `verification/verify_successor_paper2.py` pass, as do both exports and the
  all-page QA. See `successor/qa/` and `successor/qa_paper2/`; editorial
  decisions are in `successor/EDITORIAL_R2.md` and `successor/EDITORIAL_R3.md`.
- Public v12 is byte-identical to the local authority. Public v11 is
  registered as a non-authoritative draft; see
  [claims/V11_COMPARISON.md](claims/V11_COMPARISON.md).
- At the time of this description neither paper was approved by the author or published. Both were published on 2026-10-02 (see "Start here").

### Continuation 0.04 (unsealed working note): moment readouts and exceptional pullbacks

2026-10-02. The [new seven-page note](revision/Moment_Readouts_Exceptional_Pullbacks_v0_04_working.tex)
settles two historical questions with new proofs. It does not recover a lost
derivation.

- **Ancestral moment assignment** `(|z1|^2,|z2|^2)=(cos t,1-cos t)`, the same
  in the ancestor, v7 and v12 Definition 3.1. Every state at t=±π/2 lies on
  the circle z1=0, and the two edges there map to a V. Hence no readout
  real-analytic along that circle realizes S, whatever state family is used.
  This excludes affine "projections", real polynomials and bicomplex
  polynomials. Phase-invariant and mixed-state readouts fail with no
  regularity hypothesis. The obstruction is sharp. An explicit continuous
  state family with an explicit C∞ readout realizes S. Each half source
  admits a real-analytic readout but no affine one.
- **v7 draft categorical and window claims.** For every continuous map from a
  convex planar parameter domain, `Ψ^!Z ≅ j_!Z` on the interior. The draft
  fold formula `i*Ψ^!Z ≅ Z[-1]` therefore holds nowhere. The fold is detected
  by failure of the cohomological-smoothness comparison map. The ±1 sectors
  do not exist on the constant sheaf; the square-root-cover carrier is
  indecomposable over Z. The log/linear "arithmetic gap" is a ratio of
  window masses.

The author-supplied 26-page v7 draft is now registered as a non-authoritative
historical draft in `../source-registry/historical_drafts/`. Its 39-block index
is [claims/V7_DRAFT_INDEX.md](claims/V7_DRAFT_INDEX.md), and v12 remains the
claim authority. Evidence is written proofs plus cited Verdier-duality and
six-functor statements. The primary-source retrieval is recorded in
`proofs/REFERENCE_AUDIT.md`. The 0.04 verifier passed exact identities, a
64,881-label finite replay of the C∞ readout and source re-hashing. The
baseline and the earlier exact verifiers were replayed and passed
(`local/cache/bicomplex-audit/continuation-0.04-replay.log`). The 7-page
pdflatex export and the all-page visual QA passed; see
`revision/qa/continuation-v0.04/VISUAL_QA.json`. No Lean theorem was added,
no native-editor compile was run and no sealed package was made. Replay:

```bash
local/cache/python/legacy-reconstruction-venv/bin/python -B papers/legacy-geometry/bicomplex-signal-manifolds/verification/verify_continuation_0_04.py
local/cache/python/legacy-reconstruction-venv/bin/python -B papers/legacy-geometry/bicomplex-signal-manifolds/verification/build_continuation_0_04_pdf.py
```

### Preserved continuation 0.03: originality and actual scalar Green domains

The [originality and gap audit](proofs/ORIGINALITY_AND_GAPS.md) compares the
ancestor, all 66 authoritative v12 blocks and the current drafts. Standard
boundary-triple, singular-metric and Green/Markov frameworks are credited;
priority for the model-specific candidates is not established. The new state
family's powers (1-u,u) differ from the ancestral (cos(t),1-cos(t)) assignment.
The historical moment-map derivation remains unsupported.

The [new six-page proof note](revision/Whitney_Green_Domains_v0_03_working.tex)
proves actual Euclidean Whitney arclength coordinates, a-I=O(rho^(1/2)),
extrinsic-radius logarithmic Green normalization, all corrected A* geometric
coefficients and their Green pairing. It establishes Markov uniqueness,
common-reference-length uniqueness, global reflection symmetry and sheet-even
limiting scalar coefficients for the fixed-Dirichlet restriction A.
The old compact-core H0 retains its infinite deficiency/kernel. Singular Dirac
graph domains, overlap/gauge estimates and phase/Pin transmission remain open.
These are written proofs using the checked external scalar Holder theorem;
the own Lean inventory remains 33, with unchanged proof inputs. Native compilation,
six-page visual QA, exact identities and working four-PDF/33-page isolated
text/render replay passed. Original/ZIP replay, 180 payload hashes, 181 ZIP
members/CRC and final bindings passed. The [0.03 acceptance receipt](../../../releases/candidates/bicomplex-green-v0.03-receipt.json)
discloses prior complete Lean audit reuse with all 66 proof/config/verifier
inputs unchanged, no fresh Lean build and no added Lean theorem. The sealed
0.01/0.02 payloads, manifest and ZIP hashes remain unchanged.

Replay this new checkpoint from the repository root with the registered Python:
`local/cache/python/legacy-reconstruction-venv/bin/python -B releases/candidates/bicomplex-green-v0.03/verify.py`.
Append `--lean` to perform fresh complete audits; the default binds the prior
33/224/258 audit evidence and replays current baseline/exact/claims/all PDFs.

### Preserved continuation 0.02 checkpoint

The [new research manuscript](revision/Bicomplex_Realization_Point_Trace_v0_02_working.tex)
and its [seven-page PDF](revision/Bicomplex_Realization_Point_Trace_v0_02_working.pdf)
adds a global continuous unit-power quadrature realization, its necessary
power-coordinate endpoint obstruction, and a three-Hermitian-observable no-go.
An explicit singular-coordinate metric comparison and the external scalar
Holder theorem establish actual graph-bounded, surjective two-point traces.
The corrected fixed-Dirichlet restriction now has a written (2,2)/U(2)
classification, actual resolvent boundary triple and rank-two resolvent formula.
Actual curvature is locally Lp for p<3/2; explicit logarithmic coefficients and
singular Dirac/Pin transmission remain open. Grieser 2002 already established
the Whitney metric coordinate method; no novelty claim is made for that input.
Exact continuation identities and the complete own 33-theorem Lean audit passed.
The seven-page PDF passed native compilation, three-pass export and all-page
inspection. Complete working/original/ZIP replays passed on 2026-10-02,
including separate 33/224/258 audits and isolated rebuild/full-text/all-27-page
render equality. 167-file manifest, 168-member ZIP inventory and CRC passed.
The [new acceptance receipt](../../../releases/candidates/bicomplex-continuation-v0.02-receipt.json)
discloses same-host pinned dependency/build cache reuse. The original 0.01
checkpoint and receipt remain unchanged.
The verified v13 checkpoint and the historical files below remain unchanged.

2026-10-01. `FULL CLAIM AUDIT / LOCAL CHECKPOINT VERIFIED / PARTIAL LEAN / PUBLICATION HOLD`.

The [research board](../../../RESEARCH_BOARD.md) is the shared status entry.
[NEXT_THREAD_PROMPT.md](NEXT_THREAD_PROMPT.md) was the complete instruction for
this execution; its earlier handoff-only checkpoint is historical.

### Preserved v13 results and current continuation

The final-v12 source hash and a fresh full legacy baseline passed. Physical
and printed pages agree; Section 7 is pages 14–16. The complete
[claim map](claims/CLAIM_MAP.md) covers all 66 named blocks, with original
statements in [JSON](claims/CLAIM_MAP.json). Abstract/conclusion, definitions,
figures and old status-table assertions are also covered. No result is accepted
from a historical “proven” label alone.

The new [v13 manuscript](revision/Bicomplex_Signal_Manifolds_v13_working.tex)
contains actual proofs and necessary corrections: all-five-point completed
atlas, genuine polar fold charts, dipole/root lifting, sublevel asymptotics,
explicit A3 completion, link/orbit/cusp distinctions, measure-dependent Mellin
adjoints and Hilbert domains, finite-time Gram independence/conditioning,
Hardy/Haar, capacity, actual compactness and positive fixed-Dirichlet gap.
The endpoint corners are included in the global compactness proof.

The old compact-core minimum has infinite outer-boundary deficiency and
harmonic spaces, contradicting its claimed (2,2)/exhaustive U(2) classification.
Its actual reduced positive Krein spectrum and buckling correspondence remain
valid under the newly proved hypotheses. Continuation 0.02 establishes a separate
fixed-Dirichlet point restriction, actual graph-bounded traces and exhaustive
resolvent Green domains. Explicit logarithmic coefficients, Dirac parametrices,
overlap estimates and singular-cut phase/Pin transmission remain open.

The [own Lean project](../../../companions/lean/bicomplex-signal-manifolds/COVERAGE.md)
has 33 public named theorems, including quadratures, metric energies, interval
integrals, actual
Gram integrals/eigenvalue bounds, exponential root lifting and genuine
predecessor charts/winding. Written and external results are not promoted to
formal coverage. Full own/dependency audits and PDF/package acceptance are
recorded in its status and checkpoint receipt after completion.

### Files and replay

| Location | Role |
| --- | --- |
| `successor/` | **Published papers 1 and 2**: TeX, PDFs, ten figures with `FIGURES_MANIFEST.json`, page QA (`qa/`, `qa_paper2/`), editorial records, `SCOPE_AND_PLAN.md` (plan, publication record §14, closeout §15) |
| `verification/verify_successor_paper1.py`, `verify_successor_paper2.py`, `build_successor_*.py` | Successor consistency and exact replay, PDF builders, figure generator, release assembly |
| `claims/CLAIM_MAP.json` / `.md` | Complete page-pinned original/correction/proof/formal/gap inventory |
| `claims/MODULE_INDEX.md` / `LEDGER.md` | Current module/claim summaries |
| `proofs/SPECTRAL_AUDIT.md` | Earlier spectral re-derivation, with corrected page convention |
| `proofs/REFERENCE_AUDIT.md` | Primary theorem hypotheses and retrieval limits |
| `verification/build_claim_map.py` | Re-extract hash-locked v12 and rebuild the audited 66-block map |
| `verification/verify_revision.py` | New independent actual derivative/jet/metric/adjoint/counterexample replay |
| `verification/verify_continuation.py` | Realization/Bloch/metric-coordinate/curvature identities; no PDE certification |
| `verification/verify_continuation_0_04.py` | 0.04 source hashes, edge/skew-line algebra, C∞ readout replay, half-source chart identities, fold/winding/idempotent inputs, window kernels |
| `claims/V7_DRAFT_INDEX.md` | Registered v7 draft identity, 39-block inventory and 0.04 determinations |
| `verification/verify_local_algebra.py`, `verify_spectral_algebra.py`, `verify_crosscap_models.py` | Unchanged historical exact verifiers |
| `verification/build_revision_pdfs.py` | Three-pass export of native-checked standalone sources, fail on overfull/undefined diagnostics |
| `verification/verify_working.py` | Complete baseline/exact/own+dependency audits and isolated all-page PDF rebuild acceptance |
| `revision/` | Preserved v13 and companion 0.01 plus research continuation 0.02; source/PDF/native diagnostics/QA |
| `../../../companions/lean/bicomplex-signal-manifolds/` | Own proof sources, pinned dependencies, complete axiom inventory and coverage |
| `source_ancestor/` | Preserved 1,908-line TeX and its two original figures |
| `../source-registry/final_pdfs/Geometric_Realization_of_Bicomplex_Signal_Manifolds_v12.pdf` | Immutable 43-page authority |

From the repository root, without Python `-O`:

```bash
local/cache/python/legacy-reconstruction-venv/bin/python -B verification/legacy-reconstruction/verify_all.py
local/cache/python/legacy-reconstruction-venv/bin/python -B papers/legacy-geometry/bicomplex-signal-manifolds/verification/build_claim_map.py
local/cache/python/legacy-reconstruction-venv/bin/python -B papers/legacy-geometry/bicomplex-signal-manifolds/verification/verify_revision.py
local/cache/python/legacy-reconstruction-venv/bin/python -B papers/legacy-geometry/bicomplex-signal-manifolds/verification/verify_continuation.py
local/cache/python/legacy-reconstruction-venv/bin/python -B companions/lean/bicomplex-signal-manifolds/verify_lean.py
local/cache/python/legacy-reconstruction-venv/bin/python -B papers/legacy-geometry/bicomplex-signal-manifolds/verification/verify_working.py
```

Audit the unchanged Ruled and Stokes projects independently with their own
`verify_lean.py`. PDF export uses the existing pdflatex; source compilation is
also checked by the native editor. Pagewise visual QA, hashes and same-host
original/ZIP replay are recorded separately from mathematical proofs.

The preserved checkpoint had two standalone sources with native compilation; the 17-page
manuscript and 3-page companion passed three-pass export and all-page visual
inspection. `revision/NATIVE_COMPILATION.json` and
`revision/qa/VISUAL_QA_FINAL.json` bind the actual source/PDF/render hashes.
The original-tree and ZIP replay results belong to the checkpoint receipt.
The working-tree complete replay passed, including isolated three-pass PDF
rebuild, exact full-text equality and all 20 page-render hashes. The frozen
checkpoint is `releases/candidates/bicomplex-v13-working-v0.01/`; final
manifest/CRC and original/ZIP acceptance is recorded in the adjacent receipt.
The frozen payload has 155 manifest entries; ZIP inventory/CRC passed with
156 members. Its `METADATA.json` and `PUBLICATION_PREPARATION.md` keep article,
software version and concept identities separate and state the exact public
scope proposed for future author review. The frozen payload stays unchanged.
Both frozen original and ZIP extraction complete replays passed. The final
[acceptance receipt](../../../releases/candidates/bicomplex-v13-working-v0.01-receipt.json)
binds all replay logs, manifest/ZIP and PDF hashes; the final bindings were
rechecked. This is same-host replay with disclosed pinned package/build cache
reuse. The 66-block audit and 27-theorem formal inventory retain their stated
written/external/open limits. The checkpoint is about 8.1 MiB as a ZIP.

### Source and publication boundary (as of checkpoint 0.01, 2026-10-01)

Historical final-v12 SHA-256:
`4ebb8f0a7d6e88a6c5cd97f65d224b4e938867cabad54f057d3ceafb24167d5a`.
The ancestor plus its two real figures rebuilds to 26 pages; it is not the
missing final source. The new standalone manuscript reconstructs and corrects
later sections from the page-pinned final PDF. All historical PDFs, ancestor
files and sealed releases/receipts remain unchanged.

The 2026-10-01 package was a local research checkpoint with partial formal
coverage. Full Green/Dirac classification is not proved, no new DOI is assigned,
and GitHub/Zenodo/ResearchGate publication requires the author's separate
confirmation of a concrete verified scope. Ruled, Stokes, Papers I–III and
other windows' SAMT/SA-MGHP work retain their prior scope.
