# Director finding: a golden quadratic subfield in the -163 level-5 fibre

Date: 2026-10-18 (Asia/Taipei). Authoring role: supervising GPT, not the CLI worker. This note is a checked local derivation from classical inputs; no first-discovery claim is made.

## Precise result

Put tau=(1+i sqrt(163))/2, q=exp(2*pi*i*tau)=-exp(-pi sqrt(163)), and

    r=exp(2*pi*i*tau/5) product_{n>=1}
      (1-q^(5n-4))(1-q^(5n-1))/((1-q^(5n-3))(1-q^(5n-2))),
    t=r^5.

There are explicit coprime integer polynomials A and B, printed in verification/director_check.py, for which

    P_163(X)=A(X)^2-5 B(X)^2,
    P_163(X)=(X^4-228X^3+494X^2+228X+1)^3
              -640320^3 X(X^2+11X-1)^5.

The classical Klein identity and CM value imply P_163(t)=0. Coprimality implies B(t) is nonzero: otherwise both A and B vanish at the same algebraic number, contradicting their constant gcd. Therefore A(t)/B(t) is one of plus/minus sqrt(5). In particular,

    Q(sqrt(5)) is a subfield of Q(t).

This is a field-membership statement, stronger than adjoining a golden coefficient externally or fitting decimal values. It needs no irreducibility assertion about P_163.

For the specified analytic branch the exact formulas are

    sqrt(5) = -A(t)/B(t),
    phi     = (B(t)-A(t))/(2 B(t)),
    c0      = (3 B(t)+A(t))/(2 B(t)) = phi^(-2).

The last c0 is exactly the numerical algebraic parameter in the current HMR ruled-surface working source. This gives a concrete arithmetic correspondence between parameters. An intrinsic correspondence of geometric objects, metrics, operators or marked cohomology is NOT supplied by this equality.

## Why the sign is certified

Classical rational bounds 3.14 < pi < 22/7 and 12.76 < sqrt(163) < 12.77 give 40 < pi sqrt(163) < 41. Rational Taylor sums, including a geometric upper bound for the remaining positive tail, give exp(40)>2.3*10^17 and exp(41)<7*10^17.

Write the real positive product in r as F(q). The elementary bound

    |log F(q)| <= |q|/(1-|q|)^2

follows by summing |log(1-q^n)| <= |q|^n/(1-|q|^n). Thus 0.99<F(q)^5<1.01, and

    -5*10^(-18) < t < -10^(-18).

Exact rational interval arithmetic proves A<0<B on this entire interval. The negative sign in the displayed sqrt(5) formula follows. The verifier also counts exactly one real root of P_163 in this interval. No floating-point root identification is used for this sign conclusion.

## Controls and interpretation

The exact CAS control table includes all nine maximal class-number-one discriminants, four nonmaximal class-number-one orders, and rational j=1,2. For -7,-8,-43,-67,-163 the degree-12 P_j splits into degrees 6+6 over Q(sqrt(5)); this is not exclusive to -163. Other CM fibres have several rational irreducible components and require attention to which component carries the analytic branch. For j=1,2 the degree-12 polynomial remains irreducible over Q(sqrt(5)), so its root fields do not contain sqrt(5). These are exact symbolic factorization results, not a theorem classifying every discriminant.

The next substantial target is to characterize the relevant stabilizers of the CM level-5 Galois action and explain exactly which fibre components retain the quadratic character of the cyclotomic field. This should be compared against existing CM/ray-class theory. A possible HMR contribution would then require an independently defined marked construction that preserves that quadratic character. Rewriting an arbitrary scalar using phi does not supply it.

A separate, more direct CLASSICAL connection is

    j((-1+i sqrt(15))/2) = -52515-85995 phi
                          = 85995 c0-224505.

It is explicitly tabulated in Duke's CM-points paper. Its class number is two, so the strongest direct occurrence of sqrt(5) need not arise at a Heegner discriminant. It is a control against selecting 163 merely because its exponential is famous.

## Replay and source boundaries

Run from this package:

    /Users/akari_hayami_64/RH_Research_Workspace/.venv/bin/python -B verification/director_check.py

The exact algebra, branch enclosure and fifteen j-values passed; separate 100/200-digit q-product evaluations agree with the recovery formula. The JSON distinguishes classical inputs and exact checks from diagnostics.

