# Bicomplex signal manifolds: current v13 working audit

## Active continuation 0.04: moment readouts and exceptional pullbacks

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

## Preserved continuation 0.03: originality and actual scalar Green domains

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

## Preserved continuation 0.02 checkpoint

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

## Preserved v13 results and current continuation

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

## Files and replay

| Location | Role |
| --- | --- |
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

## Source and publication boundary

Historical final-v12 SHA-256:
`4ebb8f0a7d6e88a6c5cd97f65d224b4e938867cabad54f057d3ceafb24167d5a`.
The ancestor plus its two real figures rebuilds to 26 pages; it is not the
missing final source. The new standalone manuscript reconstructs and corrects
later sections from the page-pinned final PDF. All historical PDFs, ancestor
files and sealed releases/receipts remain unchanged.

The current package is a local research checkpoint with partial formal
coverage. Full Green/Dirac classification is not proved, no new DOI is assigned,
and GitHub/Zenodo/ResearchGate publication requires the author's separate
confirmation of a concrete verified scope. Ruled, Stokes, Papers I–III and
other windows' SAMT/SA-MGHP work retain their prior scope.
