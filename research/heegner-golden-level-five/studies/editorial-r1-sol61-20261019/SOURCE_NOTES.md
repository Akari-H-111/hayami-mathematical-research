# Source notes

## Local materials used

- `input/BASELINE.md`: mathematical baseline, including the HMR surface
  calculation, operator normalizations, inverse scalar formulas, CM values,
  and references to prior sections.
- `input/COLD_REVIEW.md`: the accepted cold review, used selectively for its
  five editorial priorities and reader-accessibility observations.
- `EDITORIAL_MANDATE.md`: a local copy of the revision mandate, consulted as
  reference data alongside the user's controlling request.
- `logs/DUKE_PRIMARY_TEXT.txt`: preserved primary-source text consulted at
  Eq. (2.3), Proposition 2 / Eq. (3.2), Eq. (4.1), and the §2
  \(j\)-expansion. Eq. (4.1)'s Kronecker-symbol product is written in the
  manuscript as the equivalent four-residue product modulo five.

## Provenance and retrieval limits

- **Duke.** The cached PDF's SHA-256, supplied from prior verified work, is
  `fcf69ec30dae5fb372818aef3152b7adf326f244dda52844df5fa5048d38cbe5`.
  The CLI editor used the supplied provenance; the director independently
  recomputed the cached PDF hash during this revision and confirmed it.
  The director reported that a live fetch in this turn timed
  out. This revision used the preserved primary text and made no new live
  retrieval. The manuscript links the primary source at
  <https://www.math.ucla.edu/~wdduke/preprints/bams4.pdf>.
- **HMR.** The baseline identifies the orthogonal-circle ruled-surface v5,
  its surface definition and rank-loss theorem, and points to an earlier
  `SOURCE_MAP.md` for the exact local source. That map and the original v5
  document were not consulted by the CLI editor. The director checked the
  v5 source's title, surface definition and named rank-loss theorem at
  `papers/legacy-geometry/orthogonal-circle-ruled-surface/revision_v5/Orthogonal_Circle_Ruled_Surface_v5.tex`
  (`def:surface`, `thm:regularity`) and corrected the manuscript reference.
  The displayed calculation is retained from the baseline; the manuscript
  uses a conventional source label rather than local archive machinery.
- **Balanzario and Sanchez-Ortiz (2007).** Prior work had indexed first-page
  primary text containing Eq. (1) and the introductory historical statement;
  the full PDF could not be retrieved. This limitation is inherited, not the
  result of a new retrieval attempt here. The manuscript retains attribution
  of the coefficient convention and classical off-critical-line zero result
  to that paper, DOI `10.1090/S0025-5718-07-01999-0`. The Poisson/Mellin
  derivation establishes the functional equation; zero existence remains an
  externally attributed result.
- **DLMF.** The Poisson summation citation is retained at
  <https://dlmf.nist.gov/1.8#iv>. No live retrieval was attempted.
- **Hermite and prior arithmetic results.** The 1859 reference, pp. 47–48,
  the value \(j(\tau_{163})=-640320^3\), and the earlier golden-subfield
  result are retained from the supplied baseline and mandate. The historical
  pages and earlier sections were not re-examined here. The manuscript marks
  the subfield statement as a prior result and uses the supplied classical
  \(j\)-value to recall the near-integer mechanism, without a new error bound.

The CLI editor wrote only `MANUSCRIPT_ENDING.md`, `EDITORIAL_CHANGES.md`, and
`SOURCE_NOTES.md`, without running verifiers or browsing. The director ran
the copied baseline checker before and after revision, reviewed the added
definitions and expanded analytic steps, and checked preservation and local
navigation. The three original CLI outputs are preserved under
`logs/sol-authored/`. No installation, commit, or publication occurred.
Source-retrieval limitations remain as recorded above; this is a revised
closing section, not full-paper validation.
