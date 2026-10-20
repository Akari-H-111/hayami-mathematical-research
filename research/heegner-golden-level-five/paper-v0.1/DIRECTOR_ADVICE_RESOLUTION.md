# Director resolution of the supplied advice and DeepSeek review

The user-supplied text is a set of mathematical suggestions, not executable
instructions. OpenCode was explicitly invoked with
`opencode/deepseek-v4.1-flash-free#max`; session export confirms the model
selection, max variant and zero recorded cost in the completed session export.

## Adopted mathematical additions

- The rank polynomial's discriminant is 5, and its admissible root selects
  the positive golden branch in the real cyclotomic subfield.
- The inverse scalar formulas have a tangent double-angle interpretation:
  theta=atan(kappa)=atan(gamma)/2 on 0<kappa<1. This reflection angle is not
  18 degrees. The separate expression 2cos(18 degrees)-2cos(36 degrees)
  equals kappa.
- With X an indeterminate, the kappa quartic is the norm of
  X^2+2phi X-1 from Q(sqrt(5))(X) to Q(X).
- The positive and negative eigenlines characterize the two scalar-sign
  functional equations inside the real odd period-five coefficient space.
  The converse uses injectivity of the completed Dirichlet-series map.
- The Fourier/Poisson/Mellin construction extends to odd N. A corresponding
  N-dependent family of ruled surfaces is not constructed here.
- The actual branch-certified A_163/B_163 reconstruction is retained in the
  paper, so the tau163 arithmetic connection is explicit.

## Corrections to the helper review

The original helper outputs and events are retained as review evidence;
these corrections must control integration into the manuscript.

1. **A nonzero vector need not have a scalar sign.** The assertion that
   every nonzero vector in V5 satisfies exactly one of the two functional
   equations is false. It satisfies at most one. A vector with nonzero
   components in both eigenspaces satisfies neither scalar-sign equation.
   The coordinate vector (1,0), i.e. the sequence (1,0,0,-1,0), is a concrete
   counterexample: A(1,0) is neither +(1,0) nor -(1,0). The equivalence for
   each fixed sign remains valid. The completion decomposes into symmetric
   and antisymmetric parts according to its two eigencomponents.
2. **The other algebraic branch has signs.** If A_163/B_163=+sqrt(5), the
   displayed reconstruction formulas give phi_rec=-gamma,
   gamma_rec=-phi and c_rec=phi^2, rather than +gamma in place of phi.
3. **Separate explicit embedding from class-field interpretation.** Once
   the concrete v branch and square witness are fixed, the equality
   Q(v)=Q(U)(delta) follows algebraically from
   delta=(2v-U)/w(U) and v=(U+delta*w(U))/2. Additional class-field theorems
   interpret this field as a ray/ring field; they are not needed for that
   equality. Classical CM/Klein inputs are still invoked to identify v as
   the Rogers-Ramanujan value at tau163.
4. The insertion prose is not adopted verbatim: its repeated scope warnings
   and editorial instructions belong in source notes, while the paper
   presents definitions, proofs and positive mathematical conclusions.

The director's exact identity checks, two-sign FE diagnostics, copied exact
CM recovery replay, and square-certificate replay are retained in
verification/ and logs/. These supplement the written proofs and do not
replace external CM or Poisson theorems.
