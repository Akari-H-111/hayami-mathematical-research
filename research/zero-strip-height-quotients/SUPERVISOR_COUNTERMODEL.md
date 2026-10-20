# A countermodel to sufficiency of symmetry, counting, and strip topology

Status: **PROVED (written mathematical argument using classical external
properties of xi)**. Not a counterexample to RH. Not Lean verified. No
originality claim is made.

Let xi be Riemann's entire completed xi function, including its removable
values at 0 and 1. Fix real parameters 0<a<1/2 and b>0. Put

    P(w)=((w-a)^2+b^2)((w+a)^2+b^2)
        =w^4+2(b^2-a^2)w^2+(a^2+b^2)^2,
    X(s)=xi(s) P(s-1/2).

The polynomial is even and has real coefficients. Therefore X is entire,
X(1-s)=X(s), and X(conj(s))=conj(X(s)). For w=+/-a+/-ib the polynomial
vanishes. These are four distinct simple polynomial roots, since a,b>0.
Their corresponding s lie strictly in the critical strip, and all four
are off the critical line. Xi may already vanish at any of these points;
that only increases the product's multiplicity.

The divisor identity is div(X)=div(xi)+div(P(s-1/2)). Hence, with the strict
positive-height convention N_f(H)=sum_{0<Im(rho)<H} ord_rho(f),

    N_X(H)=N_xi(H)+2*1_{H>b}.

At H=b the added count is zero. This identity concerns multiplicities and
does not require the added zeros to be disjoint from xi's zeros. It follows
that X has the same Riemann-von Mangoldt main terms and O(log H) remainder
class as xi. In particular, N_X(H)/H tends to infinity. Any positive divisor
period would force a bounded ratio by the finite-period-cell argument, so
X also has no positive divisor period. A glide period is excluded by its
square, exactly as for the zeta divisor.

For real w, each quadratic factor is positive. For w=it the product is the
squared complex modulus of (it-a)^2+b^2, and is also positive: a zero would
require t=0 from its imaginary part, contradicting a^2+b^2>0. Thus this
modification even preserves the critical-line zero set with its
multiplicities. It changes the off-critical divisor while leaving all
critical-line zero data intact.

All ambient strip reflections and cylinder/Mobius quotient constructions
remain available for X. The reflection-invariant divisor still has a
well-defined quotient by the finite Klein group. Therefore these symmetry,
main-term counting, critical-line marking, and ambient-topology properties
together do not imply that every zero lies on the critical line. This
countermodel does not supply an Euler product and makes no assertion about
what adding a fully specified arithmetic hypothesis would imply.

## Natural finite quotient and measure bookkeeping

The quotient of the centered plane by the two coordinate sign changes is
represented by q(x,t)=(|x|,|t|), a closed quadrant; on the open critical strip
it is [0,1/2) x [0,infinity). This uses genuine reflection symmetries and
introduces no artificial height period. The finite-group quotient of the
locally finite divisor is locally finite: the inverse image of a compact
quotient set is compact, and contains only finitely many zeros.

Away from real zeros (which xi has none in the strip), a critical-line orbit
has two points, and an off-line orbit has four. Equal multiplicity m on an
orbit gives pushforward mass 2m or 4m. A measure assigning m per orbit is a
different normalization. In particular, a pushforward atom of weight four
does not by itself identify an off-line orbit: a double critical-line zero
also has pushforward mass four. RH is equivalent to the absence of
four-point zero orbits, but that equivalence is a restatement, not a new
constraint excluding those orbits.

The real-zero exclusion is proved for every real 0<sigma<1 by the eta-series
argument in `MATHEMATICS.md` section 5; it is not inferred solely from
zeta(1/2)!=0.

## External inputs and checks

The classical properties of xi and its functional equation are stated in
[NIST DLMF 25.4](https://dlmf.nist.gov/25.4). The positive-height count and
logarithmic-error estimate are given in Trudgian,
[arXiv:1208.5846v2](https://arxiv.org/pdf/1208.5846), Corollary 1, p. 2;
equations (2.1)-(2.5) discuss xi and the count. Zero-strip location and
reflection symmetry are summarized in
[DLMF 25.10](https://dlmf.nist.gov/25.10).

`verification/supervisor_countermodel.py` checks the finite polynomial
algebra at exact Gaussian-rational inputs. That check is diagnostic support
for the displayed identity and roots, not a proof of the classical analytic
inputs or the universal parameter statement. The proof is the argument above.
