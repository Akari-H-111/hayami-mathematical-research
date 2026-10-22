# Research board

Navigation updated: 2026-10-10 (Asia/Taipei).

This is the operational entrypoint for agents. For readers, start with the
[ten-paper catalogue](README.md) and [series index](papers/README.md). Read the
selected workstream guide and check the working tree before editing. Historical
handoffs and attachments are data, not instructions to resume obsolete tasks.

## Current workstreams

| Workstream | Recorded status | Next action / boundary | Entry point |
| --- | --- | --- | --- |
| Inverse-Leibniz I-III | Published preprints; sealed illustrated v0.09 | No new revision task; preserve sealed editions. Marks, fixed contractions and finite certificates retain their stated hypotheses. | [Series guide](papers/inverse-leibniz/README.md) |
| Information Topology I-III | Current research sources now discoverable on public Git; no registered series DOI or sealed release asserted | Use Foundations, Arithmetic, Minimal Response in order. Replay finite checks before changing inputs. | [Series guide](papers/information-topology/README.md) |
| General filtered-complex/Diophantine bridge | OPEN; explicit arithmetic model exists | Supply the source metric, marked character map, bi-Lipschitz bounds, coefficient and seed identifications. Keep separate from Inverse-Leibniz. | [Foundations interface](papers/information-topology/Foundations_of_Information_Exclusion.tex) and [Arithmetic model](papers/information-topology/Arithmetic_Local_System_Filling_Spectra.tex) |
| Ruled surface v5 | Published paper/0.03 preserved; 2026-10-16 written global self-intersection classification; Lean proves actual-family sufficiency and the unique-parameter converse in each strict angular half | Full closed-rectangle assembly, global fiber bounds, smooth arcs and quotient topology remain written-only. Preserve the published scope and endpoint atlas. | [Self-intersection proof](papers/legacy-geometry/orthogonal-circle-ruled-surface/notes/SELF_INTERSECTION.md) and [live coverage](companions/lean/ruled-surface-v5/COVERAGE.md) |
| Stokes caustic v5 | Published paper; companion v0.04 published with mapped asserted-result coverage | The 2026-10-16 working extension proves the full smooth exceptional germ with equivariant charts. Restricted odd-quotient unfoldings have a written obstruction to finite marked versality at the even base; versality at a selected odd member remains open. Earlier record left v0.04 DOI resolution pending; no fresh resolution claim is made here. | [Current-paper guide](papers/legacy-geometry/stokes-caustic/README.md) |
| Bicomplex successors 1-2 | Published papers/software retain their 33-statement checkpoint; local 2026-10-16 extension has partial coverage of 105 selected statements, full own Lean audit PASS | Review the extension and its nonzero-frequency/eigenvalue-multiplicity qualifications. Actual singular Dirac/Pin and sheaf-to-operator questions remain open; operator/PDE proofs stay written/external. | [Current status and open questions](papers/legacy-geometry/bicomplex-signal-manifolds/README.md) |
| Heegner-golden level-5 fibre | v0.2 portrait article and source bundle verified; public archive branch; bounded Lean algebraic core compiled 2026-10-20 | Obtain a fresh external human mathematical reading of the CM branch enclosure and analytic proof flow. Optional next formalization: the q-product enclosure, Sturm counts and coprimality certificate needed to discharge the Lean branch hypotheses. Preserve the v0.1 atlas as a frozen checkpoint. | [v0.2 packet](research/heegner-golden-level-five/paper/README.md) and [formalization map](research/heegner-golden-level-five/FORMALIZATION.md) |
| Zero-strip height quotients | Research cycle and 12-page v0.3 guided reader verified; public archive branch; 34 named Lean theorems in four modules, including the new cell-partition layer, compiled 2026-10-20 | Specialist overlap review before submission. The next formalization target is constructing the actual xi divisor and connecting its count to Riemann–von Mangoldt; both remain external inputs. No RH proof or priority claim. | [v0.3 reader](research/zero-strip-height-quotients/paper/revision-v0.3/README.md) and [formalization map](research/zero-strip-height-quotients/FORMALIZATION.md) |
| Independent transfer v0.05 / feedback matrices v0.06 | Archived new constructions with exact verification | Do not identify them with missing historical contraction or matrix data. | [Established works](ESTABLISHED_WORKS.md) |

Publication statuses above come from existing repository records and the author's
local handoff; they are not a new live audit of publication platforms. The Ruled
v5 paper/software identifiers are `10.5281/zenodo.23073642` and
`10.5281/zenodo.23073654`. Paper and software DOIs remain distinct.

