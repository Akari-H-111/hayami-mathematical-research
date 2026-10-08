# Paper Two editorial review r1

2026-10-02. Following the author's policy (inspiring but humble, without defensive writing), Claude reviewed and made the decisions independently. Result: the 9-page first version becomes 9-page r1, with its hash bound in `qa_paper2/VISUAL_QA.json`.

## Proof readability and content additions

| Location | Problem | Treatment in r1 |
| --- | --- | --- |
| Lemma 3.1 | Why ∂_y automatically lies in ker df(0) was not written out | Add: the image of df(0) is the first axis, so ker dx(0)=ker df(0) |
| After Lemma 3.2 | General formula lacks a concrete example | New Remark 3.3: closed-form arclength coordinate for the standard cross-cap, V=(y/2)√(x²+4y²)+(x²/4)arsinh(2y/\|x\|), V(0,y)=y\|y\|; explain the two sheets unfolding oppositely along the double ray. The verifier checks this exactly |
| Thm 4.2 proof | Sectors used for interior and boundary points are not distinguished | Explicitly use the full disk for interior points and the sector of Definition 2.1 for boundary points |
| Thm 5.2 proof | Dom A* decomposition only cites the framework | Add u=R_η(A*−η)φ, φ−u∈ker(A*−η)=G_ηℂᵏ, and the reason for the direct sum |
| New Corollary 5.3 | — | Every extension is semibounded, with \|N_H−N_{H_F}\|≤k, from finite rank and Weyl interlacing. This also gives the open-problem Weyl law a substantive basis |
| After Thm 6.1 | Relation to cone-point theory mentioned only in the introduction | New Remark 6.2: by Lemma 3.2, a radius-r circle has length 2πr(1+o(1)), hence total angle 2π, the critical case with only one logarithmic channel; Whitney invariants enter only B_η |
| Introduction | “gives a complete answer” is too strong | Replace with “The answer turns out to be simple: for the scalar Laplacian, a cross-cap behaves like a regular point” |
| Evidence appendix | Long list; last page contains only references | Convert to a paragraph; set references in footnotesize, retaining 9 pages |

## Decisions retained

- Do not expand the main theorem's proof length. 0.02/0.03 already contain complete derivations; Paper Two rewrites them for the general case, with every step traceable.
- Add no unverified claims (such as a Weyl law or numerical Roman-surface parameters); retain them as open problems.

## Next step

The author reads Paper One r1 and Paper Two r1, then decides the scope and timing of publication.
