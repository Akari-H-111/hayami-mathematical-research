# Why the golden field appears throughout the level5 CM controls

Director extension, 2026-10-19 (Asia/Taipei). This is a written consequence of
classical complex multiplication and class field theory, not a new claim of
priority and not a numerical conjecture. Independent read-only review passed; scope and limitations are recorded in
REVIEW_RESOLUTION.md.

## Theorem with an explicit principal CM mark

Let D<0 be an imaginary-quadratic order discriminant with gcd(D,5)=1. Put
b=0 if D is even and b=1 if D is odd, and

    tau_D=(b+sqrt(D))/2,  O_D=Z+Z*tau_D,
    t=r(tau_D)^5,  u=t-t^-1.

Then

    Q(sqrt(5)) is contained in Q(j(5*tau_D))
                      is contained in Q(u) is contained in Q(t).

In particular phi, phi^-1 and the HMR parameter c0=phi^-2 all belong to these
specified modular-value fields. This theorem gives field membership, not an
intrinsic map into HMR geometry and not a statement about transcendental
exp(pi*sqrt(|D|)). It applies beyond class number one. No degree6 or S3
conclusion is asserted for general D.

## Proof of the genus inclusion

Write K=Q(sqrt(D)), O_D=Z+f O_K, so 5 does not divide f*d_K. The lattice
[1,5*tau_D] is exactly the order O'=Z+5f O_K, of discriminant25D.
Let H be its ring class field. We use the following classical inputs:

1. The main theorem of CM: K(j(O'))=H, with degree [H:K]=h(O').
2. The ring class Artin description: H corresponds to the subgroup generated
   by principal ideals (alpha) with alpha congruent to a rational integer
   a modulo5f O_K, where a is prime to5f. Fractional generators are units locally at the primes dividing the modulus;
   their congruences are interpreted in those local rings.
3. Quadratic Artin reciprocity for the real quadratic field Q(sqrt(5)):
   on ideals prime to5, the base-changed extension K(sqrt(5))/K has character
   chi(ideal)=(Norm(ideal)/5), the quadratic character modulo5.
   Its relative conductor divides5 O_K because5 is unramified in K.

For any allowed principal generator alpha congruent to a modulo5f O_K,

    Norm(alpha) is congruent to a^2 modulo5 in the local ring Z_5,
    chi((alpha))=1.

Thus the ring-class principal subgroup is in the kernel of this character.
The Artin correspondence gives

    K(sqrt(5)) is contained in H.

This quadratic extension is nontrivial, since an imaginary quadratic K cannot
equal Q(sqrt(5)). This proof does not identify conductor5 with conductor1:
the extra real quadratic field belongs to the conductor-enlarged ring class
field, not in general to the original Hilbert/ring class field.

For completeness, the Artin character in input3 follows on a prime ideal over
ell!=5 with residue degree e from the rational action on sqrt(5),
(5/ell)^e=(ell^e/5). Extension by multiplicativity gives the asserted norm
character; the equality uses5=1 mod4. Existence and the conductor statement
are standard quadratic class field inputs, not inferred from the finite
character table in the -163 computation.

## Descent to the real singular-modulus field

Let a=j(5*tau_D). Its q parameter is real, because Re(5*tau_D) is an integer
or a half-integer, so a is real. By CM, K(a)=H. Since Q(a) is a real-embedded
field and K is imaginary quadratic, [K(a):Q(a)]=2. Therefore

    [Q(a):Q]=[H:K]=h(O').

Complex conjugation is an order2 automorphism of H (ring class fields are
Galois over Q), and its fixed field H intersect R also has degree h(O') over Q.
Consequently Q(a)=H intersect R. The real field Q(sqrt(5)) lies in both
H and R, hence lies in Q(a).

This argument does not say H intersect R is totally real. In general complex
conjugation is not central in the ring-class Galois group over Q; other
embeddings can be nonreal. The prior -163 sextic has signature(2,2).

## The modular coordinate inclusion

The classical Rogers-Ramanujan identity and X0(5) formulas give

    x=r(tau_D)^-5-11-r(tau_D)^5=-(u+11),
    j(5*tau_D)=(x^2+10x+5)^3/x
                =-(u^2+12u+16)^3/(u+11).

The eta quotient x=(eta(tau_D)/eta(5*tau_D))^6 is finite and nonzero in the
upper half-plane, so there is no zero denominator. Thus a is in Q(u), and
u=t-t^-1 is in Q(t). This completes the theorem.

## Meaning for the original search

The thirteen class-number-one-order discriminants already checked in the
parent package are all prime to5. Their golden subfields are therefore
explained by this common conductor-enlargement and quadratic-character
mechanism, rather than by thirteen unrelated polynomial accidents.
The special -163 degree6/S3 identification is a sharper case-specific result.
Generic rational j=1,2 need not satisfy CM and hence do not contradict it.

This is a theorem in an existing classical framework. It neither establishes
that humans missed it nor establishes a new arithmetic/geometric transport.
The explicit HMR parameter correspondence is the local research use.

Primary inputs: Cox, *Primes of the Form x^2+ny^2*, chapters7-9 and theorem11.1
(printed220, cached PDF232); Duke, *Continued fractions and modular functions*,
equation(7.7); Maier, *On Rationally Parametrized Modular Equations*, tables2,4,5,7.
Exact normalization and source hashes are recorded by the case-specific packet.
