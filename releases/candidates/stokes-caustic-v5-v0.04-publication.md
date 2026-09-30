# Stokes v5 v0.04 publication / Zenodo handoff

2026-09-30. GitHub **published and verified**; Zenodo **login required**.
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

## Remaining external step

The browser is at <https://zenodo.org/login/?next=/records/22735974> and is
not authenticated. The author must log in to the existing owning account.
No v0.04 Zenodo draft or DOI has yet been created; do not report publication
or invent a new DOI.

After login, use **New version** from the owning v0.03 record
<https://zenodo.org/records/22735974>, preserving software concept DOI
`10.5281/zenodo.22726976`. Upload the three sealed assets above, set version
`0.04`, publication date `2026-09-30`, and use the scope/citation boundary in
`stokes-caustic-v5-v0.04-release-notes.md`. Do not replace v0.03 files.
Publish under the existing software record type/ownership and verify the
official public API, version DOI, metadata and all public download hashes.
Then update root citation/README/board and the GitHub release body with the
new software DOI, without resealing or changing the archived payload.

Paper DOI stays `10.5281/zenodo.22728902`; v0.03 software DOI stays
`10.5281/zenodo.22735974`. v0.04 must receive its own software version DOI.
No ResearchGate paper DOI change is needed. The former v0.03 citation-text
504 blocker is closed: its official API now publicly contains Citation
boundary and the correct separate identifiers.

The statement-level Lean scope remains `FULL_PAPER_COVERAGE.md`. The paper's
open full exceptional-germ classification and versal unfolding remain open;
the ordinary four-jet does not close them.
