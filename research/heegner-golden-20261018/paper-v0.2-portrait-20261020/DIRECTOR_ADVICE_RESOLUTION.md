# Director resolution of the portrait-layout cold review

Source review: `../cold-review-layout-sol61-deepseek-20261020/`, especially
`DIRECTOR_SYNTHESIS.md`. That packet contains two independent AI readings of the
19-page v0.1 PDF, their corrections, and a proposed four-group trial. It is not a
human peer review or a journal decision.

## Decision

Implement a distinct portrait revision with four compact body figures and a
separate 14-page supplement retaining plates S01–S12. Preserve the v0.1 paper,
atlas, exact certificates, and all earlier hash-bound artifacts. This is an
editorial revision of the same mathematics.

The implemented article is 10 pages; the supplement is 14 pages. The reviewers
suggested roughly 9–11 pages (Sol) or 11–13 pages including appendices
(DeepSeek). Those figures were proposals, not requirements. Ten pages with two
appendices and six references is within the lower proposal and keeps the
argument continuous.

## Acceptance criteria and disposition

| Criterion from the synthesis | Disposition |
| --- | --- |
| 1. Preserve the reviewed v0.1 checkpoint and create a distinct revision | Done. v0.1 PDF/source and the 14-page atlas are untouched; `PRESERVATION_CHECK.json` confirms 233 earlier files unchanged. |
| 2. Continuous portrait text, principal assertions early, no gallery before the first result | Done. The first figure appears after the Introduction; the first theorem follows in Section 2. No landscape pages occur in the article. |
| 3. Document every plate's body/atlas destination; introduce and interpret each retained body figure | Done. `README.md` gives the mapping; each of Figures 1–4 is referenced in running text and interpreted in its caption. S01–S12 all appear in the supplement. |
| 4. Rebuild body graphics at final size; check labels, axes, legends, captions | Done. Four native-vector body figures use 6.4-in canvases at 6.5-in insertion; minimum artist text is 8.5 pt and appears at 8.63 pt. Axes and legends were inspected at final size. |
| 5. State the positive eigenvector in theta/FE captions; distinguish paired/general statements; state domain and combined rank-loss conditions | Done. S08–S09 state `a=(1,kappa,-kappa,-1,0)`; Figure 2 and Section 2 distinguish the necessary locus `u=(1-c)/2` from the full condition including `P(c)=0`; Section 5 separates per-eigenline from mixed-vector statements. |
| 6. Search the final PDF text layer as well as viewing pages; resolve references | Done. `check_final_pdf.py` confirms Figures 1–4 each appear exactly twice, no Figure 5–12 text, no `??`, no stale S-numbers, and no unresolved citations/references. |
| 7. Recompile, inspect every page, renew hashes and visual-QA records, replay checks | Done. Two final compiles; all 24 pages rendered and inspected; PDF/source hashes renewed; exact/numerical checkers replayed. |

## Accepted editorial advice

- Remove the compulsory landscape plate breaks and keep statement/proof units
  together.
- Put a short principal-assertions passage before the visual material, with the
  CM/`tau163` recovery as the main arithmetic strand.
- Recompose selected figures at article width instead of shrinking wide plates.
- Keep the full visual evidence in a separate supplement rather than deleting it.
- Give every retained body figure a local introduction and interpretation.
- Use `x` consistently for the positive theta scale and `t` for the surface
  angle.
- Remove the global palette footer and in-art numeric figure titles.
- State the eigenvector and normalization in the scalar theta/FE diagnostics.
- Keep the exact CM certificate and both field containments in the article
  appendix, with a stable reader route to the companion data and checks.
- Keep the author line exactly `Akari Hayami (Jian-Yu Huang)` and the contact
  `akari.h.1.9984@gmail.com`; do not invent an affiliation.

## Advice not adopted, or corrected before use

- **Exact page counts and group counts.** Sol's three groups and DeepSeek's five
  groups, and their page targets, were proposals. The implemented four body
  figures follow the director synthesis rather than either count.
- **“The rank-loss locus is `u=(1-c)/2`.”** Rejected as a caption for the whole
  line. In the interior domain that line is necessary; rank loss also requires
  `P(c)=0`. Figure 2 and Section 2 state both conditions.
- **Citations absent.** Rejected. Duke's inversion law and CM value, the local
  surface source, and the Poisson reference were already cited. The revision
  improves placement and adds the missing Spearman–Williams prior-art citation;
  it does not invent attributions.
- **Statement/proof splits caused by plates.** Corrected. The v0.1 named
  theorem statements and proofs were not split; the interruptions separated
  related results and remarks. The revision fixes the latter.
- **Unreferenced figures.** Corrected. Figure 5 was already inside the cited
  range; the genuinely unreferenced plates were elsewhere. In v0.2, every body
  figure is referenced and every supplement plate is named.
- **Categorical ban on isolated full-page figures.** Not adopted. Placement is
  judged by content; the supplement is intentionally plate-per-page.
- **A new class-field identification theorem.** Not adopted. Once the explicit
  branch and square witness are fixed, `Q(v)=Q(U)(delta)` follows algebraically.
  Classical CM/Klein inputs identify `v`; no additional identification theorem is
  needed for the equality.
- **Novelty or priority language.** Rejected. The novelty audit found no
  substantive new theorem established as novel. The conductor-815 field is
  attributed to Spearman–Williams; the paper records a selected generator.

## Mathematical corrections that control the text

1. **Mixed vectors have no scalar sign.** A vector with nonzero components in
   both eigenspaces satisfies neither signed functional equation. The example
   `(x,y)=(1,0)` is stated explicitly. The equivalence in Theorem 5.2 is per
   fixed sign, not a claim about every nonzero vector.
2. **The other algebraic branch has signs.** If `A_163/B_163=+sqrt5`, the
   displayed formulas give `phi_rec=-gamma`, `gamma_rec=-phi`, and
   `c_rec=phi^2`; the paper selects the negative branch by a rational interval
   certificate.
3. **Davenport–Heilbronn parameter.** The normalized positive sequence is
   `(1,kappa,-kappa,-1,0)` with
   `kappa=(sqrt(10-2sqrt5)-2)/(sqrt5-1)=r(i)`, not the earlier misremembered
   `0.618`. A 90-digit check is recorded in `DH_CONSTANT_CHECK.json`.
4. **Prior art for conductor 815.** The cyclic quartic field is a known
   Spearman–Williams family. The paper cites it and does not present the field as
   new.
5. **Exact versus analytic evidence.** Exact certificates and finite numerical
   diagnostics are kept separate from the Poisson–Mellin proofs. No numerical
   plot is offered as a proof of an analytic theorem.

## Layout decisions retained

- Page 5 ends Section 4 with a natural gap; Figure 4 begins page 6, followed by
  Section 5. This keeps the figure next to the coordinate-exchange discussion
  without splitting Section 5.
- Figure 3 closes Section 3 and does not interrupt Section 4.
- The supplement cover uses compact ASCII notation for `phi`, `c0`, `gamma`,
  `u0`, and `kappa`; the plates and article use typeset mathematics. This is a
  cover-page convenience, not a notation change in the mathematics.
- No global palette footer appears in the article or supplement plates.

## Limits

This resolution records an editorial implementation and its QA. It does not
certify the paper as journal-ready, does not substitute for external human
mathematical review, and makes no RH, Lean, novelty-priority, or publication
claim. The HMR/RH bridge remains secondary.
