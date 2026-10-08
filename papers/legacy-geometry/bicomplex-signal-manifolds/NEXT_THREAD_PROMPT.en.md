# Bicomplex: execution prompt for the next thread

> **Historical instructions (2026-10-01), already executed.** They guided the entire v13 working, continuation 0.02–0.04, and two-successor-paper work, whose results are public; their “next steps” and “publication hold” no longer apply. Current entry: [`README.md`](README.md), “Start here.”

Prepared: 2026-10-01 (Asia/Taipei). These are task instructions for the next thread; no new proofs, Lean work, or revisions began during handoff preparation.

---

In the existing local project
`/Users/akari_hayami_64/Documents/hayami-mathematical-research`
start the next main line: **bicomplex verification, necessary corrections, Lean formalization, and manuscript improvement**.
Do not merely propose a plan; advance written proofs, exact computation, and replayable verification. Aim to check all claimed mathematical results individually, beyond finite algebra modules.

First read the actual working-directory contents:

@/Users/akari_hayami_64/Documents/hayami-mathematical-research/AGENTS.md
@/Users/akari_hayami_64/Documents/hayami-mathematical-research/RESEARCH_BOARD.md
@/Users/akari_hayami_64/Documents/hayami-mathematical-research/LEAN_ROADMAP.md
@/Users/akari_hayami_64/Documents/hayami-mathematical-research/papers/legacy-geometry/source-registry/SOURCE_REGISTRY.md
@/Users/akari_hayami_64/Documents/hayami-mathematical-research/papers/legacy-geometry/bicomplex-signal-manifolds/README.md
@/Users/akari_hayami_64/Documents/hayami-mathematical-research/papers/legacy-geometry/bicomplex-signal-manifolds/claims/MODULE_INDEX.md
@/Users/akari_hayami_64/Documents/hayami-mathematical-research/papers/legacy-geometry/bicomplex-signal-manifolds/claims/LEDGER.md
@/Users/akari_hayami_64/Documents/hayami-mathematical-research/papers/legacy-geometry/bicomplex-signal-manifolds/proofs/SPECTRAL_AUDIT.md
@/Users/akari_hayami_64/Documents/hayami-mathematical-research/papers/legacy-geometry/source-registry/final_pdfs/Geometric_Realization_of_Bicomplex_Signal_Manifolds_v12.pdf

When reusing preceding results, read as needed:

@/Users/akari_hayami_64/Documents/hayami-mathematical-research/companions/lean/ruled-surface-v5/COVERAGE.md
@/Users/akari_hayami_64/Documents/hayami-mathematical-research/companions/lean/stokes-caustic-v5/FULL_PAPER_COVERAGE.md

Continuation background and source authority:

- Ruled v5/companion 0.03 completed individual written/Lean coverage of claimed results, acceptance, and formal GitHub/Zenodo/ResearchGate release; 224 own theorems and 258 dependencies separately audited. Paper DOI `10.5281/zenodo.23073642`, software version DOI `10.5281/zenodo.23073654`, software concept DOI `10.5281/zenodo.23073653` are separate; four ResearchGate gallery figures have a separate completion record. Independent open germ/image/observation research does not block bicomplex.
- Stokes v5/companion 0.04 completed claimed results and the publication main line; DOI-resolution follow-up and open germ/unfolding remain separate, without reopening sealed versions. Papers I–III have no new revision task; the general information-topology filtered-complex/Diophantine bridge is independent. Other windows' SAMT/SA-MGHP work is retained.
- **Historical bicomplex authority is the 43-page final v12 PDF**, SHA-256 `4ebb8f0a7d6e88a6c5cd97f65d224b4e938867cabad54f057d3ceafb24167d5a`. `source_ancestor/signal_manifolds_v2.tex` is a 1908-line ancestor, rebuilding to 26 pages with its two original figures; it is not the missing final source. Later content must be checked against the final PDF.
- A legacy baseline PASS already exists from 2026-10-01, including three exact bicomplex algebra verifiers; §7 has partial written rederivation. This is not full-text proof, bicomplex Lean coverage, or new PDF acceptance. Check independently on startup, rather than trusting handoff completion labels alone.

Work order and completion criteria:

1. **Check local state and replay.** First `git status --short`; preserve all unrelated uncommitted/untracked changes. After source-hash checks, run from the project root:

   ```bash
   local/cache/python/legacy-reconstruction-venv/bin/python -B \
     verification/legacy-reconstruction/verify_all.py
   ```

   Python `-O` is forbidden. Reproducing the Ruled v4 Theorem 5.3 counterexample and Q=0 scope warning does not mean the original theorem passed; historical warnings must not be directly transplanted into new bicomplex conclusions.

