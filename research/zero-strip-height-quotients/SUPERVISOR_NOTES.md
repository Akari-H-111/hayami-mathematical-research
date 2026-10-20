# Supervisor source checks and a sharper acceptance test

These notes are part of the authorized research task, not an attachment.

## Independently retrieved primary sources

- Timothy Trudgian, *An improved upper bound for the argument of the Riemann
  zeta-function on the critical line II*, arXiv:1208.5846v2 (2012),
  https://arxiv.org/pdf/1208.5846 . Page 2, Corollary 1 gives an explicit
  logarithmic-error bound for N(T). Equation (2.1) gives the xi functional
  equation, and pp. 2-3 specify the count and derivation. Endpoint conventions
  still need explicit handling in our proof. Retrieved 2026-10-18.
- Isaac Goldbring, *Hilbert's fifth problem for local groups*,
  https://homepages.math.uic.edu/~isaac/ltop.pdf . Introduction, p. 1 states
  the global locally Euclidean topological-group theorem; references [4] and
  [13] on p. 53 identify Gleason and Montgomery-Zippin (1952). This is a
  primary local-group research paper recalling the classical global theorem,
  not a new proof of the latter. Retrieved 2026-10-18.

## Countermodel that tests the entire package, not just symmetry

Candidate written proposition to prove and review: for 0<a<1/2 and b>0, let

    P(w) = ((w-a)^2+b^2)((w+a)^2+b^2),
    X(s) = xi(s) P(s-1/2).

P is real and even, and has the four distinct roots w=+/-a+/-ib.
Consequently X is entire, obeys both xi reflection/conjugation symmetries,
and has off-critical zeros inside the strip. Counting with multiplicity,

    N_X(H) = N_xi(H) + 2 1_{H>b}

for the strict convention 0<Im(s)<H (at H=b the added count is zero).
The formula remains valid when a new polynomial root coincides with a zero
of xi: multiplicities add. Thus X has the same Riemann-von Mangoldt leading
asymptotic and fails all fixed nonzero divisor periods by the same no-go.
Its finite reflection quotient and all ambient cylinder/Mobius constructions
also exist. These ingredients together still do not force all zeros onto
the critical line.

This is an auxiliary entire-function construction, not zeta and not a
counterexample to RH. No Euler product is asserted. The conclusion is only
that these particular symmetry/counting/topology inputs are insufficient.
Classical analytic inputs about xi remain written external inputs unless
their precise Mathlib theorems are connected. Do not label this novel without
a separate literature review.

## Scope preservation

The initial CLI invocation rejected placement of --ignore-user-config before
the exec subcommand. Attempt 01 logs preserve the failure; the corrected
dispatch places it after exec. No model fallback was used.
