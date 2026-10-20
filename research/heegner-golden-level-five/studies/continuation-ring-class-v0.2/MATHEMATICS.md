# Mathematics: conductor 5, the genus layer, and the golden geodesic

## 1. Statement and dependency boundary

Put

\[
 \tau=\frac{1+\sqrt{-163}}2,\quad t=r(\tau)^5,\quad
 u=t-t^{-1},\quad K=\mathbb Q(\sqrt{-163}),\quad F=\mathbb Q(\sqrt5).
\]

The prior checkpoint supplies, and `verification/check.py` independently
rechecks, the irreducible sextic

\[
 G(u)=(u^2-228u+496)^3-640320^3(u+11)^5. \tag{1}
\]

The proof below uses only the following external classical inputs:

1. Duke's Rogers--Ramanujan identity and the level-5 modular coordinate;
2. Maier's rational parametrization of \(X_0(5)\);
3. the order class-number formula and the first main theorem of CM.

Everything described as an exact check is expanded over exact integers or
\(\mathbb Q(\sqrt5)\); the numerical section is not used in the proof.

## 2. The eta coordinate and the direction of the level-5 map

Duke's equation (7.7) gives

\[
 r(\tau)^{-5}-11-r(\tau)^5=
 \left(\frac{\eta(\tau)}{\eta(5\tau)}\right)^6.
\]

Consequently, with

\[
 x:=\left(\frac{\eta(\tau)}{\eta(5\tau)}\right)^6,
\]

we have the exact identity

\[
 x=t^{-1}-11-t=-(u+11). \tag{2}
\]

This fixes an important normalization issue.  Maier's canonical coordinate
in Table 2 is

\[
 t_5^{\rm M}=5^3\frac{\eta(5\tau)^6}{\eta(\tau)^6}=\frac{125}{x}, \tag{3}
\]

so it is the reciprocal scaled coordinate, not the present \(t=r(\tau)^5\).
Maier's Table 7 says

\[
 j(\tau)=\frac{((t_5^{\rm M})^2+10t_5^{\rm M}+5)^3}{t_5^{\rm M}},
 \qquad
 j(5\tau)=\frac{((t_5^{\rm M})^2+250t_5^{\rm M}+3125)^3}
 {(t_5^{\rm M})^5}.
\]

Substitution of (3), with cancellation of the powers of \(5\), gives

\[
 j(\tau)=\frac{(x^2+250x+3125)^3}{x^5},\qquad
 j(5\tau)=\frac{(x^2+10x+5)^3}{x}.
\]

Using (2), the second formula is precisely

\[
 R(u):=j(5\tau)=-\frac{(u^2+12u+16)^3}{u+11}. \tag{4}
\]

The checker clears denominators and verifies both the \(j(\tau)=-640320^3\)
identity modulo (1) and (4).  Thus the direction \(\tau\mapsto5\tau\),
not its Fricke reversal, is fixed algebraically.

## 3. The conductor-5 order and its class group

Since \(-163\) is fundamental,

\[
 \mathcal O_K=\mathbb Z[\tau].
\]

Hence

\[
 [1,5\tau]=\mathbb Z+5\mathbb Z\tau
 =\mathbb Z+5\mathcal O_K=:\mathcal O_5. \tag{5}
\]

Equivalently, \(z=5\tau\) satisfies the primitive equation

\[
 z^2-5z+1025=0,
\]

whose discriminant is \(-4075=5^2(-163)\).  Thus its multiplier ring is
the order of conductor \(5\), rather than the maximal order.

For completeness, the order class-number formula applies because
\(D_K=-163\) is fundamental, \(f=5\), \(h(\mathcal O_K)=1\), and the
unit index is one (the only units are \(\{\pm1\}\)).  Since \(5\) is
inert in \(K\),

\[
 \left(\frac{D_K}{5}\right)=\left(\frac{2}{5}\right)=-1,
 \qquad
 h(\mathcal O_5)=5\left(1-\frac{-1}{5}\right)=6. \tag{6}
\]

The same exact reduced-form routine returns only \([1,1,41]\) for
discriminant \(-163\), providing the finite class-number-one control used
in this application of the formula.

This is also certified directly: the complete reduced primitive positive
forms of discriminant \(-4075\) are

\[
 [1,1,1019],\ [25,-15,43],\ [25,-5,41],\ [25,5,41],\
 [25,15,43],\ [25,25,47]. \tag{7}
\]

The standard bound \(a\leq\sqrt{|D|/3}\), together with
\(|b|\leq a\leq c\), primitivity, and the usual boundary convention,
is enumerated exactly by the checker.  Thus (7) is finite evidence for the
same value in (6), not a numerical search.

The proper ideal class group of an order is abelian.  An abelian group of
order \(6=2\cdot3\) has cyclic Sylow subgroups of orders 2 and 3, whose
commuting product has order 6.  Therefore

\[
 \operatorname{Pic}(\mathcal O_5)\cong C_6. \tag{8}
\]

## 4. CM identifies the degree-six field