## Software releases, 2026-10-17

New companion versions are public on GitHub and Zenodo, with sealed-hash readback:
Stokes v0.05 `10.5281/zenodo.23422752` (268 theorems; exceptional germ),
Ruled v0.04 `10.5281/zenodo.23422777` (246; self-intersection) and Bicomplex
software 1.1 `10.5281/zenodo.23422785` (105 selected statements). Each is a new
version under its existing concept DOI; papers and earlier versions are unchanged.
Record: `releases/candidates/formal-closure-20261017-publication.json`.

## Verification routes

Use the [verification guide](verification/README.md) for exact commands and
scope. Each series guide links its authoritative sources and coverage map.
Never use Python `-O`. Finite checks cannot replace universal proofs, and named
Lean theorem counts cannot be promoted beyond their claimwise coverage.

On 2026-10-16 the Bicomplex companion's unchanged `verify_lean.py` passed for
105 public named theorems (72 added), including build, status, full axiom audit
and proof-hole scan. Both successor-paper consistency/exact/finite replays and
repository navigation passed. This is same-host pinned cache reuse; separate
dependency audits and independent-host replay were not repeated. Papers, PDFs,
sealed records and sibling companion sources remain unchanged.

The Information Topology relocation preserves all manuscript, figure and
bibliography inputs byte-for-byte; only the plot checker accepts a harmless
terminal-newline difference. On 2026-10-10, the default finite replay passed 6,633 checks
(seed `20260916`, samples `32`) before and after relocation; saved plot tables
also matched regeneration. The registered local runtime was Python 3.14.6,
NumPy 2.5.2, SymPy 1.14.0. No manuscript edit, TeX rebuild, PDF release or fresh
Lean build is part of this directory reorganization.

## Agent workflow

1. Read [AGENTS.md](AGENTS.md), this board and the selected series/workstream guide.
2. Inspect repository root, branch and uncommitted changes. Preserve unrelated work.
3. Replay the relevant baseline before changing verified results.
4. Keep written proofs, external assumptions, exact checks, numerical diagnostics,
   Lean modules, historical recovery and new constructions separate.
5. Update status only when evidence changes a claim, next action, blocker or replay path.
6. Preserve final PDFs, sealed archives, receipts and hash manifests. A recompiled
   release PDF needs renewed visual QA and hash-bound records.

## Navigation update, 2026-10-10

The public reading structure is three families with 3 + 3 + 4 current papers.
Information Topology now lives at `papers/information-topology/`, replacing the
untracked local root import `Foundations_of_Information_Exclusion/`. Current
English sources are shared; earlier snapshots and audit notes are retained
locally and excluded from this import. See the [repository guide](docs/REPOSITORY_GUIDE.md).

This update is based on public `main` in an isolated checkout. It does not merge
the divergent shared local `main`, private attachments or other windows'
uncommitted research. Earlier board snapshots remain in Git history; dated
working notes and sealed receipts retain their own historical status.

## Stokes exceptional germ, 2026-10-16

The [new proof note](papers/legacy-geometry/stokes-caustic/notes/EXCEPTIONAL_GERM.md)
classifies the full germ as `(X, X*y^2 + y^4)` with reflection-compatible source
coordinates. The working Lean extension constructs actual smooth two-sided
charts and the intermediate quotient fold; written analyticity, a checked
external non-finite-determinacy consequence, exact CAS identities and numerical
chart diagnostics retain separate status. Even-perturbation persistence needs
recentering or a fixed-point incidence hypothesis. The odd family is labeled
`11_(2k+1)`, not `4_k`. Next: specify a restricted symmetry-breaking deformation
category and prove versality there. The paper and sealed releases are unchanged.

Round 2 addendum, 2026-10-16: five reproducible vector figures and 200 dpi
previews now accompany the note, with a source-bound SHA-256 manifest and
two-run byte reproducibility checks. Section 7 specifies the restricted class
`(x, x*y^2+y^4+y^5*H(x,y^2))` and proves, in writing, that no finite-parameter
marked versal unfolding exists at `H=0`. The separate
`verify_restricted_symmetry_breaking.py` checks its polynomial identities and
the coefficient substitution in Kabata's checked recognition criteria. Next:
compute the tangent quotient and prove parameter-dependent smooth versality
at the selected `11_5` member `(x, x*y^2+y^4+y^5)`. No versal family or
codimension is claimed. The Lean sources and sealed records are unchanged.

