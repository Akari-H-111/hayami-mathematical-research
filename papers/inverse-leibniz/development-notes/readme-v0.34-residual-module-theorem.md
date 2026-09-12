# Inverse Leibniz Problem — Residual Module Theorem (v0.34)

## 1. Statement

Fix the cubic intrinsic contraction and the exact low-rail section developed through v0.33.

Let \(S\) denote the forward temporal shift,

\[
(Sx)(k)=x(k+1),
\]

and set

\[
\boxed{E:=S+2}.
\]

Let

\[
A:=-h\,\operatorname{ad}_{\alpha}.
\]

The homogeneous \(A\)-orbit extracted from the \(v^3\)-rail has minimal polynomial

\[
\boxed{
m_A(\lambda)
=
(\lambda+2)q(\lambda),
}
\]

where

\[
\boxed{
q(\lambda)
=
\lambda^5-4\lambda^4+12\lambda^3-32\lambda^2+80\lambda-192.
}
\]

Define the residual rail sequences

\[
\boxed{
r_b:=m_A(S)x_b,
\qquad b=3,4,5,
}
\]

and their cyclic temporal modules

\[
\mathcal R_b:=\mathbb C[S]\,r_b.
\]

Then:

\[
\boxed{
\mathcal R_3
\simeq
\mathbb C[S]/(S+2)
=
J_{-2}^{(1)},
}
\]

\[
\boxed{
\mathcal R_4
\simeq
\mathbb C[S]/(S+2)^2
=
J_{-2}^{(2)},
}
\]

and

\[
\boxed{
\mu_{\mathcal R_5}(\lambda)
=
(\lambda+2)^3q(\lambda).
}
\]

Consequently the \(v^5\) rail is annihilated by

\[
\boxed{
p_5(\lambda)
=
m_A(\lambda)\mu_{\mathcal R_5}(\lambda)
=
(\lambda+2)^4q(\lambda)^2.
}
\]

The proof below uses the triangular forcing maps themselves.  The finite exact certificates are used only to identify the relevant homogeneous \(A\)-modules and to prove minimality, not to extrapolate a recurrence.

---

## 2. Triangular rail equations

Write

\[
x_b(k)=F_{k+b}^{(k,b)}.
\]

The exact low-rail recursion is

\[
x_2(k)
=
-h[\alpha,x_2(k-1)],
\]

\[
x_3(k)
=
-h\Big(
[\alpha,x_3(k-1)]
+
[\xi,x_2(k)]
\Big),
\]

\[
x_4(k)
=
-h\left(
[\alpha,x_4(k-1)]
+
[\xi,x_3(k)]
+
C_{22}(k)
\right),
\]

\[
x_5(k)
=
-h\left(
[\alpha,x_5(k-1)]
+
[\xi,x_4(k)]
+
C_{23}(k)
\right),
\]

where

\[
C_{22}(k)
=
\frac12\sum_{a+b=k}[x_2(a),x_2(b)]
\]

and

\[
C_{23}(k)
=
\frac12\sum_{a+b=k}
\Big(
[x_2(a),x_3(b)]
+
[x_3(b),x_2(a)]
\Big).
\]

The basic geometric rail is

\[
\boxed{
x_2(k)=(-2)^k\mathsf e,
}
\]

hence

\[
\boxed{Ex_2=0}.
\]

---

## 3. A convolution lemma

Let

\[
a(k)=(-2)^k a_0
\]

and let \(B\) be any fixed bilinear map.  Define the Cauchy convolution

\[
C_b(k)
=
\sum_{i+j=k}B(a(i),b(j)).
\]

Then

\[
\begin{aligned}
(EC_b)(k)
&=
C_b(k+1)+2C_b(k)\\
&=
B(a_0,b(k+1)).
\end{aligned}
\]

All terms with \(i\ge1\) cancel pairwise.

Therefore, for every polynomial \(P\),

