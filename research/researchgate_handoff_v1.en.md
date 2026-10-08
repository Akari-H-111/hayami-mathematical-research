# ResearchGate task handoff

Updated: 2026-09-14

## Task objective

Create a separate final v5 Preprint entry on ResearchGate while preserving the old entry and DOI; then add a superseded notice and new DOI link to the old entry.

## Completed material that must not be rewritten

- Final manuscript title: `Observation Discriminant and Spherical Fold Image of the Orthogonal-Circle Ruled Surface`
- Author: `Akari Hayami (Jian-Yu Huang)`
- Date: July 2026
- Final PDF: `papers/legacy-geometry/source-registry/final_pdfs/The_Stokes_Caustic_of_the_Orthogonal_Circle_Ruled_Surface_v5.pdf`
- SHA-256：`4e48c805c1550dbaee9171a56264bf4ff5275ef5ff5b64f9cd116803283c11c0`
- Public Zenodo record: [22728902](https://zenodo.org/records/22728902)
- Zenodo version DOI: [10.5281/zenodo.22728902](https://doi.org/10.5281/zenodo.22728902)
- Zenodo concept DOI: [10.5281/zenodo.22728901](https://doi.org/10.5281/zenodo.22728901)
- Lean companion v0.03 software DOI: [10.5281/zenodo.22735974](https://doi.org/10.5281/zenodo.22735974); concept DOI: [10.5281/zenodo.22726976](https://doi.org/10.5281/zenodo.22726976) (neither is the mathematical paper DOI)

## Old ResearchGate entry

URL:
https://www.researchgate.net/publication/408887855_The_Stokes_Caustic_of_the_Orthogonal-Circle_Ruled_Surface_Poincare_Sphere_Geometry_and_an_Irreducible_Chirality_Quintic

Preserve:

- Keep the old title, PDF, date, and DOI.
- Old RG DOI: `10.13140/RG.2.2.23759.04006`
- Do not overwrite the old PDF or replace the old DOI with the Zenodo DOI.

## Next-window operation sequence

1. First call `cua.listBrowsers()` and select the browser whose metadata has `extensionInstanceId = fddc5e23-7e8e-4d33-9019-9232a6bbed9e`.
2. Obtain and claim the current ResearchGate tab; confirm the signed-in account is Jian-Yu Huang.
3. On the ResearchGate home page choose `Add new` → `Preprint`.
4. Enter the final v5 title, author, July 2026, and abstract, and upload the PDF above; the entry should be public.
5. Set DOI/external identifier to the Zenodo version DOI: `10.5281/zenodo.22728902`.
6. After saving, reread the public page and confirm that title, author, PDF, and DOI appear.
7. Return to the old entry; if editing is permitted, add to its description or abstract:

   `Superseded by the final v5 preprint, Observation Discriminant and Spherical Fold Image of the Orthogonal-Circle Ruled Surface (July 2026), DOI: 10.5281/zenodo.22728902.`

8. Reread the old entry's public page and confirm that its DOI is unchanged and the superseded notice is visible.

## If browser control fails

If this window cannot access `cua_repl`, do not substitute another login automation method or claim completion. Open a new conversation in the same Codex desktop app and reattach the ResearchGate tab; check Browser/Computer Use permissions and the Chrome extension instance. If the new conversation works, pass this document there to continue.

## Completion criterion

Report the ResearchGate task complete only after public-page verification of all three conditions: “new RG entry publicly visible, PDF matches the Zenodo version, old entry retained and explicitly pointing to v5.”