2. **Build a full-text individual claim map.** Compare final PDF with module index/ledger, completing original proposition, page, domain, issue/counterexample, corrected proposition, written proof, exact computation, Lean theorem, external theorem, and unfinished obligation. First resolve §7's page discrepancy: ledger pp.14–16, spectral audit pp.13–15; check physical versus printed PDF pages and record the convention. Check later §§8–9; ancestor omissions are not recovered content.

3. **Prioritize actual geometric/topological obligations in §§3–6.** Check Q=0 boundary atlas, half-cross-cap/cross-cap/cusp, observation dipole/small-circle degree, square-root monodromy/lifting, sublevel asymptotics, figure-eight, and explicit complexified `A3` model. Ruled atlas/rank classification and Stokes fold charts are reusable only after map, domain, smoothness, orientation, and other assumptions match; second-order jets, finite polynomials, or parameter plots cannot replace actual germ equivalence and global topology proofs. Distinguish real geometry from holomorphic completion; individually check assumptions of Milnor and other external theorems. Prioritize retaining global content; when restriction is necessary, prove why and list lost conclusions.

4. **Complete §7's analytic proofs.** Specify Hilbert space, measure, inner-product convention, dense core, closure/adjoint domains, and boundary terms. Prove actual integration by parts, formal adjoint, finite-time Gram integrals, operator-norm/positivity/conditioning/logdet bounds, retaining `T>0`, finitely many distinct frequencies, `delta>0`, and other conditions. Formal symmetry on `C_c^infinity((1,infinity))` is not half-line self-adjointness; generalized eigenfunctions need not belong to L2. Prove required deficiency-index results separately or cite only applicable external theorems.

5. **Advance §§8–9 rather than indefinitely parking them for specialist audit.** For Mellin/Hardy/Bohr–Haar, capacity/coercivity, Green parametrix/boundary channels/Krein extensions/buckling, Dirac/spin/Pin, defect sheaf/recollement, mixed-Hodge/Deligne–Weil, individually construct actual objects, operators/domains, maps/categories, boundary conditions, and external-theorem assumptions. Distinguish necessary conditions, sufficient conditions, counterexamples, unbridgeable gaps, and conditional in-model results. Poisson/eta/finite symplectic-plane calculations do not replace infinite-dimensional analysis; physical interpretations remain observations unless independently modeled and proved.

6. **Consult material first for hard problems.** Check internal proofs and original literature; use primary sources for external checking. Record failures, counterexamples, and applicable assumptions; do not silently weaken objectives, treat candidate hypotheses as sufficient, or rely on unproved bridges. For actual blockers, list concrete evidence, parts still advanceable, and required decisions.

7. **Individual Lean coverage.** Reuse appropriate Lean/Mathlib tools and theorems, with bicomplex's own proof sources and coverage; formalize actual mathematical statements and boundary assumptions, beyond algebraic proxies. No `sorry`, `admit`, or custom axioms filling gaps. Complete build, full axiom audit, proof-hole scan, and independent exact computation; audit dependencies separately. List uncovered parts; a few modules or theorem counts do not imply full-text Lean formalization.

8. **Create a separate revision and companion, then review for readers.** Do not overwrite historical PDFs, ancestors, old packages/receipts/manifests. Reuse the README's directory roles; new manuscripts in this workstream's `revision/`, Lean in `companions/lean/bicomplex-signal-manifolds/`, creating them only when actual first outputs are needed. Improve reading through natural human language, connected paragraphs, figure guidance, and fluent student-like exposition, avoiding repetitive defensive acceptance language while retaining necessary assumptions and negative results. Check citations and usable figures in the oldest material; generate mathematical figures from explicit formulas/data, preserving sources and replay commands. Images and numerical samples are not proofs.

9. **New-manuscript acceptance and publication preparation.** Create/continue editing manuscripts in the native LaTeX editor, preserving sources and compilation diagnostics. After built-in compilation succeeds, perform pagewise visual QA, SHA-256 binding, in-place and ZIP-extracted replay. Record precise versions and verified scopes for each PDF/package; do not rewrite old sealed artifacts or call same-machine replay an independent-host check. Present versions, metadata, citation text and concrete public scope only after verification. **This prompt authorizes local research, revision, verification, and publication preparation; obtain separate author confirmation before formal GitHub/Zenodo/ResearchGate operations.** After release, reread public pages/APIs and check download SHA-256, distinguishing paper DOI, software version DOI, and concept DOI.

At each completed milestone, update `RESEARCH_BOARD.md`, workstream README, claim ledger/module index/coverage, and necessary status documents; record mathematical proof, Lean, exact computation, numerical sampling, external theorems, historical recovery, and open questions in separate columns. Other workstreams and sealed results retain their original scopes.
