# Independent certificate and interpretation

Date: 2026-10-19. This is a written deduction and exact polynomial certificate, conditional only on the explicitly cited classical CM identification for its interpretation as a Rogers–Ramanujan singular value. It is not a priority claim.

Let tau=(1+i sqrt(163))/2, t=r(tau)^5 and u=t-1/t, with the same analytic branch and isolated root as the preceding checkpoints. Put S=sqrt(5)>0 and c0=(3-S)/2. The selected root satisfies alpha(u)+S beta(u)=0, where alpha and beta are recorded in verification/director_certificate.py. Define

```
w(u) = ((312119004989 - 139583862445*S)*u^2
      + (6858643496508 - 3067324783740*S)*u
      + 37679427598544 - 16850735555920*S) / 1574580000.
```

Then the exact identity is

    u^2+4 = 163(1+c0) w(u)^2.                              (1)

The independent checker clears denominators and reduces in the rational polynomial ring by alpha+S beta and S^2-5. Its remainder is exactly zero; no decimal fitting or algebraic-number factorization is used in that check. Because S=-alpha/beta in E=Q(u), w(u) belongs to E. Equation (1) gives

    Q(t) = E(sqrt(163(1+c0))).                            (2)

Indeed, t=(u +/- sqrt(u^2+4))/2, w(u) is nonzero, and the inherited exact degree computation gives [Q(t):E]=2. Thus (2) describes the particular quadratic extension, beyond merely observing that sqrt(5) lies in the field.

All signs are fixed: u>1 at the isolated CM root. The coefficients of u^2 and u in w are negative, and w(1)<0, as verified by integer comparisons a^2<5 b^2 with a,b>0. Hence w(u)<0. For delta=sqrt(163(1+c0))>0, the small negative root is

    t = (u+delta*w(u))/2 = -2/(u-delta*w(u)).              (3)

The second expression avoids catastrophic cancellation. An initial exploratory branch reconstruction used the opposite sign; its failed diagnostic remains in logs/DIRECTOR_BRANCH.json. It did not affect the exact identity. The sign in (3) has a separate exact certificate.

The two candidate golden factors describe the same square class:

    (4-c0)/(1+c0) = phi^2,

so E(sqrt(163(4-c0))) equals the field in (2).

## Field identification

Let K=Q(sqrt(-163)), L=K_(5) the conductor-5 ray class field and H5 the conductor-5 ring class field. The preceding checkpoint establishes H5=K(u), [H5:K]=6, [E:Q]=6 and [Q(t):Q]=12. These degrees and field inclusions are used separately.

Since tau is integral of norm 41 and O_K=Z[tau], it is a 5-unit with maximal CM order. Cais–Conrad, Equation (4.8) and Corollary 5.7 (printed pages 10 and 14), apply to j5=1/r and imply K(r)=L. Inertness of 5 gives O_K/5=F25. Since K has class number one and units {+1,-1}, the ray class exact sequence gives [L:K]=24/2=12. Thus [L:Q]=24.

Because t=r^5 is real, K intersects Q(t) in Q. Therefore [K(t):Q]=24. The already established inclusion K(t) subset L now proves K(t)=L, rather than inferring equality from degrees alone. The ring class congruence subgroup contains the ray subgroup, so H5 subset L.

The modulus 5 O_K is preserved by complex conjugation. Conjugating the class field therefore preserves L, by uniqueness of the class field for the conjugated ray subgroup. In particular, conjugate(r) belongs to L. For the selected branch q=-exp(-pi sqrt(163)), the infinite product in r=q^(1/5)*product is positive real, so r/conjugate(r)=exp(2 pi i/5)=zeta5. Consequently zeta5 belongs to L.

Now H5 contains F=Q(sqrt(5)). Moreover zeta5 does not belong to H5: K and Q(zeta5) intersect in Q (the only quadratic subfield of Q(zeta5) is F, whereas K is imaginary), so [K(zeta5):K]=4, which cannot divide [H5:K]=6. Hence [H5(zeta5):H5]=2, and the inclusions and degree 24 yield L=H5(zeta5).

## Why this radical appears

Here H5=E(sqrt(-163)). If zeta5=exp(2 pi i/5), then

    (zeta5^2-zeta5^-2)^2 = -(1+c0).

Multiplying this imaginary cyclotomic radical by sqrt(-163) produces a real square root of 163(1+c0). Complex conjugation flips both factors; their product belongs to the real fixed field Q(t). This explains the factor 163 and the golden factor as contributions from the imaginary quadratic CM field and the level-5 cyclotomic field, respectively.

There is also an exact Fibonacci/Lucas feature in this coordinate certificate:

    139583862445 = Fibonacci(55),
    312119004989 = Lucas(55),
    (Lucas(55)-sqrt(5)*Fibonacci(55))/2 = -phi^-55.

This identifies a unit in the leading coefficient. The exponent 55 depends on this normalization of w; no intrinsic approximation rate, extremal principle, or new theorem about the Ramanujan exponential follows from the appearance of that exponent alone.

## Scope

The exponential exp(pi sqrt(163)) remains a separate transcendental quantity. It determines the nome q=-exp(-pi sqrt(163)) used to evaluate r. Equations (1)–(3) are exact statements about the resulting algebraic modular value. They do not yet supply a new golden-ratio formula or improvement for the small error exp(pi sqrt(163))-(640320^3+744). That is a concrete remaining question.

Replay: `/Users/akari_hayami_64/RH_Research_Workspace/.venv/bin/python -B verification/director_certificate.py` from this packet.
