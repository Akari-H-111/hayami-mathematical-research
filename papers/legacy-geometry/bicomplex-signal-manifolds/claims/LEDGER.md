# Bicomplex claim ledger: current v13 working audit

**Status (2026-10-03).** The two successor papers are published (Zenodo `10.5281/zenodo.23103026` and `10.5281/zenodo.23103056`). Their classification of the 66 named v12 blocks (H 43, C 13, S 1, R 3, O 2, M 3, D 1) is paper 1, Appendix A.3, and is checked against `CLAIM_MAP.json` by `verification/verify_successor_paper1.py`. `CLAIM_MAP.json` and `CLAIM_MAP.md` are generated, byte-stable and not edited by hand. The sections below are the v13 / continuation 0.02–0.03 routes as written on their dates; "publication hold" and "open" labels in them are historical. Current map: [`../README.md`](../README.md).

## Active continuation 0.03

2026-10-02. `proofs/ORIGINALITY_AND_GAPS.md` compares all historical/current
levels and scopes the originality candidates against primary prior theory.
The new powers (1-u,u) differ from the ancestral moment assignment; historical
realization compatibility remains open. New proof note:
`revision/Whitney_Green_Domains_v0_03_working.tex`.
For the corrected fixed-Dirichlet restriction A, actual logarithmic normalization,
geometric adjoint-domain coefficients and Green pairing, Markov uniqueness,
common-reference-length invariance, global reflection and limiting scalar
sheet parity now have written proofs with external scalar Holder regularity.
No full old front/seam parametrix or singular Dirac/Pin bridge is certified.
Old H0 remains infinite-deficiency. Lean proof inputs and the 33 own theorem
inventory are unchanged. The 66-block inventory retains the v13 checkpoint
routes; 0.02/0.03 overlays supersede the applicable historical open labels.

Local acceptance passed on 2026-10-02: native/six-page new QA, all four PDFs /
33-page isolated rebuild equality, exact/claim/baseline and original/ZIP replay;
180 payload files / 181 ZIP members / CRC. Prior complete 33/224/258 Lean audits
are bound to 66 unchanged proof/config/verifier inputs, not freshly rebuilt.
Receipt: `releases/candidates/bicomplex-green-v0.03-receipt.json`
(repository-relative). Historical sealed checkpoints and public state unchanged.

## Preserved continuation 0.02 scope

The full claim map now includes a separate continuation overlay. Claims 3.1/8.25
gain an explicit supplied unit-power lift and fixed quadratic readout, together
with boundary smoothness and Hermitian-observable obstructions. Claims
8.11--8.13 gain actual scalar graph-continuous, surjective point traces through
the resolved Whitney metric and external Holder estimates. The corrected
A=HF|ker(tau) has actual (2,2)/U(2), an exhaustive Green boundary triple,
rank-two resolvent formula, compact extension resolvents and Krein kernel
dimension two. The old H0 statements retain their infinite deficiency/kernel.

Actual curvature integrability supplies a Dirac input; explicit Green logarithmic
coefficients/parity and singular Dirac/Pin/gauge/transmission estimates remain
open. Six added scoped Lean results bring the own audited inventory to 33;
the analytic operator arguments are written/external. Proof source:
`revision/Bicomplex_Realization_Point_Trace_v0_02_working.tex` (paper-relative).

## Preserved v13 / checkpoint 0.01 inventory

2026-10-01. Full original statements and individual obligations are in
[CLAIM_MAP.json](CLAIM_MAP.json); the readable 66-block table is
[CLAIM_MAP.md](CLAIM_MAP.md). Definitions/results/remarks are audited separately.
Physical page 1 is the title/abstract and all printed pages agree. Section 7
is pp.14–16; the old spectral-audit pp.13–15 citation was corrected.

