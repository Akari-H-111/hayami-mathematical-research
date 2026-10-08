# Shared research board

English reading index: [Complete English editions, including historical sources](docs/english-editions-20261008/README.md). Original sealed evidence remains unchanged.

Bicomplex status on 2026-10-03, after publication closeout: two successor papers and software companion 1.0 public since 2026-10-02 under the author's full authorization. Paper one *Realization Limits of the Bicomplex Signal Surface*: Zenodo `10.5281/zenodo.23103026` / RG `415154912`; paper two *Pseudo-Laplacians at Whitney Cross-Caps*: `10.5281/zenodo.23103056` / `415164048`; software `10.5281/zenodo.23103299` (Apache-2.0 code, CC-BY-4.0 text); GitHub source-only tag/release `bicomplex-successor-v1.0` at `aceb055`. Old RG `408878000` retains original content and a leading superseded-by paragraph. Zenodo API, anonymous-download SHA-256, six DOI resolutions, GitHub asset digest and old/new RG pages rechecked PASS on 2026-10-03. Lean covers 33 theorems partially (fresh in-place PASS on 2026-10-02), not either whole paper. **Shortest entry: “Start here” in `papers/legacy-geometry/bicomplex-signal-manifolds/README.md`** (version relations, proved/corrected/refuted/conditional/open claims, evidence types, replay commands/interpreters, open questions). Publication records: `releases/candidates/bicomplex-successor-v1-publication.json`, `…-figures-publication.json`, `successor/SCOPE_AND_PLAN.md` §14–15. Open mathematics (actual singular Dirac / Pin, sheaf→operator bridges) is in the README; refuted originals are not proof targets, and the next window chooses a topic. Remaining: (1) RG “Edit limit reached” blocks polishing old superseded-by wording; proposal in `releases/candidates/bicomplex-successor-v1-researchgate-pending-edits.md`; (2) local `main` (`5803d6a`) diverges from origin/main; the author handles synchronization after committing/stashing other windows' changes (see `EXTERNAL_ACTIONS.md`).

Last updated: 2026-10-03 CST
Scope: all subsequent Codex windows and manual work in this project

This is the single live entry point across windows. Established results: `ESTABLISHED_WORKS.md`; research lines: `RESEARCH_DIRECTIONS.md`; external work: `EXTERNAL_ACTIONS.md`; Lean: `LEAN_ROADMAP.md`.

## Current snapshot

| Priority | Workflow | Status | Next atomic task | Authority / verification |
| ---: | --- | --- | --- | --- |
| 1 | Stokes v5 Lean companion v0.04 | `PUBLISHED / API+DOWNLOAD VERIFIED; DOI RESOLUTION PENDING` | GitHub / Zenodo record `23057630` public; three downloads on both platforms match the archive; software DOI `10.5281/zenodo.23057630` assigned; only `doi.org` read-back pending, no republication | `releases/candidates/stokes-caustic-v5-v0.04-publication.md`; `https://zenodo.org/records/23057630`; paper DOI `10.5281/zenodo.22728902` unchanged |
| 2 | All asserted Stokes v5 mathematical results | `COMPLETED / 258 PUBLIC THEOREMS` | Actual ordinary-fold charts, exceptional no-fold/four-jet, physical locus/discriminant/radial image, expansions, auxiliary quintic, Sturm tables and rational bounds proved; germ classification / unfolding remain open | `companions/lean/stokes-caustic-v5/FULL_PAPER_COVERAGE.md`; `verify_lean.py` build/status/exhaustive axiom audit/proof-hole scan all PASS |
| 3 | Inverse-Leibniz Papers I–III | `PUBLISHED / SEALED` | Keep v0.09 immutable; arXiv requires metadata / category approval first | `releases/current/submission-v0.09-zenodo/`; DOIs in `ESTABLISHED_WORKS.md` |
| 4 | Filtered complex → Diophantine locus | `PLANNED / SEPARATE` | Fix source class, marking, metric, target torus and locus definitions | `RESEARCH_DIRECTIONS.md` A1; no theorem certificate yet |
| 5 | Corrected ruled surface v4 | `BLOCKED` | Choose boundary atlas or explicit `Q>0` restriction, and revise Theorem 5.3 assumptions | `papers/legacy-geometry/orthogonal-circle-ruled-surface/claims/LEDGER.md` |
| 6 | Bicomplex successor papers v1 + software 1.0 | `PUBLISHED 2026-10-02 / READBACK RECHECKED 2026-10-03 / PARTIAL LEAN / NO REQUIRED NEXT TASK` | Both papers and software 1.0 public (DOIs, RG and GitHub above); old RG `408878000` retains original content with superseded-by. No mandatory next task: choose from README “What is genuinely open” (actual singular Dirac / Pin, sheaf→operator bridges); refuted originals are not proof targets. Remaining: RG wording blocked by Edit limit; divergent local main awaits author synchronization. Git: public `publish/bicomplex-successor` = `origin/main` (isolated plumbing workflow, no v7 history); `research/bicomplex-continuation-0.04` (`2997135`) is local-only and contains private v7 PDF, **never push**; local main and other windows' worktree unchanged | Bicomplex README “Start here”; `releases/candidates/bicomplex-successor-v1-publication.json`; `papers/legacy-geometry/bicomplex-signal-manifolds/successor/SCOPE_AND_PLAN.md` §14–15 |
| 7 | New v0.05/v0.06 constructions | `ARCHIVED / VERIFIED` | Not missing historical data; reopen only for a new question | `research/independent_transfer_v0_05/RESEARCH_LOG.md`; `research/feedback_matrices_v0_06/RESEARCH_LOG.md` |
| 8 | ResearchGate final Stokes v5 | `COMPLETED / VERIFIED` | None; retain old/new public records and distinct DOIs | RG publication `414264187`; paper DOI `10.5281/zenodo.22728902`; `research/researchgate_handoff_v1.md` |