\[
P(S)b=0
\quad\Longrightarrow\quad
EP(S)C_b=0.
\]

Applied to the symmetric bracket convolutions above:

\[
\boxed{
E^2C_{22}=0
}
\]

and, whenever \(p_3(S)x_3=0\),

\[
\boxed{
Ep_3(S)C_{23}=0.
}
\]

This is the temporal source of the successive \((S+2)\)-powers.

---

## 4. The homogeneous \(A\)-module from \(x_3\)

Set

\[
\boxed{
g_3:=Ex_3.
}
\]

Apply \(E\) to the \(x_3\)-equation.

Because \(Ex_2=0\), the inhomogeneous \(\xi\)-forcing disappears exactly:

\[
\boxed{
g_3(k+1)=A\,g_3(k).
}
\]

Thus \(g_3\) is a genuine homogeneous \(A\)-orbit.

The exact six vectors

\[
g_3(0),g_3(1),\ldots,g_3(5)
\]

are linearly independent.  On this cyclic basis,

\[
\boxed{
A_*=
\begin{pmatrix}
0&0&0&0&0&384\\
1&0&0&0&0&32\\
0&1&0&0&0&-16\\
0&0&1&0&0&8\\
0&0&0&1&0&-4\\
0&0&0&0&1&2
\end{pmatrix}.
}
\]

Hence this six-dimensional space is \(A\)-invariant and

\[
\boxed{
\mu_{A_*}(\lambda)
=
\chi_{A_*}(\lambda)
=
m_A(\lambda)
=
(\lambda+2)q(\lambda).
}
\]

Because the basis is cyclic, \(m_A\) is the true minimal polynomial, not merely an annihilator.

---

# Part I.  The \(r_3\) module

## 5. Proof that \(\mathcal R_3\simeq J_{-2}^{(1)}\)

By definition,

\[
r_3=m_A(S)x_3.
\]

Since

\[
m_A(\lambda)=(\lambda+2)q(\lambda),
\]

we may write

\[
r_3=q(S)g_3.
\]

Now

\[
Er_3
=
Eq(S)g_3
=
m_A(S)g_3
=
0.
\]

Thus

\[
(S+2)r_3=0.
\]

It remains to show \(r_3\neq0\).

If \(r_3=0\), then

\[
q(S)g_3=0,
\]

so the cyclic homogeneous orbit \(g_3\) would have an annihilator of degree \(5\).  This contradicts the exact six-dimensional cyclicity and

\[
\mu_{g_3}=m_A,
\qquad
\deg m_A=6.
\]

Hence

\[
r_3\neq0.
\]

Therefore

\[
\operatorname{Ann}_{\mathbb C[S]}(r_3)
=
(S+2),
\]

and

\[
\boxed{
\mathcal R_3
=
\mathbb C[S]r_3
\simeq
\mathbb C[S]/(S+2)
=
J_{-2}^{(1)}.
}
\]

An exact coordinate witness is

\[
r_3(0)_{((0,1),(1,0))}
=
\frac{32}{3}\neq0.
\]

---

# Part II.  The \(r_4\) module

## 6. First annihilate \(x_3\)

Define

\[
\boxed{
p_3(\lambda)
=
(\lambda+2)m_A(\lambda)
=
(\lambda+2)^2q(\lambda).
}
\]

Since

\[
r_3=m_A(S)x_3
\]

and

\[
Er_3=0,
\]

we already have

\[
\boxed{
p_3(S)x_3=0.
}
\]

---

## 7. Apply \(p_3(S)\) to the \(x_4\)-equation

Set

\[
\boxed{
y_4:=p_3(S)x_4.
}
\]

Because temporal polynomials commute with the fixed linear maps and with the fixed bilinear source construction,

\[
p_3(S)[\xi,x_3]
=
[\xi,p_3(S)x_3]
=
0.
\]

