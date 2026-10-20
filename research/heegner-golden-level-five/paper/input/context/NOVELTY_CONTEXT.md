# Novelty assessment of the golden Heegner-163 packet

Audit date: 2026-10-19. Scope: the mathematical contribution of the parent,
v0.2 and especially v0.3 packets concerning c0=phi^-2, Rogers-Ramanujan (RR)
singular values at tau=(1+sqrt(-163))/2, the cyclic quartic radical, and its
Artin law. New mathematical extensions were paused for this audit.

## Verdict

**No substantive new mathematical theorem has been established as novel by this
audit.** Several central claims specialize explicit prior theorems; others are
coordinate computations inside those structures. The packet remains useful as
a local, reproducible example. This is not a proof that every coefficient or
possible future connection has appeared in print.

The strongest correction is concrete, not a negative keyword search: our
quartic is equivalent to a standard cyclic quartic parameterization, whose
published conductor formula immediately yields 815. The ratio phi describes
our selected generator. It is not an invariant of the field without that
generator being marked. A canonical marked construction could be studied, but
its novelty and usefulness have not been established here.

## Claim-by-claim disposition

| Local claim | Literature relationship | Disposition |
| --- | --- | --- |
| c0=phi^-2; RR inversion has the golden matrix normalization | Duke, Proposition 2, Eq. (3.2), printed p. 7; classical RR transformation | Known transformation plus elementary algebra |
| delta=2 sqrt(163) sin(pi/5), with positive conjugates delta and phi delta | Cyclotomic pentagon geometry; standard cyclic quartic family below | Correct chosen-generator description; no novelty claim |
| Q(delta) is cyclic quartic | Spearman-Williams, Eqs. (1)-(4), printed pp. 453-454, after the exact generator change below | Equivalent formulation of a prior family |
| Conductor 815, discriminant 3321125 | Spearman-Williams, Eq. (9), printed p. 455; Milne V.3.27-3.28, printed p. 165 | Routine theorem specialization |
| K(r(tau)) is the conductor-5 ray class field | Gee-Honsbeek, Theorem 5, printed pp. 62-63; Cais-Conrad, Corollary 5.7, printed p. 14 | Direct prior theory; norm(tau)=41 supplies the 5-unit hypothesis in the latter |
| Ray/ring/cyclotomic field identifications and the quartic embedding in Q(r(tau)^5) | Prior class-field theory plus the local branch, inclusion and degree arguments | Routine deduction with an explicit local certificate; not implied by Cais-Conrad alone |
| Quartic Dirichlet character and oriented Frobenius rule | Rational cyclotomic/Artin theory, Milne V, Example 3.10 and Section 3 | Routine specialization; the chosen-generator orientation is certified locally |
| Explicit rational w(u) satisfying u^2+4=163(1+c0)w(u)^2 | No verbatim coordinate expression located in the inspected sources | Computational certificate; mathematical priority and an advantage over existing methods are not established |
| A new explanation or estimate for the exponential near-integer error | None supplied in the packets | OPEN; not a result of the quartic calculations |

## Decisive equivalence with the published quartic family

Put s=sqrt(5), phi=(1+s)/2, c0=(3-s)/2, and delta^2=163(5-s)/2.
For beta=phi^2 delta, exact algebra gives

    beta^2 = 163(5+2 sqrt(5)).

The fields are equal, not merely of equal degree. Indeed

    sqrt(5)=5-2 delta^2/163 = (beta^2/163-5)/2,

so each field contains phi and the generator change is invertible within it.
Spearman-Williams write a cyclic quartic field as

    Q(sqrt(A(D+B sqrt(D)))),
    D=B^2+C^2,

subject to their squarefree, coprimality and sign conventions. Our parameters
are A=163, D=5, B=2, C=1. Since D is 1 modulo 4, B is even and A+B=165 is
1 modulo 4, their case 3(b) has ell=0. Their formula gives

    f=2^ell |A| D=815.

The quartic character and its conjugate have conductor 815, and their quadratic
character has conductor 5; the conductor-discriminant formula yields

    disc=5*815^2=3321125.

The 1997 paper explicitly credits the conductor theorem to a 1986 work
([1], Theorem 5) and the parameterization to that work's Theorem 1. The 1986
original was not inspected; the 1997 primary paper itself is sufficient prior
art. Its general formula, rather than a printed example with the digits 815,
is what establishes this overlap.