## Verification entry points

### Legacy geometry baseline

```bash
local/cache/python/legacy-reconstruction-venv/bin/python -B \
  verification/legacy-reconstruction/verify_all.py
```

### Bicomplex successor papers v1: replay

Both interpreters PASSed on 2026-10-03: `PY_LEGACY` = `local/cache/python/legacy-reconstruction-venv/bin/python` (Python 3.9.6, sympy 1.14.0, mpmath 1.3.0); `PY_TAGD` = `/Users/akari_hayami_64/TAGD_Master_Paper/.agent-venv/bin/python` (also numpy 2.5.2, matplotlib 3.11.1, needed only by the figure generator). Never use `-O`.

```bash
local/cache/python/legacy-reconstruction-venv/bin/python -B papers/legacy-geometry/bicomplex-signal-manifolds/verification/verify_successor_paper1.py
local/cache/python/legacy-reconstruction-venv/bin/python -B papers/legacy-geometry/bicomplex-signal-manifolds/verification/verify_successor_paper2.py
python3 -B companions/lean/bicomplex-signal-manifolds/verify_lean.py
```

Both successor verifiers also replay earlier exact verifiers, without certifying analytic proofs. Lean is partial coverage of 33 theorems (Lean 4.33.1, fresh in-place PASS on 2026-10-02, requiring same-repository `ruled-surface-v5` and `stokes-caustic-v5`). Commands and last verification dates for PDF reconstruction, figure generation (`PY_TAGD` only), release assembly and old checkpoints (v13, 0.02, 0.03) are in the Bicomplex README “Replay” table.

### Full replay of the public Stokes v5 companion

```bash
local/cache/python/legacy-reconstruction-venv/bin/python -B \
  releases/candidates/stokes-caustic-v5-v0.04/verify.py
```

### Stokes v5 working Lean source

```bash
cd companions/lean/stokes-caustic-v5
python3 -B verify_lean.py
```

### Inverse-Leibniz illustrated releases

These PDF/evidence verifiers also require pypdf, pdfplumber and Pillow. The verified
interpreter is outside the public tree, in the local environment:

```bash
/Users/akari_hayami_64/TAGD_Master_Paper/.agent-venv/bin/python -B \
  releases/current/paper-01-illustrated-v0.09/verify_integrated.py
/Users/akari_hayami_64/TAGD_Master_Paper/.agent-venv/bin/python -B \
  releases/current/paper-02-illustrated-v0.09/verify_evidence.py
/Users/akari_hayami_64/TAGD_Master_Paper/.agent-venv/bin/python -B \
  releases/current/paper-02-illustrated-v0.09/verify_integrated.py
/Users/akari_hayami_64/TAGD_Master_Paper/.agent-venv/bin/python -B \
  releases/current/paper-03-illustrated-v0.09/verify_evidence.py
/Users/akari_hayami_64/TAGD_Master_Paper/.agent-venv/bin/python -B \
  releases/current/paper-03-illustrated-v0.09/verify_integrated.py
```

Package hashes are in each release directory's `SHA256SUMS.txt`. Never use Python `-O` for assertion-dependent verifiers.

## Starting the next window