Also \(C_{22}\) is annihilated by \(E^2\), and \(p_3\) contains \(E^2\), so

\[
p_3(S)C_{22}=0.
\]

Therefore all inhomogeneous terms disappear and

\[
\boxed{
y_4(k+1)=A\,y_4(k).
}
\]

So \(y_4\) is another homogeneous \(A\)-orbit.

The exact initial vector is nonzero:

\[
\boxed{
y_4(0)_{((0,1),(0,0))}
=
-3200.
}
\]

Moreover the exact \(A\)-action gives

\[
\boxed{
Ay_4(0)=-2y_4(0).
}
\]

Hence

\[
y_4(k)=(-2)^k y_4(0)
\]

for all \(k\), and therefore

\[
\boxed{
Ey_4=0.
}
\]

But

\[
y_4
=
p_3(S)x_4
=
E\,m_A(S)x_4
=
Er_4.
\]

Consequently

\[
E^2r_4=0.
\]

Since

\[
Er_4=y_4\neq0,
\]

the annihilator of the cyclic module generated by \(r_4\) is exactly

\[
(E^2).
\]

Thus

\[
\boxed{
\mathcal R_4
\simeq
\mathbb C[S]/(S+2)^2
=
J_{-2}^{(2)}.
}
\]

This also explains the explicit form found previously,

\[
r_4(k)=(-2)^k(a+kb),
\]

as the standard length-two Jordan chain at eigenvalue \(-2\).

---

# Part III.  The \(r_5\) module

## 8. The \(x_4\) annihilator

Define

\[
\boxed{
p_4(\lambda)
=
(\lambda+2)p_3(\lambda)
=
(\lambda+2)^3q(\lambda).
}
\]

Since

\[
Ey_4=0
\]

and \(y_4=p_3(S)x_4\),

\[
\boxed{
p_4(S)x_4=0.
}
\]

---

## 9. The convolution forcing \(C_{23}\)

The convolution lemma gives

\[
E C_{23}
=
B_{\mathsf e}(Sx_3)
\]

for the fixed symmetric bracket map

\[
B_{\mathsf e}(v)
=
\frac12
\left(
[\mathsf e,v]+[v,\mathsf e]
\right).
\]

Since

\[
p_3(S)x_3=0,
\]

we obtain

\[
p_3(S)E C_{23}=0.
\]

Thus

\[
\boxed{
p_4(S)C_{23}=0.
}
\]

So \(p_4\) kills **both** inhomogeneous terms in the \(x_5\)-recursion.

---

## 10. The homogeneous \(x_5\) residual orbit

Set

\[
\boxed{
y_5:=p_4(S)x_5.
}
\]

Applying \(p_4(S)\) to the triangular \(x_5\)-equation gives

\[
\boxed{
y_5(k+1)=A\,y_5(k).
}
\]

The exact first six values

\[
y_5(0),\ldots,y_5(5)
\]

are linearly independent.

On this cyclic basis the \(A\)-action is again exactly

\[
\boxed{
A_*=
\begin{pmatrix}
0&0&0&0&0&384\\
1&0&0&0&0&32\\
0&1&0&0&0&-16\\
0&0&1&0&0&8\\
0&0&0&1&0&-4\\
0&0&0&0&1&2
\end{pmatrix}.
}
\]

Therefore

\[
\boxed{
\mu_{y_5}=m_A.
}
\]

In particular

\[
m_A(S)y_5=0.
\]

Since \(y_5=p_4(S)x_5\),

\[
\boxed{
p_5(S)x_5=0,
}
\]

where

\[
\boxed{
p_5
=
m_Ap_4
=
(\lambda+2)^4q(\lambda)^2.
}
\]

---

## 11. Annihilation of \(r_5\)

Recall

\[
r_5=m_A(S)x_5.
\]

Because temporal polynomials commute,

