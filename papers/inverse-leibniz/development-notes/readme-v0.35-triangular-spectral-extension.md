# Inverse Leibniz Problem — Triangular Spectral Extension Lemma (v0.35)

## 1. Motivation

The cubic low-rail system exhibits

\[
p_3=E\,m_A,
\qquad
p_4=E\,p_3,
\qquad
p_5=m_A\,p_4,
\]

where

\[
E=S+2
\]

and

\[
m_A=(S+2)q(S).
\]

The goal is to isolate the general mechanism deciding whether the next rail acquires only a resonant factor \(E\), or the complete homogeneous factor \(m_A\).

The correct abstraction separates two operations:

1. **forcing annihilation**: kill every triangular forcing branch;
2. **spectral landing**: determine the homogeneous \(A\)-module in which the residual lands.

---

# 2. Temporal setup

Let \(V\) be a finite-dimensional complex vector space.

Let

\[
S:V^{\mathbb N}\to V^{\mathbb N},
\qquad
(Sx)(k)=x(k+1)
\]

be the forward temporal shift.

Let

\[
A\in\operatorname{End}(V)
\]

be a fixed homogeneous transfer operator.

Consider a triangular extension

\[
\boxed{
Sx=Ax+f.
}
\]

Equivalently,

\[
(S-A)x=f.
\]

Here \(f\) is constructed from previously known lower rails by fixed linear and bilinear forcing maps.

For a sequence \(z\), write

\[
\mu_z(\lambda)
\]

for its monic minimal temporal annihilator:

\[
\mu_z(S)z=0.
\]

---

# 3. Forcing-killing polynomial

Let \(P(\lambda)\) be a monic polynomial satisfying

\[
\boxed{
P(S)f=0.
}
\]

Define the residual

\[
\boxed{
y:=P(S)x.
}
\]

Since temporal polynomials commute with the constant operator \(A\),

\[
\begin{aligned}
(S-A)y
&=
(S-A)P(S)x\\
&=
P(S)(S-A)x\\
&=
P(S)f\\
&=0.
\end{aligned}
\]

Therefore

\[
\boxed{
Sy=Ay.
}
\]

Thus

\[
y(k)=A^k y(0).
\]

The residual is a genuine homogeneous \(A\)-orbit.

Let

\[
\mathcal H_y
=
\mathbb C[A]\,y(0)
\]

and define

\[
\boxed{
d_y(\lambda)
:=
\mu\!\left(A|_{\mathcal H_y}\right).
}
\]

Then

\[
d_y(S)y=0.
\]

Consequently

\[
\boxed{
d_y(S)P(S)x=0.
}
\]

Hence

\[
\boxed{
\mu_x\mid d_yP.
}
\]

This is the universal annihilation statement.

---

# 4. Triangular Spectral Extension Lemma

## Lemma

Let

\[
Sx=Ax+f
\]

and let \(P\) be a monic forcing-killing polynomial:

\[
P(S)f=0.
\]

Set

\[
y=P(S)x.
\]

Let

\[
d_y
=
\mu(A|_{\mathbb C[A]y(0)}).
\]

Then:

\[
\boxed{
\mu_x\mid P\,d_y.
}
\]

If, in addition, no polynomial of degree

\[
<\deg P+\deg d_y
\]

annihilates \(x\), then

\[
\boxed{
\mu_x=P\,d_y.
}
\]

A sufficient exact minimality certificate is that

\[
x(0),x(1),\ldots,
x(\deg P+\deg d_y-1)
\]

are linearly independent.

### Proof

The divisibility statement follows from the calculation above.

The product \(Pd_y\) is an annihilator of degree

\[
D=\deg P+\deg d_y.
\]

If a monic minimal annihilator \(\mu_x\) were a proper divisor of smaller degree, then

\[
\deg\mu_x<D.
\]

Evaluating the resulting recurrence at \(k=0\) would give a nontrivial linear dependence among

\[
x(0),\ldots,x(D-1).
\]

Thus any exact certificate excluding lower-degree recurrences promotes divisibility to equality.

---

# 5. Spectral Landing Principle

The polynomial multiplying the forcing killer \(P\) is not determined by the forcing itself.

It is determined by **where the residual lands inside the homogeneous \(A\)-spectrum**:

\[
\boxed{
P(S)x
\quad\longmapsto\quad
\mathcal H_y=\mathbb C[A]y(0).
}
\]

Therefore the most general multiplier is

\[
\boxed{
d_y
=
\mu(A|_{\mathcal H_y}),
}
\]

which may be any divisor of the stabilized homogeneous minimal polynomial \(m_A\).

The two observed rules

\[
P\mapsto EP
\]

and

\[
P\mapsto m_AP
\]

are two extremal cases of this principle.

---

# 6. Resonant Extension Corollary

Let \(\lambda_0\) be a distinguished resonance and define

\[
\boxed{
E(\lambda)=\lambda-\lambda_0.
}
\]

Suppose the residual satisfies

