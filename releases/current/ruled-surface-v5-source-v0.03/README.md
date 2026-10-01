# Ruled surface v5 verification companion 0.03 — source release

This GitHub release publishes the executable proof and verification sources
first, as authorized by the author on 1 October 2026. **No PDF is included.**
The article TeX is the mathematically verified snapshot preceding the requested
reader-facing review of language, paragraphs, layout and figure guidance.
The final article and companion PDF publication is deferred until that review.

Every asserted corrected mathematical result has claimwise Lean coverage in
`companions/lean/ruled-surface-v5/COVERAGE.md`, with its actual definitions and
domain/boundary hypotheses: 224 own public named theorems and 258 separately
audited dependency theorems. The global boundary atlas, five source rank losses,
corner obstruction, actual curvature and atlas transport, small physical-circle
winding, complete critical locus and skeleton intersections, actual fold charts,
conditional recurrence/phase lock and Fourier integral bounds are covered.
Exceptional-germ classification, global regular-image identifications and an
invariant boundary-observation convention remain unclaimed research questions.

The included exact scripts preserve the old counterexamples. Successful
reproduction of an old counterexample rejects the original unrestricted claim;
it does not prove it. The historical v4 PDF and all local full-candidate ZIPs,
receipts, manifests and accepted PDFs remain unchanged. The historical PDF is
not redistributed in this source-only package. Its ResearchGate paper DOI
`10.13140/RG.2.2.10337.26725` is not a new article or software DOI.
All three new DOI roles remain unassigned.

## Replay

Install Lean 4.33.1 with elan/Lake and create an isolated Python environment:

```sh
python3 -m venv local/venv
local/venv/bin/python -m pip install -r requirements.txt
local/venv/bin/python -B verify.py
```

The lockfiles pin Mathlib 4.33.1 and all nine git dependencies; do not run
`lake update`. Never use Python optimization: assertions are verification
checks. The entrypoint checks the complete source inventory and hashes,
independent exact algebra/counterexamples, actual dependency HEADs and clean
tracked sources, both complete builds/status/axiom audits and proof-hole scans.
The only allowed logical axioms are `propext`, `Classical.choice`, `Quot.sound`.
No `.lake` cache or credentials are distributed. A first run fetches pinned
dependencies through the official cache command.

This entrypoint deliberately makes **no PDF rebuild, native compilation or
visual-QA claim for this distribution**. The separate immutable full local
candidate passed those checks; its ZIP and receipt hashes are recorded in
`METADATA.json`. The adjacent source-release receipt records this package's
actual in-place and ZIP-extracted replays. They reuse pinned packages and an
identical-source Stokes cache on the same host; RuledV5 is rebuilt from the
packaged sources in both locations. This is not independent-host evidence.
No GitHub Actions workflows are configured; local replay is not a CI claim.

Code/build: Apache-2.0. Original manuscript, figures and documentation:
CC-BY-4.0. See `LICENSE.md`. Cite version 0.03 using its GitHub release URL
until a distinct software-version DOI is assigned; do not reuse a Stokes DOI.