\[
\begin{aligned}
p_4(S)r_5
&=
p_4(S)m_A(S)x_5\\
&=
p_5(S)x_5\\
&=0.
\end{aligned}
\]

Therefore

\[
\mu_{\mathcal R_5}
\mid
p_4.
\]

Since

\[
\deg p_4=8,
\]

it remains only to prove that no polynomial of degree \(<8\) annihilates \(r_5\).

---

## 12. Minimality certificate

The exact eight cochains

\[
\boxed{
r_5(0),r_5(1),\ldots,r_5(7)
}
\]

are linearly independent.

A concrete \(8\times8\) rational minor has determinant

\[
\boxed{
-1974127506397904857128197160960
\neq0.
}
\]

Therefore a relation

\[
a_0r_5(k)
+\cdots+
a_dr_5(k+d)=0
\]

with \(d<8\) is impossible: evaluating at \(k=0\) would give a nontrivial linear dependence among the first eight orbit vectors.

Hence

\[
\deg\mu_{\mathcal R_5}\ge8.
\]

But \(p_4\) is already an annihilator of degree \(8\).  Therefore

\[
\boxed{
\mu_{\mathcal R_5}=p_4.
}
\]

Explicitly,

\[
\boxed{
\mu_{\mathcal R_5}(\lambda)
=
(\lambda+2)^3q(\lambda).
}
\]

---

# 13. Residual Module Theorem

Combining the preceding arguments gives:

\[
\boxed{
\mathcal R_3\simeq J_{-2}^{(1)},
}
\]

\[
\boxed{
\mathcal R_4\simeq J_{-2}^{(2)},
}
\]

and

\[
\boxed{
\mu_{\mathcal R_5}
=
(\lambda+2)^3q(\lambda).
}
\]

Consequently

\[
\boxed{
p_5(\lambda)
=
(\lambda+2)^4q(\lambda)^2
}
\]

is not merely a finite-window recurrence polynomial.

For the fixed cubic contraction and its exact low-rail triangular subsystem, it follows from:

\[
\boxed{
\text{homogeneous }(-h\,\mathrm{ad}_\alpha)\text{ dynamics}
+
\text{triangular Cauchy forcing}
+
\text{two exact finite minimality certificates}.
}
\]

The first copy of \(q\) is the nontrivial homogeneous \(A\)-spectrum.

The successive powers of \((\lambda+2)\) are the resonant Jordan depths created by the geometric \(x_2\)-mode.

The second copy of \(q\) appears because the complete \(p_4\)-spectrum enters the \(x_5\)-forcing and then passes once more through the same homogeneous \(A\)-module.

---

## 14. Status upgrade

Within the present cubic contraction, the factorization

\[
\boxed{
p_5=(\lambda+2)^4q^2
}
\]

can now be promoted from an empirically stabilized low-rail law to an **all-orders theorem for the autonomous low-rail triangular subsystem**.

This does **not** assert universality for arbitrary inverse-Leibniz algebras or arbitrary choices of contraction.

It is an intrinsic theorem of the fixed cubic example and fixed contraction studied here.

---

## 15. Next research direction

The next useful question is no longer whether the order-14 recurrence survives another arity.

Instead, package the proof into a general **Triangular Spectral Extension Lemma**.

A suitable abstract template is:

\[
x_{j+1}
=
A x_{j+1}^{\mathrm{prev}}
+
\text{forcing from lower rails},
\]

with one geometric mode \(E=S-\lambda_0\), a homogeneous minimal polynomial \(m_A\), and Cauchy forcing operators that raise the \(E\)-Jordan depth.

The goal is to prove a general rule predicting when a new rail multiplies its predecessor's annihilator by

\[
m_A
\]

and when only an extra resonant factor

\[
E
\]

appears.

That abstraction would explain, rather than merely record, the transition

\[
p_3=E\,m_A,
\qquad
p_4=E\,p_3,
\qquad
p_5=m_A\,p_4.
\]