\[
(A-\lambda_0I)^r y(0)=0,
\]

but

\[
(A-\lambda_0I)^{r-1}y(0)\neq0.
\]

Then

\[
\boxed{
d_y(\lambda)=E(\lambda)^r.
}
\]

Under the minimality hypothesis,

\[
\boxed{
\mu_x=E^rP.
}
\]

In particular, if \(y(0)\) is a nonzero eigenvector:

\[
Ay(0)=\lambda_0y(0),
\]

then

\[
\boxed{
\mu_x=E\,P.
}
\]

Thus the rule

\[
\boxed{
p_{j+1}=E\,p_j
}
\]

holds precisely when:

1. \(p_j\) annihilates every forcing branch entering \(x_{j+1}\);
2. \(y_{j+1}=p_j(S)x_{j+1}\neq0\);
3. \(y_{j+1}(0)\) lands in the simple \(\lambda_0\)-eigenspace of \(A\);
4. a minimality certificate excludes a smaller annihilator.

If the residual lands in a length-\(r\) Jordan chain instead, the correct rule is

\[
p_{j+1}=E^r p_j.
\]

---

# 7. Full Spectral Extension Corollary

Assume the homogeneous dynamics has a stabilized cyclic module

\[
\mathcal H
\]

with minimal polynomial

\[
m_A.
\]

Suppose

\[
y=P(S)x
\]

is a cyclic vector for this full module:

\[
\mathbb C[A]y(0)=\mathcal H.
\]

Then

\[
\boxed{
d_y=m_A.
}
\]

Under the minimality hypothesis,

\[
\boxed{
\mu_x=m_A\,P.
}
\]

Thus

\[
\boxed{
p_{j+1}=m_A\,p_j
}
\]

holds precisely when:

1. \(p_j\) annihilates every triangular forcing branch;
2. the residual \(p_j(S)x_{j+1}\) is homogeneous;
3. its initial vector is cyclic for the complete stabilized \(A\)-module;
4. minimality excludes cancellation.

---

# 8. Partial Spectral Extension

There is no true dichotomy between \(E\) and \(m_A\).

If the residual lands in a proper \(A\)-invariant cyclic submodule

\[
\mathcal H'\subsetneq\mathcal H,
\]

with