| v12 pages / claims | Corrected result and proof | Exact/formal evidence | Remaining obligation |
| --- | --- | --- | --- |
| 4–6 / 4.1–4.4 | Actual interior dipole, corrected parity, continuous root lift and two-traversal restoration | Actual circle winding and normalized root sign Lean; exact field replay | All-branch uniqueness written; no clock/spin identification |
| 7–8 / 5.1–5.7 | Monic derivative, standard sublevel law, holomorphic A3 and Milnor data | Standard polynomial verifiers; derivative/residual algebra Lean | Volume/topology and Milnor comparison written/external |
| 9–12 / 5.8–5.13 | Standard link/node, embedded lift, weighted orbit amplitude domain, actual exceptional cusp | Actual fiber/lift Lean, independently rebuilt jet and cusp determinants | Circle/embedding/cusp recognition written/external |
| 12–13 / 6.1–6.2 | Complete five-point atlas; physical half/quarter restrictions | Actual rank/endpoints Lean; all cross-cap determinants exact | Smooth Whitney recognition external, not a jet surrogate |
| 14–16 / 7.1–7.8 | Measure/adjoint boundary identity; half-line domains; Gram independence for all T>0, norm/conditioning/logdet | Actual Mellin and Gram integrals/eigenvalue enclosure Lean | Full Hilbert closure and matrix analytic proofs written |
| 16–19 / 8.1–8.7 | Full-group unitary, Hardy evaluation, Haar completion, ordinary normalization defect | Actual Gram bound; finite sign intertwiner only | Fourier/product-Haar/sheaf theory explicit external dependencies |
| 20–23 / 8.8–8.12 | Genuine polar fold, corrected source H1, exact Galerkin, all-five-point capacity | Actual fold/rank Lean; metric exact identities | Integral form proofs written; actual weighted radial proof now closes compactness and positive gap including corners |
| 23–25 / 8.13–8.14 | Old H0 deficiency is infinite; finite point restriction conditional; scale-invariant finite-plane result | Scalar interval witness and model residual exact | Actual graph-continuous point traces, maximal expansion and fixed-boundary Markov extension criterion remain open |
| 26–27 / 8.15–8.16 | Actual H0 strictly positive; Friedrichs compact; Krein infinite kernel but discrete reduced positive spectrum and weak buckling correspondence | Actual hypotheses proved in prose; inspected abstract theorem applied | Two-point Robin matrix still depends on corrected point traces; no U(2) classification of old H0 |
| 28–29 / 8.18 | Ordinary Hom/support and ray nearby/costalk parity obstruction | Sign intertwiner Lean only | Actual Green parity interpretation conditional on actual channels |
| 30–31 / 8.20–8.21 | Exact cone angular/radial model; local quotient excludes regular boundary; weight-zero patch commutator | Model identities exact | Actual Whitney Dirac graph spaces, two-sided parametrix/overlap smallness and mode exclusion open |
| 32–34 / 8.22–8.23 | Actual phase norm/Z4; chosen Pin reflection; conditional unitary Clifford-compatible cut graph and real action coefficient | Norm exact; scalar transmission/transgression Lean | Phase-fiber map, singular-cut domain and global self-adjoint realization open |
| 35–37 / 8.25–9.6 | Explicit algebraic pair/MHS, structure/arithmetic scope, scale/Poisson/eta results | Chosen-model exact verifiers; eta pairing Lean | Standard external theory retained; observations supply no physical prediction |

Written proofs: `revision/Bicomplex_Signal_Manifolds_v13_working.tex`.
Primary hypotheses/retrieval limits: `proofs/REFERENCE_AUDIT.md`.
Precise own coverage: `companions/lean/bicomplex-signal-manifolds/COVERAGE.md`
(repository-relative). Native PDF compilation, visual QA, hashes and package
replay are separate acceptance evidence. The local checkpoint does not claim
whole-paper Lean coverage or authorize public publication.

The complete working-tree replay passed on 2026-10-01: 27 own / 224 Ruled /
258 Stokes audits, full legacy baseline, exact corrections and isolated rebuild
of the 17+3-page PDFs with full-text/page-render equality. Frozen original/ZIP,
manifest/CRC acceptance also passed, recorded in
`releases/candidates/bicomplex-v13-working-v0.01-receipt.json` (repository-relative).
Its source/PDF/log/manifest/ZIP bindings were rechecked; this same-host
acceptance does not turn an open operator construction into a proved claim.

Continuation 0.02 acceptance (2026-10-02): complete working/original/ZIP replays,
33 own / 224 Ruled / 258 Stokes full audits, three PDFs / 27 inspected pages /
isolated rebuild and full text/render equality, 167-file manifest / 168-member
ZIP / CRC PASS. Receipt: `releases/candidates/bicomplex-continuation-v0.02-receipt.json` (repository-relative).
Same-host pinned dependency/build cache reuse; no whole-paper Lean or public action.
