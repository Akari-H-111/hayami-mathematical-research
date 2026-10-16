# Complete self-intersection of the Ruled v5 surface

2026-10-16. New research beyond the published article; the article and sealed
companions are unchanged.

**Result (written proof).** The conjectured classification is correct, with
one set-theoretic qualification: a cross-cap label itself has a singleton
fiber. The *closure* of the double-label locus in each open half is one smooth
embedded arc through that label; the actual double-label locus omits it.
Every fiber has at most two labels. The only two-label fibers are the seam
pairs and the pairs on the two mirror arcs described explicitly below.

**Verification boundary.** The complete classification, smooth-arc argument
and quotient homeomorphism below are written proofs supported by exact
symbolic certificates, not a complete Lean formalization. Lean checks the
boundary examples in both halves, mirror symmetry and separation, the seam
iff, and the universal necessary elimination condition. The table script is
numerical illustration only. No full surface-germ equivalence to a Whitney
umbrella, further exceptional-germ classification, or invariant boundary
observation convention is asserted here.

## 1. Precise classification and formulas

Write

\[
 S(t,u)=(c+2u(1-c),(1-u)\sin t,u\sqrt{c(2-c)}),\qquad
 D=[-\pi/2,\pi/2]\times[0,1],\quad c=\cos t.
\]

Let \(v_* = \sqrt5-2\), \(\alpha=(\sqrt5-1)/2\), and, for
\(0\le v\le v_*\), put

\[
\begin{aligned}
 h&=v^3+7v^2+3v+5,\\
 x&=\frac{2(1+v)(3+v^2)}h,&
 y&=\frac{(1+v)^2(1+3v^2)}{(1-v)h},\\
 \Delta&=x^2-4y
 =\frac{16(1+v)^3(1+v^2)(1-4v-v^2)}{(1-v)h^2},&
 L&=\frac{(1+v)(1+3v^2)}h,\\
 a_\pm&=\frac{x\pm\sqrt\Delta}{2},&
 u_\pm&=\frac{a_\pm-L}{2a_\pm},\\
 T_\pm&=\arccos(1-a_\pm).
\end{aligned}
\]

The notation \(\pm\) here distinguishes the two labels in the *positive*
half; a separate sign \(\varepsilon\in\{1,-1\}\) selects the mirror half.

**Theorem 1 (all fibers).** For distinct \(p,p'\in D\), \(S(p)=S(p')\)
if and only if exactly one of these holds:

