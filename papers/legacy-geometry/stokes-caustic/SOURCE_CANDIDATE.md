# Recovered source-candidate audit

Candidate: `../../過往論文（可能是草稿）/The_Stokes_Caustic_of_the_Orthogonal_Circle_Ruled_Surface_v5.tex`

Evidence:

- Tectonic 0.17.0 compiles the candidate to a 10-page US-letter PDF, matching the final PDF's page count and size.
- The portable builder's deliberately simple ASCII word-token comparison between `pdftotext -raw` outputs gives ratio `0.982321`, above its fail-closed `0.98` threshold. An earlier typography-normalized comparison gave `0.99553998`; the portable, stricter-to-reproduce number is the release metric.
- The rebuilt PDF is not pixel-identical.  Its embedded Latin Modern fonts are Type 1C, whereas the supplied final PDF uses Type 1; line breaks also differ slightly.
- The independently reconstructed exact and Sturm verifiers pass the candidate's principal mathematical formulas.

Status: **content-aligned recovered source candidate**, not hash- or pixel-identical original source.  It may be used as the base for the corrected local reconstruction, while the final PDF remains the authority for any textual discrepancy.

The system `pdflatex` route was also tested but the minimal TeX installation lacks `cleveref.sty`; no package was installed globally merely to force that route.
