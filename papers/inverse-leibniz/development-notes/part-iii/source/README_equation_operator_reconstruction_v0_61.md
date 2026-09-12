# General Triangular Spectral Theory V
## Equation-Operator Reconstruction Theorem
### v0.61

## 1. Goal

v0.60 removed the propagator matrices \(C_i\) as independent data, but
still assumed an equation-operator algebra

\[
\mathscr A_{\rm eq}
\]

acting on the relation resolution.

The goal of v0.61 is to reconstruct the **effective**
equation-operator algebra directly from the marked filtered relation
resolution.

The main correction is important:

> A filtration alone does not determine an operator algebra.

Nor should one take every filtration-preserving endomorphism.  That
would usually introduce many operations unrelated to the deformation
equations.

The correct input is the canonical family of chain operations already
singled out by the deformation presentation:

\[
\boxed{
\mathfrak G_{\rm can}
=
\{S_{\rm ar},\Delta_1,\ldots,\Delta_r\}.
}
\]

Here \(S_{\rm ar}\) is the canonical arity shift and the \(\Delta_i\)
are distinguished filtration-compatible chain endomorphisms arising
from the relation syntax, grading, or linearized constraints.

No algebra relations among these operators are declared in advance.

---

# 2. Filtered relation resolution

Let

\[
P_\bullet
\]

be a finite filtered relation-resolution complex, with differential
\(d\).

Assume every canonical operator

\[
G\in\mathfrak G_{\rm can}
\]

is a filtered chain endomorphism:

\[
\boxed{
dG=Gd.
}
\]

It may have a prescribed filtration degree, for example:

- \(S_{\rm ar}\): positive arity degree;
- weight or grading operators: degree \(0\);
- triangular relation operators: nonnegative filtration degree.

Because \(G\) is a chain map,

\[
G(\operatorname{im}d_1)
\subseteq
\operatorname{im}d_1.
\]

Therefore every canonical chain operator automatically descends to
relation homology

\[
\boxed{
H_0(P_\bullet)=P_0/\operatorname{im}d_1.
}
\]

Write the descended operator as

\[
\bar G\in\operatorname{End}(H_0(P_\bullet)).
\]

This is precisely the syzygy-preservation mechanism needed in v0.60,
but no ambient algebra has been assumed.

---

# 3. Raw and effective operator algebras

One may form the chain-level algebra

\[
\mathscr A_{\rm raw}
=
k\langle \mathfrak G_{\rm can}\rangle
\subseteq
\operatorname{End}_{\rm Ch}(P_\bullet).
\]

However, \(\mathscr A_{\rm raw}\) is not the right invariant: adding or
changing contractible resolution summands can change its action.

Define instead the **effective equation-operator algebra**

\[
\boxed{
\mathscr A_{\rm eq}^{\rm eff}(P)
=
k\langle
\bar G:G\in\mathfrak G_{\rm can}
\rangle
\subseteq
\operatorname{End}(H_0(P_\bullet)).
}
\]

This is the operator algebra actually seen by the relation module.

It is the unique smallest unital subalgebra of
\(\operatorname{End}(H_0(P_\bullet))\) containing every canonical
descended operator.

---

# 4. Automatic reconstruction of algebra relations

Let the canonical family be indexed by

\[
G_0,\ldots,G_r.
\]

Consider the free associative algebra

\[
\mathscr F
=
k\langle X_0,\ldots,X_r\rangle.
\]

Evaluation on relation homology gives

\[
\boxed{
\operatorname{ev}_P:
\mathscr F
\to
\operatorname{End}(H_0(P_\bullet)),
\qquad
X_i\mapsto\bar G_i.
}
\]

Then

\[
\boxed{
\mathscr A_{\rm eq}^{\rm eff}(P)
=
\operatorname{im}(\operatorname{ev}_P)
\cong
\mathscr F/\ker(\operatorname{ev}_P).
}
\]

Thus the defining operator identities are not separately postulated.

They are exactly the noncommutative polynomial identities satisfied by
the canonical operators on the relation module.

For example, a presentation may force

\[
S_{\rm ar}^4=0,
\qquad
[W,S_{\rm ar}]=S_{\rm ar},
\]

without either relation being supplied as an independent equation-
operator axiom.

---