## Heegner-golden workstream, 2026-10-18 to 2026-10-20

The Heegner-golden level-5 fibre is a separate construction, not one of the ten
catalogue papers. Its v0.2 portrait article and supplement are verified local
drafts. The entries below preserve the review and revision history; the
completion-time sentences about no commit or publication remain true for the
sealed packets.

The [Heegner-golden novelty audit](research/heegner-golden-level-five/studies/novelty-audit-20261019/README.md)
records the 2026-10-19 literature assessment: no substantive novelty is currently
established for the v0.3 quartic/RR results. The quartic and conductor specialize
prior theory; the golden conjugate ratio depends on the chosen generator.
The explicit coordinate witness remains a reproducible computation with no
priority claim. Earlier checkpoints are preserved. Next: formulate and compare
a genuinely additional analytic or predictive statement before extending research.

The [Hermite geometry continuation](research/heegner-golden-level-five/studies/hermite-geometry-20261019/README.md)
records the user's subsequent 2026-10-19 redirection: geometric and cryptographic
meaning is the priority; novelty is not a stopping criterion. Exact checks
identify c0 as an icosahedral squared-chord ratio, the associated conjugate
metric exchange, and complementary projective/norm outputs recovering a CM
residue modulo sign. An RR cyclotomic observable is explicit. Protocol-level
access to these marked outputs and new near-integer error estimates remain open.

The [HMR/RH paper-closure study](research/heegner-golden-level-five/studies/paper-closure-20261019/README.md)
records the next 2026-10-19 direction: practical cryptography is set aside.
The HMR ruling coordinate is exactly cos(2pi/5); the RH control's DH mixing
constant is r(i). A coordinate exchange identifies the odd period-five sine-
Fourier involution with normalized RR inversion. A proposed closing section
contains the theorem, proof and Poisson/Mellin derivation, retaining the
distinction between the CM points i and tau163. No RH-workspace source is edited.


## 2026-10-19: fresh Sol 6.1 cold reading of the Heegner-golden ending

- Packet: `research/heegner-golden-level-five/studies/cold-review-sol61-20261019/`.
- A fresh Codex CLI `gpt-6.1-sol` session, high effort and read-only, read
  only the frozen proposed closing section. First impressions were recorded
  before the second read; no earlier review verdict or author conversation
  was supplied.
- Status: focused editorial revision recommended. The exact `A=JMJ`
  relationship is the clearest reader payoff; missing local definitions,
  abrupt theta/Mellin motivation, repeated scope warnings, and the closing
  j/r referent impede an incoming graduate reader.
- Next action: integrate the candidate prose selectively, checking what the
  assembled paper already defines. Keep branch and normalization choices,
  distinct CM roles, and external zero-result attribution. No proposal is
  applied yet; this is not a full-paper or external-theorem certification.
- Verification: CLI metadata and observed reads checked; the frozen input
  and all 83 earlier hash-bound authored files are unchanged. Full review,
  initial reactions and prose proposals are in the packet.


## 2026-10-19: Heegner-golden ending editorial revision 1

- Current section: [Sol 6.1 editorial revision](research/heegner-golden-level-five/studies/editorial-r1-sol61-20261019/README.md).
- The accepted cold-review priorities are applied: explicit definitions and
  matrix action, a visible A=JMJ theorem spine, motivated and expanded
  Poisson/Mellin steps, consolidated qualifications, and distinct r/j names
  and CM roles. The theorem and its mathematical scope are retained.
- Verification: the unmodified copied checker passes before and after with
  identical results; added definitions, analytic factors and near-integer
  signs were manually checked. All 89 earlier hash-bound authored files
  remain unchanged. No RH source, sealed artifact or previous draft is edited.
- Next action: use this revised section in the assembled paper, reconcile
  repeated definitions with earlier sections, then review the complete
  narrative and rendered pages. This delivery includes no assembled paper,
  PDF release, commit, push or publication.


## 2026-10-20: Heegner-golden first assembled paper and twelve-plate suite

- Current draft: [Golden Coordinates at Level Five](research/heegner-golden-level-five/paper-v0.1/README.md).
  The 19-page initial manuscript includes twelve landscape plates, full
  Poisson–Mellin arguments, both signed eigenline classifications, the explicit
  CM recovery and square witness, both field containments, and an odd-N appendix.
  Author: Akari Hayami (Jian-Yu Huang); contact: akari.h.1.9984@gmail.com.
