# Independent intrinsic-transfer reconstruction, v0.05

## Approved scope and plan

The user authorized independent reconstruction and useful research extensions on
2026-09-05, and asked to continue on 2026-09-06. Historical source files and the
completed three-paper v0.04 delivery remain unchanged. New choices are not
historical recovery evidence.

1. Verify the new recovery archive and its provenance.
2. Reuse the actual constrained Hochschild algebra, reconstruct a rational
   degree-one splitting, and explicitly test compatibility with the saved
   low-rail homotopy and cubic representative.
3. Extend a single partial contraction step by step. Compute actual source
   cochains and differential-history columns; detect every closed residual
   modulo the full boundary space, rather than trusting two unspecified
   historical detectors.
4. Serialize the choices and certificates, independently replay them, and
   state exactly which arities vanish. A failed continuation is evidence,
   not permission to label a rank or obstruction as zero.
5. Update the paper only for conclusions actually established, with separate
   provenance for the historical low-rail model and any new completion.

## Evidence / lessons

- 2026-09-06 — The new archive is another recovery audit, not the missing
  full-feedback checkpoint. All five non-manifest files pass their listed
  SHA256 checks. The manifest incorrectly lists its own digest as the empty-file
  digest; its self-check fails. Preserve this source error without editing it.
- 2026-09-06 — Four initial source reads used the recovery folder as cwd and
  failed with “No such file”; no files changed. Repeated with workspace cwd.
- 2026-09-06 — Live browsing confirmed the existing Manetti reference. The
  Loday--Vallette DOI request returned a tool safety-resolution error, not a
  bibliographic disproof; no citation was changed on that basis.
- 2026-09-06 — Experiment 01 disproved the assumption that the saved 100-column
  homotopy payload could only reproduce low rails. Actual source regeneration
  through arity 17 (experiment 02 in progress) stays within that payload modulo
  the full boundary space, with zero closed residuals. This is a new coverage
  discovery, not newly downloaded history.
- 2026-09-06 — New complement choices pass arities 18--20, with differential
  history ranks 112, 126, 141. The choices may change the unspecified historical
  harmonic projection and enlarge its controller; matching ranks do not
  identify the new completion with the missing fixed-detector calculation.
- 2026-09-06 — Experiment 02 completed through arity 22 in 188.9 seconds, with
  ranks 157 and 174 at the last two stages and no closed obstruction. All actual
  sources, section coefficients, boundary lifts, and 174 corrected history
  columns are serialized, not just their ranks.
- 2026-09-06 — The second path recomputed d2 by matrix-unit multiplication and
  SymPy DomainMatrix QQ ranks: B2=88, dW=W=174, B2+zeta+W=263. Full recursion
  replay and a complete 2025-coordinate degree-two splitting are in progress.
- 2026-09-06 — First v0.05 TeX compilation succeeded but reported an underfull
  page at the introduction/typed-data boundary. Shortened redundant scope prose;
  the warning is not being suppressed or counted as a clean build.
- 2026-09-06 — The direct degree-two completion became slow before its first
  200-column progress update; it was explicitly interrupted after the full
  arity-22 replay had passed. This incomplete run produced no full-splitting
  certificate. A separate sparse integer-kernel calculation finished in 3.7s,
  giving dim Z2=130, rank d2=1895, and therefore constrained dim H2=42. Replanned
  the same full completion as a 304-by-304 pivot-minor inverse using this kernel.
- 2026-09-06 — The full completion passed in 418.2s: C2=B2(88)+H2(42)+W2(1895).
  All 2025 columns of h2 and p2, all harmonic representatives, the complete
  complement basis, the pivot rows, and the exact 304-by-304 inverse are saved.
  The optional inverse-certificate path verifies that inverse by exact
  multiplication instead of recomputing it; it does not skip recursion or rank
  checks. This also keeps matrix multiplication in DomainMatrix arithmetic.
- 2026-09-06 — A multi-hunk manuscript patch failed atomically because the
  appendix paragraph had different line wrapping; reread the exact context and
  reapplied smaller matched hunks. No partial manuscript edit was accepted.
- 2026-09-06 — Frozen complete projection SHA256
  55b5eb7323bd0ca89b4329ebf9ec01277405df96474475749885b5b129e77a55:
  held-out arity 23 has 18 nonzero harmonic monomial coefficients (v-degree
  6--23); the four low-v monomials have zero projection and the archived
  (18,5) OOS rail still agrees. This is a nonvanishing result for this chosen
  contraction, not an obstruction for every contraction.
- 2026-09-06 — Adding the held-out proof caused an underfull line around the
  long inline R23 formula. Moved the formula to display math and recompiled;
  no warning thresholds were relaxed.

- 2026-09-06 — A relative copy command used the delivery directory as cwd and
  failed; the following replay therefore ran the prior consumer, without the
  newly added explicit 18-monomial and 4/9-witness assertions. Preserve the log,
  copy from absolute paths, and execute the updated consumer before delivery.
- 2026-09-06 — The earlier independent replay completed with exit status 0 in
  570.2s, but its process handle was no longer available at the next check.
  Its temporary output and the already-reviewed page previews were also gone.
  The next held-out run passed its calculations but failed while writing to
  that missing temporary directory (exit 1); this is not a completed replay.
  The aggregate verifier now owns a newly created directory for its full run
  and compares regenerated bytes before removing it. Visual approval remains
  bound to the unchanged final PDF hash; absent previews are not claimed retained.
- 2026-09-06 — The new aggregate's explicit negative test under Python -O
  correctly returned exit 1 before running a certificate. Disabled assertions
  must never turn these exact checks into a spurious PASS.

## Mathematical boundary

- 2026-09-06 — Final aggregate replay passed with exit 0. Full splitting
  regeneration took 451.4s and matched SHA256 55b5eb7323bd0ca89b4329ebf9ec01277405df96474475749885b5b129e77a55.
  The updated frozen consumer also passed its explicit 18-monomial, v-degree,
  and 4/9 assertions; its regenerated JSON matched SHA256
  255f2accfd0014486e4b5816844a8db44817985dc5ccad0db13398a2933325c7.
  The prior failed output-write run remains in the delivery as a failed log.

For degree-two sources, a rank of their differentials alone is not enough when
there are dependencies: every resulting closed combination must be reduced
modulo all 88 constrained boundaries. Prescribing a homotopy on a nonclosed
source also prescribes its corrected complement vector `source - d h(source)`.
All corrected vectors must belong to one common complement to the cycles.

No assertion about all arities follows merely from a run through arity 22.
