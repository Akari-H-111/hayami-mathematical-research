# Figure Guide

All standalone assets are `output/pdf/figure_NN.pdf`, `output/svg/figure_NN.svg`, and `output/png/figure_NN.png`. Gold denotes geometry, teal Fourier/theta, violet the modular map, and blue CM/Hermite.

1. **Connection map** — Traces the scalar coordinate through the reflection, coordinate exchange, Fourier eigenline, and functional equation. Place after the opening definitions.
2. **Ruled surface** — Shows the actual patch and the reflected lateral pair; the local panel is the positive-t point. Place after the surface parametrization.
3. **Rank loss** — Displays the cross-product norm and polynomial root on the restricted positive-sine branch. Place with the rank-loss elimination.
4. **Pentagonal coordinate** — Separates the horizontal projection `cos(72 degrees)=u0` from the segment ratio giving `c0`. Place after the golden-coordinate identification.
5. **Coordinate exchange** — Shows M and A=JMJ with off-axis sample images and separately named slopes. Place with the matrix identity.
6. **Rogers-Ramanujan inversion** — Shows the positive fixed point and independently evaluated `r(iy)` / `r(i/y)` product curves. Place after the fixed-point argument.
7. **Finite Fourier eigenvector** — Uses the consistent residue order 1,2,3,4,5 (5 represents 0), plotting both actual DFT input and output. Place with the finite DFT calculation.
8. **Theta self-duality** — Direct numerical Gaussian sums from both reciprocal arguments. Place after the theta transformation.
9. **Mellin completion** — Connects Gaussian, theta, Mellin, and completed series with a paired numerical profile. Place in the functional-equation section.
10. **Two CM arguments** — Distinguishes the fixed-point role of `i` from the arithmetic role of `tau_163`. Place at the CM comparison.
11. **Hermite near-integer** — Shows the fixed gap and high-precision j-series correction ladder. Place in the Hermite comparison passage.
12. **Icosahedral chord context** — Counts short, long, and antipodal pairs and displays their squared ratio. Place as a geometry-context companion.

Numerical source inputs, formulas, precision settings, and arrays are in `data/figure_values.json` and `data/figure_arrays.npz`. Conventional primary references are retained in the canonical manuscript-ending input rather than repeated here.