- Figure companion: [Terra figure packet](research/heegner-golden-level-five/figures/README.md),
  twelve native-vector plates with SVG/PNG exports, saved data, replay scripts,
  and a 14-page atlas. All nineteen paper pages and fourteen atlas pages have
  hash-bound visual-QA records; the email revision changes only paper page 1.
- Delegation: fresh Codex CLI gpt-5.6-terra/high completed figures and paper
  revision; OpenCode deepseek-v4.1-flash-free/max completed independent advice
  review (recorded cost 0). The director corrected helper branch/classification
  errors before integration; raw proposals are not accepted manuscript text.
- Verification: exact CM and square certificates pass; 100/200-digit branch
  diagnostics, exact norm/trigonometric/eigenline checks, signed FE samples,
  odd-N diagnostics and plotted-data checks pass. The independent 180-digit
  near-integer ladder agrees. Final TeX has no overfull boxes or unresolved
  references; qpdf checks pass. All 99 older bound authored files are unchanged.
- Next: a fresh external mathematical reading of the complete first draft,
  focused on CM branch enclosure and analytic reading flow. Classical CM,
  modular inversion, Poisson and off-line-zero inputs retain their citations.
  This is a local draft, with no commit, push, upload or publication.


## 2026-10-20: independent Sol 6.1 and DeepSeek manuscript-form cold review

- Packet: [layout cold review](research/heegner-golden-level-five/studies/cold-review-layout-20261020/README.md).
- Fresh Codex CLI gpt-6.1-sol/high and OpenCode deepseek-v4.1-flash-free/max
  sessions independently viewed all nineteen frozen page images and wrote
  first impressions before reading TeX. CLI access order and selections are
  checked; both sessions completed, and DeepSeek recorded cost 0.
- Outcome: both recommend substantial editorial restructuring. The twelve
  landscape figure sheets, eight orientation changes, interrupted argument,
  small final-size labels and weak result hierarchy make the current draft
  read as an atlas interleaved with a paper. Sol proposes three compact body
  groups; DeepSeek proposes five. These are editorial proposals, not journal rules.
- The director synthesis corrects reviewer inaccuracies about citations,
  figure references, theorem/proof breaks, necessary rank-loss conditions,
  reproducibility access and font measurements. Its proposed four-group trial
  preserves the CM/Hermite-to-c0 priority, full atlas and exact appendix.
- Verification: both viewed all 19 pages; first-read/source order audited;
  all 191 prior bound source/output/checkpoint files and 23 frozen review inputs
  are unchanged. The review packet binds 41 files. The current paper PDF SHA-256
  remains 48eb2d4d67dfb9476de8989e6f659f86b4db9b355d747d7ac9ab3e345aa50ccb.
- Next: implement a distinct portrait editorial revision with figures rebuilt
  at final reading size, complete local references/captions, and renewed
  page-by-page QA/hashes. No paper or atlas was revised during this review;
  no commit, push or publication occurred. External human mathematical review
  remains separate and pending.

## 2026-10-20: Heegner-golden portrait revision 0.2 and source bundle

- Packet: [Golden Coordinates at Level Five, portrait revision 0.2](research/heegner-golden-level-five/paper/README.md).
  The main article is a continuous 10-page Letter article with four compact
  body figures; a separate 14-page landscape supplement retains plates S01–S12
  with local captions and a methods page. The v0.1 paper and atlas remain
  unchanged checkpoints.
- Content: the CM/Hermite-to-`c0` recovery remains the primary strand. The
  article retains Theorem 3.1, Corollary A.1 and both appendices; the Fourier
  classification is per eigenline, with the mixed-vector `(x,y)=(1,0)` example.
  The normalized positive sequence is identified with Davenport–Heilbronn at
  `kappa=(sqrt(10-2sqrt5)-2)/(sqrt5-1)=r(i)`. The conductor-815 cyclic quartic
  field is attributed to Spearman–Williams; no novelty or priority claim is made.
- Layout: body figures were recomposed at 6.4-in source width and inserted at
  6.5 in, so minimum 8.5-pt artist text appears at 8.63 pt. Figure 3 closes
  Section 3; Figure 4 closes Section 4 and begins page 6, followed by Section 5.
  Every body figure is referenced and interpreted; no gallery precedes the first
  theorem and no stale Figure 5–12 text remains in the PDF text layer.
