# Stokes caustic v5 Lean companion v0.04

This separate version formalizes the asserted mathematical results of final
v5, with a statement-level map in `formalization/FULL_PAPER_COVERAGE.md`.

- Actual smooth source/target coordinate changes and two-sided local inverses
  give the Whitney fold `(x,y^2)` on both ordinary branches.
- The exceptional point is not a Whitney fold. Its valid source chart,
  weighted expansion, ordinary four-jet and invertible real rescaling to
  `(x,xy^2+y^4)` are proved.
- Physical locus/discriminant, radial geometry and strict monotonicity,
  Taylor/Big-O remainders, auxiliary irreducible quintic/maximum, fixed Sturm
  variation data, skeleton intersection and exact rational enclosures are
  included.

All 258 public named theorems pass the exhaustive axiom audit and pinned Lean
4.33.1 / Mathlib v4.33.1 build. Proof holes, extra axioms, `unsafe` and
`native_decide` are rejected. Independent exact CAS/Sturm scripts and the
unchanged PDF/recovered-source verification are separate evidence.

Full exceptional-germ classification and versal unfolding are open questions
in the paper, not claimed results. Plot samples, bibliography, historical
attribution and unasserted physical/APS/spinorial interpretations are excluded.
No general Whitney/Morse recognition theorem or general Sturm theorem is
assumed. Ordinary boundary folds are ambient-extension statements.

Citation boundary: cite the mathematical paper using
[paper DOI 10.5281/zenodo.22728902](https://doi.org/10.5281/zenodo.22728902).
Cite this **software v0.04** via this versioned release and its own new DOI
when assigned. The software concept DOI is
[10.5281/zenodo.22726976](https://doi.org/10.5281/zenodo.22726976).
Do not cite v0.03 software DOI 10.5281/zenodo.22735974 as v0.04 or as the paper.

The authoritative final-v5 PDF SHA-256 remains
`4e48c805c1550dbaee9171a56264bf4ff5275ef5ff5b64f9cd116803283c11c0`.
Both original-location and independently extracted complete replays passed,
including all 258 Lean theorem audits, exact CAS/Sturm scripts and the
ten-page recovered-source alignment (`0.982321`). ZIP CRC and 51 payload
hashes passed; no `.lake` build cache is distributed. No GitHub Actions
workflows are configured, so these are replay results, not a CI-green claim.

v0.04 ZIP SHA-256:
`6789042a046fc1f3f0f75610979fec3a7d8355179ab10549101f48265ad76244`.

v0.02/v0.03 archives, receipts and manifests are unchanged. The attached ZIP
and sealing receipt report the original local and independently extracted
replays; publication itself is verified separately on the public platform.
