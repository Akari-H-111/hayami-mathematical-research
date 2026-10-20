# Explicit observables in the inherited RR field

Director's exact algebra addendum, 2026-10-19. This uses the v0.3 square
certificate and branch proof as inherited inputs; those are not rerun or edited
here. The new cyclotomic formula is checked symbolically in check_structure.py.

Let K=Q(kappa), kappa=i sqrt(163), t=r(tau)^5<0, u=t-1/t, and take the
previously certified w=w(u) such that

    u^2+4=delta^2 w^2, delta>0, w<0,
    t=(u+delta w)/2.

The last identity is equivalent to the earlier branch formula
t=-2/(u-delta w). It gives an explicit field expression

    delta=(2t-u)/w.

The selected sqrt(5) and phi already lie in Q(u), by the earlier sextic
factorization and exact certificate. Define

    Z(t)=(phi-1-phi*delta/kappa)/2
        =(phi-1+phi*delta*kappa/163)/2.

Since delta^2=163(5-sqrt(5))/2, exact reduction gives

    Z^4+Z^3+Z^2+Z+1=0,
    Z+Z^-1=phi-1.

The chosen analytic embedding has positive imaginary part and real part
(sqrt(5)-1)/4, so Z(t)=exp(2 pi i/5)=zeta5. This gives a concrete
cyclotomic observable in K(t), rather than merely counting equal field degrees.

For every K-automorphism sigma of L=K(t), the pair

    (u^sigma, Z(t)^sigma)

distinguishes sigma: K(u)=H, K(Z)=K(zeta5), and H K(zeta5)=L. Thus the
six-state and four-state outputs in MATHEMATICS.md genuinely have counterparts
in the inherited RR singular-value field. Their overlap K(sqrt(5)) expresses
the same quadratic conjugation as the two icosahedral chord relations.
The formula is equivariant because kappa is fixed over K; it does not reuse
r/conjugate(r) indiscriminately on every conjugate branch. Complex conjugation
need not commute with this ray-class action.

These are algebraic functions of the RR singular value, relative to the known
K/CM structure and the previously proved branch. They are not a protocol's
public transcript. No efficient extraction from an unlabeled finite-field
j-invariant, security claim, or new error estimate for exp(pi sqrt(163)) is
deduced. The point is the explicit meaning of what two quotients forget and
recover, not mathematical priority.