Let \(H_5\) denote the ring class field of \(\mathcal O_5\).  Applying
the first main theorem of complex multiplication to the proper
\(\mathcal O_5\)-ideal \(\mathcal O_5=[1,5\tau]\) gives

\[
 K(j(5\tau))=H_5,\qquad
 \operatorname{Gal}(H_5/K)\cong\operatorname{Pic}(\mathcal O_5).
 \tag{9}
\]

The q parameter of \(5\tau\) is real, so \(j(5\tau)\) is real. Thus
\(K\cap\mathbb Q(j(5\tau))=\mathbb Q\) and
\([K(j(5\tau)):\mathbb Q(j(5\tau))]=2\). Since (9) and (8) give
\([H_5:K]=6\), it follows that

\[
 [\mathbb Q(j(5\tau)):\mathbb Q]=6. \tag{10}
\]

Independently, (1) is irreducible over \(\mathbb Q\), so
\([\mathbb Q(u):\mathbb Q]=6\).  Formula (4) gives the inclusion

\[
 \mathbb Q(j(5\tau))\subseteq\mathbb Q(u).
\]

The equal degrees in (10) prove the desired field equality

\[
 \boxed{\ \mathbb Q(u)=\mathbb Q(j(5\tau)),\qquad K(u)=H_5.\ } \tag{11}
\]

This is the conductor-5 interpretation that was previously open.  It is a
classical CM consequence once the exact coordinate relation (4) and the
degree-six sextic are established.

## 5. Exact resultant minimal polynomial

Let \(Y\) be an indeterminate.  The checked resultant is

\[
 H(Y)=\operatorname{monic}\operatorname{Res}_u\left(
 G(u),\;Y(u+11)+(u^2+12u+16)^3\right). \tag{12}
\]

It is irreducible over \(\mathbb Q\), has degree six, and is the minimal
polynomial of \(j(5\tau)\).  In
\(H(Y)=Y^6+a_5Y^5+a_4Y^4+a_3Y^3+a_2Y^2+a_1Y+a_0\), its exact
coefficients are:

| coefficient | exact value |
| --- | --- |
| \(a_5\) | 1247257156019637304856107520018074552566824585862995272173368815794085495792299621089280 |
| \(a_4\) | -4639796612478190683980432654525770873723843904020069491990531249067242924053663574455746560 |
| \(a_3\) | 5676192994124845302961495367285934992661012738565045163590318545337507001358527681694321868800 |
| \(a_2\) | -2530123180606721645060899046691076382780085382180063288738379701466385821402803681978244451532800 |
| \(a_1\) | 307678260252363847142518557058020616760886195569701698589818485393365264653517720247611686912000000 |
| \(a_0\) | 327449218015598326103658292188693405775089450022293408267511192500873413185838399911936381646297628672000 |

The coefficients are obtained by an exact resultant, not by a fitted
polynomial or numerical rounding.  The checker also verifies directly that
\(H(R(u))\) vanishes modulo \(G(u)\) after clearing \((u+11)^6\).

## 6. The golden genus layer and the cubic splitting field

Over \(F=\mathbb Q(\sqrt5)\), (1) is the product of two irreducible
cubics,

\[
 g_\pm(u)=\alpha(u)\pm\sqrt5\,\beta(u),
\]

where

\[
\begin{aligned}
 \alpha(u)&=u^3-131268706320384342u^2
 -2896632145572621512u-15979661797307720544,\\
 \beta(u)&=-58705150130167150u^2
 -1295413276662289800u-7146322007247306400.
\end{aligned}
\]

Exact expansion gives \(G=g_+g_-=\alpha^2-5\beta^2\), and the plus
representative has cubic discriminant

\[
 \operatorname{Disc}(g_+)=-163\,(m+n\sqrt5)^2, \tag{13}
\]

with

\[
 m=130605881159290836097272600000000,
 \qquad n=58408725706686669664104300000000.
\]

The discriminant is not a square in the real field \(F\).  An irreducible
cubic with nonsquare discriminant has Galois group \(S_3\), and its
quadratic discriminant subfield is

\[
F(\sqrt{\operatorname{Disc}(g_+)})=F(\sqrt{-163})=K(\sqrt5). \tag{14}
\]

The conjugate factor has the conjugate square in (13), hence the same
quadratic discriminant field.  Let \(g_*\) denote whichever of
\(g_+,g_-\) vanishes at the selected value \(u\); the following argument
uses \(g_*\), so it does not depend on a numerical root selection.

There is a precise genus interpretation.  For either cubic factor containing
the selected root \(u\), irreducibility gives \([F(u):F]=3\).  Hence
\([F(u):\mathbb Q]=6\), while \(\mathbb Q(u)\subseteq F(u)\) already has
degree six; therefore \(F\subseteq\mathbb Q(u)\).  By (11),
\(K(\sqrt5)\subset H_5\), and it has degree two over \(K\).  The cyclic
group \(C_6\) has a unique index-two subgroup, namely \(C_6^2\) of order
three.  Thus \(K(\sqrt5)\) is exactly the unique quadratic ring-class genus
layer, the fixed field of \(\operatorname{Pic}(\mathcal O_5)^2\).