Primary external inputs:
- W. Duke, Continued fractions and modular functions, author version, equations (2.5), (3.2), Theorems 2-3: https://www.math.ucla.edu/~wdduke/preprints/bams4.pdf
- W. Duke, Modular functions and the uniform distribution of CM points, author version p.1: https://math.ucla.edu/~wdduke/preprints/modud.pdf

Local HMR source:
- papers/legacy-geometry/orthogonal-circle-ruled-surface/revision_v5/working_fullproof/Orthogonal_Circle_Ruled_Surface_v5_fullproof_working.tex, displayed c0 in the singular-point classification (around line 238).

The -163 CM value, modular identity and pi bounds are classical external inputs, not newly reproved analytic theorems. The field inclusion and explicit branch formula follow by the written algebra and certified inequalities above. Worldwide novelty, a geometric realization, and any connection to RH remain unestablished.

## Deeper reduction and the information that the golden ratio discards

Put u=t-1/t. Exact cancellation gives

    P_163(t)/t^6=(u^2-228u+496)^3-640320^3*(u+11)^5.

The sextic on the right is irreducible over Q and factors into two cubics over Q(sqrt(5)). The verifier checks both exact statements. Consequently

    Q < Q(sqrt(5)) < Q(u),
    [Q(u):Q]=6, [Q(u):Q(sqrt(5))]=3.

This locates the golden ratio in a proper quadratic layer, leaving a cubic arithmetic layer above it. Identifying that layer with a conductor-5 ring class construction requires the additional CM correspondence discussed in SUPERVISOR_MECHANISM_LEAD.md; that interpretation remains an audited target here, not a new assumed theorem.

There is also an elementary HMR-specific loss-of-information observation. Since c0=2-phi, for every integer q, exp(2*pi*i*q*c0) is the complex conjugate of exp(2*pi*i*q*phi). Their absolute chord responses are exactly equal. Any pipeline that first extracts the same positive phi from several discriminants and then keeps only this chord response is constant in those discriminants. Thus extracting phi is mathematically meaningful field information, but a response intended to distinguish 163 must retain additional data, such as the remaining cubic component. This is an elementary application to the local definitions, not a claim to a new general theorem.

A relevant prior preprint was submitted on 12 October 2026: Sumit Kumar Jha, Cyclic Kronecker Fourier Transforms, Weber Norms, and Rogers-Ramanujan Singular Values, https://arxiv.org/abs/2610.18910 . Its assumptions involve fundamental D=-5n, ramified 5 and a cyclic C_(4M) class group, unlike the present -163 inert-5/conductor-5 setup. The overlap in genus-field descent warrants detailed comparison; its claims have not been independently audited here.

## A finite rational self-adjointness obstruction

The same irreducible sextic G163 has exactly two real roots and two conjugate pairs of nonreal roots, certified by an exact real-root count. Thus F=Q(u) has signature (2,2), although the selected u is real. In the rational regular representation on basis 1,u,...,u^5, let C be multiplication by u and let T_ij=Tr_F/Q(u^(i+j)). Exact calculation gives C^T T=T C, with LDL signs +,+,-,+,-,+ and trace-form signature (4,2). This is a concrete indefinite trace model.

There is no unital representation of F on any nonzero finite-dimensional Q-vector space for which multiplication by u becomes self-adjoint for a positive-definite real inner product after scalar extension to R. Its rational minimal polynomial must be G163, which has nonreal roots; a positive self-adjoint real operator cannot have them. This does not exclude multiplication by the selected real embedding as a real scalar on a one-dimensional real space; that construction discards the full rational conjugacy data. It also does not exclude other positive operators or infinite-dimensional analytic constructions. No equality with the zeta Weil form follows from this finite trace matrix.

This supplies a sharp compatibility test for future HMR/RH maps instead of treating an arithmetic norm factorization as automatic positivity. The root count, trace self-adjointness and LDL signs are replayed in verification/director_check.py. The general spectral argument is elementary; the present application makes no priority claim.

## Explicit degree comparison

Let E=Q(u) and F=Q(sqrt(5)). Irreducibility of G163 gives [E:Q]=6.
The two irreducible cubic factors over F show that the selected u has degree3
over F, so [EF:F]=3 and [EF:Q]=6. Since E is contained in EF and already has
degree6 over Q, EF=E. Thus F is contained in E and [E:F]=3. This comparison
uses both factors' irreducibility, not a numerical choice of one root.
