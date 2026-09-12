# Spectral module audit (v12 Section 7)

Source scope: final PDF, pp. 13--15.

## Theorem 7.1 and Corollary 7.3

On `C_c^infinity((1,infinity))`, integration by parts has no boundary term.  With the standard complex `L2` inner product and real `sigma`, the formal adjoint calculation gives

`T_sigma^* = -i(x d/dx + 1 - sigma) = T_(1-sigma)`.

Therefore formal symmetry occurs exactly at `sigma=1/2`.  This is a formal-domain statement, not self-adjointness of the closed half-line operator.  The PDF correctly keeps the unequal half-line deficiency indices `(1,0)` separate.

For `f_omega(x)=x^(-(sigma+i omega))`, direct differentiation gives `T_sigma f_omega=-omega f_omega`.  These functions are generalized eigenfunctions and are not asserted to lie in the half-line `L2` space.

Status: `re-derived`; the algebraic differentiation is covered by `verification/verify_spectral_algebra.py`.  The integration-by-parts step remains a written proof rather than a proof-assistant certificate.

## Theorem 7.4, Proposition 7.6, Corollary 7.8

For distinct `n,m`, the normalized finite-time Gram entry is

`(exp(-i T log(n/m))-1)/(-i T log(n/m))`,

so its modulus is at most `2/(T |log(n/m)|)`.  The row sum is at most `2(M-1)/(T delta)`.  Because the Gram matrix is Hermitian, Gershgorin gives the stated operator-norm enclosure; positivity, linear independence, the condition-number bound, and the log-determinant bound follow directly.

Status: `re-derived`.  This proof depends only on the displayed finite set, positive `T`, and `delta>0`; it does not require multiplicative independence of the integers.
