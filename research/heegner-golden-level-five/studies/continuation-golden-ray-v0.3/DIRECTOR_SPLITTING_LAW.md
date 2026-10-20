# The quartic character and an oriented Artin action

Date: 2026-10-19. This advances the earlier exploratory character controls to a written class-field deduction. It uses the already reviewed cyclic-quartic and conductor-815 results, and the named external reciprocity facts below.

Let A=Q(delta), with delta^4-815 delta^2+132845=0, and sigma(delta)=3 delta-delta^3/163=phi delta. Let chi5 be the quartic character modulo 5 with chi5(2)=i. Define the character modulo 815 by

    chi(n)=chi5(n)*(n/163),      gcd(n,815)=1.            (1)

Here (n/163) is the Legendre symbol. The kernel of chi determines A. More precisely, for the arithmetic Frobenius convention and chi(p)=i^k,

    Frob_p = sigma^(-k),        p not dividing 815.       (2)

Thus the residue degree is the order of chi(p). In particular, the splitting types are four linear factors, two quadratic factors, or one irreducible quartic according as that order is 1, 2, or 4. At primes where a chosen polynomial has index divisible by p, one must use an integral model to read the field's splitting.

## Proof of the character identification

Milne, *Class Field Theory*, Chapter V, Example 3.10 and the conductor discussion immediately before it (printed pp. 158–159), identify the ray class fields of Q with the corresponding cyclotomic fields and their real subfields. Since A has conductor 815 and is totally real, A lies in Q(zeta815)^+. Under the cyclotomic Artin map, arithmetic Frobenius at p acts by zeta815 -> zeta815^p. The residue-degree/order statement is also stated after Exercise V.3.13 (printed p. 160). URL: https://www.jmilne.org/math/CourseNotes/CFT.pdf, cached PDF SHA-256 `50d79af78250a9f1117ad9d337e0b231704a533fc707966ed1bfa52e13d498f5`.

The CRT gives (Z/815Z)^*=C4 x C162. An order-four character restricts on C162 with order at most two. Conductor 815 forces both restrictions to have their full local conductors; hence the C162 restriction is its unique nontrivial quadratic character, (./163), and the C4 restriction is chi5 or chi5^-1. These two characters are inverses and have the same kernel. Their parity is even, since chi5(-1)=-1 and (-1/163)=-1. Thus there is exactly one cyclic quartic field of conductor 815, and it is real: its kernel is that of (1). This identifies A with that field, using its previously proved conductor and Galois group.

## Orientation at one prime

The kernel determines the character only up to inversion. To match the chosen sigma, use p=3. Here (3/163)=-1, chi5(3)=-i, so chi(3)=i. The defining polynomial has good index at 3. Modulo 3,

    sigma(delta)=3 delta-delta^3/163 = -delta^3,
    sigma^3(delta)=delta^3.

Arithmetic Frobenius is delta -> delta^3 in the residue field, so Frob_3=sigma^3. This fixes the inverse sign in (2). The exact checker also verifies that the polynomial is irreducible modulo 3, so this determines the generator unambiguously. Reciprocity then gives (2) for every unramified prime; the subsequent finite checks are independent controls rather than its proof.

## Exact predictive controls

The checker verifies character multiplicativity on all 648 units modulo 815 and the size-162 kernel. For every prime below 1000 other than 5 and 163, it compares the predicted splitting type with exact polynomial factorization. For odd primes in this range it also compares the arithmetic p-power map with the polynomial for sigma^(-k), modulo the defining quartic. At p=2, where the delta polynomial has bad index, it uses the integral generator b=(delta+phi)/2 with polynomial X^4-X^3-204X^2+204X+8201 instead. All 166 splitting controls and 165 p-power comparisons pass.

This is a prediction law about the algebraic golden quartic extracted from the Heegner-163 modular value. It is not yet an analytic estimate for exp(pi sqrt(163))'s near-integer error. The earlier exploratory JSON remains preserved with its original finite-only label; this separate note records the later universal deduction.