# 5. Equation-Operator Reconstruction Theorem

## Theorem

Let \(P_\bullet\) be a finite filtered relation resolution equipped
with a canonical finite family of filtered chain endomorphisms

\[
\mathfrak G_{\rm can}.
\]

Then:

1. each canonical operator descends uniquely to
   \(H_0(P_\bullet)\);

2. the effective equation-operator algebra

   \[
   \boxed{
   \mathscr A_{\rm eq}^{\rm eff}
   =
   k\langle \bar{\mathfrak G}_{\rm can}\rangle
   }
   \]

   is determined by the marked deformation presentation;

3. it is characterized by the universal minimality property of being
   the smallest unital subalgebra of
   \(\operatorname{End}(H_0(P_\bullet))\) containing all descended
   canonical operators;

4. its algebra relations are reconstructed as

   \[
   \boxed{
   \ker(\operatorname{ev}_P)
   }
   \]

   rather than declared externally;

5. its action is independent of the chosen syzygy basis and quotient
   basis;

6. under an operator-compatible filtered chain equivalence, the
   effective algebras are naturally conjugate.

Thus \(\mathscr A_{\rm eq}\) need not be supplied as a separate marked
algebra.

The presentation supplies the canonical chain operations; their
effective algebra is reconstructed automatically.

---

# 6. Naturality under chain comparison

Let

\[
\Phi:P_\bullet\to P'_\bullet
\]

be a filtered chain map inducing an isomorphism