For sigma(delta)=phi delta, sigma(phi)=(1-s)/2, the alternate generator has

    beta/sigma(beta)=phi^3.

Both conjugates here are positive. Thus the positive-root ratio changes from
phi to phi^3 under a natural generator change of the same field. The earlier
report's emphasis on the ratio should be read as a selected-coordinate fact,
not as a newly discovered intrinsic arithmetic invariant. The conductor and
discriminant are intrinsic, but already covered by prior theory.

## RR prior art and a notation trap

Gee-Honsbeek's thesis chapter contains a general algorithm using Shimura
reciprocity for CM RR values, not just a list of numerical coincidences.
Theorem 5 identifies the ray field; Proposition 6 gives a reciprocal-pair
description and a cyclotomic compositum. The thesis preface dates submission
of the joint manuscript to June 1999; the thesis is dated 2001. Cais-Conrad's
bibliography also cites its 2006 journal publication.

The director visually inspected the chapter's complete printed pages 53 and
63 (PDF pages 2 and 12). Its R(z) is the ordinary RR function r(z), not r(z)^5.
Its function w(z)=eta(z/5)/eta(5z) satisfies

    1/R(z)-R(z)-1=w(z),
    H_5=K(w(tau),zeta_5).

These are the actual Eq. (25) and Proposition 6. Their w is **not** our
coordinate polynomial w(u), and their R is **not** our t=r^5. Their H_5 denotes
the level-5 ray field, whereas the local v0.3 packet uses H5 for the
conductor-5 ring class field. The notation must be translated before comparing
claims. We do not identify these different w functions or call the proposition
a verbatim statement of our t certificate.

Cais-Conrad Eq. (4.8) fixes j_5=1/r, so Corollary 5.7 applies directly at our
maximal-order tau with norm 41. It does not alone prove that r^5 generates the
appropriate real fixed field or give the coordinate square witness. The local
proofs still provide those deductions. Deducing a specific instance of a known
class-field mechanism does not by itself establish a new theorem.

Duke's Eq. (3.2) already gives

    r(-1/tau)=(phi^-1-r(tau))/(1+phi^-1 r(tau)).

Squaring its representing matrix produces (1+c0)I. The pentagonal factor
therefore belongs to the universal level-5 modular geometry, before specializing
to discriminant -163. It has not been shown here to explain the unusually small
error of exp(pi sqrt(163)) beyond the established j-function mechanism.

## What remains potentially useful

The explicit square witness, branch selection, finite prime controls and
replayable scripts provide an inspectable worked example. No identical printed
witness was located; that is a search status, not a claim of originality.
To turn this into a contribution, one would need, for example, a demonstrably
simpler uniform construction, a new theorem with hypotheses outside the prior
ones, or a new quantitative prediction. None has been established by this audit.

The research question to carry forward is: does the naturally marked level-5
structure provide a non-tautological formula, bound, or prediction for the
Heegner exponential error, with content beyond the classical j expansion and
RR transformations? Before computation, state the expected new conclusion and
the exact prior result it improves. A re-expression of the same algebraic
number in golden coordinates does not pass that gate.

## Evidence, preservation and limits

The explicitly selected Codex CLI model was gpt-5.6-terra with high reasoning,
in a read-only sandbox. Its completed source-level review is preserved in
`logs/terra-audit.md` and `logs/terra-events.jsonl`. It agrees on the family
equivalence and the absence of demonstrated novelty. This is a second review
of the same evidence, not independent literature coverage or peer review.
The director added network source checks, page-image inspection and the exact
generator-equivalence checker. The review placed the 1997 theorem on p. 454;
the PDF's theorem and Eq. (9) are actually on printed p. 455, corrected here.

The 55 authored files bound by the three earlier checkpoint manifests remain
unchanged. No old result or sealed manifest was regenerated. Audit checks do
not replay the entire old computation, whose prior acceptance records remain
historical evidence. New source PDF bytes and checks are pinned separately.

Coverage is bounded: the 1986 source and all historical notebooks were not
exhaustively inspected; access to a guessed LMFDB entry and some publisher
pages failed. The contemporary sources screened are recorded in SEARCH_LOG.md.
No inference of novelty is drawn from missing search hits, inaccessible pages,
OCR failures, or the absence of a literal coefficient string. No publication,
priority, Lean-formalization or RH claim is made.
