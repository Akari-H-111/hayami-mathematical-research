# Stokes v5 v0.04 publication verification

2026-09-30. GitHub and Zenodo **published / API+download verified**.
The assigned Zenodo DOI's `doi.org` resolution is still unverified.
This is a mutable external-state record, separate from the sealed payload.

GitHub release:
<https://github.com/Akari-H-111/hayami-mathematical-research/releases/tag/stokes-v5-companion-v0.04>

- Published: `2026-09-30T05:55:12Z`; neither draft nor prerelease.
- Tag points to proof/sealing commit `83e92981f560a1751afb4439a5d1a73a1e973fba`.
- 258 public named Lean theorems: exhaustive axiom audit, build, status and
  proof-hole check PASS in both original and independently extracted copies.
- Exact CAS, standard-library Sturm, authoritative PDF hash/ten-page geometry,
  isolated recovered-source alignment (`0.982321`), 51 payload hashes and
  52-member ZIP CRC PASS. No GitHub Actions workflows are configured.
- All three public downloads reproduce the sealed SHA-256 values below and
  agree with GitHub's API asset digests.

| Asset | Bytes | SHA-256 |
| --- | ---: | --- |
| `stokes_caustic_v5_lean_companion_v0_04_candidate.zip` | 413199 | `6789042a046fc1f3f0f75610979fec3a7d8355179ab10549101f48265ad76244` |
| `stokes_caustic_v5_lean_companion_v0_04_candidate_receipt.json` | 1117 | `77bd10329e704ea191e1cbac11d6b55b54ad344bda2aa6cb5afdc022f22a22c6` |
| `The_Stokes_Caustic_of_the_Orthogonal_Circle_Ruled_Surface_v5.pdf` | 316335 | `4e48c805c1550dbaee9171a56264bf4ff5275ef5ff5b64f9cd116803283c11c0` |

## Zenodo public readback

The author-login handoff is resolved. **New version** of the owning v0.03
record produced the public record <https://zenodo.org/records/23057630>.
The official API <https://zenodo.org/api/records/23057630> reports:

- `state=done`, `submitted=true`, resource type `software`, version `0.04`;
- title `Stokes caustic v5 Lean companion`, author Hayami, Akari;
- publication date `2026-09-30`;
- assigned version DOI `10.5281/zenodo.23057630` and unchanged concept DOI
  `10.5281/zenodo.22726976`;
- the three files/byte counts above, all publicly downloaded SHA-256 values
  matching the sealed assets and API MD5 checksums;
- public description containing the full statement-level scope, open-germ
  boundary and separate paper/software citation identifiers;
- preserved CC-BY-4.0 scholarly/documentation and Apache-2.0 code licenses.

Initial `https://doi.org/10.5281/zenodo.23057630` readback returned HTTP 404.
DOI resolution is therefore **pending verification**, not a publication
failure: the Zenodo public record/API/downloads are already available. Do
not create another version or change the assigned DOI to resolve this.
Root citation/README/board and the GitHub v0.04 release notes use the assigned
software DOI with the available direct Zenodo record link. The sealed ZIP,
receipt, payload manifests and archived citation snapshot are not resealed.

Paper DOI stays `10.5281/zenodo.22728902`; v0.03 software DOI stays
`10.5281/zenodo.22735974`. v0.04 software DOI is `10.5281/zenodo.23057630`.
No ResearchGate paper DOI change is needed. The former v0.03 citation-text
504 blocker is closed: its official API now publicly contains Citation
boundary and the correct separate identifiers.

The statement-level Lean scope remains `FULL_PAPER_COVERAGE.md`. The paper's
open full exceptional-germ classification and versal unfolding remain open;
the ordinary four-jet does not close them.
