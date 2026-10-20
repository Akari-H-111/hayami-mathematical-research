# A golden coordinate and two realizations of one involution

The pentagonal parameter from the ruled surface also determines a modular
fixed value and a Fourier eigenvector. The link is an explicit matrix
identity: exchanging coordinates turns Rogers–Ramanujan inversion into the
normalized Fourier operator on odd five-periodic vectors. We follow this
identity from the surface calculation to a Dirichlet-series functional
equation, then distinguish the fixed-point role of \(i\) from the arithmetic
role of \(\tau_{163}\) in Hermite's near-integer phenomenon.

## 1. From the surface to a pentagonal coordinate

Write \(\phi=(1+\sqrt5)/2\). Consider the orthogonal-circle ruled surface
of [HMR]:

\[
 S(t,u)=\bigl(c+2u(1-c),(1-u)s,uQ\bigr),\qquad
 c=\cos t,\quad s=\sin t,\quad Q=\sqrt{c(2-c)}.
\]

For fixed \(t\), varying \(u\) traces a straight line, called a ruling.
Rank loss occurs when the two tangent vectors \(S_t,S_u\) become linearly
dependent, so \(S_t\times S_u=0\). In the interior lateral case
\(0<c<1\), the third component of this cross product is
\((1-c)(1-c-2u)\), forcing

\[
 u=\frac{1-c}{2}.
\]

After this substitution, the other two components are

\[
 -\frac{(1+c)P(c)}{2Q},\qquad -\frac{sP(c)}{Q},
 \qquad P(c)=c^2-3c+1.
\]

The unique root of \(P\) in \((0,1)\) therefore gives

\[
 c_0=\frac{3-\sqrt5}{2}=\phi^{-2},\qquad
 \gamma=1-c_0=\phi^{-1},\qquad
 u_0=\frac{\gamma}{2}=\cos\frac{2\pi}{5}.
\]

Thus the ruling coordinate at rank loss is a pentagonal cosine. The two
reflected points with \(t=\pm\arccos c_0\) and \(u=u_0\) share the scalar
coordinates \((c_0,u_0)\).

## 2. The common involution and its positive eigenline

For \(\operatorname{Im}\tau>0\), define the Rogers–Ramanujan function by
the convergent product

\[
 r(\tau)=q^{1/5}\prod_{n\ge1}
 \frac{(1-q^{5n-4})(1-q^{5n-1})}
      {(1-q^{5n-3})(1-q^{5n-2})},\qquad
 q=e^{2\pi i\tau},\quad q^{1/5}=e^{2\pi i\tau/5}.
\]

Here \(|q|<1\), so the product converges to a nonzero value. This is
Duke's Eq. (4.1), with its mod-five Kronecker symbol expanded into residue
classes. The classical inversion law [Duke, Proposition 2, Eq. (3.2)] is

\[
 r(-1/\tau)=\frac{\gamma-r(\tau)}{1+\gamma r(\tau)}.
\]

Set

\[
 M=\frac1{\sqrt{1+c_0}}
 \begin{pmatrix}-1&\gamma\\\gamma&1\end{pmatrix},
 \qquad J=\begin{pmatrix}0&1\\1&0\end{pmatrix}.
\]

The matrix \(M\) acts on homogeneous coordinates by

\[
 M\binom z1=\frac1{\sqrt{1+c_0}}
 \binom{\gamma-z}{1+\gamma z}.
\]

Taking the ratio of the two entries gives the fractional-linear map in the
inversion law.

An odd five-periodic sequence satisfies \(a_{n+5}=a_n\) and
\(a_{-n}=-a_n\) for every integer \(n\). Its coordinates, indexed by
the residues \(1,2,3,4,5\), are

\[
 (a_1,a_2,a_3,a_4,a_5)=(x,y,-y,-x,0),
\]

where residue \(5\) represents \(0\). Define

\[
 (\mathcal F a)_m=\frac1{\sqrt5}
       \sum_{n=1}^{5}a_n e^{2\pi i mn/5},\qquad
 \mathcal T=-i\mathcal F,
 \qquad m\in\mathbb Z.
\]

**Theorem.** On the real coordinates \((x,y)\), the operator
\(\mathcal T\) has matrix

\[
 A=\frac2{\sqrt5}
 \begin{pmatrix}
 \sin(2\pi/5)&\sin(\pi/5)\\
 \sin(\pi/5)&-\sin(2\pi/5)
 \end{pmatrix}
 =JMJ.
\]

Exchanging coordinates therefore carries the \(+1\) eigenline of \(M\)
to that of \(A\). With the positive value

\[
 \boxed{\quad \kappa=r(i)=\frac{\gamma}{1+\sqrt{1+c_0}},\quad}
\]

this gives

\[
 A\binom1\kappa=\binom1\kappa,
 \qquad a=(1,\kappa,-\kappa,-1,0).
\]

The scalar correspondence is reversible on this positive branch:

\[
 \boxed{\quad u_0=\frac{\kappa}{1-\kappa^2},\qquad
 c_0=\left(\frac{2\kappa}{1-\kappa^2}\right)^2.\quad}
\]

**Proof.** Since \(\gamma^2=c_0\), we have \(M^2=I\). In the finite
Fourier sum, oddness pairs residues \(n\) and \(5-n\) into twice the
corresponding sine term. Multiplication by \(-i\) gives the displayed
real matrix \(A\). The identities

\[
 \frac{2\sin(2\pi/5)}{\sqrt5}=\frac1{\sqrt{1+c_0}},\qquad
 \frac{2\sin(\pi/5)}{\sqrt5}=\frac{\gamma}{\sqrt{1+c_0}}
\]

give \(A=JMJ\).

Since \(-1/i=i\), the inversion law makes \(r(i)\) a fixed point.
At \(\tau=i\), the prefactor \(e^{-2\pi/5}\) and every factor of the
convergent product are positive. Thus \(r(i)>0\), selecting the unique
positive solution of

\[
 \gamma\kappa^2+2\kappa-\gamma=0.
\]

Solving gives \(\kappa=\gamma/(1+\sqrt{1+c_0})\). In particular,
\(1+\gamma\kappa=\sqrt{1+c_0}\), so
\(M(\kappa,1)^T=(\kappa,1)^T\). Conjugating by \(J\) gives the
claimed \(+1\) eigenvector \((1,\kappa)^T\) of \(A\).
Finally, \(0<\kappa<1\) and
\(\gamma=2\kappa/(1-\kappa^2)\); using \(u_0=\gamma/2\) and
\(c_0=\gamma^2\) gives the inverse formulas. \(\square\)

For comparison with explicit evaluations [Duke, Eq. (2.3)], the equivalent
radical forms are

\[
 \kappa=\sqrt{\frac{5+\sqrt5}{2}}-\phi
       =\frac{\sqrt{10-2\sqrt5}-2}{\sqrt5-1}.
\]

Eliminating \(\phi\) also yields

\[
 \kappa^4+2\kappa^3-6\kappa^2-2\kappa+1=0.
\]

The relationship is thus both scalar and linear: the surface parameters
recover \(\kappa\) and are recovered from it, while \(J\) identifies the
two normalized involutions and their distinguished eigenlines.

## 3. From the Fourier eigenline to a functional equation

To see why this eigenvector supplies Dirichlet-series coefficients, place
its periodic entries in a Gaussian sum. Poisson summation turns the finite
Fourier action into a transformation under \(t\mapsto1/t\). A Mellin
integral then turns that transformation into \(s\mapsto1-s\).

For any odd five-periodic sequence \(a\), put

\[
 F_a(s)=\sum_{n\ge1}\frac{a_n}{n^s}\quad(\operatorname{Re}s>1),
 \qquad
 \Theta_a(t)=\sum_{n\in\mathbb Z}n a_n e^{-\pi n^2t/5}
 \quad(t>0),
\]