1. Confirm root `/Users/akari_hayami_64/Documents/hayami-mathematical-research`.
2. Run `git status --short`; preserve untracked / uncommitted work outside the task.
3. Read this board, then the selected workflow's status / README.
4. Reproduce the current baseline before the smallest scoped change.
5. Run the appropriate verifier after each mathematical or code change; never record failures as passes.
6. Update status, next atomic task and paths when evidence changes; do not change status without new evidence.
7. Renew visual QA and hash-bound records after PDF recompilation.

## Cross-window message format

Add a row at the top of this section; record only evidenced changes that actually occurred.

```text
YYYY-MM-DD HH:MM | Workflow | STATUS | Completion / failure / blocker summary | Verification file or public URL | Next step
```

### Bicomplex publication closeout (2026-10-02/03)

- 2026-10-03 | Bicomplex publication closeout (documents and Git) | `CLOSEOUT / DOCS SYNCED / PUBLIC STATE RECHECKED` | Rechecked three Zenodo APIs / anonymous-download SHA-256 / six DOI resolutions, GitHub release asset digest and old/new RG pages; no residual Bicomplex drafts. Private v7 PDF absent from origin/main, remote tags, release assets and three published ZIPs (blob and SHA-256 checks). Legacy baseline and eight verifiers PASS on both interpreters; rebuilt claim-map hash unchanged. Synchronized README “Start here,” board, shared inventories and Lean documents; old prompts / prepublication states marked historical. No proof, PDF, figure or sealed-file changes | `papers/legacy-geometry/bicomplex-signal-manifolds/successor/SCOPE_AND_PLAN.md` §15 | RG wording awaits quota; author handles local-main synchronization

- 2026-10-02 | Publication of Bicomplex successor papers and software companion 1.0 | `PUBLISHED / ZENODO + GITHUB + RESEARCHGATE READBACK PASS` | Full author authorization. Paper one/two v1 and software 1.0 on Zenodo; GitHub source-only `bicomplex-successor-v1.0`; two RG records (CC BY 4.0, single author, 7＋4 figures) and old-page superseded-by. Failures retained: one paper-one Overfull export; background Zenodo buttons not refreshing (official REST used); missing publisher on first publish; RG figure 5 lost once without caption (reuploaded); RG Edit limit blocks old wording polish | `releases/candidates/bicomplex-successor-v1-publication.json`; `releases/candidates/bicomplex-successor-v1-figures-publication.json` | Same remaining items above

- Note: Bicomplex entries below labeled UNPUBLISHED / AWAITING AUTHOR READING / publication hold are preserved prepublication records from 2026-10-01/02. Current status is in the two entries above and the Bicomplex README.

### Messages

- 2026-10-07 | Environment and Git preservation | `SCOPED PRIVATE SNAPSHOT / PUBLIC NAVIGATION BRANCH` | Updated the AHR current handoff, the source / seed tables, and the environment and evidence documents; RH-SPIRAL has no Git, so the new RH/GIR packages and their context were byte-preserved in the AHR private checkpoint (its Traditional Chinese documents were replaced by English editions later the same day). Environment text corrected: AHR uses Python 3.12.14 and RH/GIR 3.14.6, the original RESULTS runtime fields were correct, and the sealed report was not rewritten. The diverged shared main and other windows' work were left alone; the public navigation is preserved on the codex/research-renewal-20261007 branch cut from origin/main | `research/cross-workstream-save-20261007/README.md` | Resume from the latest HANDOFF in the private repository; remote and clone checks follow this round's receipt; public paper records unchanged

- 2026-10-07 | Free-form continuation: RH sign criterion / GIR action / AHR joint phase | `NEW WRITTEN THEOREMS + FRESH SYNTHETIC CONFIRMATION / PARTIAL GATES` | RH: on the current v1.2.1, written proofs that the eventual sign of the trace / dimension is equivalent to RH; an unconditional two-sign counterexample for the fixed higher-order heat moments j>=40, with 147 numerical samples; correction of the section 7 small-u bound. GIR: the per-pair sheet action on the actual cover fiber yields n(I-E), with a self-adjoint direct sum and finite heat traces on compact regular cores; a uniform bound on the full punctured locus remains open. AHR: two batches of 3,136 new cases, near-alias gcd errors 89/128->0 and 40/64->0; signed weak-harmonic reconstruction shows an interval gain but slightly fails the pure-noise upper-bound gate, and the projective-axis negative result is preserved; a soft-root e-value / positive-integral prototype was also derived. The current manuscript / original drift / covering baselines, the new results and the output replays pass; no Lean was added and no old seal was changed | `research/cross-workstream-renewal-20261007/README.md`; internal links to RH-SPIRAL and the new AHR folder | Controlled error bounds for higher-order heat moments, global GIR heat bounds, AHR trained root weights and drift leakage; see the new entry points; computation does not replace written proof