- Hashes: article PDF `b3200ffa4130b5046c8462a2a0f22d1ea30273120442953faf93a01b5f937718`;
  source `46d473aa9e32528617b3ddc8396987d0240e9717832e537481f43b5eba688fc7`;
  supplement PDF `e4bc0fbe12deeeed7a998be333f534fcf1de8218583170e622b75846d38fe32b`;
  source zip `4f752a6423f9174f61e2872218cf309f0bf8a08329d3a2b3b619697e28e83fbc`.
- Verification: exact CM replay, square certificate, lemma/trigonometric/
  eigenline checks, 90-digit DH constant check, both figure-data checkers,
  layout/text-layer checker and qpdf all pass. The 233 earlier authored files
  match the preservation baseline. The source zip was extracted, its 107-entry
  manifest verified, the article compiled twice, and the supplement rebuilt:
  10 and 14 pages, identical text layers, and 10/10 article page renders
  identical. The rebuilt article PDF differs only in pdfTeX creation metadata.
- Next: obtain a fresh external human mathematical reading focused on the CM
  branch enclosure and the analytic proof flow. Optional cosmetic polish of the
  supplement cover notation is separate from the verified build. No commit,
  push, upload or publication occurred; no RH source or sealed artifact changed.

## 2026-10-20: public archive and repository-facing reorganization of the Heegner-golden workstream

- The complete workstream, excluding ignored `logs/` directories and third-party
  source scans, is released through the public branch
  `publish/heegner-golden-v0.2`, based on `origin/main` at `cd41476`.
- The public directory is `research/heegner-golden-level-five/`. The current
  packet is `paper/`, the frozen checkpoint is `paper-v0.1/`, shared plates are
  in `figures/`, and process records are in `studies/`.
- The v0.2 packet remains byte-identical to its completion record. Its README
  line `Local draft; no commit, upload, or publication` describes the state at
  completion; the new [HANDOVER.md](research/heegner-golden-level-five/HANDOVER.md)
  records the later public archive without rebinding the v0.2 hashes.
- No RH source, sealed release, or unrelated workstream was changed. The shared
  local `main` checkout remains divergent and was not merged or pushed.

## Zero-strip height quotients, 2026-10-18

This dated snapshot records the 18 October state; the current 34-theorem layer
is recorded in the table above and in the formalization map.

The [zero-strip workstream](research/zero-strip-height-quotients/HANDOVER.md)
is a separate research construction, not one of the ten catalogue papers. It
records a written No-Go for a fixed or eventual height period of the complete
zeta zero divisor, an audit of the cylinder and Möbius ambient quotients, and
an auxiliary entire-function countermodel showing that the named symmetries,
counting asymptotic and ambient topology do not force RH. The countermodel is
not zeta and is not an RH counterexample. The [v0.2 novelty verdict](research/zero-strip-height-quotients/paper/revision-v0.2/NOVELTY_VERDICT.md)
found no independent new theorem or priority claim; Gauthier–Xarles is the
material predecessor.

The manuscript has three local editions: v0.1 (9 pages, analytic base), v0.2
(11 pages, illustrated revision and figure/source bundle) and v0.3 (12 pages,
current guided reader). The theorem/proof and figure content are unchanged
from v0.2 to v0.3. Twenty-three named Lean theorems cover the algebraic and
topological-group models plus actual zeta zero-support invariance under
conjugation and functional reflection; xi, Riemann–von Mangoldt, multiplicity
preservation, the analytic No-Go and the quotient homeomorphisms remain
outside Lean.

Verification: the root replay passes 23 Lean axiom reports, 330 exact
polynomial checks and the assertion guard; the paper continuation replay passes
1,827 exact finite complex cases and two scalar Lean inequalities. The three
PDFs are 9, 11 and 12 pages, and their hashes match the acceptance records.
The tested Lean environment is the prepared read-only checkout pinned to Lean
v4.33.1 and Mathlib `0df444a360eaa60ab8c11dca51a86af692955474`; a clean-machine
replay was not tested.

Git: the workstream is released through the public branch
`publish/height-quotients-v0.3`. The archive started from `origin/main` at
`cd41476` and was rebased onto `f14a506` for the public release. The public
directory is `research/zero-strip-height-quotients/`; the paper-development
archive is now `paper/`. Logs, local inputs and temporary build files are
excluded. Next: specialist overlap review before submission, and formalization
of the half-open cell partition with multiplicity-preserving translation; the
analytic counting input remains external. No RH proof or counterexample,
complete Lean formalization, external human peer review, or priority claim is
made.