and write \(a'=\mathcal T a\). Use the continuous Fourier convention

\[
 \widehat f(\xi)=\int_{\mathbb R}f(x)e^{-2\pi i x\xi}\,dx.
\]

For \(f_t(x)=x e^{-\pi t x^2/5}\), the Gaussian transform gives

\[
 \widehat f_t(\xi)=-i(5/t)^{3/2}\xi e^{-5\pi\xi^2/t}.
\]

Poisson summation [DLMF, §1.8(iv)], applied to each residue class, yields

\[
 \sum_{\ell\in\mathbb Z}f_t(j+5\ell)
   =\frac15\sum_{k\in\mathbb Z}
          e^{2\pi i kj/5}\widehat f_t(k/5).
\]

Multiplying by \(a_j\) and summing over \(j=1,\ldots,5\), we obtain

\[
 \begin{aligned}
 \Theta_a(t)
 &=\frac1{\sqrt5}\sum_{k\in\mathbb Z}
       (\mathcal F a)_k\widehat f_t(k/5)\\
 &=\frac1{\sqrt5}\sum_{k\in\mathbb Z}
       i a'_k\left[-i(5/t)^{3/2}\frac{k}{5}
                         e^{-\pi k^2/(5t)}\right]\\
 &=t^{-3/2}\Theta_{a'}(1/t).
 \end{aligned}
\]

Both theta series decay exponentially at infinity: their zero-index terms
vanish, and their remaining terms contain Gaussian factors. The
transformation gives exponential decay up to a power at zero as well.
Consequently the Mellin integral

\[
 \Lambda_a(s)=\frac12\int_0^\infty
      \Theta_a(t)t^{(s+1)/2}\frac{dt}{t}
\]

converges for every complex \(s\), locally uniformly together with its
derivatives in \(s\), and defines an entire function. Here the Mellin
transform means integration against powers of the positive variable \(t\).
For \(\operatorname{Re}s>1\), oddness and absolute convergence allow
pairing \(n\) with \(-n\) and integrating term by term:

\[
 \begin{aligned}
 \Lambda_a(s)
 &=\sum_{n\ge1}n a_n\int_0^\infty
        e^{-\pi n^2t/5}t^{(s+1)/2}\frac{dt}{t}\\
 &=\left(\frac5\pi\right)^{(s+1)/2}
       \Gamma\left(\frac{s+1}{2}\right)F_a(s).
 \end{aligned}
\]

Thus the integral continues the completed Dirichlet series to the whole
plane. Substituting the theta transformation and then \(v=1/t\) gives

\[
 \begin{aligned}
 \Lambda_a(s)
 &=\frac12\int_0^\infty
       \Theta_{a'}(1/t)t^{(s-2)/2}\frac{dt}{t}\\
 &=\frac12\int_0^\infty
       \Theta_{a'}(v)v^{(2-s)/2}\frac{dv}{v}
 =\Lambda_{a'}(1-s).
 \end{aligned}
\]

For \(a=(1,\kappa,-\kappa,-1,0)\), the theorem gives \(a'=a\), hence

\[
 \boxed{\Lambda_a(s)=\Lambda_a(1-s).}
\]

These are the Davenport–Heilbronn coefficients in the convention of
[Balanzario–Sanchez-Ortiz, Eq. (1)]. They are not multiplicative:
\(a_6=1\), whereas \(a_2a_3=-\kappa^2\), although \(2\) and \(3\)
are coprime. Classical Davenport–Heilbronn theory supplies the existence of
zeros off \(\operatorname{Re}s=1/2\), as recalled in that paper's
introduction. Together with the equation just derived, this shows that
functional-equation symmetry alone does not fix zero locations.

## 4. The distinct roles of the two CM arguments

Here CM refers to imaginary quadratic arguments in the upper half-plane.
The level-five Rogers–Ramanujan function \(r\) is evaluated at both
\(i\) and \(\tau_{163}\). The table records values of the different
modular function \(j\):

| CM argument | Nome \(q\) | \(j\)-value | Role |
| --- | --- | --- | --- |
| \(i\) | \(e^{-2\pi}\) | \(j(i)=1728\) | Fixed by modular inversion, selecting \(r(i)=\kappa\) |
| \(\tau_{163}=(1+i\sqrt{163})/2\) | \(-e^{-\pi\sqrt{163}}\) | \(j(\tau_{163})=-640320^3\) | Integral \(j\)-value and a small negative nome in Hermite's near-integer phenomenon |

The classical expansion [Duke, §2]

\[
 j(\tau)=q^{-1}+744+196884q+\cdots
\]

recalls the mechanism at \(\tau_{163}\). Its leading term is
\(-e^{\pi\sqrt{163}}\); combining this with the integral \(j\)-value
gives

\[
 e^{\pi\sqrt{163}}
   =640320^3+744+196884q+\cdots,
 \qquad q=-e^{-\pi\sqrt{163}}.
\]

The tiny negative nome therefore places the exponential close to the
integer \(640320^3+744\). This is the near-integer phenomenon associated
with Hermite's discussion [Hermite, pp. 47–48]. The golden subfield at
\(\tau_{163}\) is a prior result from earlier sections; here \(i\)
supplies the inversion fixed value.

The exact connection obtained on this page runs from the surface's
pentagonal coordinate to \(\gamma\), from \(\gamma\) to the matrix
\(M\), and through \(A=JMJ\) to its Fourier eigenline. The positive
fixed value \(r(i)=\kappa\) selects that line's periodic coefficients,
and Poisson summation carries their Fourier symmetry to the
Davenport–Heilbronn functional equation.

### References for this section

- [HMR] *The Orthogonal-Circle Ruled Surface: A Boundary Atlas, Five Rank
  Singularities, and Conditional Fold-Signal Recurrence*, version 5,
  Definition “Paired circles and interior surface map” and Theorem “Five
  rank singularities on the completed domain.”
- [Duke] W. Duke, *Continued Fractions and Modular Functions*, Eq. (2.3)
  (printed p. 2), Proposition 2, Eq. (3.2) (printed p. 7), and Eq. (4.1)
  (printed p. 8); see also §2 for the \(j\)-expansion and §6 for
  \(j(i)=1728\). [Primary text](https://www.math.ucla.edu/~wdduke/preprints/bams4.pdf).
- [DLMF] NIST Digital Library of Mathematical Functions,
  [§1.8(iv), Poisson summation](https://dlmf.nist.gov/1.8#iv).
- [Balanzario–Sanchez-Ortiz] E. P. Balanzario and J. Sanchez-Ortiz,
  *Zeros of the Davenport–Heilbronn counterexample*, Mathematics of
  Computation **76** (2007), 2045–2049, Eq. (1) and introductory historical
  statement. [DOI: 10.1090/S0025-5718-07-01999-0](https://doi.org/10.1090/S0025-5718-07-01999-0).
- [Hermite] C. Hermite, 1859, pp. 47–48.
