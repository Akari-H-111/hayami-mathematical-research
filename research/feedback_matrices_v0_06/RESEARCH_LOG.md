# Feedback matrices v0.06

User request: complete the matrices. Preserve the v0.05 paper and sealed bundle.
The primary missing target is the historical arity-22 34-by-560 feedback system.

Plan: identify its actual row/column conventions; generate actual bracket and
projection matrices with the available specified contraction; derive right-hand
sides from sources; verify exact ranks, solutions, minors and compatibility.
Never identify a new projection with the missing historical projection merely
because matrix shapes or ranks agree.

- 2026-09-06 — Initial rg included a nonexistent workspace `Part II` directory
  and returned exit 2. Relevant Part II algebra is available in the v0.04/v0.05
  portable bundles; subsequent reads use those verified paths. No source changed.
- 2026-09-06 — The frozen v0.05 projection sends the U16 alpha/xi feedback
  images into a two-dimensional harmonic sector. Its arity-22 full-coordinate
  matrix has rank 34, but resetting the high F21 coefficients on the v0.05
  trajectory gives augmented rank 35. The 88-direction controller instead
  has ranks 67/67. Rank 34 alone does not imply the U16 system is solvable.
  Revised plan: preserve this countercheck; continue a separate U16-valued
  trajectory from arity 17, parameterizing homotopy values only on genuinely
  independent source channels and checking the full harmonic output.
- 2026-09-06 — The first U16 continuation probe failed before changing any
  trajectory: not every quadratic U16 bracket projects into the two-dimensional
  alpha/xi feedback image under p_v05. Therefore a two-row-per-monomial matrix
  is not automatically a complete obstruction test. Investigate the closed
  harmonic quotient of the full quadratic space before reducing outputs.
- 2026-09-06 — The complete quadratic span has ranks 267 (raw), 264
  (differential), 2 (closed cohomology image), and 3 (p_v05 image).
  A probe incorrectly assumed p_v05[alpha,E32] supplies the third direction;
  its independence assertion failed. Select that direction from the actually
  computed quadratic image instead, and verify feedback rank is preserved.
- 2026-09-06 — The revised probe passed all five compatible systems at targets
  19--23, with ranks 28,30,32,34,36. The serialized producer subsequently
  completed the full h2,p2 maps and replay through arity 23, exit 0. After a
  continued user turn its process handle was no longer available; completion
  is confirmed by the durable log and final result files, not a stale handle.
  Arity 23 was actively controlled and must not be called held out.
- 2026-09-06 — Independent consumer completed with exit 0: full d2 kernel,
  42-class splitting, all 703 quadratic pairs, arities 2--23 from an independent
  flattened cup product, history ranks, 76 archived rails, and every entry/RHS/
  solution/pivot inverse/determinant at arities 19--23 passed. The deliberate
  Python -O negative test correctly exited 1 before accepting any certificate.
  The updated portable v0.05 comparison now asserts its observed ranks 34/35
  and 67/67; it is included in the extracted-package check.
- 2026-09-06 — After sealing the payload, an optional attempt to open the
  mathematical note in the desktop panel failed because the formerly available
  open_in_codex tool was no longer callable. Deliver ordinary local file links;
  this UI failure does not alter the matrix files or their verification.
