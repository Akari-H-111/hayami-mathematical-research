# Assembly notes — portrait revision 0.2

Completed 20 October 2026. This packet is a distinct revision; the v0.1 paper,
its twelve-plate atlas, and all sealed or hash-bound earlier artifacts remain
unchanged.

## Starting point and editorial decision

The cold-review packet
`../cold-review-layout-sol61-deepseek-20261020/` recorded two independent AI
readings of the 19-page v0.1 PDF. Both recommended a continuous portrait article
and a separate full-size visual supplement. The director synthesis proposed four
compact body groups, while insisting that the CM/Hermite-to-`c0` strand remain
primary and that no original visual evidence be discarded.

The implemented revision follows that synthesis:

- A 10-page Letter article with four body figures, continuous prose, and no
  landscape gallery before the first theorem.
- A 14-page landscape supplement retaining plates S01–S12 with local captions,
  a cover, and a methods/replay page.
- The exact CM and square certificates remain in Appendix A of the article.
- The odd-`N` Poisson/Fourier extension remains in Appendix B.
- The HMR/RH bridge remains secondary; no RH result is claimed.

This is an editorial revision, not a new mathematical result and not a journal
submission.

## Article assembly

The article structure is: Introduction and principal assertions; the surface and
its golden coordinate; CM field recovery; the common involution; the
Poisson–Mellin bridge and classification; Conclusion; Appendix A exact
certificate and square witness; Appendix B odd-`N` extension; six references.

The body figures were rebuilt at their final reading width:

| Figure | Placement | Height | Role |
| --- | --- | --- | --- |
| 1 | after the Introduction | 1.95 in | connection map, `tau163` versus `i` |
| 2 | after the rank-loss derivation | 3.30 in | actual surface and diagnostic |
| 3 | inline at the end of Section 3 | 2.65 in | fixed-gap correction ladder |
| 4 | inline at the end of Section 4 | 3.25 in | `A=JMJ` coordinate exchange |

Figures 3 and 4 use the `[H]` placement defined by `\BodyFigureHere`, so they
close their sections instead of drifting into Section 4 or Section 5. Figure 4
moves to the top of page 6, followed immediately by Section 5. Page 5 retains a
natural bottom gap before that figure. The result is a continuous argument with
no figure block interrupting a statement/proof unit.

The 6.4-inch source canvases are inserted at `\linewidth` (6.5 in), a scale of
6.5/6.4. The minimum 8.5 pt artist text therefore appears at 8.63 pt or larger;
ordinary figure text is nominally 9.5 pt. Figure heights in the final PDF are
approximately 1.98, 3.35, 2.69, and 3.30 in. The `body_layout_audit.json` records
that no artist text falls outside its canvas.

## Supplement assembly

`build_companion.py` assembles a 16 × 11 in landscape PDF from the twelve
native-vector plate PDFs. Each plate page has an `S01`–`S12` heading, a local
caption stating the mathematical object, normalization, and numerical method,
and a page footer. The cover states the author, contact, date, notation, article
mapping, and evidence separation. The final page records methods, data,
precision, and replay commands.

The supplement states the positive coefficient vector
`a=(1,kappa,-kappa,-1,0)` in the theta and completed-function captions (S08 and
S09). It uses `x` for the positive theta scale and `t` for the surface angle.
The old global palette footer and in-art numeric titles are removed from the
plates; plate numbering is supplied by the supplement overlay, not by clipped
PDF text.

## Final polish

After the first portrait assembly, the following changes were made and the
article was rebuilt twice:

- The abstract now says that exact arithmetic certificates “are kept separate
  from the analytic arguments,” rather than that both are “given separately.”
- The mixed-vector example is written as “the vector with `(x,y)=(1,0)`,” which
  is unambiguous in the `(x,y,-y,-x,0)` convention.
- The normalized positive sequence is explicitly identified with the
  Davenport–Heilbronn sequence, with
  `kappa=(sqrt(10-2sqrt5)-2)/(sqrt5-1)=r(i)`.
- A Spearman–Williams citation records the conductor-815 cyclic quartic field as
  a known family; the paper does not claim the field as new.
- The Davenport–Heilbronn constant and the mixed-vector failure were checked at
  90 digits by `verification/check_dh_constant.py`.

The pre-polish source is preserved as `logs/main-pre-final.tex` (and as
`provenance/main-pre-final.tex` in the source bundle) with SHA-256
`b78eab26708e7ddefd1f5cc39427d8cf92c4fadf5cb1080abeb3b9f204830f70`.
The final source is `main.tex` with SHA-256
`46d473aa9e32528617b3ddc8396987d0240e9717832e537481f43b5eba688fc7`.

## Delegation

Codex CLI GPT-5.6 Terra, high effort, completed the companion figure revision
and the four compact body figures under `companion/TERRA_FIGURE_MANDATE.md`.
Its completed thread id is recorded in `provenance/CLI_SELECTIONS.json`. The
director assembled the portrait article and supplement, chose final figure
placement, added the prior-art and Davenport–Heilbronn text, and ran the final
QA. OpenCode DeepSeek V4.1 Flash Free, max variant, produced the earlier
independent cold review; it did not assemble this revision.

No worker output was accepted as mathematical certification by itself. Raw
events and earlier drafts remain in ignored local logs. The director checked the
exact identities, branch signs, figure data, and page layout.

## Verification performed

- `verification/replay_cm.py`: exact CM core and separate 100/200-digit
  diagnostics — PASS.
- `verification/baseline_square_certificate.py`: zero remainder, rational signs,
  modular square, cyclotomic radical — PASS.
- `verification/director_check_lemmas.py`: discriminant, norm, trigonometric and
  eigenline identities, two-sign finite FE samples, odd-`N` involutions — PASS.
- `verification/check_dh_constant.py`: 90-digit DH parameter and finite
  eigenline/nonmultiplicativity checks — PASS.
- `companion/verification/check_figure_data.py` and `check_body_data.py` — PASS.
- `verification/check_final_pdf.py`: 10 pages, Letter, author/email, theorem
  labels, Figures 1–4 each referenced once and captioned once, all plates named,
  no stale Figure 5–12 text, no `??`, no overfull/underfull log entries — PASS.
- `qpdf --check` on the main PDF — PASS.
- All 10 article pages and all 14 supplement pages were rendered and visually
  inspected for clipping, overlap, formula legibility, numbering, and flow.
- 233 earlier authored files match `logs/PRESERVATION_BASELINE.json` byte for
  byte.

The supplement's numerical diagnostics are finite checks of the displayed
identities. The analytic continuation, functional equation, and classification
rest on the written proofs and the cited Poisson/gamma inputs.

## Source bundle

`output/golden_coordinates_level_five_v0_2_source.zip` contains the article
source, supplement builder, companion sources and data, body and plate PDFs,
verification programs and records, and a top-level bundle manifest. It was
extracted to a temporary directory, compiled twice, and checked for 10 article
pages, 14 supplement pages, and matching text layers. `REBUILD_CHECK.json`
records the test.

## Boundaries

No commit, push, upload, or publication occurred. No RH-workspace source,
sealed artifact, earlier paper, atlas, review packet, or unrelated workstream was
modified. No Lean formalization, RH result, or novelty priority is claimed.
