# Shared orthogonal-circle surface core

This module is the only permitted common mathematical base for the three legacy papers.  It must establish, from scratch:

1. the parameter domain and the constrained orthogonal-circle parametrization;
2. the definitions of `c = cos t`, `s = sin t`, and all denominator/radical quantities;
3. the immersion derivatives, cross product, and regularity equations;
4. the polynomial `P(c) = c^2 - 3c + 1` and its admissible root;
5. the observation-field coordinates used by the ruled-surface and Stokes papers.

No result about folds, topological indices, caustics, monodromy, Mellin operators, or physical interpretation belongs here until independently reconstructed.  This prevents a later paper from being used as hidden evidence for an earlier one.

## Chart boundary discovered during reconstruction

The final v4 PDF uses `Q=sqrt(c(2-c))` on `c in [0,1]`, but its displayed `t`-derivative formulas contain `1/Q`.  The exact algebraic verifier consequently certifies them only on the interior `Q != 0`.  At `c=0` (the two endpoints `t=+-pi/2`) the original `t` chart is not a valid differentiable chart for those formulas.  The local reconstructed theorem must either restrict the immersion statement to the interior or provide a separate boundary atlas and its rank analysis.  This is an open reconstruction obligation, not a change silently imposed on the final PDF.
