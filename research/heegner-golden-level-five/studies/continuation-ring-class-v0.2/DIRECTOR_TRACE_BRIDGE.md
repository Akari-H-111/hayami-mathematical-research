# One contraction explains both golden approximation phenomena

Director continuation, 2026-10-19 (Asia/Taipei). Written elementary proof;
no novelty, HMR geometric transport, or RH consequence is asserted.

Set phi=(1+sqrt(5))/2, c=phi^-2=(3-sqrt(5))/2 and lambda=phi^2=1/c.
The matrix M=[[2,1],[1,1]] has determinant1, trace3 and eigenvalues
lambda,c. Thus for every integer n>=1,

    L_(2n)=Tr(M^n)=lambda^n+c^n is an integer,
    lambda^n=L_(2n)-c^n.

Since 0<c<1/2, L_(2n) is the nearest integer to lambda^n for all n>=1.
The error is exactly c^n. Here c is a LINEAR eigenvalue of M. The
Möbius map z -> (2z+1)/(z+1) instead has derivative c^2 at its attracting
fixed point phi; the two contraction conventions must not be conflated.
This is the elementary quadratic Pisot mechanism:
the other algebraic conjugate contracts, while the trace is integral.
It does not mean that rational approximations to phi become unusually good.

Here the distinction can be quantified by the SAME error term. Define the
Fibonacci integers by F_0=0,F_1=1,F_(k+1)=F_k+F_(k-1). Induction gives

    M^n=[[F_(2n+1),F_(2n)],[F_(2n),F_(2n-1)]].

The eigenvector (phi,1) and the integral trace therefore give

    F_(2n)*phi-F_(2n+1)=-c^n.

For p=F_(2n+1), q=F_(2n), the rational approximation error is exactly

    |phi-p/q|=c^n/q,
    q^2 |phi-p/q| = q*c^n = (1-c^(2n))/sqrt(5).

The last identity follows from Binet's formula, or from the same two-root
recurrence. In particular q^2|phi-p/q| tends to 1/sqrt(5).

Thus the disappearing conjugate has TWO readings: an exponentially small
integer error in lambda^n, and an error of order q^-2 for approximating phi.
The latter is the sharp asymptotic golden value in Hurwitz's theorem, not an
example of beating it. The identities above give the upper bound for the full liminf. For the lower
bound, take p nearest to q*phi. The nonzero integer quadratic norm satisfies

    1 <= |(p-q*phi)(p-q*phi')|,  phi'=(1-sqrt(5))/2.

Because p/q tends to phi as q grows, |p/q-phi'| tends to sqrt(5), giving

    q*||q*phi|| >= 1/|p/q-phi'|,
    liminf_(q->infinity) q*||q*phi|| = 1/sqrt(5).

Thus even the all-denominator golden liminf is proved here, rather than
inferred from the finite check. Since c=2-phi, ||q*c||=||q*phi|| for every
integer q. The SAME sharp asymptotic value therefore applies to the exact
HMR parameter c. Comparing this value with all other irrational numbers
uses the external classical Hurwitz theorem; it is not established by a
finite search.

## Comparison with the Ramanujan constant

For tau=(1+i*sqrt(163))/2, put E=exp(pi*sqrt(163)), q=-1/E.
The classical modular expansion is

    j(tau)=q^-1+744+196884*q+21493760*q^2+...
           =-E+744-196884/E+21493760/E^2-... .

Together with the classical CM integer j(tau)=-640320^3, this yields

    E=(640320^3+744)-196884/E+O(E^-2).

The integer correction is now supplied by a modular function and a CM value.
It is not the trace of algebraic conjugates of E: E is transcendental.
The displayed expansion is an analytic asymptotic mechanism, whereas
lambda^n=Tr(M^n)-c^n is an exact two-term identity. The separate level5
ring-class result explains an arithmetic golden subfield in modular values;
it does not turn E into an algebraic golden-field number.

This clarifies the user's geometric intuition: the golden side has an exact
stable/unstable eigenvalue pair on a closed modular geodesic; the Ramanujan
side has an exponentially decaying modular Fourier tail at a CM cusp point.
Their common modular setting is substantive, but identifying the two error
terms or claiming a new intrinsic map into the ruled surface requires a
further theorem.

## Acceptance check

`verification/director_trace_check.py` checks the matrix/Fibonacci identities
and error equalities exactly for n=1,...,40 using integer pair arithmetic in
Q(sqrt(5)); no decimal equality or floating-point cancellation is used.
The proof above covers every n. The registered command is the same RH Python
runtime as the main continuation checker, with `-B` and assertions enabled.
