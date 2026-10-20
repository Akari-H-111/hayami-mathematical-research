# Mathematics: the ray field and the exact golden quadratic layer

## Status and notation

This packet resolves the previously open ray-class identification.  It proves
the displayed field equalities subject only to the explicitly listed classical
CM/Artin inputs.  The polynomial identity is an exact finite computation.
The Rogers--Ramanujan product calculation is a branch diagnostic, not a proof.

Put

\[
 \tau=\frac{1+\sqrt{-163}}2,\quad K=\mathbb Q(\sqrt{-163}),\quad
 r=r(\tau),\quad t=r^5,\quad u=t-t^{-1},\quad E=\mathbb Q(u),
\]

and let \(F=\mathbb Q(\sqrt5)\), \(c_0=(3-\sqrt5)/2=\phi^{-2}\).
The analytic branch is the one with \(q^{1/5}=\exp(2\pi i\tau/5)\).
The inherited, replayed predecessor result is

\[
 K(u)=H_5,
\]

where \(H_5\) is the ring class field of
\(\mathcal O_5=\mathbb Z+5\mathcal O_K\); it also establishes
\([E:\mathbb Q]=6\), \(F\subset E\), and \([E:F]=3\).

## 1. Direct ray-class identification

**External input.**  Cais--Conrad equation (4.8) gives, with this analytic
choice of \(q^{1/5}\),

\[
 j_5(\tau)=\frac1{r(\tau)}.
\]

Here \(\tau\) has primitive polynomial

\[
 X^2-X+41,
\]

so it is 5-integral and is a 5-unit: both \(\tau\) and
\(\tau^{-1}=(1-\tau)/41\) are integral at 5.  Its CM order is the maximal
order \(\mathcal O_K\), and \(5\) is inert because
\((-163/5)=(2/5)=-1\).  Thus all equality hypotheses of Cais--Conrad
Corollary 5.7 apply.  It follows directly, rather than from a degree count,
that

\[
 \boxed{K(r)=K(j_5(\tau))=K_{(5)}.} \tag{1}
\]

The ray degree is 12.  This can be read from the exact Artin calculation
below; it is not used to establish the inclusion in (1).

## 2. Exact Artin certificate for \(K_{(5)}=H_5(\zeta_5)\)

**External input.**  Use the standard ray and ring-class exact sequences.
The inherited class-number-one calculation gives \(h(K)=1\) and
\(\mathcal O_K^\times=\{\mathord\pm1\}\).  Therefore

\[
 \operatorname{Cl}_{(5)}(K)
 \simeq(\mathcal O_K/5\mathcal O_K)^\times/\{\mathord\pm1\},
 \qquad
 \operatorname{Pic}(\mathcal O_5)
 \simeq(\mathcal O_K/5\mathcal O_K)^\times/
       \bigl((\mathbb Z/5\mathbb Z)^\times\{\mathord\pm1\}\bigr).
 \tag{2}
\]

Modulo 5, the polynomial of \(\tau\) is \(X^2-X+1\), irreducible over
\(\mathbb F_5\).  Write its root as \(\theta\), and set
\(\gamma=1+\theta\).  Exact multiplication in
\(\mathbb F_{25}=\mathbb F_5[\theta]/(\theta^2-\theta+1)\) gives

\[
 \operatorname{ord}(\gamma)=24,\qquad
 \gamma^6=3,\qquad\gamma^{12}=-1.
\]

Hence the ray group is \(R=\langle\bar\gamma\rangle\simeq C_{12}\).
The scalar subgroup is

\[
 S=\mathbb F_5^\times/\{\mathord\pm1\}
   =\langle\bar\gamma^6\rangle,\qquad |S|=2,
\]

and by (2) its fixed field is \(H_5\).  The norm character is

\[
 N_{\mathbb F_{25}/\mathbb F_5}(\gamma^k)=\gamma^{6k};
\]

its kernel in \(R\) is

\[
 N=\langle\bar\gamma^4\rangle,\qquad |N|=3.
\]

Artin reciprocity sends an ideal prime to 5 to its norm action on
\(\zeta_5\), so the fixed field of \(N\) is \(K(\zeta_5)\).  The finite
relations

\[
 S\cap N=1,\qquad\langle S,N\rangle=\langle\bar\gamma^2\rangle
 \quad(\text{order }6)
\]

give both conclusions:

\[
 \boxed{K_{(5)}=H_5(\zeta_5)},\qquad
 \boxed{H_5\cap K(\zeta_5)=K(\sqrt5)}. \tag{3}
\]

The second field has degree two over \(K\): it is fixed by
\(\langle\bar\gamma^2\rangle\), and it is visibly contained in both
fields.  In particular, the calculation also independently accounts for the
golden genus layer already found in the predecessor packet.

## 3. An exact \(c_0/163\) square certificate

Let

