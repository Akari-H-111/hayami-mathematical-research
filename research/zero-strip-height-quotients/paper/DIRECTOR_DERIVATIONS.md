# Independent director derivations for the paper core

These are candidate written proofs, provided for critical integration. They
are not claims of Lean verification or novelty. The external inputs below
are those explicitly recorded in Ford-Zaharescu, arXiv:math/0405459v2,
Introduction, Lemmas 1-2, and its smooth-test theorem. Preserve their scopes.

## 1. Quantitative collapse to the central circle

Fix a>=1/2 and L>0. On [-a,a] x R use the Euclidean metric and the isometric
deck action d(x,t)=(e*x,t+L), with e=1 or e=-1. Give the quotient Q_e the
metric

    dist([x,t],[y,u]) = inf_{n in Z}
        sqrt((x-e^n*y)^2+(t-u-nL)^2).

The action is proper: only finitely many n can keep the vertical displacement
bounded. Thus the displayed pseudometric is a metric, agrees with the
quotient topology, and Q_e is compact as the image of a fundamental closed
rectangle. The central circle i(R/LZ) is isometric to the circle of length L.
The map r([x,t])=[0,t] is well defined and continuous, and

    dist([x,t],r([x,t]))=|x|.

For zeros 0<gamma<=H, form probability mu_H^e by dividing the pushed-forward
multiplicity measure by N(H). Let lambda_H be the probability distribution of
gamma/L mod 1. For any real 1-Lipschitz f on Q_e,

    |int f dmu_H^e - int f dm_center|
       <= (1/N(H)) sum_{0<gamma<=H} m_rho |beta-1/2|
          + L D_H^*,                                      (A)

where D_H^*=sup_{0<=u<=1}|lambda_H([0,u))-u|. To prove (A), replace each point
by its retraction; this changes the sum by at most the average |x|. On the
circle, g(u)=f(i([Lu])) is L-Lipschitz and periodic. Stieltjes integration by
parts bounds the empirical/uniform difference by
D_H^* int_0^1 |g'(u)| du <= L D_H^*. CDF choices differ only at atoms and do
not change that integral; periodicity cancels the endpoint term.

Let the uniform Selberg bound from FZ Lemma 2 be
N(sigma,H)<=C H^(1-(sigma-1/2)/4) log H. Its count includes both signs of
gamma, which only enlarges the upper bound needed here. Reflection about
beta=1/2 and the layer-cake identity give

    sum m_rho |beta-1/2|
      = int_0^(1/2) #{rho:0<gamma<=H, |beta-1/2|>u} du
      <= 2 C H log H int_0^(1/2) exp(-u log H/4) du
      <= 8 C H.

Consequently the first term of (A) is O(1/log H). FZ's Introduction records
Fujii's unconditional D_H^*=O_L(log log H/log H). Under these named external
inputs, (A) is therefore O_L(log log H/log H), for both deck signs. The weak
limit is central-circle Haar measure. For a proof of weak convergence without
transport duality, use uniform continuity of each continuous f, split the
retraction error at |x|=delta, and use the fixed-delta density bound plus
circle equidistribution. No assertion of RH or exact critical-line support
is involved.

The unnormalized pushforward has infinite mass in every neighborhood of each
central-circle point: every such neighborhood contains a narrow transverse
strip over an open height arc I. Its zero count is at least

    (|I|/L+o(1)) N(H) - #{|beta-1/2|>=delta}
      = (|I|/L+o(1)) N(H) -> infinity.

Do not claim infinite mass near every off-center point; RH would leave those
neighborhoods empty. Likewise, the weak limit does not force every zero onto
the central circle: finite or density-zero exceptions disappear from it.

## 2. Support periodicity and the critical-line distinction

Full or eventual unweighted support periodicity with period L would, by
bounded-slab local finiteness and downward use of the eventual equivalence,
put every positive-height zero into finitely many residue classes modulo L,
apart from a finite prefix. Hlawka equidistribution contradicts an open arc
avoiding those finitely many classes. This works for the full support and
for the set of all positive ordinates. A glide period is excluded by squaring.

