# Whitney-fold formalization status

Updated: 2026-09-30.

## Completed working-source milestone

The formerly outstanding coordinate-level ordinary-fold statement is now
proved. `HasWhitneyNormalFormAt` supplies smooth source and target charts,
smooth two-sided local inverses, and the actual local identity `(x,y^2)`.
Both symmetry points with `u>0` and ordinary physical rational-branch points
have this normal form. The proof does not assume a Morse or Whitney theorem.

The working extension also proves the physical critical-locus decomposition,
the complete physical rational interval, transverse source tangents at the
exceptional intersection, discriminant tangency with cubic Big-O error, and
the actual radial sphere map's unit length, mirror relation, endpoints,
strict third-coordinate monotonicity, unique boundary maximum, and nonzero
initial derivative. The construction and precise hypotheses are recorded in
`COORDINATE_PROOFS.md`.

The 2026-09-30 extension now also covers all asserted mathematical results
listed in `FULL_PAPER_COVERAGE.md`: displayed Taylor and Jacobian remainder
bounds, the actual exceptional no-fold obstruction, valid exceptional chart
and ordinary four-jet/rescaling, auxiliary curve and irreducible quintic,
fixed Sturm variations, and exact rational enclosures. The full exceptional
germ's classification and versal unfolding are open questions, not proved
claims of the paper and not closed by its four-jet.

## Preserved criterion-level baseline

The working Lean source now closes L1–L5 at the intrinsic Jacobian-criterion
level:

- the positive-`Q` chart;
- the real two-coordinate observation map;
- positivity and nonvanishing of its square-root denominator;
- an explicit Fréchet derivative throughout the chart;
- the exact displayed Jacobian factorization;
- exact rank-one kernels and Jacobian transversality on both ordinary branches;
- zero transversality and failure of the fold criterion at the exceptional
  common initial point;
- an intrinsic plane-to-plane Whitney-fold criterion, satisfied by both
  ordinary branches.

These declarations compile without `sorry` and are included in the axiom audit.
The sealed v0.02 and v0.03 releases remain immutable.

## Published archive status (historical verification)

The separate v0.03 candidate is sealed locally under
`releases/candidates/stokes-caustic-v5-v0.03/`. Its local and extracted replays
pass, and GitHub release `stokes-v5-companion-v0.03` is public with its ZIP,
receipt, and authoritative PDF hash-verified after download. Zenodo version
record `22735974` is now public as version DOI `10.5281/zenodo.22735974`,
under the unchanged concept DOI `10.5281/zenodo.22726976`; its official API and
public downloads reproduce all three sealed SHA-256 values. The sealed v0.02
remains unchanged.

## Verification boundary

The original criterion-level line remains checked:

1. the explicit Jacobian factorization;
2. rank one and kernel transversality on each claimed ordinary-fold branch;
3. the exceptional status of the common initial point;
4. the precisely stated intrinsic plane-to-plane Jacobian fold criterion on
   each ordinary branch.

The stronger coordinate-level line is now checked in the working source,
but is not retroactively attributed to v0.03. The 2026-09-30 local replay
passes build, status checks, the public-theorem axiom audit, and the no-`sorry`
scan; the exact geometry and Sturm verifiers also pass. No PDF was recompiled
and no external release or DOI metadata was modified in this task.

No mathematical blocker remains for the asserted v5 results in the coverage
map. The author has authorized a separate v0.04 release. Sealing, independent
extracted replay and public readback remain required before publication is
marked complete. The authoritative PDF and v0.02/v0.03 stay unchanged.
