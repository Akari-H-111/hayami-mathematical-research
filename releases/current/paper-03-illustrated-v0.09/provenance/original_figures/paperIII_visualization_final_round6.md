# Paper III visualization — Round 6 final integration / QA

## Final status

- 10 formal figures completed.
- 10 canonical SVG masters + 10 PNG previews = 20 formal figure files.
- All 10 SVGs independently rasterized with Inkscape for cross-renderer QA.
- Embedded raster objects inside SVG: NONE.
- Final contact sheet: `paperIII_all10_svg_raster_contact_final.png`.

## Round 6 fixes

1. Rebuilt Figs. 1, 2, 7, and 8 as true vector SVG masters rather than retaining PNG-only versions.
2. Fig. 1: reflowed the dependency band to eliminate label/arrow crowding and standardized the master pipeline notation.
3. Fig. 7: standardized the assembly notation to use `Gamma_eq = q_eq D Lambda` and separated operator closure, source closure, and stable assembly into three levels.
4. Fig. 8: removed the earlier duplicated end-to-end realization content, restored the intended reconstruction-model + scope-boundary role, and fixed marking/scope text collisions.
5. Figs. 8–10: standardized the rational field notation to `\mathbb{Q}`.
6. Re-rasterized all SVGs after the final edits and visually rechecked node/arrow collisions, panel boundaries, formula clipping, and label placement.

## Mathematical notation checks

- `A_eff`, `N_eq`, `Gamma_eq`, `q_eq`, `K_infty`, `W`, `ker Lambda`, and the forced characteristic/minimal polynomials are used consistently with the manuscript.
- Fig. 2 preserves the theorem's full normalized variation space and does not silently replace it by a smaller or larger perturbation family.
- Fig. 3 preserves the unchanged original tilt orbit when passing from noninvariant `K` to the stable core `U`.
- Fig. 4 keeps global landing descent, normalized closure, local descent, and the future-output quotient visually distinct.
- Fig. 8 keeps the scope claim negative and precise: bare filtered data do not determine an arbitrary distinguished marking.
- Fig. 9 uses the exact witnesses `(S-2)S^2` and `(S-2)(S^2+1)`, whose gcd is `S-2`.
- Fig. 10 remains an explicit marked realization, not a canonicality claim.

## Suggested insertion manifest

| Figure | Suggested location | LaTeX label |
|---|---|---|
| Fig. 1 | §1, immediately after the master pipeline equation | `\label{fig:master-pipeline}` |
| Fig. 2 | §2, immediately after the normalized-tilt spectral-floor theorem | `\label{fig:invariant-tilt-floor}` |
| Fig. 3 | §2.1, immediately after the stable-core floor theorem | `\label{fig:stable-core-floor}` |
| Fig. 4 | §3, after the local-descent / future-output proposition | `\label{fig:landing-observability}` |
| Fig. 5 | §4, after minimality and functoriality of the generated source | `\label{fig:generated-source}` |
| Fig. 6 | §6, after the identification C_syz ≃ A_eff and N_eq = A_eff im R_0 | `\label{fig:syzygy-effective-algebra}` |
| Fig. 7 | §7, immediately after the stable assembly theorem | `\label{fig:stable-assembly}` |
| Fig. 8 | §9, after the opening scope-boundary paragraph, with backward reference to §8.1 | `\label{fig:marked-scope-boundary}` |
| Fig. 9 | §8, immediately after the noninvariant-normalization exact-floor calculation | `\label{fig:exact-noninvariant-floor}` |
| Fig. 10 | §8, immediately after the end-to-end marked-realization paragraph | `\label{fig:end-to-end-realization}` |

No LaTeX source was modified in Round 6; the table above is the recommended insertion plan.

## Next research direction

The visualization layer is complete. The next natural step is manuscript integration: insert the ten figures into `paper_III_spectral_floor_v0_08.tex`, write final captions/cross-references, compile, and do page-level PDF QA. No additional mathematical figure is currently required unless the optional supplementary future-output figure becomes necessary during typesetting.