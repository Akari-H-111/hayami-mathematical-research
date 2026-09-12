# Paper II closeout package v0.01

## Proposed title

Resonance-Marked Naturality and Homotopy-Tilt Non-Invariance in the Inverse-Leibniz Cubic Case

## Decision

Paper II closes at strict resonance-faithful naturality plus the ordinary quasi-isomorphism no-go.

The concise stopping formula is

\[
\boxed{\text{strict/resonance-faithful naturality}\;+
       \text{ordinary quasi-isomorphism no-go}.}
\]

The general triangular problem with

\[
m_A(S)=\prod_\lambda(S-\lambda)^{e_\lambda}
\]

is explicitly deferred. It belongs to a later paper, after the fixed cubic paper and Paper II have been closed.

## What the current Part II records establish

| record | result | role in Paper II |
|---|---|---|
| v0.44--v0.46 | finite Cauchy forcing closure, homotopy-closure criteria, a priori finite-box criteria | background mechanism; not the endpoint |
| v0.47 | exact cubic support/incidence structure; \(U_{16}\) has dimension 35 and \(\operatorname{rank}\operatorname{ad}_\alpha=23\) | fixed-model computational foundation |
| v0.48 | compatible contraction completion exists; extension freedom has dimension 560 | proves the completion is non-unique |
| v0.49 | maximal extension-independent domain has dimension 19; recurrent forced image has dimension 7 and characteristic polynomial \((S+2)^2q(S)\) | identifies the fixed partial-contraction recurrent envelope |
| v0.50 | the forced core is intrinsic to the chosen partial-contraction rigid germ | comparison language |
| v0.51 | rigid-germ-preserving comparisons transport the forced core; ambient equality or quasi-isomorphism alone is insufficient | precursor to marked naturality |
| v0.53 | \(E\)-rail is forced, but exact \(g_3\)-source behavior changes under admissible tilts | source-level no-go |
| v0.54 | the seven-dimensional internal tilt orbit is \(\{B:B(E)=-2E\}\); the universal spectral divisor is only \(S+2\) | final fixed-cubic quotient statement |

## Correct status of the cubic spectral package

For the chosen partial contraction,

\[
q(S)=S^5-4S^4+12S^3-32S^2+80S-192,
\qquad
m_A=(S+2)q(S)
\]

and the associated primary dimensions are exact fixed-model data. They are not deformation-level invariants under the normalized homotopy-tilt action. In particular, the following must not be advertised as unmarked invariants:

- the quintic factor \(q(S)\);
- the second \(-2\)-eigenline;
- the six-dimensional cyclic \(g_3\)-module;
- the recurrence \(m_A=(S+2)q\);
- the 64/128/709-style fixed-contraction spectral strata.

The surviving normalized response is

\[
D_\alpha E=2dE=-2\,\xi\smile\xi,
\qquad
A(E)=-2E,
\qquad
D_\alpha A^nE=2(-2)^n dE.
\]

The dimension seven is an envelope dimension for the present internal tilt calculation; it is not claimed to be invariant under arbitrary changes of partial contraction that change the envelope.

## Proposed Paper II theorem sequence

1. Define the primitive-free resonant pair
   \[
   \mathcal L_{\mathrm{res}}=\mathbb C\beta\subset B^2,
   \quad \beta=\xi\smile\xi,
   \quad
   \mathcal P_{\mathrm{res}}=d^{-1}(\mathcal L_{\mathrm{res}})/Z^1.
   \]
2. Define \(\bar d:\mathcal P_{\mathrm{res}}\to\mathcal L_{\mathrm{res}}\), \(\bar D_a\), and
   \[
   \Theta(a)=\bar D_a\bar d^{-1}
   =\rho_{\mathrm{res}}(a)\operatorname{id}.
   \]
3. Prove transport under strict resonance-faithful comparison:
   \[
   \Theta'(\Phi_Ta)=\Phi_L\Theta(a)\Phi_L^{-1},
   \qquad
   \rho'_{\mathrm{res}}(\Phi_Ta)=\rho_{\mathrm{res}}(a).
   \]
4. Give the small contractible-pair counterexample showing that an ordinary strict DGLA quasi-isomorphism can erase \(\mathcal L_{\mathrm{res}}\).
5. State the scope boundary: the correct object is a resonance-marked chain-level datum, not an ordinary derived invariant.

## Reproducibility status

The following exact verifiers were rerun successfully with SymPy 1.14.0 in a temporary target directory:

- verify_cubic_support_multigrading_v0_47.py
- verify_extension_independent_forced_core_v0_49.py
- verify_intrinsic_partial_contraction_forced_core_v0_50.py
- verify_partial_contraction_comparison_v0_51.py
- verify_homotopy_tilt_quotient_v0_54.py

The following are not counted as a successful local rerun yet:

- verify_source_behavior_intrinsicity_v0_53.py, because it imports the absent helper verify_inverse_leibniz_examples_v0_13.py;
- verify_U16_contraction_extension_certificate_v0_48.py, because its JSON certificate is not bundled beside Part II;
- the older v0.41 aggregate verifier in Part II, because it references verifier files that are not bundled in Part II.

This is a packaging gap, not a mathematical reversal. Before submission, either bundle the missing helper and certificate files or replace the v0.53 source check with a self-contained verifier. Until then, the v0.53 source no-go is a recorded exact algebraic argument, but its script status is **not independently reproducible from the current Part II directory**.

## Deliberate stopping point

After the Paper II draft has its proof text, references, and portable verification manifest, stop. Do not add:

- the abstract multiplicity-vector theory for general \(m_A\);
- a full category/functor formalization beyond the marked comparison theorem;
- a proof that all admissible partial contractions have isomorphic rigid germs;
- contraction-independent classification of the full \(U_{16}\) envelope;
- simultaneous deformation of \(A\) and \(B\).
