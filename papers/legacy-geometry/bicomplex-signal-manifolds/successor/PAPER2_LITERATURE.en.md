# Paper two: literature comparison (first round)

2026-10-02. Before integrating paper two (scalar Green/point-interaction theory on Whitney cross-caps), the aim is to compare the closest prior results and use them to determine originality wording and positioning. All PDFs are stored only in this session's scratch directory, not in the repository; hashes are recorded below.

## Primary literature obtained and read

| Literature | Acquisition and SHA-256 | Reading scope |
| --- | --- | --- |
| D. Grieser, *Quasiisometry of singular metrics*, Houston J. Math. 28 (2002) 741–752 | PDF publicly provided on the author's University of Oldenburg page (scan, 12 pages), `4a03d4b302c8050a1bb603cb53401047162cd211a3e4e137eca58baecd8bf45e` | **All 12 pages read page by page** (images). This resolves the limitation after three previous acquisition failures |
| Y. Colin de Verdière, *Pseudo-laplaciens. I*, Ann. Inst. Fourier 32 (1982) 275–286 | Open Numdam PDF (13 pages), `fecfe207273d52d82cb7a1c67df4deede52ef2cfb5ec8e3c766325f9ea1e30f5` | Introduction, §1 Theorem 1, Lemma 1, Lemma 2 and their proofs, Remarques |
| L. Hillairet, A. Kokotov, *Krein formula and S-matrix for Euclidean surfaces with conical singularities*, arXiv:1011.5034v2 | arXiv PDF (25 pages), `0f023ebfc6e05cdf27a93b5e9ad9cb92e5e95e139ad94e0336f99cd736c0cc49` | Abstract, introduction, §2, dom(Δ*) expansions (3.1)–(3.4) at the start of §3, §3.4 resolvent kernel |
| A. Kokotov, K. Lagota, *Green function and self-adjoint Laplacians on polyhedral surfaces*, Canad. J. Math. 72 (2020); arXiv:1902.03232 | arXiv PDF (27 pages), `4cd8b1452a81567f4e8fe42f8ab3d46ad4271dff728492621b1703d09c178cf8` | **Abstract only**: construct a basis for ker Δ* using the Roelcke formula and compute S(0). Sections were not individually checked |

## What prior authors established

1. **Grieser 2002 §1.** The Whitney umbrella metric g_W is weakly quasi-isometric to the Euclidean metric after the singular coordinate change x=u√(u²+v²), y=v, using the diagonalization criterion of Lemma 1.1. This is continuation 0.02's “Uniform metric comparison” lemma (Ψ(x,y)=(x,yR), with variable names interchanged). 0.02 already attributed this method to Grieser; the full text now confirms it. §2 gives a general weak quasi-isometry criterion; §2.2 uses arclength reparametrization along level curves; Thm 2.5 and Cor 2.7 treat horns. **The full text gives only quasi-isometry (bounded distortion), no asymptotic isometry estimate, and no Laplacian or PDE analysis.**
2. **Colin de Verdière 1982, Theorem 1.** On a complete smooth Riemannian surface (d=2,3), Δ restricted to C_c^∞(X∖{x₀}) has deficiency 1; extensions are parametrized by α∈ℝ/πℤ with condition f=λ(sin α·log r/2π+cos α)+o(1). Lemma 1 says elements of D(A*) have the form c₁G(r)+c₂+o(1). Lemma 2 gives the resolvent-kernel expansion R(λ;x,x₀)=G(r)+F(λ,x₀)+o(1), where F is meromorphic in λ and strictly decreasing between poles. The proof uses polar coordinates and Sobolev embedding for a smooth metric.
3. **Hillairet–Kokotov.** On a flat conical surface, at a cone point of angle θ_p, elements of dom(Δ*) expand as a₀⁺+a₀⁻ln r plus r^{±|ν|}e^{iνθ} terms, where ν=2πk/θ_p and 0<|k|<θ_p/2π; this is equation (3.1). Thus **θ_p≤2π permits only the logarithmic channel**, while θ_p>2π permits additional power channels. They use the Krein formula to compare ζ-determinants of extensions and give an S-matrix.
4. **Kokotov–Lagota.** Treat Green functions and self-adjoint Laplacians on polyhedral surfaces (abstract-level reading).

## Positioning each result of paper two

