# The same golden factor in modular inversion and the CM radical

Date: 2026-10-19. The transformation formula below is classical, not a new discovery. The connection to this packet's exact radical identifies the mechanism worth pursuing.

Put gamma=phi^-1 and c0=gamma^2=phi^-2. Duke's Proposition 2, Equation (3.2), printed page 7, states that the Rogers–Ramanujan function obeys

    r(-1/tau) = (gamma-r(tau))/(1+gamma*r(tau)).           (1)

The coordinate matrix for this involution is

    M = [[-1, gamma], [gamma, 1]],
    M^2 = (1+c0) I,          det M = -(1+c0).             (2)

Its derivative with respect to the Rogers–Ramanujan coordinate z is

    d[(gamma-z)/(1+gamma*z)]/dz = -(1+c0)/(1+gamma*z)^2.

Thus 1+c0 occurs directly in the universal modular transformation law. It is present before choosing the Heegner discriminant. The cusp limit r(i*y) as y tends to 0 from above equals gamma, because r(i/y) tends to 0 and (1) is an involution. Its square is c0. This also explains why a reciprocal golden ratio is natural in a continued-fraction coordinate.

Let zeta=exp(2 pi i/5) and theta=zeta^2-zeta^-2. Elementary cyclotomic identities give

    gamma=zeta+zeta^-1,   theta^2=-(1+c0).

Consequently B=M/theta satisfies det B=1 and B^2=-I. The same cyclotomic radical normalizes a matrix representing modular inversion, and, at the CM point tau=(1+i sqrt(163))/2, combines with sqrt(-163) to give the real square root

    (sqrt(-163)*theta)^2 = 163(1+c0).                    (3)

The field identification and explicit polynomial certificate in DIRECTOR_CERTIFICATE.md then show

    Q(r(tau)^5)=Q(r(tau)^5-r(tau)^-5)(sqrt(163(1+c0))). (4)

Equations (1)–(4) give a single mechanism linking the reciprocal golden ratio, the level-5 modular symmetry, and the Heegner-163 singular value. The matrix representative in (2) depends on the stated coordinate and scaling. Its determinant is not asserted to be an independently invariant metric, contraction rate or approximation constant.

Source: W. Duke, *Continued Fractions and Modular Functions*, Proposition 2, Equation (3.2), https://www.math.ucla.edu/~wdduke/preprints/bams4.pdf. The cached PDF SHA-256 is `fcf69ec30dae5fb372818aef3152b7adf326f244dda52844df5fa5048d38cbe5`. Its icosahedral geometric setting is explained in Section 3. No new result about the small integer-approximation error of exp(pi sqrt(163)) is claimed here.

Exact algebra checks are included in verification/director_certificate.py. The transformation law itself is an external theorem; the checker verifies its stated algebraic consequences, not a new proof of that theorem.
