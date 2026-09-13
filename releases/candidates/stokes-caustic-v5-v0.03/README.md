# Stokes caustic v5 Lean companion v0.03 candidate

This is a reproducible companion to Akari Hayami (Jian-Yu Huang),
*The Stokes Caustic of the Orthogonal-Circle Ruled Surface*, version 5.

The supplied PDF in `final_pdf/` is authoritative.  The TeX file in
`source_candidate/` is a content-aligned recovered source candidate, not the
lost byte-identical original source.  Its isolated rebuild has ten pages and
an ASCII word-token similarity of at least `0.98` to the authoritative PDF.

The Lean project defines the real two-variable observation map on the positive-
`Q` chart; proves its explicit Fréchet derivative and exact Jacobian
factorization; certifies the ordinary symmetry and physical rational branches
by an intrinsic plane-to-plane Whitney-fold Jacobian criterion; and proves that
the exceptional common point fails that criterion. It also retains the exact
polynomial identities, real root barriers, and independent CAS replay from
v0.02. The package does **not** claim to construct local source and target
diffeomorphisms carrying the map to the coordinate normal form `(x, y^2)`.
See `THEOREM_MAP.md` and `formalization/GEOMETRIC_CLOSURE_BOUNDARY.md`.

Run the complete replay from this directory:

```bash
python3 -B verify.py
```

Python dependencies are pinned in `requirements.txt`. Required commands are
`lake`, `tectonic`, `qpdf`, `pdfinfo`, and `pdftotext`.
The pinned Lean project uses Lean `4.33.1` and Mathlib `v4.33.1`; the first
replay downloads the pinned Mathlib dependency and its official build cache.

If SymPy is not already available, create an isolated environment and install
`requirements.txt` before running the replay.

Code is Apache-2.0 and scholarly/documentation material is CC-BY-4.0; see
`LICENSE.md` for the exact scope. The sealed v0.01 and v0.02 packages remain
unchanged.

This directory is a local release candidate. Its generated ZIP and receipt are
not evidence of GitHub or Zenodo publication.

`Stokes` here refers to optical Stokes-Poincare parameters, not to the
Navier-Stokes equations of fluid mechanics.