| Paper-two result (source) | Closest prior result | Assessment and suggested wording |
| --- | --- | --- |
| Quasi-isometry in singular coordinates (0.02 `lem:metric`) | Grieser §1, same method | **Prior result**. This paper supplies explicit constants and cites it as a tool |
| Arclength coordinates for an actual Euclidean Whitney germ: a−I=O(ρ^{1/2}), m−1=O(ρ), ρ_e/ρ=1+O(ρ^{1/2}) (0.03 `lem:arclength`) | Grieser gives only qi; his arclength parametrization follows level curves for a qi criterion | **Candidate contribution** (technical but substantive). At the cross-cap, it upgrades coefficients from “bounded measurable” to “close to the identity in a C^{1/2} sense,” enabling an exact logarithmic coefficient |
| Point trace, corrected A with (2,2)/U(2), resolvent formula (0.02) | CdV Theorem 1 (smooth points, deficiency 1 per point); Posilicano framework; HK (3.1) (cone points) | **Realization of a known picture in a new setting**. CdV's smooth Sobolev argument and HK's exact conical separation do not directly apply to cross-caps; Hölder regularity and arclength coordinates supply the missing step |
| Universal coefficient −(1/2π)log ρ_e, real symmetric B_η (0.03 `thm:log`) | CdV Lemma 2's G(r)+F+o(1); HK's cone-point coefficient | **Analogous result in a new setting**. Structural conclusion: a cross-cap has total angle 2π and only one logarithmic channel, like CdV's smooth point and unlike HK's cone points of angle greater than 2π |
| Markov uniqueness of A (0.03 `cor:markov`) | Classical phenomenon: a 2D point interaction is not Markovian for Lebesgue measure; zero capacity implies uniqueness of the Dirichlet form. Full texts of Albeverio–Brasche–Röckner, Fukushima et al. **were not obtained** | **Expected analogy, proved directly here**. No new phenomenon is claimed |
| Uniqueness of a common reference length (0.03 `cor:scale`) | Scale/coupling relations for 2D point interactions are classical (Albeverio–Gesztesy–Høegh-Krohn–Holden); **full text not obtained** | Describe as a “notation/scale convention,” cite classical sources, and check details after obtaining originals |
| Reflection symmetry, limiting sheet parity, Krein kernel dimension 2, counterexample showing infinite deficiency for old H₀ | General Krein theory (Ashbaugh et al.) | Model-level conclusions and corrections to the old manuscript |

## A suggestion from the comparison: broaden paper two's scope

The arclength lemma in 0.03 is proved for **any** smooth Euclidean Whitney germ; the trace, logarithm, and boundary-coefficient arguments are also local. Only global compactness and the positive gap use this model's five-point analysis. Paper two could therefore consider the following formulation:

> For a compact immersed surface in ℝ³ with smooth boundary and finitely many interior Whitney cross-caps, scalar-Laplacian point-interaction theory at these points has the same form as Colin de Verdière's smooth setting: one logarithmic channel per point, with universal coefficient −1/2π expressed in the extrinsic radius.

S would be the principal example, including treatment of two boundary-corner quarter-germs. This would give paper two a general theorem and an example, reaching more readers than a single model and fitting the “inspiring but humble” direction. **One new verification is needed**: global form compactness in the general case (local qi plus Rellich), and an assumption separating boundary and singularities. This is not yet proved and is listed as the first research step in integrating paper two.

## Comparisons still unfinished

- Albeverio–Gesztesy–Høegh-Krohn–Holden, *Solvable Models in Quantum Mechanics* (scale and Markov properties of 2D point interactions); Albeverio–Brasche–Röckner 1989; Fukushima–Oshima–Takeda (capacity and Dirichlet-form uniqueness). Currently only bibliography or secondary-source level.
- Full-text details of Kokotov–Lagota, and Brüning–Geyler–Pankrashkin on point perturbations on manifolds.
- Direct literature on “Laplacians or point interactions on cross-caps or Whitney umbrellas”: this round's search found no identical result, but this cannot prove originality.

## Conclusion

Paper two's tools (qi coordinates, Krein/Posilicano, Hölder regularity, Markov criteria) are prior work; **the closest analogous theorem is Colin de Verdière's 1982 pseudo-Laplacian on smooth surfaces**. The contribution to emphasize is proving the same picture at a Whitney cross-cap with a singular metric and giving exact logarithmic normalization, using finer arclength asymptotics beyond Grieser. Suggested wording: “extend Colin de Verdière's pseudo-Laplacian picture to cross-caps of immersed surfaces,” explicitly acknowledging the works above.