\[
 G(U)=(U^2-228U+496)^3-640320^3(U+11)^5
\]

and use the supplied polynomials \(\alpha,\beta\).  Exact expansion gives

\[
 G=\alpha^2-5\beta^2,\qquad\gcd(\beta,G)=1.
\]

On the selected CM factor, \(\sqrt5=-\alpha/\beta\), so in
\(\mathbb Q[U]/(G)\),

\[
 1+c_0=\frac{5\beta+\alpha}{2\beta}. \tag{4}
\]

There is a compact selected-cubic certificate before rationalizing
\(\sqrt5\).  Put \(S=\sqrt5\) and

\[
\begin{aligned}
 N(U)={}&(312119004989-139583862445S)U^2\\
 &+(6858643496508-3067324783740S)U\\
 &+37679427598544-16850735555920S,\qquad D_0=1574580000.
\end{aligned}
\]

The exact relation in
\(\mathbb Q[S,U]/(S^2-5,\alpha+S\beta)\) is

\[
 163(5-S)N(U)^2-2D_0^2(U^2+4)=0. \tag{5}
\]

Thus \(N(u)/D_0\in E\) is a short \(\mathbb Q(\sqrt5)\)-coefficient
witness.  The same checker proves that, after
\(S=-\alpha/\beta\), it equals the following explicitly rational witness.

Define \(w(U)=P(U)/D\), where

\[
 D=36379027361268900000000000
\]

and the coefficients of \(P=\sum_{i=0}^{5}p_iU^{5-i}\) are:

| \(i\) | \(p_i\) |
| ---: | ---: |
| 0 | 10032184018936 |
| 1 | -2633823635467525896114151113195 |
| 2 | -115712687728690506769685317605640 |
| 3 | -1906355528351506425904447779674640 |
| 4 | -13958593196667408481064116830792320 |
| 5 | -38327281745357972136346029647288064 |

**Exact computation.**  Clearing only the already-certified invertible
\(2\beta\), the checker verifies the polynomial congruence

\[
 2\beta(U^2+4)-163(5\beta+\alpha)w(U)^2\equiv0\pmod {G(U)}. \tag{6}
\]

Evaluation at the selected root \(u\) and (4) prove the requested identity

\[
\boxed{u^2+4=163(1+c_0)w(u)^2\quad\text{in }E.} \tag{7}
\]

This is a proof by an explicit rational certificate, not a numerical fit.
The irreducibility of \(G\) and \(\deg w<6\) show \(w(u)\ne0\).

Let

\[
 s=\sqrt{163(1+c_0)}.
\]

Since \(t\) satisfies \(T^2-uT-1=0\), (7) gives

\[
 \mathbb Q(t)=E(t)=E\bigl(\sqrt{u^2+4}\bigr)=E(s). \tag{8}
\]

Moreover,

\[
 N_{F/\mathbb Q}\bigl(163(1+c_0)\bigr)=163^2\cdot5
\]

is not a rational square.  Thus \(s\notin F\), and the coprime degrees
\([E:F]=3\) and \([F(s):F]=2\) imply

\[
 [\mathbb Q(t):E]=2,\qquad[\mathbb Q(t):\mathbb Q]=12. \tag{9}
\]

Finally,

\[
 \frac{4-c_0}{1+c_0}=\phi^2,
\]

so the same field has the alternative exact form

\[
 \boxed{\mathbb Q(t)=E\bigl(\sqrt{163(1+c_0)}\bigr)
              =E\bigl(\sqrt{163(4-c_0)}\bigr).} \tag{10}
\]

## 4. Why this quadratic layer is cyclotomic

Let \(\zeta=\zeta_5\).  The exact cyclotomic identities are

\[
 a:=\zeta^2-\zeta^{-2},\quad a^2=-\frac{5-\sqrt5}{2}=-(1+c_0),
\]

\[
 b:=\zeta-\zeta^{-1},\quad b^2=-\frac{5+\sqrt5}{2}=-(4-c_0),
 \qquad b=\phi a. \tag{11}
\]

For \(\sqrt{-163}=i\sqrt{163}\) and \(\zeta=e^{2\pi i/5}\), the positive
selected radical is \(s=-\sqrt{-163}\,a>0\). Its square is precisely the
radicand in (7); changing this sign does not change the generated field.
Since \(F(a)=\mathbb Q(\zeta_5)\) and \(\sqrt{-163}\in K\),

\[
 K(s)=K(\zeta_5). \tag{12}
\]

Combining (3), (8), and (12), with the predecessor equality \(K E=H_5\),
now gives a field-theoretic proof independent of a bare degree match:

\[
 K(t)=H_5(s)=H_5(\zeta_5)=K_{(5)}.
\]

Together with (1) and \(t=r^5\), the main conclusion is

\[
 \boxed{K(t)=K(r)=K_{(5)},\qquad [K_{(5)}:K]=12.} \tag{13}
\]