- 2026-09-30 | Stokes v5 Lean companion v0.04 Zenodo publication | `PUBLISHED / API+DOWNLOAD PASS; DOI RESOLUTION PENDING` | After login, the author created and published version record `23057630` under the same concept as v0.03. Official API `done` / `submitted=true`, Software / version `0.04`, three MD5 and public-download SHA-256 values match. New software DOI `10.5281/zenodo.23057630` assigned; initial `doi.org` HTTP 404, resolution pending; public record/API/files available. GitHub/root citations and status synchronized without repackaging; paper DOI/PDF/v0.02/v0.03 and open germ classification / unfolding unchanged | `https://zenodo.org/records/23057630`; `https://zenodo.org/api/records/23057630`; `releases/candidates/stokes-caustic-v5-v0.04-publication.md` | Only new-DOI resolution read-back pending; no duplicate version or DOI change

- 2026-09-30 | Stokes v5 Lean companion v0.04 publication handoff | `GITHUB PASS / ZENODO LOGIN REQUIRED` | Two full package replays, exhaustive audit of 258 public theorems, 52-member ZIP CRC and source alignment .982321 all PASS. GitHub not draft/prerelease; three public-download SHA-256 / API digests match local archive. No new Zenodo draft/DOI; stopped before owner login. Original open germ classification / unfolding not claimed | `https://github.com/Akari-H-111/hayami-mathematical-research/releases/tag/stokes-v5-companion-v0.04`; `releases/candidates/stokes-caustic-v5-v0.04-publication.md` | After author login at `https://zenodo.org/login/?next=/records/22735974`, create v0.04 version, publish and verify new DOI/metadata/downloads; no repackaging or old-version changes

- 2026-09-30 | All asserted Stokes v5 mathematics | `LEAN PASS / 258 PUBLIC THEOREMS` | Actual ordinary-fold charts, exceptional no-fold / ordinary four-jet, physical locus/discriminant/radial image, Big-O expansions, auxiliary irreducible quintic / maximum, fixed Sturm tables / rational bounds pass exhaustive audit/build/status/proof-hole scan. Original germ classification / unfolding stays open. Author authorized separate v0.04 publication; paper PDF/DOI/v0.02/v0.03 unchanged. Official API reads Citation boundary in Zenodo v0.03 description, closing the 504 blocker | `companions/lean/stokes-caustic-v5/FULL_PAPER_COVERAGE.md`; `verify_lean.py`; `https://zenodo.org/api/records/22735974` | Publish GitHub after in-place / extracted replay; Zenodo needs author login

- 2026-09-14 01:21 | Citation boundary synchronization | `GitHub PASS / Zenodo VERIFY BLOCKED` | Root `CITATION.cff`, `README.md` and GitHub `stokes-v5-companion-v0.03` release body distinguish paper DOI `10.5281/zenodo.22728902`, this Lean-software DOI `10.5281/zenodo.22735974` and software concept `10.5281/zenodo.22726976`. RG retains correct paper DOI, not software DOI. Zenodo v0.03 edit showed saved and Publish submitted, but public page/API then returned 504; public wording not verified yet | GitHub release `stokes-v5-companion-v0.03`; `https://zenodo.org/records/22735974`; `https://zenodo.org/api/records/22735974` | After recovery, read public description and confirm Citation boundary before closing