For the critical-line-only set Gamma, do not assume it is equidistributed.
Its fixed/eventual period is still excluded by the positive-proportion
critical-line theorem: if Gamma's residues lay in a finite set A, its
weighted contribution to lambda_H(A) would have positive limiting lower
mass. The full all-zero measure lambda_H tends weakly to Haar, whose mass
on a finite closed A is zero. This contradicts the closed-set upper bound.

More generally, if K is the closure of the projected positive critical-line
heights, Haar(K)>=c whenever liminf N_crit(H)/N(H)>=c. This gives a lower
bound on the size of that closure, not its equality with the whole circle.
For a quantitative distinct-residue bound use simple critical-line zeros:

    R_L(H) >= N_crit,simple(H)/(floor(H/L)+1),
    liminf R_L(H)/log H >= c L/(2 pi)

when liminf N_crit,simple(H)/N(H)>=c. The primary BCY theorem permits a
conservative c=0.4. Same-height off-line zeros cannot be used in place of
simple critical-line zeros in this pigeonhole bound.

## 3. Sparse products preserve more than a probability limit

Take 0<a<1/2, b_n=2^n, z_n=a+i b_n, and

    P(w)=prod_{n>=1}(1-w^2/z_n^2)(1-w^2/conj(z_n)^2).

For |w|<=R the sum of absolute factor deviations after N is bounded by

    B_N=(2R^2/3)4^(-N)+(R^4/15)16^(-N).

This follows by expanding each paired factor and summing the two geometric
series. Normal convergence follows. Off its prescribed roots the product is
nonzero, since the absolute factor-deviation series is summable. Each paired
factor is a squared modulus when w is real or purely imaginary, and none
vanishes there; the convergent product is positive on both axes. The roots
are the distinct simple points +/-a+/-i 2^n. Products with xi add
multiplicities even at accidental coincidences.

The extra positive-height count is

    N_P(H)=2 #{n>=1:2^n<=H}=2 floor(log_2 H), H>=2,

with the closed convention; the strict convention must instead use the exact
strict counting function at powers of two. Thus N_P(H)=O(log H). For a pair
factor tail with B_N<1, a safe relative tail bound is B_N/(1-B_N): expand
finite products, use elementary symmetric sums bounded by powers of their
total absolute deviations, sum the geometric series, then pass to the limit.

The product has log max_{|w|<=R}|P(w)|=O((log(R+2))^2), by splitting factors
at n about log_2 R. It therefore has order zero; xi*P retains order one.
The upper growth bound is for log maximum modulus, not a uniform bound on
log|P| from below near its zeros.

Let X(s)=xi(s)P(s-1/2). In addition to preserving all RvM main terms with
the O(log H) remainder class, the critical-line zero multiplicities and
sign pattern of the real function xi(1/2+it), X has the same normalized
quotient probability limits and the same FZ secondary limits. Indeed for
every bounded measurable height test h and fixed alpha,

    |(1/H)[sum_{X} h({alpha gamma})-N_X(H) int h
           -sum_{xi} h({alpha gamma})+N_xi(H) int h]|
      <= 2 ||h||_infinity N_P(H)/H -> 0.

This proves equality of every secondary limit that actually exists for xi;
it does not prove a conjectural interval limit for either function.

Even the fixed-x Landau asymptotic class survives: the extra contribution
to sum_{0<gamma<=H} x^rho is O_x(log H), since all extra abscissas remain
in (0,1). Thus the leading prime-power term and an O_x(log H) error remain
the same. The uniform FZ Lemma 1 error class also absorbs the elementary
O(x log H) extra contribution for x>1, H>=2. The Selberg density upper-bound
class survives as well, since O(log H) extra zeros are absorbed uniformly
in its right side for 1/2<=sigma<=1.

These are asymptotic classes with unspecified constants. An exact Weil
explicit formula, an Euler product, prescribed gamma factors and full
functional values are not preserved or asserted. The exact additional
divisor would be visible to sufficiently precise compactly supported tests.
The construction is not a counterexample to RH; it is a nonidentifiability
theorem for the specified asymptotic observations.