1. \(\{p,p'\}=\{(t,1),(-t,1)\}\), for \(0<t\le\pi/2\).
2. For a unique \(\varepsilon\in\{1,-1\}\) and a unique
   \(0\le v<v_*\),
   \(\{p,p'\}=\{(\varepsilon T_+,u_+),(\varepsilon T_-,u_-)\}\).

At \(v=0\), the two labels are
\((\varepsilon\pi/2,2/5)\) and
\((\varepsilon\arccos(4/5),0)\), with image
\((4/5,\varepsilon3/5,0)\). At \(v=v_*\), they coalesce at
\(P_\varepsilon=(\varepsilon t_0,u_0)\), where
\(\cos t_0=1-\alpha=(3-\sqrt5)/2\) and \(u_0=\alpha/2\).
The common image is

\[
 I_\varepsilon(v)=\left(1-L,
 \varepsilon\frac{(3-v)\sqrt{(1+v)(1+v^2)(1+3v^2)}}{h\sqrt{1-v}},
 \frac{2\sqrt2\,v\sqrt{(1+v)(v^2+3)}}{h\sqrt{1-v}}\right).
\]

In particular its first coordinate has derivative

\[
 (1-L)'=-\frac{2(9v^4+8v^3+22v^2+8v+1)}{h^2}<0.                 \tag{1}
\]

Thus each closed image arc is embedded, with a regular parametrization even
at its cross-cap endpoint.

## 2. Boundary, symmetry and equal-cosine cases

Mirror symmetry is \(S(-t,u)=J S(t,u)\), \(J=\operatorname{diag}(1,-1,1)\).
For \(t>0,u<1\) the second coordinate is strictly positive, including
\(t=\pi/2\); for \(t<0,u<1\) it is strictly negative. Therefore opposite
halves cannot meet off \(y_{\rm image}=0\).

The labels with zero second coordinate are precisely \(t=0\) or \(u=1\).
Their images are respectively \((1,0,u)\) and
\((2-c,0,\sqrt{c(2-c)})\). The segment is injective and meets the seam image
only at \(S(0,1)=(1,0,1)\). On the seam, equality of first coordinates is
exactly equality of cosines, hence \(t'=t\) or \(t'=-t\) in the closed
angular interval. This proves all the zero-second-coordinate cases.

More generally equal cosines force equal ruling parameters: use the first
coordinate if \(c<1\), and the third if \(c=1\). The remaining equality
of second coordinates then gives either the same label or the seam pair.
It remains to classify distinct cosines in one open half. By reflection
work in the positive half and order

\[
 0<b<a\le1,\quad a=1-\cos t,\ b=1-\cos t'.
\]

The case \(b=0\) has already been excluded by the zero-second-coordinate
argument. If \(a=1\), equality of third coordinates implies that either
both labels are on the same edge or the second ruling parameter is zero.
Distinct cosines require the latter. The edge is
\((2u,1-u,0)\); intersecting it with the base unit circle gives
\(u(5u-2)=0\). The root \(u=0\) gives the same corner label, leaving exactly
\(u=2/5\), \(b=1/5\). This argument includes \(Q=0\) without dividing by it.

## 3. Elimination with the missing sign retained

For \(0<b<a<1\) set

\[
 A=\sqrt{a(2-a)},\quad B=\sqrt{b(2-b)},\quad
 C=\sqrt{1-b^2},\quad E=\sqrt{1-a^2}.
\]

All four are strictly positive. If the ruling parameters are \(u,u'\), the
three differences of coordinates, with the constant 1 removed, are

\[
 e_x=-a+2au+b-2bu',\quad
 e_y=(1-u)A-(1-u')B,\quad e_z=uE-u'C.
\]

The coplanarity polynomial is

\[
 K=(a+b)(AC+BE)-2aBC-2bAE
 =(AC-BE)e_x+2(aC-bE)e_y+2(aB-bA)e_z.                         \tag{2}
\]

Thus equal images imply \(K=0\). Put \(x=a+b,y=ab\), and

\[
 H=-2y^2-2xy-x^2-2y+2x,
\]
\[
 F(x,y)=16(1-x)y^3-4(3x^2+4x-8)y^2
          +4(x+1)(x-2)^2y-x^2(x-2)^2.
\]

The following identities use only the four square identities above:

\[
\begin{aligned}
 K\big((a+b)(AC+BE)+2aBC+2bAE\big)
    &=(a-b)^2(H+2ABCE),\\
 H^2-4a(2-a)b(2-b)(1-a^2)(1-b^2)&=-F(a+b,ab).              \tag{3}
\end{aligned}
\]

Consequently every interior double pair with distinct cosines satisfies
\(F=0\) **and \(H=-2ABCE<0\)**. The universal necessary condition, including
edges, is \(a=b\) or \(F(a+b,ab)=0\); (2)-(3) prove it without division by
any vanishing boundary factor. These are the Lean elimination certificates.

The expanded polynomial \(D(c,d)\) in the brief is exactly
\(F(2-c-d,(1-c)(1-d))\). The verifier checks every coefficient, symmetry,
the diagonal and edge factorizations, and independently recomputes the
stated quadratic resultant. That resultant alone is not sufficient for real
image equality: it has discarded the sign of \(H\).

## 4. Rational normalization and necessity of the stated interval

This derivation replaces a genus argument and does not require a singularity
classification at infinity. Set \(z=y+1\), \(k=2+x/(y+1)\). Then

\[
 F((k-2)z,z-1)=z^2(A_kz^2+B_kz-4k^2),
\]
\[
 A_k=-k^4+12k^3-60k^2+112k-64,\qquad B_k=12k^2-16k,
\]

whose discriminant is
\(-16k^2(k-4)^2(k-3)(k-1)\).
In the interior physical region, \(x>0,y>0\) and
\(1-x+y=(1-a)(1-b)>0\), so \(2<k<3\). Define

\[
 r=\frac{2A_kz+B_k}{4k(k-4)},\qquad v=\frac r{k-1}.
\]

The quadratic equation gives \(r^2=(3-k)(k-1)\), whence
\(-1<v<1\) and

\[
 k=\frac{3+v^2}{1+v^2},\qquad r=\frac{2v}{1+v^2}.
\]

Here \(A_k<0\): equivalently
\(-A_k=(k-2)((k-2)(k-4)^2+8(k-2)+16)\).
Solving for \(z\) gives exactly the rational \(x(v),y(v)\) of section 1.
There is no lost solution or zero denominator in this region. In particular
\(h>0\) on \((-1,1)\), since
\(h=(v+1)^3+4v^2+4>0\). Substitution gives

\[
 H(v)=\frac{8v(v-3)(v+1)(v^2+3)(3v^2+1)}{(1-v)^2h^2}.       \tag{4}
\]

Thus \(H<0\) forces \(v>0\). Since \(a,b\) are real,
\(\Delta\ge0\) forces \(v\le\sqrt5-2\); distinctness makes this strict.
The boundary pair is \(v=0\). This proves that every possible double pair
is in the stated list, once its ruling parameters are recovered.

The verifier also factors \(F\) over \(\mathbb Q\) and checks it is
irreducible. The formulas and their rational inverse above give an explicit
rational normalization. No numerical genus inference is used. For example,
\(v=-1/2\) gives a physical unequal pair of \(a,b\) with \(F=0,H>0\);
here \(x=26/41,y=7/123,H=10192/15129\). It lies on the extraneous squared
branch, not the double locus.

The proposed singularity data are also consistent with exact algebra. A
lexicographic Groebner basis of \((F,F_x,F_y)\) over \(\mathbb Q\) is

\[
 x-6y^3-16y^2-12y-2,\qquad y(y+1)^3.
\]

Thus the only affine singularities over \(\mathbb C\) are \((2,0)\) and
\((0,-1)\). At the former the quadratic part in \(\xi=x-2,y\) is
\(-4\xi^2-48y^2\), with distinct complex tangent lines. At the latter, in
\(w=x+2(y+1),\beta=y+1\), the weighted initial form, with weights
\(\operatorname{wt}(w)=2,\operatorname{wt}(\beta)=1\), is
\(-4(w^2+4w\beta^2+16\beta^4)\); the two quadratic branches are conjugate.
The degree-four homogeneous part is
\(-x(x^3-4x^2y+12xy^2+16y^3)\). Its specialization at \(y=1\) has
discriminant \(-5439488\), and \([1:0:0]\) is not on the projective curve;
therefore every point at infinity is smooth. These checks verify the node,
tacnode and smooth-infinity data from the brief. The explicit birational
normalization already establishes geometric genus zero independently of a
delta-invariant calculation.

## 5. Sufficiency and removal of all square-root sign ambiguity

For \(0\le v\le v_*<1/4\), all displayed denominators are positive,
\(y>0\), \(x<2\), and

\[
 1-x+y=\frac{4v^2(v^2+3)}{(1-v)h}\ge0.
\]

The real roots \(a_\pm\) of \(a^2-xa+y=0\) are positive. The last inequality
and \(x<2\) imply both are at most 1; for \(v>0\) both are strictly less
than 1. Moreover

\[
 (a_+-L)(a_--L)=\frac{8v(v+1)^3(3v^2+1)}{(1-v)h^2}\ge0,
 \qquad x-2L=\frac{4(1-v)(1+v)^2}{h}>0.
\]

Hence both \(a_\pm\ge L>0\), so \(0\le u_\pm<1/2\), with strict
positivity when \(v>0\). For either root \(a\), direct reduction modulo
\(a^2-xa+y\) gives

\[
 \frac{(a+L)^2(2-a)}{4a}
  =\frac{(3-v)^2(1+v)(1+v^2)(1+3v^2)}{(1-v)h^2},
\]
\[
 \frac{(a-L)^2(1-a^2)}{4a^2}
  =\frac{8v^2(1+v)(v^2+3)}{(1-v)h^2}.                       \tag{5}
\]

These are precisely the squared second and third coordinates of the stated
image. Their signs are nonnegative, and the first coordinate is \(1-L\).
Thus (5) proves actual equality of the three coordinates, not just their
squares. It also recovers the ruling parameters uniquely: for fixed \(a>0\)
the first coordinate forces \(u=(a-L)/(2a)\).

All fibers have at most two labels. Indeed every non-seam equality has the
form just proved, and (1) makes its common-image parameter \(v\) unique.
For each \(v<v_*\) there are exactly the two roots \(a_+,a_-\), and each
has just one ruling parameter. At \(v_*\) the root is repeated, so the
cross-cap fiber is a singleton. The mirror halves and seam cannot add any
labels to these fibers by section 2.

## 6. Smooth source arcs and the involution

Here smoothness uses the completed endpoint atlas, rather than the angular
chart at \(t=\pi/2\). The following rational derivative certificates make
the source-arc assertion quantitative. With \(\Delta=\Delta(v)\),

\[
 \Delta'=\frac{32(v+1)^2N}{(1-v)^2h^3}<0,
\]
\[
 N=3v^7-v^6-29v^5+7v^4-87v^3+29v^2-47v-3,
\]
\[
 (\Delta')^2-4\Delta(x')^2
  =\frac{2048v(3-v)(v+1)^3T}{(1-v)^4h^4}>0\quad(0<v\le v_*),
\]
\[
 T=3v^6-2v^5+21v^4-4v^3+5v^2+6v+3.
\]

Exact positive Bernstein coefficients for \(-N,T\) on \([0,1/4]\) are
listed here and reconstructed exactly by the verifier. The coefficient
convention is \(p(v)=\sum_{j=0}^n b_j\binom nj(4v)^j(1-4v)^{n-j}\).

| Polynomial | Degree | Bernstein coefficients in increasing index order |
| --- | --- | --- |
| \(-N\) | 7 | \(3,131/28,301/48,2501/320,16757/1792,78243/7168,359833/28672,234257/16384\) |
| \(T\) | 6 | \(3,13/4,169/48,1219/320,5271/1280,4561/1024,19787/4096\) |

Thus \(a_+'<0<a_-'\) for \(0<v<v_*\).
The roots move monotonically from \((1,1/5)\) to \((\alpha,\alpha)\).
Use \(w=a_+-a_-\) on the first branch and its negative on the second.
Since \(w^2=\Delta(v)\) and \(\Delta'\ne0\), the inverse \(v=v(w^2)\)
is smooth near every interior point, including \(w=0\). The combined arc is

\[
 a(w)=\tfrac12(x(v(w^2))+w),\quad
 t(w)=\arccos(1-a(w)),\quad
 u(w)=\frac{a(w)-L(v(w^2))}{2a(w)},\quad -4/5\le w\le4/5.    \tag{6}
\]

Its interior is smooth, embedded and immersed: away from \(w=0\) this
follows from root monotonicity, and at zero \(a'(0)=1/2\), so
\(t'(0)=1/(2\sin t_0)\ne0\). At the base endpoint the smaller root has
nonzero derivative. At the edge endpoint,

\[
 a_+(v)=1-3v^2+O(v^3),\quad
 Q=\sqrt{1-a_+^2}=\sqrt{6}\,v+O(v^2).
\]

More precisely \(1-a_+^2\) is analytic with a double zero and positive
leading coefficient 6, so its nonnegative square root on \(v\ge0\) has
a smooth extension with derivative \(\sqrt{6}\). The endpoint coordinates
\((Q,u)\) therefore give a regular smooth arc there too. Reflection proves
the negative-half assertion.

The image of (6) depends only on \(w^2\); its exact involution is
\(w\mapsto-w\), with sole fixed point \(P_+\). Since (1) and
\(\Delta'(v_*)\ne0\) hold, the first image coordinate has a nonzero
quadratic coefficient at \(w=0\). Thus the restriction of \(S\) to the
source arc has an ordinary fold onto a regular image arc. This proves the
stated Whitney-umbrella *double-locus involution*, without invoking a full
two-dimensional surface-germ recognition theorem.

Neither source arc meets \(u=1\), \(t=0\), or either rank-singular corner
\((\pm\pi/2,0)\). The polar rank-singular label \((0,1)\) also has a
singleton fiber. The only rank-singular label on each closed source arc is
its interior \(P_\varepsilon\), by the existing five-label classification.
The paired edge labels \((\pm\pi/2,1)\) belong only to the seam fibers.
There are no additional edge, corner, triple, or seam-arc intersections.

## 7. Topology of the entire image

Define an equivalence relation on the rectangle by the seam identifications
of Theorem 1 and by \(w\sim-w\) on each of the two disjoint source arcs
(6), with every other label left alone. Theorem 1 says this is exactly the
fiber relation of \(S\). The map \(S\) is continuous on the closed rectangle,
including the endpoints, so it induces a continuous bijection

\[
 D/{\sim}\ \longrightarrow S(D).
\]

The source quotient is compact, and \(S(D)\subset\mathbb R^3\) is Hausdorff;
therefore this bijection is a homeomorphism. This is a complete quotient
model, including the isolated singleton cross-cap fibers and all boundary
labels. It does not assert that the image is an embedded surface or a
manifold at the identified loci; the previously proved corner obstruction
is unaffected.

## 8. Replay and Lean inventory

From the repository root:

```sh
python3 -B papers/legacy-geometry/orthogonal-circle-ruled-surface/verification/verify_self_intersection.py
python3 -B papers/legacy-geometry/orthogonal-circle-ruled-surface/verification/self_intersection_table.py
```

The first command checks exact identities, the supplied resultant, rational
normalization and inverse, root/image relations, endpoint jets and rational
Bernstein sign certificates. These support the universal written arguments;
a successful symbolic run alone is not the classification theorem.
The second emits a CSV table to standard output using floating-point
arithmetic. Matplotlib is unavailable in the registered runtime; no plot
package is added. The table is an illustration and is not used in the proof.

New public Lean results in `RuledV5/SelfIntersection.lean`:

| Theorem | Kernel-checked statement |
| --- | --- |
| `surface_mirror` | Actual angular surface mirror identity for all real labels |
| `seam_image_iff` | In the closed angular interval, two seam images agree iff the angles agree or are negatives |
| `mirror_half_separation` | Positive-half label with `u<1` differs from every negative-half image with `u'≤1`, including angular edges |
| `exact_boundary_double_point` | Both positive labels and the completed endpoint-chart label have image `(4/5,3/5,0)` |
| `exact_negative_boundary_double_point` | The two reflected angular labels have image `(4/5,-3/5,0)` |
| `double_elimination_certificate` | Four squared-root identities and coplanarity imply equal parameters or `D=0` together with the retained sign equality |
| `surface_double_elimination` | Equal actual surface images of any two labels in the closed rectangle imply `D(cos t,cos t')=0` or equal cosines |

Every new public theorem is listed in `Status.lean` and audited in
`Audit.lean`; only `propext`, `Classical.choice`, `Quot.sound` are allowed.
The elimination theorem covers endpoints directly rather than extending an
interior division argument by numerical continuity.

No published-paper claim was found false. The supplied resultant,
singularity data and rationality expectation are confirmed. The corrections
to the proposed description are the omission of the singleton cross-cap
limit from the actual double-label locus and the need for the sign condition
when using the squared eliminant as a real equality test.

### Recorded local replay, 2026-10-16

Python 3.9.6, SymPy 1.14.0; Lean/Mathlib 4.33.1 from the existing local caches.
The two Lean projects were checked sequentially. The lines below report the Ruled baseline,
updated Ruled companion, downstream Bicomplex regression after that update,
exact self-intersection verifier, and repository navigation/source integrity:

```text
PASS 224 public named theorems; build/status/full axiom audit/proof-hole scan
PASS 231 public named theorems; build/status/full axiom audit/proof-hole scan
PASS 33 public named theorems; build/status/full axiom audit/proof-hole scan
PASS self-intersection: 48 exact identities and sign certificates
PASS: 13 reading guides, 116 local links, ten current papers, 35 source hashes and TeX inputs.
```

Both Lean checks used `python3 -B verify_lean.py` in their respective project
directories. The numerical table script emitted 17 rows and passed its
coordinate-agreement assertions. `git diff --check` passed. No protected
paper source, PDF, release, receipt, manifest or dependency-companion source
was changed, and no commit or external publication was made.