\[
d(\lambda)
=
\mu(A|_{\mathcal H'}),
\]

then the general rule is

\[
\boxed{
p_{j+1}=d\,p_j.
}
\]

Thus the multiplier is the **reachable residual spectrum**, not the entire ambient spectrum.

This is useful whenever \(m_A\) factors:

\[
m_A=d_1d_2\cdots.
\]

A triangular forcing map may select only one spectral block.

---

# 9. When is the forcing killer equal to the previous rail polynomial?

The formulas

\[
p_{j+1}=Ep_j
\]

and

\[
p_{j+1}=m_Ap_j
\]

presuppose that

\[
\boxed{
p_j(S)f_{j+1}=0.
}
\]

This is a nontrivial **forcing domination condition**.

If the \(j+1\) forcing has several branches

\[
f_{j+1}
=
f^{(1)}+\cdots+f^{(r)},
\]

with branch annihilators

\[
a_1,\ldots,a_r,
\]

the natural forcing polynomial is

\[
\boxed{
P_j
=
\operatorname{lcm}(a_1,\ldots,a_r).
}
\]

Only when

\[
P_j=p_j
\]

does the simple multiplicative rule use the previous rail polynomial itself.

Otherwise the correct formula is

\[
\boxed{
p_{j+1}=d_{j+1}P_j.
}
\]

---

# 10. Resonant Cauchy Forcing Lemma

Let

\[
a(k)=\lambda_0^k a_0
\]

and let \(B\) be a fixed bilinear map.

Define

\[
C_b(k)
=
\sum_{i+j=k}
B(a(i),b(j)).
\]

Set

\[
E=S-\lambda_0.
\]

Then

\[
\boxed{
(EC_b)(k)
=
B(a_0,b(k+1)).
}
\]

### Proof

We have

\[
\begin{aligned}
C_b(k+1)
={}&
B(a_0,b(k+1))
+
\sum_{i=1}^{k+1}
B(a(i),b(k+1-i)).
\end{aligned}
\]

Since

\[
a(i)=\lambda_0a(i-1),
\]

the sum with \(i\ge1\) equals

\[
\lambda_0 C_b(k).
\]

Therefore

\[
C_b(k+1)-\lambda_0C_b(k)
=
B(a_0,b(k+1)).
\]

Hence the claim.

Consequently,

\[
P(S)b=0
\]

implies

\[
\boxed{
EP(S)C_b=0.
}
\]

This lemma explains why triangular Cauchy forcing raises the resonant \(E\)-depth by one.

---

# 11. Application to the cubic low rails

For the cubic contraction,

\[
\lambda_0=-2,
\qquad
E=S+2,
\]

and

\[
m_A=Eq.
\]

## \(x_3\)

The forcing is \(x_2\), whose annihilator is

\[
E.
\]

So the forcing killer is

\[
P_2=E.
\]

The residual

\[
Ex_3=g_3
\]

is cyclic for the complete six-dimensional homogeneous \(A\)-module.

Therefore

\[
\boxed{
p_3=m_AE=E^2q.
}
\]

This is a full spectral extension.

## \(x_4\)

The two forcing branches are:

\[
[\xi,x_3],
\qquad
C_{22}.
\]

They are annihilated by

\[
p_3
\]

because

\[
p_3x_3=0
\]

and

\[
E^2C_{22}=0,
\qquad
E^2\mid p_3.
\]

Hence

\[
P_3=p_3.
\]

The residual

\[
y_4=p_3(S)x_4
\]

is a nonzero eigenvector of \(A\) with eigenvalue \(-2\).

Thus

\[
d_4=E
\]

and

\[
\boxed{
p_4=E\,p_3.
}
\]

This is a simple resonant extension.

## \(x_5\)

The forcing branches are

\[
[\xi,x_4],
\qquad
C_{23}.
\]

The first is annihilated by \(p_4\).

The Resonant Cauchy Forcing Lemma gives

\[
Ep_3\,C_{23}=0.
\]

Since

\[
p_4=Ep_3,
\]

we again have

\[
P_4=p_4.
\]

The residual

\[
y_5=p_4(S)x_5
\]

generates the complete six-dimensional homogeneous \(A\)-module.

Hence

\[
d_5=m_A
\]

and

\[
\boxed{
p_5=m_A\,p_4.
}
\]

This is a full spectral extension.

---

# 12. The selection rule

For a triangular rail

\[
Sx_{j+1}=Ax_{j+1}+f_{j+1},
\]

the next annihilator is determined in two stages.

### Stage A: forcing domination

Find

\[
P_j
=
\operatorname{lcm}
\{\text{annihilators of all forcing branches}\}.
\]

### Stage B: spectral landing

Compute

\[
y_{j+1}=P_j(S)x_{j+1}.
\]

Then

\[
Sy_{j+1}=Ay_{j+1}.
\]

Let

\[
d_{j+1}
=
\mu(A|_{\mathbb C[A]y_{j+1}(0)}).
\]

Under minimality,

\[
\boxed{
p_{j+1}=d_{j+1}P_j.
}
\]

Therefore:

\[
\boxed{
p_{j+1}=E\,p_j
}
\]

exactly when the previous rail polynomial dominates all forcing branches and the homogeneous residual lands in a simple resonant eigendirection.

Whereas

\[
\boxed{
p_{j+1}=m_A\,p_j
}
\]

exactly when the previous rail polynomial dominates all forcing branches and the residual is cyclic for the full homogeneous \(A\)-module.

---

# 13. Conceptual interpretation

The factor multiplying \(p_j\) measures **new spectral memory introduced after the forcing has been removed**.

Thus:

- \(E\) means the new rail contributes only one resonant Jordan layer;
- \(E^r\) means it contributes a length-\(r\) resonant Jordan extension;
- \(m_A\) means it reintroduces the complete homogeneous spectral memory;
- a proper divisor \(d\mid m_A\) means only a partial spectral block is reachable.

So the triangular recurrence is best viewed as an iterated extension of temporal modules:

\[
\boxed{
\text{lower-rail forcing module}
\longrightarrow
\text{homogeneous residual module}
\longrightarrow
\text{next rail module}.
}
\]

The annihilator multiplication law records the spectral type of that extension.

---

# 14. Current theorem status

For the fixed cubic contraction, the hypotheses are verified exactly:

\[
p_3=E\,m_A,
\]

\[
p_4=E\,p_3,
\]

\[
p_5=m_A\,p_4.
\]

The v0.34 residual-module certificates provide the required minimality statements.

Thus the Triangular Spectral Extension Lemma is not merely a heuristic interpretation of the cubic example: it is an abstract lemma whose two principal corollaries specialize exactly to the observed low-rail transitions.

---

# 15. Next research direction

The next natural step is to classify **which spectral landing occurs from the forcing map alone**.

Define the residual landing map

\[
\Lambda_{j+1}:
\text{lower-rail forcing data}
\longrightarrow
\mathcal H
\]

by

\[
\Lambda_{j+1}(\text{data})
=
P_j(S)x_{j+1}(0).
\]

Then:

- resonant extension occurs when
  \[
  \operatorname{im}\Lambda_{j+1}
  \subseteq
  \ker(A-\lambda_0I);
  \]
- full spectral extension occurs when
  \[
  \operatorname{im}\Lambda_{j+1}
  \]
  contains a cyclic vector for \(A\).

For the cubic example this asks whether the contrast

\[
x_4:\ E\text{-extension}
\]

versus

\[
x_5:\ m_A\text{-extension}
\]

can be read directly from the algebraic rank/image of the two triangular forcing operators, without first constructing the complete temporal sequences.

That would turn the present lemma into a predictive spectral-selection theorem.
