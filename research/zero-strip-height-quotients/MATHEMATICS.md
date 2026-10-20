# Mathematical audit

## 1. Analytic object and its exact symmetries

Put `s = 1/2 + x + i t` and

\[
 \xi(s)=\tfrac12s(s-1)\pi^{-s/2}\Gamma(s/2)\zeta(s).
\]

This is entire; its zeros are precisely the nontrivial zeta zeros, with the
same orders.  Write its divisor in centered coordinates as

\[
 D=\sum_{(x,t)\in Z}m(x,t)\,\delta_{(x,t)}.
\]

It is locally finite: zeros of a nonzero entire function are isolated, hence
finite on each compact subset.  The functional equation `xi(s)=xi(1-s)` and
the real structure `xi(conj s)=conj(xi(s))` preserve the order of every zero.
Consequently the maps

\[
C(x,t)=(x,-t),\quad F(x,t)=(-x,-t),\quad R(x,t)=(-x,t)=C F(x,t)
\]

preserve `D`, including multiplicities.  They square to the identity and
commute.  Together with the identity they form a faithful ambient action of
`V_4` on `R^2`: the four maps are distinct (for example evaluate at `(1,1)`
and `(1,0)`).  This is an assertion about the plane.  On `Z` it need not be
faithful: if RH holds, every zero has `x=0`, so `R|_Z` is the identity.  The
converse is exactly RH; it is a reformulation, not a proof of RH.

The derivative matrices are diagonal:

\[
 DC=\operatorname{diag}(1,-1),\quad DF=\operatorname{diag}(-1,-1),
 \quad DR=\operatorname{diag}(-1,1).
\]

Thus `det C=det R=-1` and `det F=+1`.  This is a signed-orientation statement.
It does **not** say that unsigned counting measure or absolute area measure
changes sign; both are invariant under these bijections.

The orientation character on the ambient group is epsilon(id)=epsilon(F)=1
and epsilon(C)=epsilon(R)=-1. The chain rule and multiplicativity of the
determinant prove it is a homomorphism, with kernel {id,F}; reversing
orientation does not affect commutativity. This derivative/character argument
is written mathematics. Lean checks the displayed matrix determinants only.

## 2. The divisor periodicity no-go

Here equality of divisors means equality of the integer multiplicity at every
point.  Let `P_T(x,t)=(x,t+T)` for `T>0`.

**Theorem (classical consequence).** There is no `T>0` for which
`(P_T)_*D=D`.

**Proof.** Define, with a half-open convention,

\[
 N(H)=\sum_{\substack{\rho=\beta+i\gamma\\0<\gamma\le H}}m_\rho.
\]

The Riemann--von Mangoldt formula (sources and convention in `SOURCES.md`)
states

\[
 N(H)=\frac{H}{2\pi}\log\frac{H}{2\pi}-\frac{H}{2\pi}+O(\log H)
 \qquad(H\to\infty). \tag{RvM}
\]

For precision, S8 in `SOURCES.md` supplies a directly retrieved explicit bound
at heights away from zero ordinates. No exact endpoint constants are used.
At an ordinate H, strict or closed counts are squeezed between counts at
nonordinate heights in (H-1,H) and (H,H+1). The main term changes by O(log H)
over this range, so either endpoint convention has the displayed asymptotic.

Suppose `D` had period `T`.  The rectangle
`[-1/2,1/2] × [0,T]` contains only finitely many xi zeros, so the multiplicity
mass

\[
 M=D\bigl(\{(x,t):0\le t<T\}\bigr)
\]

is finite.  (The endpoints `x=±1/2` have no xi zeros; alternatively enlarge
the compact rectangle slightly.)  The half-open cells `[kT,(k+1)T)` partition
`[0,\infty)`, and periodicity gives each cell mass `M`.  Hence, including the
last possibly incomplete cell,

\[
 N(H)\le M(\lfloor H/T\rfloor+1)=O(H). \tag{1}
\]

But (RvM) gives `N(H)/H = (2π)^{-1} log H+O(1)`, which is unbounded.  This
contradicts (1).  Multiplicities were retained throughout.  Notice that the
cell argument does not require any assertion about a zero at height zero.
Conjugation maps `(0,H]` exactly onto `[−H,0)`, so the same half-open
bookkeeping covers negative heights without double-counting `0`. ∎

The same argument excludes a glide-invariant divisor.  For
`G_T(x,t)=(-x,t+T)`, direct calculation gives
`G_T^2=P_{2T}`; invariance under the glide would imply the forbidden vertical
period `2T`.

This proof does **not** claim that the unweighted support is nonperiodic.
Support periodicity alone does not control possibly varying multiplicities,
whereas (RvM) counts multiplicity.  A separate multiplicity bound or a separate
argument would be needed.

## 3. Ambient height quotients

For `a,T>0`, let

\[
 A_a=[-a,a]\times\mathbb R,\quad
 Q_{a,T}^{+}=A_a/((x,t)\sim(x,t+T)),\quad
 Q_{a,T}^{-}=A_a/((x,t)\sim(-x,t+T)).
\]

