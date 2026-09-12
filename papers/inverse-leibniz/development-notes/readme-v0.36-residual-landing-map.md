# Inverse Leibniz Problem — Residual Landing Map and Spectral Selection (v0.36)

## 1. Goal

The Triangular Spectral Extension Lemma reduces the next rail annihilator to

\[
p_{j+1}=d_{j+1}P_j,
\]

where \(P_j\) kills every forcing branch and \(d_{j+1}\) is the minimal polynomial of the homogeneous residual landing.

The remaining question is whether \(d_{j+1}\) can be determined **without first generating the whole temporal sequence**.

The answer is yes.

The relevant object is a finite-boundary-data map

\[
\boxed{
\Lambda_{j+1}:
\mathscr D_{j+1}^{\mathrm{adm}}
\longrightarrow
\mathcal H_{\mathrm{hom}},
}
\]

whose value is

\[
\boxed{
\Lambda_{j+1}(d)
=
P_j(S)x_{j+1}(0).
}
\]

The spectral type of this single landing vector determines the multiplier.

---

# 2. Finite-jet Landing Formula

Consider the abstract one-sided recurrence

\[
\boxed{
x_{k+1}=Ax_k+f_k
}
\]

on a finite-dimensional vector space \(V\).

Let

\[
P(z)=p_0+p_1z+\cdots+p_dz^d
\]

and assume

\[
P(S)f=0.
\]

Set

\[
y=P(S)x.
\]

Then

\[
y_{k+1}=Ay_k.
\]

The initial homogeneous landing is

\[
y_0=P(S)x(0).
\]

Unrolling the recurrence,

\[
x_r
=
A^rx_0
+
\sum_{t=0}^{r-1}
A^{r-1-t}f_t.
\]

Therefore

\[
\boxed{
\begin{aligned}
y_0
={}&
P(A)x_0\\
&+
\sum_{t=0}^{d-1}
K_{P,t}(A)f_t,
\end{aligned}
}
\]

where

\[
\boxed{
K_{P,t}(z)
=
\sum_{r=t+1}^{d}
p_r z^{r-1-t}.
}
\]

Thus \(y_0\) depends only on the finite boundary jet

\[
(x_0,f_0,\ldots,f_{d-1}).
\]

No infinite temporal sequence is required.

---

# 3. Landing map from lower-rail data

In a triangular system the initial state and forcing jet are themselves determined by lower-rail data.

Let

\[
\iota:
\mathscr D^{\mathrm{adm}}
\to V
\]

be the initial-state map and

\[
F_t:
\mathscr D^{\mathrm{adm}}
\to V
\]

the first \(d\) forcing-jet maps.

Define

\[
\boxed{
\Lambda_P(d)
=
P(A)\iota(d)
+
\sum_{t=0}^{d-1}
K_{P,t}(A)F_t(d).
}
\]

Then

\[
\boxed{
\Lambda_P(d)
=
P(S)x_d(0).
}
\]

In general \(\Lambda_P\) may be polynomial rather than linear, because the forcing can contain bilinear Cauchy terms.

After a lower rail is frozen, or after linearization, it becomes an ordinary linear landing operator.

The spectral-selection results below only require the image set

\[
\operatorname{im}\Lambda_P.
\]

---

# 4. Pointwise Spectral Selection Theorem

Let

\[
v=\Lambda_P(d)
\]

for a fixed admissible datum \(d\).

Since

\[
P(S)x
\]

is homogeneous,

\[
(Sy)_k=Ay_k,
\qquad
y_0=v.
\]

Hence the multiplier contributed after forcing elimination is exactly

\[
\boxed{
d_v(\lambda)
=
\mu(A|_{\mathbb C[A]v}).
}
\]

Under the same minimality hypothesis as the Triangular Spectral Extension Lemma,

\[
\boxed{
\mu_x=P\,d_v.
}
\]

Thus one finite landing vector is sufficient.

---

# 5. Image Criterion for \(E\)-extension

Let

\[
E_A:=A-\lambda_0I.
\]

Suppose

\[
\boxed{
\operatorname{im}\Lambda_P
\subseteq
\ker E_A.
}
\]

Then every landing vector satisfies

\[
Av=\lambda_0v.
\]

Therefore every **nonzero** admissible landing has

\[
d_v(\lambda)=\lambda-\lambda_0=:E(\lambda).
\]

Consequently, for every datum with

