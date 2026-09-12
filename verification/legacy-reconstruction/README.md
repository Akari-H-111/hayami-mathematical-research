# Legacy-paper clean-room reconstruction

This directory rebuilds three legacy papers from their final PDFs.  It is deliberately **not** a cleanup of the historical TeX in `過往論文（可能是草稿）/`: that TeX may contain superseded statements or calculations.

## Authority order

1. The three hash-bound final PDFs listed in `../../papers/legacy-geometry/source-registry/SOURCE_REGISTRY.md` determine the statements, scope limits, figures, and bibliography that must be reconstructed.
2. Fresh symbolic, numerical, and (where appropriate) Lean checks determine whether a reconstructed claim has been independently re-established.
3. The legacy TeX is comparison-only evidence.  It may suggest notation or an earlier derivation, but cannot overwrite a final-PDF statement.

## Status vocabulary

- `PDF-locked`: statement transcribed and page-pinned to a final PDF.
- `re-derived`: a human-readable reconstruction exists, but has not yet been checked computationally.
- `CAS-passed`: a self-contained exact verifier passes.
- `Lean-passed`: the formal theorem builds without `sorry`.
- `external-dependency`: relies on a cited theorem whose hypotheses have not yet been checked in this project.
- `counterexample`: the PDF statement is false under its written hypotheses; any replacement must be a newly stated theorem with explicit additional assumptions.
- `blocked`: missing a definition, derivation, or prerequisite.

Never treat `PDF-locked` as a mathematical proof status.  It preserves what the final manuscript says; it does not replace re-verification.

## Dependency order

```text
shared orthogonal-circle surface
  ├─ 01 ruled surface v4
  ├─ 02 Stokes caustic v5
  └─ 03 bicomplex signal manifolds v12
       ├─ intrinsic geometry and monodromy
       ├─ singular/cross-cap analysis
       └─ analytic and spectral completion modules
```

Each paper must remain buildable as a separately citable manuscript.  The shared directory holds only definitions and certificates genuinely common to all three; it must not silently import conclusions from one paper into another.

## First reconstruction milestones

1. Transcribe every theorem, proposition, definition, scope limitation, and figure/citation dependency from the PDFs into the three claim ledgers.
2. Re-derive the shared parametrization, domain conditions, and exact polynomial identities.
3. Build independent exact verifiers for the ruled-surface and Stokes algebraic cores.
4. Split the 43-page bicomplex manuscript into independently auditable geometric, singular, analytic, and observation modules before reconstructing prose.
5. Only then regenerate TeX and begin Lean work on the finite algebraic components.

## Current verification entrypoint

From the repository root, create a machine-local environment and execute:

```bash
python3 -m venv local/cache/python/legacy-reconstruction-venv
local/cache/python/legacy-reconstruction-venv/bin/python -m pip install -r verification/legacy-reconstruction/requirements.txt
local/cache/python/legacy-reconstruction-venv/bin/python -B verification/legacy-reconstruction/verify_all.py
```

This command is intentionally a baseline, not a whole-paper certificate.  It reports the known v4 boundary obligation and the explicit counterexample to the unqualified v4 pseudo-recurrence theorem.

To rebuild and classify every located TeX source, run:

```bash
local/cache/python/legacy-reconstruction-venv/bin/python -B verification/legacy-reconstruction/build_source_candidates.py
```

The classifications are part of the output: only v5 is content-aligned; v4 and v12 are preserved as ancestors. The authoritative final PDFs live under `../../papers/legacy-geometry/source-registry/final_pdfs/` and are hash-checked by the baseline verifier.

See `../../papers/legacy-geometry/source-registry/RECOVERED_SOURCE_PROVENANCE.md` for source hashes, `VISUAL_QA.md` for rendered-page checks, and `FORMALIZATION_AND_PUBLICATION_DECISION.md` for the Lean/publication ranking.