The deck generators are respectively `d_+(x,t)=(x,t+T)` and
`d_-(x,t)=(-x,t+T)`.  The analogous full-width spaces replace `[-a,a]` by
`R`.  These are statements about ambient spaces, not a descended zeta divisor.

| quotient | underlying space | compact / boundary / orientability | `pi_1`, `H_1(-;Z)` | center and orientation cover | compatible topological group? |
|---|---|---|---|---|---|
| `Q^+_{a,T}` | closed cylinder | compact, two boundary circles, orientable | `Z`, `Z` | `x=0` circle; orientation cover is two disjoint copies | No |
| `Q^-_{a,T}` | closed Mobius band | compact, one boundary circle, nonorientable | `Z`, `Z` | `x=0` circle; cover is cylinder with height `2T` | No |
| `Q^+_{∞,T}` | `R × (R/TZ)` | noncompact, boundaryless, orientable | `Z`, `Z` | `x=0` circle; trivial orientation cover | Yes: `R × AddCircle T` |
| `Q^-_{∞,T}` | open Mobius band | noncompact, boundaryless, nonorientable | `Z`, `Z` | `x=0` circle; cover is full cylinder of height `2T` | No |

The cylinder descriptions are mapping tori of `id`; the Mobius descriptions
are mapping tori of `x ↦ -x`.  In the two Mobius cases the displayed double
cover is induced by `R/(2T Z) -> R/(T Z)` together with the deck involution
`(x,[t]) ↦ (-x,[t+T])`.

For each *closed* band, no compatible topological-group structure can exist:
a topological group is homogeneous under left translations, whereas interior
and boundary points have different local homology (in dimension two,
`H_2(M,M\setminus\{p\};Z)` is `Z` at an interior point and `0` at a boundary
point).  This is stronger than merely observing a failed candidate operation.

For the open Mobius band, suppose its given topology supported a topological
group law.  It is a locally Euclidean topological group, hence a Lie group by
the Gleason--Montgomery--Zippin solution of Hilbert's fifth problem.  Every Lie
group is orientable: choose an orientation at the identity and translate it
leftward.  The open Mobius band is nonorientable, a contradiction.  This is
the needed topological-group theorem; no smoothness of a proposed law has been
assumed.

For the full ordinary cylinder, `R × AddCircle T` is an abelian topological
group, and the map `(x,t) ↦ (x,[t])` is a continuous homomorphism invariant
under `d_+`.  The Lean file proves these model facts and deck invariance.  It
does not formalize the universal property/homeomorphism from the deck quotient
to that product.

## 4. Divisors versus pushed-forward measures

Every quotient map `q` pushes the extended positive counting measure forward:
`q_*D(B)=D(q^{-1}(B))`; this is defined even when it is infinite.  A divisor
on the quotient with the intended local finite multiplicities instead requires
deck invariance, so that a fiber has a well-defined multiplicity.  The no-go
theorem prevents that descent for either height deck action.

If a finite-width strip covers every zero (for instance `a≥1/2`, using the
open critical strip), its quotient is compact.  Yet
`q_*D(Q)=D(Z)=infinity`, since (RvM) makes `N(H)` unbounded.  Therefore this
pushforward is not a Radon counting measure: Radon measures are finite on
compact sets.  Calling it a quotient "zero measure" without this qualification
would conceal the obstruction.

## 5. The critical-line height set and a nonperiodic finite quotient

For every real `0<sigma<1`, the eta identity (S10) gives
`eta(sigma)=(1-2^{1-sigma}) zeta(sigma)`. Its even partial sums are sums
of positive adjacent pairs, so their limit satisfies
`eta(sigma) >= 1-2^{-sigma} > 0`. The prefactor `1-2^{1-sigma}` is
negative. Thus `zeta(sigma)<0` throughout the real open strip, and xi has
no real zero there because its remaining factors are finite and nonzero.
This proves the real-zero exclusion used in the finite-orbit bookkeeping.

Let `Gamma={t in R : zeta(1/2+i t)=0}`. It omits `0` by the preceding
argument at `sigma=1/2`. Consequently `Gamma` cannot be an additive subgroup of
`(R,+)`, because every subgroup contains zero.  Its integer span is of course
an additive subgroup, but it forgets which elements were originally marked;
no density or rational-independence assertion is used here.
This excludes only the inherited addition. S2's paragraph following DLMF
25.10.2 explicitly states infinitude of the critical-line zeros; together
with analytic isolation on compact height intervals, this makes Gamma
countably infinite and discrete. It can receive an abelian group law through an arbitrary bijection
with the integers, but such a transported law is extra data and has no
asserted compatibility with heights, spacing or the analytic divisor.

There is a natural finite alternative to height periodicity: take the quotient
of the ambient plane by `R(x,t)=(-x,t)`.  It is a closed half-plane and the
divisor descends because `R` preserves multiplicities.  It pairs the functional
equation partners and has a boundary representing the critical line.  The
statement that every marked point is fixed by this reflection is exactly RH;
the quotient construction itself is unconditional and adds no information
toward RH.