## 5. The intrinsic cyclic quartic in \(\mathbb Q(t)\)

Set \(\delta=s=\sqrt{163(1+c_0)}\), with its positive selected embedding.
Eliminating \(c_0\) gives

\[
 f_\delta(X)=X^4-815X^2+132845. \tag{14}
\]

This polynomial is Eisenstein at 5.  Hence
\(A=\mathbb Q(\delta)\) has degree four, and

\[
 \phi=3-\frac{\delta^2}{163}\in A.
\]

All four roots of (14) already lie in \(A\):

\[
 \delta,\quad\phi\delta,\quad-\delta,\quad-\phi\delta.
\]

The exact polynomial map

\[
 \sigma(\delta)=3\delta-\frac{\delta^3}{163}=\phi\delta
\]

has iterates \(\sigma,-1,-\sigma,1\) on \(\delta\).  Therefore

\[
 \operatorname{Gal}(A/\mathbb Q)\simeq C_4,\qquad
 A^{\langle\sigma^2\rangle}=\mathbb Q(\sqrt5),\qquad
 A\subset\mathbb Q(t). \tag{15}
\]

The final inclusion follows directly from (7):
\(\delta\) is, up to the harmless sign of a square root,
\((t+t^{-1})/w(u)\).  Thus this is an embedded subfield of the
Rogers--Ramanujan singular-value field, not merely a separately defined
golden radical.  Its two positive conjugates have the exact ratio \(\phi\),
so

\[
 c_0=\left(\frac{\delta}{\phi\delta}\right)^2. \tag{16}
\]

There is a further intrinsic arithmetic refinement.  With
\(b=(\delta+\phi)/2\),

\[
 b^2-\phi b+41\phi-122=0,
\]

and the relative discriminant of the \(F\)-basis \(\{1,b\}\) is

\[
 163(3-\phi)=163\sqrt5(\phi-1).
\]

The prime 163 is inert in \(F\), the prime above 5 is ramified, and
\(\phi-1\) is a unit.  This relative discriminant ideal is squarefree, so
the usual discriminant-index argument proves that this order is maximal.
The exact trace Gram determinant of
\(\{1,\phi,b,\phi b\}\) is

\[
 \operatorname{disc}(A)=125\cdot163^2=3321125. \tag{17}
\]

**External input.**  Applying the conductor--discriminant formula to the
cyclic quartic \(A/\mathbb Q\) (Milne, V.3.27 and Remark V.3.28), its
quadratic character has conductor 5 and its two faithful characters have a
common conductor \(f\).  Equation (17) yields

\[
 3321125=5f^2,\qquad \boxed{f=815=5\cdot163}. \tag{18}
\]

The checker verifies the polynomial, cyclic action, integral trace
determinant, and inertness arithmetic.  Maximality and (18) are written
deductions using the stated standard discriminant and conductor theorems.

## 6. Bounded extension statement and controls

The Artin decomposition in Section 2 is not peculiar to 163.  For an
imaginary quadratic \(K'\) in which 5 is inert, with
\(\mathcal O_{K'}^\times=\{\mathord\pm1\}\), the relative local quotient
is again \(\mathbb F_{25}^\times/\{\mathord\pm1\}\).  The same scalar and
norm-kernel argument gives the corresponding ray/ring/cyclotomic
decomposition after applying the usual ray and ring-class exact sequences.
Cais--Conrad supplies the ray-field equality for a *maximal-order 5-unit*
CM mark.

For every positive \(d\) prime to 5, the abstract quartic
\(X^4-5dX^2+5d^2\) is Eisenstein at 5 and has the same formal golden cyclic
construction.  What is specific to \(-163\) here is the certified embedding
of that quartic into \(\mathbb Q(r(\tau)^5)\), the exact sextic \(G\), its
selected cubic factor, and the displayed rational polynomial \(w\).  No
uniform embedding or formula for \(w_D\), no intrinsic HMR transport, and no
RH consequence is claimed.

Two controls prevent overgeneralization.  For discriminant \(-11\), 5 splits
(\(-11\equiv4\pmod5\)), so the residue algebra is
\(\mathbb F_5\times\mathbb F_5\), not \(\mathbb F_{25}\); the order-12
inert calculation and cubic pattern do not apply.  For the exceptional
imaginary fields with extra roots of unity (for example \(\mathbb Q(\sqrt{-3})\)),
the unit quotient in (2) changes and must be recalculated.

## 7. Numerical branch diagnostic

At 260 decimal digits, the independently evaluated product has
\(\arg r/\pi=0.2\), \(t<0\), and relative residual
\(1.23\ldots\times10^{-201}\) for (7).  These figures are recorded in
`RESULTS.json`.  They only select and sanity-check the analytic branch;
equations (5)--(18) do not rely on floating-point arithmetic.