\[
\Lambda_P(d)\neq0,
\]

and satisfying minimality,

\[
\boxed{
\mu_x=E\,P.
}
\]

This gives a uniform \(E\)-extension criterion.

More generally, if

\[
\operatorname{im}\Lambda_P
\subseteq
\ker(E_A^r),
\]

then all residual multipliers divide

\[
E^r.
\]

The exact Jordan depth of a particular datum is the least \(s\) such that

\[
E_A^s\Lambda_P(d)=0.
\]

---

# 6. Cyclic Landing Criterion for \(m_A\)-extension

Let

\[
\mathcal H
\]

be an \(r\)-dimensional cyclic \(A\)-module with minimal polynomial

\[
m_A.
\]

Fix a basis of \(\mathcal H\).

For \(v\in\mathcal H\), define the Krylov determinant

\[
\boxed{
\Delta_A(v)
=
\det
\begin{bmatrix}
v&Av&A^2v&\cdots&A^{r-1}v
\end{bmatrix}.
}
\]

Then

\[
\boxed{
\Delta_A(v)\neq0
\iff
v\text{ is }A\text{-cyclic}.
}
\]

Hence for a datum \(d\),

\[
\boxed{
\Delta_A(\Lambda_P(d))\neq0
}
\]

is a finite algebraic certificate for

\[
d_v=m_A.
\]

Under minimality,

\[
\boxed{
\mu_x=m_AP.
}
\]

Again, no long temporal sequence is required.

---

# 7. What does \(\operatorname{im}\Lambda_P\) containing a cyclic vector mean?

A logical distinction is necessary.

The statement

\[
\operatorname{im}\Lambda_P
\text{ contains an \(A\)-cyclic vector}
\]

does **not** imply that every nonzero point in the image is cyclic.

The correct consequences are:

### Existence

If the image contains a cyclic vector, then there exists admissible data giving a full \(m_A\)-extension.

### Genericity

If the data space is algebraic and

\[
\Delta_A\circ\Lambda_P
\not\equiv0,
\]

then the set

\[
\boxed{
\{d:
\Delta_A(\Lambda_P(d))\neq0\}
}
\]

is a nonempty Zariski-open subset.

Thus full spectral extension is generic in that data family.

### Uniform one-dimensional case

If

\[
\operatorname{im}\Lambda_P=\mathbb Cv
\]

and \(v\) is cyclic, then every nonzero landing is cyclic.

Only in this special situation does image-level cyclicity imply a uniform full extension for all nonzero data.

---

# 8. Matrix tests

If \(\Lambda_P\) is linear with matrix \(B\), then the resonant criterion is simply

\[
\boxed{
(A-\lambda_0I)B=0.
}
\]

For a single actual landing vector \(v=Bd\), full cyclicity is tested by

\[
\boxed{
\rank
[v,Av,\ldots,A^{r-1}v]
=r.
}
\]

For a data family, one may study the polynomial

\[
\boxed{
d\longmapsto
\Delta_A(Bd).
}
\]

If this polynomial is not identically zero, full extension occurs generically.

This turns spectral selection into a finite rank/determinant problem.

---

# 9. Cubic example: direct prediction of the \(x_4\) multiplier

For the cubic contraction,

\[
\lambda_0=-2,
\qquad
E=S+2,
\]

and

\[
P_3=p_3=(S+2)^2q(S).
\]

The \(x_4\) landing is

\[
\boxed{
\Lambda_4(d_4)
=
p_3(S)x_4(0)
=
y_4(0).
}
\]

This requires only the finite \(p_3\)-jet.

The exact landing vector is nonzero:

\[
\boxed{
y_4(0)_{((0,1),(0,0))}
=
-3200.
}
\]

Moreover

\[
\boxed{
(A+2I)y_4(0)=0.
}
\]

The actual admissible boundary-data family is one-dimensional, so

\[
\operatorname{im}\Lambda_4
=
\mathbb C y_4(0)
\subseteq
\ker(A+2I).
\]

Therefore the landing map predicts immediately:

\[
\boxed{
d_4=E.
}
\]

Hence

\[
\boxed{
p_4=E\,p_3.
}
\]

No temporal recurrence fitting and no construction of the complete \(x_4\)-orbit is needed.

---

# 10. Cubic example: direct prediction of the \(x_5\) multiplier

Now

\[
P_4=p_4=(S+2)^3q(S).
\]

