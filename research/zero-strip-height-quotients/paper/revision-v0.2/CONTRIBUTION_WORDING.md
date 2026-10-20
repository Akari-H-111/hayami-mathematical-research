# Defensible contribution wording

These replacements are intentionally narrow.  They preserve the useful
worked construction while avoiding a priority claim for classical inputs,
standard consequences, or generic functional-equation nonuniqueness.

## Replacement abstract

> We formulate fixed-height observations of the Riemann zero divisor on a
> cylinder and on a half-twisted band.  Using established all-zero mod-one
> equidistribution, discrepancy, and zero-density estimates, we derive the
> corresponding normalized central-circle limit and record elementary support
> and compactness consequences.  A positive-proportion theorem for simple
> critical-line zeros yields further packing and closure corollaries; it does
> not give equidistribution of that subsequence.  We then give a concrete even
> entire product with dyadically sparse off-critical roots.  Direct estimates
> show that this example leaves unchanged the specified normalized quotient
> limits, the known smooth prime-resonant secondary limits, and selected
> coarse counting and Landau error classes, while it does not retain an
> ordinary Dirichlet-series representation.  Thus the paper is a worked
> synthesis and obstruction example.  It neither claims priority for its
> classical ingredients nor proves or refutes the Riemann hypothesis.

## Replacement introduction paragraph

> The mod-one distribution and secondary statistics used below are prior
> arithmetic results: Hlawka's all-zero equidistribution and Fujii's
> discrepancy estimate are recorded and developed by Ford--Zaharescu, while
> Ford--Soundararajan--Zaharescu emphasize that the corresponding interval
> refinement remains conjectural.  Bui--Conrey--Young provide the
> positive-proportion input for simple critical-line zeros.  The geometric
> quotient and the ensuing retraction estimates are a convenient formulation
> of consequences of these inputs, rather than a new zero-distribution
> theorem.  Likewise, canonical products with prescribed sparse zeros are
> standard tools, and functional equations outside the ordinary Dirichlet
> series class have long been studied in the Hamburger--Koshliakov--Knopp
> literature and in modern extensions.  Our narrow purpose is to place these
> facts in one explicit test construction: a dyadic symmetric product for
> which the stated quotient, smooth-secondary, and coarse-asymptotic transfers
> can be checked directly.  Within the limited audit recorded here, no source
> was located that states this exact combined package; this is not a claim of
> exhaustive priority.

## Replacement paragraph for the arithmetic-boundary section

> The functional equation alone is not a characterization of zeta outside
> suitable Dirichlet-series and growth hypotheses.  This boundary is classical
> in the work of Hamburger and Koshliakov, has nonuniqueness constructions of
> Knopp, and has been sharpened in later work such as Burnol's.  Recent
> explicit examples of Nakamura also have Riemann's gamma factor while falling
> outside the ordinary Dirichlet-series setting.  Proposition
> \ref{prop:dirichlet} makes only the more specific assertion needed here:
> the displayed normalized sparse multiplier is not an ordinary absolutely
> convergent Dirichlet series, by its elementary positive-real-axis growth.
> It is not offered as a new general nonuniqueness theorem.

## Prior-work comparison table (TeX-ready)

```tex
\begin{center}
\small
\begin{tabular}{p{0.23\linewidth}p{0.30\linewidth}p{0.37\linewidth}}
\toprule
Prior work & What it already supplies & Scope of the present manuscript \\
\midrule
Hlawka; Fujii; Ford--Zaharescu; Ford--Soundararajan--Zaharescu
& all-zero mod-one equidistribution, discrepancy, and smooth prime-resonant
secondary limits (with interval refinements conjectural)
& compact-quotient reformulation and a direct sparse-product transfer check;
no new equidistribution or interval theorem \\
\addlinespace
Bui--Conrey--Young
& a positive lower proportion of simple critical-line zeros
& elementary residue-packing and closed-support corollaries; no
critical-line-only equidistribution claim \\
\addlinespace
Hamburger--Koshliakov--Knopp; Burnol; Nakamura
& functional-equation nonuniqueness once ordinary Dirichlet-series/converse
hypotheses are weakened or left aside
& one particular symmetric sparse multiplier and its direct failure of an
ordinary Dirichlet-series condition; no general nonuniqueness claim \\
\addlinespace
Classical Weierstrass products
& prescribed symmetric entire divisors and normal-convergence methods
& the selected dyadic divisor and estimates transferring the named coarse
observations \\
\bottomrule
\end{tabular}
\end{center}
```

## Mathematical caption traps in the mandated figure plan

1. **Cylinder/Mobius seam figure.**  Caption it as a diagram of the ambient
   quotient map and central retraction.  Do not plot dots resembling actual
   zeta zeros, do not use a random cloud, and do not say that the divisor
   descends to either quotient.  State that the raw pushforward is not locally
   finite and that only normalized finite-height measures are considered.
2. **Prescribed-product-roots figure.**  Label every point as a root of the
   *constructed multiplier* in the centered `w`-plane (or explicitly shift
   to the `s`-plane); it is not a computed zeta zero.  With `eta=1/4`, label
   the four roots at `w=+/-1/4 +/- i 2^n`, specify the displayed range of
   `n`, and say that the positive-height added count through a closed cutoff
   is `2 floor(log_2 H)` only for the convention and range stated in the
   theorem.  Avoid a caption saying the figure is evidence of off-critical
   zeta zeros.
3. **Secondary/tail-bound figure.**  Plot formula-derived upper bounds, not
   “measurements” or “convergence observed numerically.”  State the precise
   `N`, `R`, and `H` conventions, whether tails begin at `n>N`, and the domain
   condition `B_N(R)<1` where the displayed quotient bound is used.  The
   `O(log H/H)` transfer bound is for the added divisor's contribution to the
   stated bounded-test functional; it is not evidence for an unproved interval
   secondary limit.

Every caption should identify a figure as **schematic** or **exact
formula-derived bound**, as appropriate.  Numerical plotting cannot verify an
analytic theorem, establish RH, or test an infinite-product conclusion.
