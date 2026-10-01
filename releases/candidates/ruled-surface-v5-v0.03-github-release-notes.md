# Ruled surface v5 verification companion v0.03 — source release

The executable proof and verification sources are released before the final
article PDF, following the author's 1 October 2026 instruction. This release
contains **no new article or companion PDF**. Its manuscript TeX is the verified
mathematical snapshot awaiting reader-facing editorial review.

Every asserted corrected mathematical result has claimwise Lean coverage,
with actual definitions and domain/boundary hypotheses: 224 own public named
theorems and 258 separately audited dependencies. The global boundary atlas,
five rank-singular source labels, corner-embedding obstruction, actual curvature
and atlas transport, physical-circle winding, full critical locus and skeleton
intersections, actual ordinary fold charts, conditional fiber/phase-lock
recurrence and Fourier integral bounds are included. Independent open research
questions remain clearly separated in `COVERAGE.md`.

Lean/Mathlib 4.33.1 builds, complete axiom audits and proof-hole scans pass.
Only `propext`, `Classical.choice` and `Quot.sound` are allowed. Independent exact
SymPy replay preserves the old counterexamples: reproducing a counterexample
rejects the old claim rather than validating it. The source-release receipt
records in-place and ZIP-extracted source replay; no PDF rebuild/visual-QA claim
is made for this PDF-free distribution. Same-host pinned packages and an
identical-source dependency cache are reused; RuledV5 is freshly rebuilt in
both locations. No GitHub Actions workflows are configured.

Run `python -B verify.py` with the included `requirements.txt` and Lean toolchain.
Never use Python optimization or `lake update`. No build cache is distributed.

The immutable full local v0.03 candidate and the older partial checkpoints
remain unchanged. ResearchGate and Zenodo article/companion PDF publication
follows editorial review and final artifact confirmation. The historical v4
paper DOI `10.13140/RG.2.2.10337.26725` is a source relation; new article,
software-version and software-concept DOIs remain unassigned and distinct.
Cite this software version using this release URL until its DOI is assigned.

License: Apache-2.0 code/build; CC-BY-4.0 original scholarly material.

Source-only ZIP SHA-256: `40da570c30257f6bc060ecf173416946229d26420acd252ba185bd4e16119e0c`.
Manifest SHA-256: `df4f95282b15ce4a6f9d11cac452b66a3d5d65f689803dbd0f43256a0a8aba64`.
The ZIP has 69 members: 68 source payload files and its manifest.