\[
H_0(\Phi):
H_0(P_\bullet)\xrightarrow{\sim}H_0(P'_\bullet).
\]

Suppose corresponding canonical operators satisfy either strict
intertwining

\[
\Phi G_i=G_i'\Phi,
\]

or, more generally, intertwining up to chain homotopy,

\[
\boxed{
\Phi G_i-G_i'\Phi
=
dH_i+H_id.
}
\]

Passing to \(H_0\) kills the homotopy term, giving

\[
\boxed{
H_0(\Phi)\bar G_i
=
\bar G_i'H_0(\Phi).
}
\]

Hence for every noncommutative word \(w\),

\[
H_0(\Phi)w(\bar G)
=
w(\bar G')H_0(\Phi).
\]

Therefore

\[
\boxed{
\mathscr A_{\rm eq}^{\rm eff}(P')
=
H_0(\Phi)\,
\mathscr A_{\rm eq}^{\rm eff}(P)\,
H_0(\Phi)^{-1}.
}
\]

This is the correct resolution-independence statement.

---

# 7. Why the effective algebra, not the raw chain algebra

A free resolution may be enlarged by a contractible summand

\[
C_1\xrightarrow{\sim}C_0.
\]

Canonical chain operators may act on that summand in many different
ways while inducing exactly the same maps on \(H_0\).

Therefore

\[
\mathscr A_{\rm raw}
\]

can change without changing the deformation relation module.

The quotient-visible algebra

\[
\boxed{
\mathscr A_{\rm eq}^{\rm eff}
\subseteq
\operatorname{End}(H_0(P_\bullet))
}
\]

removes this irrelevant resolution freedom.

This is the same structural lesson that appeared in Paper II:
contractible chain-level data require marking if one wishes to retain
them.  For the general spectral-floor pipeline, only the effective
relation action is needed.

---

# 8. Relation to v0.60

v0.60 began with an algebra \(\mathscr A_{\rm eq}\) and obtained

\[
\mathscr C_{\rm syz}
=
\operatorname{im}
\left(
\mathscr A_{\rm eq}
\to
\operatorname{End}(F_{\rm rel})
\right).
\]

Under

\[
F_{\rm rel}\cong H_0(P_\bullet),
\]

v0.61 identifies the intrinsic object directly as

\[
\boxed{
\mathscr C_{\rm syz}
=
\mathscr A_{\rm eq}^{\rm eff}.
}
\]

Thus the two stages collapse:

\[
\boxed{
\text{canonical chain operators}
\Longrightarrow
\mathscr A_{\rm eq}^{\rm eff}
=
\mathscr C_{\rm syz}.
}
\]

The abstract predeclared algebra is no longer needed.

---

# 9. Relation to v0.59

The normalized source closure becomes

\[
\boxed{
N_{\rm eq}
=
\mathscr A_{\rm eq}^{\rm eff}
\cdot
\operatorname{im}R_0.
}
\]

Therefore the current pipeline is

\[
\boxed{
(P_\bullet,\mathfrak G_{\rm can},R_0)
}
\]

\[
\Downarrow
\]

\[
\boxed{
\mathscr A_{\rm eq}^{\rm eff}
}
\]

\[
\Downarrow
\]

\[
\boxed{
N_{\rm eq}
}
\]

\[
\Downarrow
\]

\[
\boxed{
K,\ A|_K
}
\]

\[
\Downarrow
\]

\[
\boxed{
\chi_{\rm forced},\mu_{\rm forced}.
}
\]

No separately declared \(\mathscr A_{\rm eq}\), \(C_i\), or \(N\) remains.

---

# 10. Finite reconstruction algorithm

Let

\[
r=\dim H_0(P_\bullet).
\]

Given matrices for the canonical chain maps:

1. verify each chain-map identity
   \[
   dG_i=G_id;
   \]

2. compute the quotient
   \[
   H_0=P_0/\operatorname{im}d_1;
   \]

3. descend every \(G_i\) to a matrix
   \[
   \bar G_i\in M_r(k);
   \]

4. initialize
   \[
   A_0=\operatorname{span}
   \{I,\bar G_0,\ldots,\bar G_r\};
   \]

5. iterate multiplication closure
   \[
   A_{n+1}
   =
   A_n+
   \sum_i
   (\bar G_iA_n+A_n\bar G_i);
   \]

6. stop when
   \[
   \dim A_{n+1}=\dim A_n.
   \]

Because

\[
\dim\operatorname{End}(H_0)=r^2,
\]

the process terminates after at most \(r^2\) strict dimension
increases.

The stabilized vector space, equipped with matrix multiplication, is

\[
\boxed{
\mathscr A_{\rm eq}^{\rm eff}.
}
\]

This avoids computing a noncommutative Gröbner basis merely to obtain
the effective finite algebra.

A multiplication table can then be extracted exactly.

---

# 11. Filtration and triangularity

The canonical filtration is still useful even though it does not by
itself determine the algebra.

Suppose \(H_0\) has a finite descending filtration

\[
H_0=F^0\supseteq F^1\supseteq\cdots\supseteq F^{N+1}=0.
\]

If a canonical operator has filtration degree \(d\ge0\),

\[
G(F^p)\subseteq F^{p+d},
\]

its effective action inherits that degree.

Let \(\mathscr J_+\) be the ideal generated by all strictly
positive-degree canonical operators.  Then

\[
\boxed{
\mathscr J_+^{N+1}=0.
}
\]

Indeed every product of \(N+1\) positive-degree factors raises the
filtration beyond \(F^N\).

Thus the reconstructed effective equation algebra has an intrinsic
triangular structure:

\[
\boxed{
\text{degree-zero operator algebra}
\ltimes
\text{nilpotent positive-filtration ideal}.
}
\]

This directly explains why the later forcing and spectral-extension
systems naturally acquire triangular finite-state presentations.

---

# 12. Exact example

Let

\[
H_0=k^4
\]

with canonical arity shift

\[
S=
\begin{pmatrix}
0&0&0&0\\
1&0&0&0\\
0&1&0&0\\
0&0&1&0
\end{pmatrix}
\]

and canonical weight operator

\[
W=\operatorname{diag}(0,1,2,3).
\]

The presentation itself forces

\[
\boxed{
S^4=0,
}
\]

and

\[
\boxed{
[W,S]=S.
}
\]

No algebra relation was postulated.

The generated effective algebra has exact dimension

\[
\boxed{10}
\]

and is the full lower-triangular \(4\times4\) matrix algebra.

Under a nontrivial change of relation-module basis, the two canonical
operators are conjugated and the generated ten-dimensional algebra is
conjugated with them.

Adding a two-dimensional contractible resolution summand and changing
the raw actions on that summand changes the chain-level matrices but
leaves the effective \(H_0\)-operators and their ten-dimensional algebra
unchanged.

All statements were checked exactly.

---

# 13. Sharp no-go: filtration and shift alone are insufficient

Keep the same filtered four-dimensional module and the same arity shift
\(S\).

The algebra generated only by \(S\) is

\[
\boxed{
k[S],
\qquad
\dim k[S]=4.
}
\]

Adding the distinguished weight operator \(W\), which is compatible
with the same filtration and shift structure, generates an algebra of
dimension \(10\).

Therefore

\[
\boxed{
\text{filtration + arity shift alone}
\not\Longrightarrow
\mathscr A_{\rm eq}^{\rm eff}.
}
\]

The distinguished chain operations matter.

Likewise taking *all* filtration-compatible endomorphisms would
overgenerate the algebra.

Hence the sharp input is:

\[
\boxed{
\text{marked filtered presentation}
+
\text{canonical chain-operator family}.
}
\]

The algebra itself, however, is reconstructed rather than declared.

---

# 14. Scope boundary

The theorem removes the independently supplied algebra
\(\mathscr A_{\rm eq}\), but it cannot manufacture distinguished
operators from an unmarked chain complex.

This is unavoidable: different choices of canonical operations on the
same underlying filtered resolution can generate different effective
algebras.

Therefore the correct invariant is attached to a marked deformation
presentation in which arity shift and distinguished relation operators
are genuinely part of the presentation syntax or natural structure.

This matches the marked-versus-unmarked boundary already established
in Paper II.

---

# 15. Equation-Operator Reconstruction Theorem, concise form

## Theorem

Let \(P_\bullet\) be a finite filtered relation resolution of a marked
deformation presentation, and let

\[
\mathfrak G_{\rm can}
\subseteq
\operatorname{End}_{\rm Ch,F}(P_\bullet)
\]

be its canonically specified finite family of arity/constraint chain
operators.

Then the effective equation-operator algebra is reconstructed by

\[
\boxed{
\mathscr A_{\rm eq}^{\rm eff}
=
k\langle
H_0(G):G\in\mathfrak G_{\rm can}
\rangle
\subseteq
\operatorname{End}(H_0(P_\bullet)).
}
\]

Equivalently,

\[
\boxed{
\mathscr A_{\rm eq}^{\rm eff}
\cong
k\langle X_G:G\in\mathfrak G_{\rm can}\rangle
/
\ker(\operatorname{ev}_P).
}
\]

It is:

1. the unique smallest unital algebra containing the effective
   canonical operators;

2. independent of syzygy basis and quotient basis;

3. invariant up to conjugacy under filtered chain comparisons that
   intertwine the canonical operators up to chain homotopy;

4. insensitive to arbitrary actions on contractible resolution
   summands;

5. finite-dimensional whenever \(H_0(P_\bullet)\) is finite;

6. the same effective propagator algebra required by v0.60.

Consequently the general spectral-floor pipeline requires no separately
declared equation-operator algebra.

---

# 16. Status of the upstream reconstruction program

The sequence v0.57--v0.61 has now removed, successively:

\[
\boxed{
\text{complementary spectrum}
}
\]

\[
\boxed{
\text{external forced sector }K
}
\]

\[
\boxed{
\text{external normalized source }N
}
\]

\[
\boxed{
\text{external propagators }C_i
}
\]

\[
\boxed{
\text{external equation-operator algebra }\mathscr A_{\rm eq}.
}
\]

The remaining input is

\[
\boxed{
(P_\bullet,\mathfrak G_{\rm can},R_0),
}
\]

namely the marked relation resolution, its genuinely canonical chain
operations, and the distinguished relation seed coefficients.

This is essentially the finite marked deformation presentation itself.

---

# 17. Next research direction

There is now a natural stopping question.

One can attempt one more level and ask whether the distinguished
operator family

\[
\mathfrak G_{\rm can}
\]

itself can be characterized internally, for example as natural
transformations of the deformation-presentation functor rather than as
marked operators.

That would lead to a

\[
\boxed{
\text{Natural-Operator Characterization Theorem}.
}
\]

However, Paper II's quasi-isomorphism no-go strongly suggests a hard
boundary: an unmarked formal moduli problem cannot recover arbitrary
contractible chain-level markings.

Therefore the likely endpoint is not to erase all markings, but to
prove that \(\mathfrak G_{\rm can}\) is canonical **within the category
of marked deformation presentations**.

At that point the upstream reconstruction program is complete at the
strongest level compatible with the known no-go theorem.