The finite landing vector is

\[
\boxed{
\Lambda_5(d_5)
=
p_4(S)x_5(0)
=
y_5(0).
}
\]

Apply \(A\) only inside the homogeneous residual module.

The exact Krylov matrix

\[
\boxed{
K_5=
[y_5(0),Ay_5(0),\ldots,A^5y_5(0)]
}
\]

has rank

\[
\boxed{6}.
\]

A concrete \(6\times6\) cochain-coordinate minor has determinant

\[
\boxed{
68852103320239427215687680
\neq0.
}
\]

Therefore

\[
\boxed{
y_5(0)\text{ is \(A\)-cyclic}.
}
\]

The actual landing family is again one-dimensional, so every nonzero landing on this line is cyclic.

Thus the landing map predicts directly:

\[
\boxed{
d_5=m_A.
}
\]

Consequently

\[
\boxed{
p_5=m_A\,p_4.
}
\]

This is a one-vector finite-jet prediction of the full spectral extension.

---

# 11. Residual Landing Selection Theorem

The preceding discussion can be summarized as follows.

## Theorem

For a triangular extension

\[
Sx_{j+1}=Ax_{j+1}+f_{j+1},
\]

let \(P_j\) annihilate all forcing branches.

Define the finite residual landing map

\[
\boxed{
\Lambda_{j+1}(d)
=
P_j(S)x_{j+1}(0).
}
\]

Then, for every admissible datum \(d\),

\[
\boxed{
p_{j+1}
=
P_j\,
\mu\!\left(
A\big|
\mathbb C[A]\Lambda_{j+1}(d)
\right)
}
\]

whenever the usual minimality condition excludes cancellation.

In particular:

### Uniform resonant selection

If

\[
\boxed{
\operatorname{im}\Lambda_{j+1}
\subseteq
\ker(A-\lambda_0I)
}
\]

and the landing is nonzero, then

\[
\boxed{
p_{j+1}=E\,P_j.
}
\]

### Pointwise full spectral selection

If

\[
\boxed{
\Delta_A(\Lambda_{j+1}(d))\neq0,
}
\]

then

\[
\boxed{
p_{j+1}=m_A\,P_j.
}
\]

### Generic full spectral selection

If

\[
\boxed{
\Delta_A\circ\Lambda_{j+1}
\not\equiv0,
}
\]

then full \(m_A\)-extension occurs on a nonempty Zariski-open subset of admissible data.

---

# 12. What has changed conceptually

The previous workflow was

\[
\text{construct a rail}
\to
\text{observe its recurrence}
\to
\text{factor its annihilator}.
\]

The new workflow is predictive:

\[
\boxed{
\text{lower-rail finite boundary data}
\xrightarrow{\Lambda_{j+1}}
\text{one homogeneous landing vector}
\xrightarrow{\text{spectral test}}
\text{next multiplier}.
}
\]

For the cubic example:

\[
\Lambda_4
\longrightarrow
\ker(A+2I)
\longrightarrow
E\text{-extension},
\]

while

\[
\Lambda_5
\longrightarrow
A\text{-cyclic vector}
\longrightarrow
m_A\text{-extension}.
\]

This is the first version of a spectral-selection theorem that can decide the multiplier before constructing the complete next temporal rail.

---

# 13. Next research direction

The next step is to compute the **landing operator itself**, not merely its value on the actual cubic data.

For \(x_4\) and \(x_5\), choose natural finite-dimensional admissible lower-rail data spaces

\[
\mathscr D_4,\qquad
\mathscr D_5,
\]

and write matrices/polynomial coordinate maps for

\[
\Lambda_4,\qquad
\Lambda_5.
\]

Then determine:

\[
\rank\Lambda_4,
\qquad
\operatorname{im}\Lambda_4,
\]

and the polynomial

\[
\Delta_A\circ\Lambda_5.
\]

This would answer a stronger question:

> Is the \(E\)-versus-\(m_A\) choice forced by the triangular algebraic architecture itself, or only by the particular initial lower-rail datum realized in the cubic solution?

If

\[
(A+2I)\Lambda_4=0
\]

as an operator identity on all admissible data, while

\[
\Delta_A\circ\Lambda_5
\]

is a nonzero polynomial, then the contrast between \(x_4\) and \(x_5\) becomes a structural, predictive theorem rather than a property of one realized trajectory.