- 2026-09-14 01:11 | Stokes v5 Lean companion v0.03 | `PUBLISHED / API+DOWNLOAD PASS` | Version record `22735974` public under the same concept; version DOI `10.5281/zenodo.22735974`, concept DOI `10.5281/zenodo.22726976`; official API `published`/`done`, three files, all three download SHA-256 values match local archive | `https://zenodo.org/records/22735974`; `https://zenodo.org/api/records/22735974` | Keep v0.02/v0.03 immutable; continue separately on coordinate-level local normal forms
- 2026-09-13 21:08 | Stokes v5 Lean companion v0.03 | `GITHUB PASS / ZENODO BLOCKED` | GitHub tag/release `stokes-v5-companion-v0.03` public, downloaded ZIP/receipt hashes match asset digests; repeated Zenodo record 504 and API timeout, with retry still returning 504; new DOI not created | `https://github.com/Akari-H-111/hayami-mathematical-research/releases/tag/stokes-v5-companion-v0.03`; `EXTERNAL_ACTIONS.md` | When reachable, create a new version under v0.02 concept DOI `10.5281/zenodo.22726976`; v0.02 immutable
- 2026-09-13 20:59 | Stokes v5 Lean companion v0.03 | `CANDIDATE PASS / NOT PUBLISHED` | Separate candidate, theorem map / scope updated, 31-member ZIP/receipt created; in-place / extracted replay and ZIP CRC pass; no `.lake`, authoritative PDF hash unchanged | `releases/candidates/stokes-caustic-v5-v0.03/stokes_caustic_v5_lean_companion_v0_03_candidate.zip`; receipt; SHA-256 `2a88e20b1984738f9a9bd19c8460a145aae6b04819b792ede9c547967acc2f5b` | External GitHub/Zenodo publication requires authorization; v0.02 immutable
- 2026-09-13 20:33 | Stokes v5 Lean geometry bridge | `PASS / CRITERION LEVEL` | L1–L5 working source passes: explicit Fréchet derivative, Jacobian factorization, ordinary-branch rank-one kernels / transversality, exceptional-point failure and intrinsic plane-to-plane Whitney-fold criterion; build/status/axiom audit pass, no new axioms | `companions/lean/stokes-caustic-v5/StokesV5/ObservationMap.lean`; `companions/lean/stokes-caustic-v5/StokesV5/FoldGeometry.lean`; `companions/lean/stokes-caustic-v5/StokesV5/WhitneyFold.lean`; `companions/lean/stokes-caustic-v5/LEAN_STATUS.md` | L6: separate v0.03 candidate; v0.02 immutable
- 2026-09-13 15:43 | ResearchGate final Stokes v5 | `PASS` | Official authenticated browser read-back of both pages: new final-v5 title, author, DOI, supersedes and sole `v5.pdf` visible; old DOI and superseded-by retained, sole historical `v3.pdf`. Earlier unauthenticated “two full texts” index was stale cache; no public deletion/rewrite needed | `https://www.researchgate.net/publication/414264187_Observation_Discriminant_and_Spherical_Fold_Image_of_the_Orthogonal-Circle_Ruled_Surface`; `https://www.researchgate.net/publication/408887855_The_Stokes_Caustic_of_the_Orthogonal-Circle_Ruled_Surface_Poincare_Sphere_Geometry_and_an_Irreducible_Chirality_Quintic`; `https://doi.org/10.5281/zenodo.22728902` | External work closed; next internal Stokes v5 Lean L1 explicit derivative
- 2026-09-13 15:31 | Public records | `PASS` | Official Zenodo APIs verify DOIs, types and files of three Inverse-Leibniz preprints, shared materials, Stokes v5 preprint and Lean companion; GitHub API confirms v0.02 not draft/prerelease | DOIs and commands in `EXTERNAL_ACTIONS.md` | RG final v5 awaits official browser control
- 2026-09-13 15:30 | Inverse-Leibniz v0.09 | `PASS` | Fresh Paper I integrated checks, six finite-evidence checks for Paper II/III and two integrated/visual-record checks pass; II/III integrated rerun sequentially after evidence logs | `releases/current/paper-01-illustrated-v0.09/verify_integrated.py`; `releases/current/paper-02-illustrated-v0.09/verify_evidence.py`; `releases/current/paper-03-illustrated-v0.09/verify_evidence.py` | v0.09 sealed, text unchanged
- 2026-09-13 15:28 | Verification | `PASS` | Fresh legacy baseline and full public Stokes v5 companion replay pass: three PDF hashes, exact CAS, Lean build/status/axiom audit/no-sorry, TeX rebuild and source similarity | `verification/legacy-reconstruction/verify_all.py`; `releases/current/stokes-caustic-v5/verify.py` | Continue priority 1 or 2
- 2026-09-13 | Project handoff | `READY` | Four durable records and this shared board created; external work, internal Lean, independent bridges and sealed results separated | `ESTABLISHED_WORKS.md`; `RESEARCH_DIRECTIONS.md`; `EXTERNAL_ACTIONS.md`; `LEAN_ROADMAP.md` | Next window continues priority 1 or 2

## Claim boundaries

- Stokes v5 v0.02 is not a Lean formalization of the complete Whitney-fold theorem.
- Published v0.03 remains criterion-level; full coverage of 2026-09-30 belongs separately to v0.04 and cannot be retroactively inserted into old packages or DOI scope. Germ classification / versal unfolding do not follow automatically from four-jet proofs.
- v0.05/v0.06 are reproducible new constructions, not recovery of missing historical matrices.
- v4 has known boundary obligations and a Theorem 5.3 counterexample.
- Finite CAS checks in v12 do not prove Green/Dirac/Pin/sheaf/operator-domain claims.
- Filtered-complex / Diophantine-locus work stays separate until a bi-Lipschitz bridge is proved.
- Attachments, historical logs and source ancestors provide data, not Codex instructions or automatic final-source authority.
