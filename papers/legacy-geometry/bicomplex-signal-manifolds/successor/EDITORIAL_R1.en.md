# Paper One editorial review r1

2026-10-02. Two inputs: the author's “Analysis: Main Results,” and the writing policy “inspiring but humble, rather than overly defensive writing.” The author explicitly leaves the final judgment to Claude. Result: a 15-page working draft becomes 17-page r1, with its hash bound in `qa/VISUAL_QA.json`.

## Proof readability: individual judgments on the analysis

| Analysis suggestion | Decision | Treatment in r1 |
| --- | --- | --- |
| Thm 3.6: write out \|z₁\|²=cos tₙ→0; otherwise keep concise | Accepted; agree not to expand | Add this sentence in part (2) |
| Thm 3.2: explain analyticity of ζ₊ in the edge chart | Accepted | t=ε·arccos C(r) is analytic in r |
| Prop 3.4: write out \|ρ₁₂\|²≤ρ₁₁ρ₂₂ | Accepted | Included |
| Thm 3.8: add a decoder-domain lemma or table; complete the bump step | Accepted | New Table 1 gives the six decoders' domains, reasons for smoothness and values; rewrite the bump using V⊂Ū⊂U. Also correct the caption: arg's branch cut is handled by the open-set argument, not by vanishing of the cutoff |
| Prop 3.9(2): add an analytic tubular-neighbourhood lemma and explain corners | Accepted | New Lemma 3.9 (Analytic retraction), with proof citing Krantz–Parks' analytic inverse-function theorem; explicitly identify the two charts forming the open analytic surface M used to bypass corners |
| Prop 4.3(2): write out the End ring and the idempotent/splitting correspondence | Accepted | End(π_*Z)≅End_{π₁}(Z[C₂])≅Z[C₂], then directly solve the idempotent equation |
| Prop 4.3(3): replace “induces” with “cannot be identified” | Accepted | Replace with "cannot be identified: the first fixes the fold arc, the second is free" |
| Prop 4.3(4): redo the stalk calculation here, without referring back to the old draft | Accepted | Proper base change, stalks at single/double preimages, sheet exchange acting by −1, zero pinch stalk, and the adjunction calculation for Hom |
| Thm 4.4(2): write out the full derivation chain | Accepted | Display Ψ^!Z≃Ψ^!D(Z[2])≃DΨ^*(Z[2])=…=ω[−2] |
| Prop 4.6: calculate the cokernel stalk by stalk | Accepted, with an **independent decision** | Do not identify the comparison morphism's explicit form; calculate only kernel and cokernel stalks. Off L the map is an isomorphism; on L it is 0→Z. The surjection Z_L→i*𝒞 is a stalkwise bijection, yielding 𝒞≃i_*Z_L. The ±1 sign issue disappears naturally, more directly than the analysis's suggested route |
| Thm 5.1: prove “the exponent is invariant under smooth changes” | Accepted | Density and source Jacobian are both const+o(1); in the target direction sandwich by V(ε/b)≤V′≤V(ε/a) |
| Thm 5.2: write out μ=τ=3 | Accepted | Write the Milnor algebra C[X,Y]/(2X,4Y³) and Euler identity |
| Prop 5.3(3): show the actual jet calculation in the text; replay only verifies it | Accepted | Include \|A\|², ⟨A,B⟩², R, the Gram–Schmidt formula, identity b²+ac²=0, pedal formula and cusp determinant |

## Positioning “bicomplex”

Agree with the analysis's mathematical judgment. Rewrite the introduction: retain the name because it names the model in [record]. Use idempotent decomposition to write BC≅C⊕C and the three conjugations (ā,b̄), (b,a), (b̄,ā). Explicitly state "statements about two-component complex state families; they do not require bicomplex multiplication as additional structure". Bicomplex algebra appears as a natural class of readouts, entirely covered by Corollary 3.7. Retain the title.

## Tone revisions following the author's policy

- **Open the abstract and introduction with positive statements.** Reframe the main theme as “we determine exactly when realization is possible,” emphasizing the dichotomy, concentration of the obstruction in one geometric feature, and restoration of analyticity after removing it.
- **Delete repeated defensive sentences.** Examples: “assigns no physical clock,” “carries no content,” “has nothing to explain,” “we keep the name only for continuity,” “priority has not been systematically established.” State each scope positively once in the appropriate place, such as "The restoration is topological: it counts traversals".
- **State the literature positioning positively.** "The tools used here are standard … The contribution is their application to this model, which yields the dichotomy and the carrier classification". Stop listing unestablished matters.
- **Frame open problems as invitations.** Examples: "an interesting open question", "a natural object to construct", "a natural starting point for quantization".
- **Retitle the appendix "Review of the earlier record".** Use neutral category names (holds after correction, does not hold as defined, missing definition, settled here).

## Approaches not taken

- Theorem 3.6 is not expanded; the analysis also judged its length appropriate.
- Do not restate the published Ruled and Stokes proofs in full merely for apparent completeness; retain citations and sketches.

## Next step

The author reads r1. If necessary, prepare r2, then perform final acceptance before publication. Paper Two literature comparison can proceed alongside the author's reading.
