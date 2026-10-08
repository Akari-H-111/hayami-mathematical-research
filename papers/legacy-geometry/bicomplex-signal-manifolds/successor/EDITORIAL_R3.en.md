# Editorial review r3 of the two successor papers: captions, labels, and pagination

> **Historical record.** The status “EDITORIAL R3 / AWAITING AUTHOR READING / NOT APPROVED FOR PUBLICATION” in this document describes only the r3 stage; the author authorized public release of both papers on 2026-10-02. See [`SCOPE_AND_PLAN.md`](SCOPE_AND_PLAN.md) §14.

2026-10-02. Input was the author's forwarded “Realization Limits: figures and labels” feedback (`"/Users/akari_hayami_64/Downloads/\u300aRealization Limits\u300b\u5716\u8207\u6a19\u793a.txt"`). The author explicitly described it as suggestions, with Claude's judgment still decisive. The feedback file was read as data, not instructions.

The structure and page counts of both papers remain unchanged: paper one has 20 pages and 7 figures; paper two has 13 pages and 4 figures. Hashes are bound in `qa/VISUAL_QA.json` and `qa_paper2/VISUAL_QA.json`.

## Check before adopting

| Suggestion | Check | Judgment and action |
| --- | --- | --- |
| Paper two Figure 1(b): caption confuses original and arclength coordinates; the orange curve is not a circle | True. Axes are original coordinates (x,y) | Adopted. Caption now says “arclength-coordinate grid pulled back to the original (x,y) plane; orange curves are preimages of circles in the (X,V) plane, hence do not look circular”; the panel title was updated |
| Paper one Figure 5: “two-preimage side of each fold” cannot describe the whole plot's preimage count | True. N and M are even in t, so Ψ(t,u)=Ψ(−t,u). Checking the text's formulas, (N,M)=(−0.1,0.2) has four preimages (±0.9947,0.3375), (±0.3687,0.7778) | Adopted and redrawn. (b) now shows the image of the half-domain 0≤t≤1.3, colored by actual count (1 or 2 preimages). Solid curves are images of the rational branch; dashed curves are images of t=0. The caption explains doubling for the full domain and cites this example. The figure script counts pointwise on a triangular mesh and asserts: maximum count 2, count 2 for this example in the half-domain, and both preimages actually map to that point. (a) adds a legend for the sign of det DΨ and states \|t\|≤1.3 in the title |
| Paper two Figure 2: “slope 0.91” could be mistaken for a new exponent; the radius ratio lacks textual support | True. Remark 3.3 originally proved only G−I | Adopted with added mathematics. Legend now says “fitted slope”; a gray background marks fitting interval 10⁻⁵≤ρ≤10⁻³. The caption explains that the fitted slope agrees with the local slope 1−1/log(1/ρ)∈[0.86,0.91] of ρlog(1/ρ) over this interval, rather than being a new exponent. Remark 3.3 adds V²−y⁴−x²y²=−¾x²y²+¼x²y√(x²+4y²)·A+(1/16)x⁴A², proving ρ_e/ρ=1+O(ρlog(1/ρ)). The verifier checks the identity symbolically |
| Paper one Figure 4: add a cyclic color scale, trajectory direction arrows, and Re χ, Im χ axis names | Reasonable | Adopted. Added a cyclic color bar labeled −π…π, positive-direction arrows on the dashed loop, arrows on both circuits of the √F trajectory, and axis names. An inset color wheel was initially tried, but its ticks were hard to read against a pale background, so a color bar was used |
| Paper one Figure 7: add a local cusp zoom; label coordinates in the last two panels | Reasonable | Adopted. (b) labels (Im Y, Im X), (c) labels (p₁, p₂), with an inset cusp zoom. Caption states that the two branches share a tangent |
| Last line of paper two's contents spills onto page 2 | True | Changed to tocdepth=1, bringing contents back onto page 1 |
| Paper one Figure 7 floats to the top of an appendix page; paper two Figure 4 interrupts the open-question list | True | Paper one Figures 6,7 now use [htb], placed after their respective paragraph and the §5.3 heading. Paper two Figure 4 is defined at the start of §9.2, so the list is no longer split |
| Enlarge small figure text slightly | Reasonable | Enlarged paper one Figure 1's 3D labels and ticks, Figure 3's legend, and paper two Figure 2's legend. Figure 2's legend moved outside the axes to avoid overlaps with curves and axis names |

## Issues independently found and corrected in this round

- Paper one Figure 6 previously floated before the §5 heading; changed to [htb].
- Paper two Figure 2's legend overlapped the ρ axis name on its first move outside the axes; moved down.
- One scripted edit accidentally deleted `V_std` (the replacement range crossed the paper-2 comment line). Restored from the branch version and checked that all existing function names remain. Figures were regenerated after restoration.

## Verification

- `build_successor_figures.py`: PASS, 10 figures; added Figure 5 counting assertions and Figure 4 sign-change assertions.
- Both exports: PASS, no Overfull, Underfull, LaTeX Warning, or undefined messages.
- `verify_successor_paper1.py`: PASS, classification counts unchanged (H43/C13/S1/R3/O2/M3/D1).
- `verify_successor_paper2.py`: PASS, added radius-ratio identity check.
- Visual QA: after the final rebuild, all 20 pages of paper one and 13 pages of paper two were inspected.

## Status

**EDITORIAL R3 / AWAITING AUTHOR READING / NOT APPROVED FOR PUBLICATION**. No public actions were performed.