This gives the requested explanation of \(\sqrt5\), hence of
\(\phi=(1+\sqrt5)/2\) and \(c_0=\phi^{-2}\): it is the real generator of
the uniquely determined quadratic genus layer, while the remaining extension
over \(F\) is cubic.  It is not a generic consequence of replacing
\(t\) by \(t-t^{-1}\).

Finally, \(H_5\) contains both \(F(u)\) and the discriminant field (14).
Their degrees over \(F\) are 3 and 2, so their intersection is \(F\) and
their compositum has degree six.  Since \([H_5:F]=6\), that compositum is
all of \(H_5\). For an irreducible cubic, adjoining its discriminant
square root to a root field gives its splitting field: the difference of
the other roots is the discriminant square root divided by the derivative
at the chosen root. Thus

\[
 H_5=\operatorname{Spl}_F(g_*),\qquad
 \operatorname{Gal}(H_5/F)\cong S_3. \tag{15}
\]

The unmarked biquadratic field in (14) also contains
\(\mathbb Q(\sqrt{-815})\).  Therefore the quadratic resolvent alone does
not identify the label \(-163\); the original CM lattice/order in (5) is
the mark that identifies \(K=\mathbb Q(\sqrt{-163})\).

## 7. Independent numerical diagnostics

For each of the six forms in (7), the checker evaluates

\[
 j\!\left(\frac{-b+i\sqrt{4075}}{2a}\right)
\]

directly from \(E_4^3/\Delta\), separately evaluates the
Rogers--Ramanujan product and the rational expression (4), and tests a
coefficient-weighted residual of (12).  It does so at 120 and 180 decimal
digits.  The resulting errors are recorded in `RESULTS.json`.  These
calculations test conventions and branches; they do not prove (12).

## 8. Golden hyperbolic geometry: a separate common stage

Let

\[
 M=\begin{pmatrix}2&1\\1&1\end{pmatrix}\in\operatorname{PSL}_2(\mathbb Z).
\]

Its fixed points are \(\phi\) and \(\phi'=(1-\sqrt5)/2\), and its
eigenvalues are \(\phi^2\) and \(\phi^{-2}=c_0\).  Its translation length
is

\[
 L(M)=2\log(\phi^2)=4\log\phi. \tag{16}
\]

For every hyperbolic integral determinant-one matrix, the absolute trace is
an integer at least 3.  Since translation length is
\(2\operatorname{arcosh}(|\operatorname{tr}|/2)\), it is monotone in that
trace, and \(M\) realizes the lower bound.  Thus (16) is the shortest
primitive hyperbolic conjugacy-class length on the modular orbifold, and

\[
 c_0=e^{-L(M)/2}. \tag{17}
\]

The lifted axis is the semicircle

\[
 |z-\tfrac12|=\frac{\sqrt5}{2}. \tag{18}
\]

For \(\tau_d=(1+i\sqrt d)/2\), \(d>5\), its vertical geodesic reaches the
apex of (18) perpendicularly, hence has length

\[
 \delta=\log\!\left(\frac{\sqrt d/2}{\sqrt5/2}\right)
 =\frac12\log\!\left(\frac d5\right). \tag{19}
\]

This is also the actual quotient distance to the unmarked axis image.  Indeed,
every \(\operatorname{PSL}_2(\mathbb Z)\)-translate has an equation

\[
 A|z|^2+B\operatorname{Re}z+C=0,
 \qquad A,B,C\in\mathbb Z,\quad B^2-4AC=5.
\]

Neither irrational endpoint can map to infinity, so \(A\ne0\).  Completing
the square shows that its maximum height is
\(\sqrt5/(2|A|)\leq\sqrt5/2\).  The function \(z\mapsto\log\operatorname{Im}z\)
is 1-Lipschitz for the hyperbolic metric, so every point on every translate
is at distance at least (19) from \(\tau_d\).  The original vertical path
attains the bound.  Taking the infimum over translates proves the quotient
claim.

There is an orbifold-marking caveat: the axis passes through the elliptic
point \(i\), and an axis-orientation-reversing normalizer (orientation
preserving on \(\mathbb H\)) can make an un-oriented image look like a
shorter orbifold segment.  Equations
(16)--(17) use the standard translation length of the primitive hyperbolic
conjugacy class; (19) concerns the unmarked image set, so neither convention
changes the distance statement.

Equation (19) gives only the geometric identity

\[
 e^{\pi\sqrt d}=e^{\pi\sqrt5\,e^\delta}.
\]

It holds for non-Heegner \(d\) as well, and is not an arithmetic explanation
of the near integer at \(d=163\).  Likewise, Hurwitz extremality of \(\phi\)
is an infinite Diophantine-approximation statement, whereas the familiar
\(163\) proximity is one fixed modular constant.  No canonical HMR map,
ruled-surface theorem, or RH consequence follows from these scalar facts.
