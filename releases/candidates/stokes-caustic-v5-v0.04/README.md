# Stokes caustic v5 Lean companion v0.04

Reproducible companion to Akari Hayami (Jian-Yu Huang),
*Observation Discriminant and Spherical Fold Image of the Orthogonal-Circle
Ruled Surface* (final v5; historical PDF title: *The Stokes Caustic of the
Orthogonal-Circle Ruled Surface*).

The unchanged ten-page PDF in `final_pdf/` is authoritative. The TeX in
`source_candidate/` is a content-aligned recovered candidate, not the lost
byte-identical original. Its isolated rebuild must have ten pages and at
least `0.98` ASCII word-token similarity.

This version covers the asserted mathematical results listed in
`formalization/FULL_PAPER_COVERAGE.md`: actual smooth two-sided Whitney-fold
charts on both ordinary branches; the full physical locus/discriminant;
radial endpoints, regularity and strict monotonicity; Taylor/Big-O remainders;
the exceptional no-fold obstruction, valid chart and ordinary four-jet;
auxiliary-curve maximum and irreducible quintic; fixed Sturm variation data;
and exact rational numerical enclosures. All 258 public named theorems are
included in the exhaustive axiom audit. No proof holes, added axioms,
`unsafe`, or `native_decide` are permitted.

The paper explicitly leaves full exceptional-germ classification and versal
unfolding open; these are not claimed. Plot samples, bibliography, historical
attribution and unasserted physical/spinorial interpretations are not Lean
theorem targets. No generic Whitney/Morse or Sturm theorem is assumed.

Run from this directory:

```bash
python3 -B verify.py
```

Install the pinned `requirements.txt` in an isolated Python environment.
Required commands: `lake`, `tectonic`, `qpdf`, `pdfinfo`, `pdftotext`.
Lean `4.33.1` and Mathlib `v4.33.1` are pinned. A fresh replay downloads the
pinned dependency and official build cache. The Lean-only replay is
`python3 -B verify_lean.py` inside `formalization/`.

Citation boundary: the mathematical paper DOI is
`10.5281/zenodo.22728902`. Cite this **software companion v0.04** separately
via its versioned release/DOI; never assign v0.03 DOI
`10.5281/zenodo.22735974` to v0.04. The all-version software concept DOI is
`10.5281/zenodo.22726976`, not a paper DOI.
Versioned release:
<https://github.com/Akari-H-111/hayami-mathematical-research/releases/tag/stokes-v5-companion-v0.04>.

Code: Apache-2.0. Scholarly/documentation material: CC-BY-4.0; see
`LICENSE.md`. Earlier sealed packages, receipts and manifests are unchanged.
A local ZIP/receipt alone is not evidence of public publication.

“Stokes” means optical Stokes-Poincare parameters, not Navier-Stokes.
