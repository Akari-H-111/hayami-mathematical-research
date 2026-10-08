# Proof of matrix completion and the new contraction

2026-09-06; v0.06 matrix supplement. Original v0.05's three PDFs and ZIP unchanged.

## Conclusion and research stopping point

This round completed a new stationary-feedback matrix family, beyond merely supplying rank numbers.
Arity 19–22 matrices have the historical shapes: 28×455,30×490,32×525,34×560;
all have full row rank with identical augmented rank, complete entries, RHS, solutions, pivot inverses, and determinants.
The arity 23 system of size 36×595 was also completed, with full row rank and a solution.

The new construction preserves the cubic class and original 100 partial-homotopy assignments, with one global
contraction realizing kappa_2=0,kappa_3=v^3[zeta],kappa_4=...=kappa_23=0.
**Arity 23 is the verified order of this round's new construction, not a theorem about the last order that can vanish.**
No arity 24 computation or all-order pure-cubic conclusion this round.

Arity 23 was actively eliminated through F22 feedback, not predicted held out. This differs from v0.05's
nonzero 4/9 after complete freezing, which remains valid for its original contraction. Together they
show that a selected contraction's finite stopping point cannot directly become a universal obstruction.

## 1. Why old shapes cannot be imposed directly on v0.05

Let p0 denote complete v0.05 projection. Its combined image on [alpha,U16] and [xi,U16] is two-dimensional,
so the formal 34×560 response matrix has rank 34. But setting high-v coefficients of v0.05's F21
to zero and appending the same prior trajectory raises the complete 42-dimensional equations' augmented rank to 35.
Thus this U16 system is incompatible; coefficient rank 34 does not prove solvability.
The control system using the complete 88-dimensional acyclic controller has rank/augmented rank 67/67.

This is because v0.05's high-order lifts exceed U16 and p0 has a third output direction on other nonclosed quadratic
sources. Three probe logs and RESEARCH_LOG.md preserve these
incompatibilities and failed checks, not historical records relabeled PASS.

## 2. Complete quadratic space and new projection

Let T be the bracket span of all unordered cochain pairs from span{alpha,xi,U16}.
37 vectors give 703 pairs. Actual matrix multiplication and Hochschild differential yield

    dim T=267, rank(d2|T)=264,
    dim(T intersect Z2)=3, dim(T intersect B2)=1.

Its closed cohomology image C therefore has dimension 2, rather than the whole H2 having only two dimensions.
The complete space still has C2=2025,rank d2=1895,Z2=130,B2=88,H2=42.
p0(T) has dimension 3; the extra dimension comes from the projection choice on nonclosed sources.

Choose a replayable retraction r from three-dimensional p0(T) to C, identical on C.
The program uses an actual closed-class basis and the first independent additional image, selects parameter 0, and explicitly checks
that this preserves the two-dimensional alpha/xi feedback image and full row rank of matrices.
No historical sensitivity numbers are used to reverse-engineer or tune parameters.

On T, delta=(r-I)p0 annihilates T intersect Z2, uniquely factoring through d2(T):

    L(d2 q)=delta(q),   q in T.

Define L on an exact echelon basis of d2(T), then use explicit coordinate extension
to all C3, obtaining the new global projection

    p2=p0+L*d2.

Since d2 vanishes on Z2, p2 retains all 42 original cohomology classes. On T its image
is exactly C, so two output coordinates are complete, not two selected rows with remaining equations ignored.
The original partial-source space is annihilated by both p0 and p2. All 2025 columns are serialized and hash-frozen
before any new controller solution, with the same projection used at every later order.

## 3. Actual rows, columns, and right-hand sides

Keep F1,...,F17 at their replayed original values. For target arity n, new free homotopy
channels are v-degrees 6,...,n-1 of F_(n-1); each channel takes 35 U16
basis vectors. Sources first undergo exact reduction modulo the assigned homotopy domain,
confirming these channels genuinely independent before introducing control coefficients, rather than assuming all are free.

Let rho be two-dimensional coordinates for the complete p2 image; set

    A_j=rho([alpha,U_j]),  B_j=rho([xi,U_j]).

For one control c_(b,j) u^(n-1-b) v^b U_j, the next-order source changes by

    c_(b,j) [u alpha+v xi, u^(n-1-b) v^b U_j].

Thus matrix row (v-degree d,harmonic k) and column (channel b,U_j) is

    M_(d,k),(b,j)=delta_(d,b) A_(k,j)+delta_(d,b+1) B_(k,j).

Every entry is computed from these brackets. Set current free channels to zero and recompute R_n^base from all
previous F_i; set forcing=rho(R_n^base), then solve M*c=-forcing.
Each order preserves source, forcing, explicitly negative RHS, and selected control solution.

Every square pivot minor P comes with complete P^(-1), checking P*P^(-1)=I and independently
recomputing det P. This certifies rank(M)=row count, while exact M*c=rhs proves
equal augmented rank. Every CSV entry also matches JSON, beyond a matrix summary.

## 4. Why successive solutions belong to one contraction

At each order fix h2(R_n^monomial)=-F_n^monomial, preserving the differential
inverse on B2 and all original 100 h0 assignments. Exact source-domain reduction checks every
linear dependence yields consistent h values. Cumulative differential ranks including the full old partial history
are 99,112,126,141,157,174, not prefix ranks omitting old history.

On all assigned sources, h2-h0 annihilates closed combinations, so it too
factors as L_h*d2 with an explicit linear extension: h2=h0+L_h*d2. All 2025 columns are saved.
The verifier checks h2's image lies in the fixed 88-dimensional C1 acyclic complement and that all basis
vectors simultaneously satisfy

    h2(df_j)=f_j, p2(df_j)=0,
    h2(i z_j)=0, p2(i z_j)=z_j.

Recomputing the complete d2 kernel yields Z2=B2 direct-sum i(H2). Therefore

    W2=ker h2 intersect ker p2

is a common complement to Z2, of dimension 2025-88-42=1895. Equivalently, W2 is
the image of I-d1*h2-i*p2. Vector-space splittings at adjacent degrees extend to
a standard contraction of the entire complex; d2 and H2 are not additionally truncated.

The final verifier independently recomputes all R_n with another flattened matrix-unit cup-product
implementation, checking the same h2,p2 realize F_n=-h2(R_n) and the stated kappa values.
F2,...,F22 lie in U16; F23 is determined by global completion, without a further claim that it remains in U16.

## Retained limitations

Original historical detector pair, E32 sensitivity 1103872, specific pivot determinant,
danger-row RHS, and evolving quotient flags have not been recovered. These numbers do not
become replayed merely because new matrices share shape/rank. This supplement completes checkable
alternative matrices and a common contraction, not original bytes of the missing checkpoints.

Following Ponytail, existing algebra and SymPy were reused; additions are matrix construction, complete certificates, and
an independent consumer, without new package dependencies. This is exact rational computation and linear-algebra proof,
not full-paper proof-assistant formalization. Three delivered PDFs were unchanged, with
no new images and no preprint upload.
