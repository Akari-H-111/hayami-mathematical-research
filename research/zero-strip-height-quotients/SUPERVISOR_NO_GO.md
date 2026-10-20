# An eventual-periodicity strengthening

Status: **PROVED (written argument with classical analytic input)**.
This is a standard consequence of superlinear zero counting; no novelty or
Lean completion is claimed.

Let D be a nonnegative, integer-weighted locally finite divisor in a bounded
horizontal strip. Require finiteness of its total mass in every bounded
height slab, including near the horizontal strip's edges. For the xi divisor
this follows by considering compact slabs in the closed strip and using
that xi is an entire function not identically zero.

Suppose its strict positive-height count N_D(H) satisfies
N_D(H)/H -> infinity. Then, for every fixed T>0 and h>=0, the cell masses

    A_n = D({s: h+nT <= Im(s) < h+(n+1)T}), n=0,1,...,

are unbounded. Indeed, if A_n<=M for all n, the half-open partition gives

    N_D(h+nT) <= K+nM,

where K is the finite mass between heights 0 and h. Thus the count divided
by height is bounded on an unbounded sequence, a contradiction. The same
proof applies to any tail of the sequence, so no tail has uniformly bounded
cell masses. It does not assert growth or monotonicity of each individual
cell mass.

Consequently there is no eventual divisor periodicity, even when a finite
initial region may be exceptional. More strongly, an inequality

    m(s+iT) <= m(s) for every s with Im(s)>=h

would force A_(n+1)<=A_n and hence a uniform cell-mass bound, so is also
impossible. Here m(s)=0 at points outside the divisor; the inequality is
over every point in the strip, not just points already known to be zeros.
An injection sending existing zeros upward, or mere support containment,
does not imply this inequality and is not excluded by this argument.

Riemann-von Mangoldt supplies the growth hypothesis for the complete xi
divisor without assuming RH. This proves full and eventual translation
No-Go statements for that divisor. If a glide (x,t)->(-x,t+T) preserves its
multiplicity function eventually, two applications give an eventual
translation period 2T, also impossible. Endpoint atoms cause no ambiguity
because every cell is half-open and the final count is bounded above by a
finite prefix plus a sum of full cells.

These conclusions do not prove that the unweighted zero support is
aperiodic. Support invariance without multiplicity invariance is a separate
claim, and may require additional information.

External input: Trudgian,
[arXiv:1208.5846v2](https://arxiv.org/pdf/1208.5846), Corollary 1, p. 2,
gives the logarithmic-error count estimate; only its superlinear growth
consequence is used here.
