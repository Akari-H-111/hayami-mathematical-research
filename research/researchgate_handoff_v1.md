# ResearchGate task handoff

Updated: 2026-09-14

## Task goal

Create a separate ResearchGate preprint entry for final v5, leaving the old
entry and old DOI unchanged; after completion, add a superseded note and a link
to the new DOI to the old entry.

## Completed and immutable data

- Final title: `Observation Discriminant and Spherical Fold Image of the Orthogonal-Circle Ruled Surface`
- Author: `Akari Hayami (Jian-Yu Huang)`
- Date: July 2026
- Final PDF:
  `papers/legacy-geometry/source-registry/final_pdfs/The_Stokes_Caustic_of_the_Orthogonal_Circle_Ruled_Surface_v5.pdf`
- SHA-256:
  `4e48c805c1550dbaee9171a56264bf4ff5275ef5ff5b64f9cd116803283c11c0`
- Zenodo public record: [22728902](https://zenodo.org/records/22728902)
- Zenodo version DOI:
  [10.5281/zenodo.22728902](https://doi.org/10.5281/zenodo.22728902)
- Zenodo concept DOI:
  [10.5281/zenodo.22728901](https://doi.org/10.5281/zenodo.22728901)
- Lean companion v0.03 software DOI:
  [10.5281/zenodo.22735974](https://doi.org/10.5281/zenodo.22735974); concept
  DOI: [10.5281/zenodo.22726976](https://doi.org/10.5281/zenodo.22726976)
  (neither may be used as the mathematical paper DOI)

## Old ResearchGate entry

URL:
https://www.researchgate.net/publication/408887855_The_Stokes_Caustic_of_the_Orthogonal-Circle_Ruled_Surface_Poincare_Sphere_Geometry_and_an_Irreducible_Chirality_Quintic

Retain:

- Keep the old title, old PDF, old date, and old DOI.
- Old RG DOI: `10.13140/RG.2.2.23759.04006`
- Do not overwrite the old PDF, and do not change the old DOI to a Zenodo DOI.

## Next-window operation order

1. First call `cua.listBrowsers()`, and select the browser whose metadata has
   `extensionInstanceId = fddc5e23-7e8e-4d33-9019-9232a6bbed9e`.
2. Obtain and claim the current ResearchGate tab; confirm the logged-in account
   is Jian-Yu Huang.
3. On the ResearchGate home page, choose `Add new` → `Preprint`.
4. Fill in the final v5 title, author, July 2026, and abstract, and upload the
   above PDF; the entry should be public.
5. Enter the Zenodo version DOI in the DOI/external identifier field:
   `10.5281/zenodo.22728902`.
6. After saving, re-read the public page and confirm the title, author, PDF, and
   DOI are all visible.
7. Return to the old entry; if you have edit permission, add the following to
   the description or abstract:

   `Superseded by the final v5 preprint, Observation Discriminant and Spherical Fold Image of the Orthogonal-Circle Ruled Surface (July 2026), DOI: 10.5281/zenodo.22728902.`

8. Re-read the old entry's public page and confirm the old DOI is unchanged and
   the superseded note is visible.

## If the browser controller fails

If this window cannot see `cua_repl`, do not switch to another login automation
method and do not claim completion. First open a new conversation in the same
Codex desktop app and re-attach the ResearchGate tab; check Browser/Computer Use
permissions and the Chrome extension instance. If the new conversation works,
hand this file to the new window to continue.

## Completion criteria

Only after all three conditions are verified on the public page — the new RG
entry is publicly visible, the PDF is consistent with the Zenodo version, and
the old entry is retained and clearly points to v5 — may the ResearchGate task
be reported complete.
