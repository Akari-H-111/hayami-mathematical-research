# Claim ledger

Status vocabulary: **CLASSICAL** is an external theorem or standard input;
**PROVED HERE** is a written algebraic/rational proof checked by
`verification/check.py`; **EXACT CHECK** is finite exact symbolic computation;
**NUMERICAL** is a finite-precision diagnostic; **OPEN** has not been proved
in this package; **REFUTED** has an explicit countercontrol.

| ID | Claim | Status | Hypotheses and dependencies | Falsifier / boundary | Next strengthening |
| --- | --- | --- | --- | --- | --- |
| C1 | The nine Heegner numbers and (j(\tau_{163})=-640320^3) supply the stated CM baseline. | CLASSICAL | CM theory; source locations in `SOURCES.md`. | Not reproved by this package. | Use an independently checked class-polynomial source if a publication claim requires it. |
| C2 | (P_j(t)=t^6G_j(t-t^{-1})) with (G_j) sextic. | PROVED HERE | Polynomial algebra only. | It is a quotient identity, not a field factorization. | Relate its involution to a precise modular-curve automorphism if needed. |
| C3 | For (j=-640320^3), (P=A^2-5B^2) and (gcd(A,B)=1). | PROVED HERE | Exact expansion in `check.py`. | A wrong coefficient would fail the identity or gcd check. | Give an independent resultant or formal proof if required. |
| C4 | The specified (-163) product branch has (A/B=-\sqrt5), so it reconstructs (phi,gamma,c_0). | PROVED HERE conditional on C1 and Klein's equation | Rational bounds, Sturm counts, exact interval signs. | A different fifth-root/CM branch can have the opposite sign; conventions are explicit. | Formalize the analytic product enclosure in a proof assistant if desired. |
| C5 | The positive real (s)-branch has the degree-12 factor (H) and (a_s/b_s=\sqrt5). | PROVED HERE conditional on C1 and Klein's equation | Exact factorization, rational (s)-interval, Sturm/cofactor counts. | This is not a claim that complex (r) has degree 12. | Certified complex-root isolation for the degree-24 (r)-factor. |
| C6 | Each listed class-number-one-order control has an exact $\mathbb Q$-component that splits over $\mathbb Q(\sqrt5)$. | EXACT CHECK | Thirteen hard-coded classical integer (j)-values. | It is not a theorem for all CM orders. | Derive a ray-class stabilizer criterion. |
| C7 | The listed analytic CM component is the splitting component for all 13 controls. | NUMERICAL | Direct q-product match at 100 and 200 digits. | Numerical matching is not a certified root isolation except at (-163). | Add rational/complex ball isolation for every control. |
| C8 | Golden extraction is universal for rational (j). | REFUTED | (j=1,2): degree-12 (P_j) stays irreducible over $\mathbb Q(\sqrt5)$. | These are generic rational controls, not CM points. | Characterize the exceptional rational (j)-set rather than extrapolating from two examples. |
| C9 | (j_{-15}=85995c_0-224505) is an exact direct connection. | CLASSICAL + PROVED HERE algebraic rewrite | Duke's tabulated (j_{-15}); substitution of (2). | It is a shared-field affine identity, not a geometric map. | None unless a separately defined geometric map is proposed. |
| C10 | HMR Boolean exact-fillability data can retain the $\mathbb Q(\sqrt5)$ mark. | REFUTED for Boolean-only data | Current Information Topology proposition: all non-torsion points have the same Boolean sequence; C4 makes the relevant parameters algebraic irrational. | A richer, independently defined marked observable is not ruled out. | Construct and test a canonical field/ray-class mark. |
| C11 | The factorization is a new CM/ray-class theorem. | OPEN / NOT CLAIMED | Existing level-5 CM and ray-class theory is relevant. | Source comparison did not locate a named theorem for this exact factor pattern. | Compute the Shimura-reciprocity stabilizer before any novelty claim. |
| C12 | The result gives an intrinsic ruled-surface map or an RH consequence. | NOT CLAIMED | None. | The package proves only a parameter/field relation and a Boolean obstruction. | A direct theorem-level functor or operator map would be required. |

## Director supplement

| ID | Claim | Status | Evidence and boundary | Next target |
| --- | --- | --- | --- | --- |
| D1 | Q(u) has degree6 and contains Q(sqrt(5)) with relative degree3. | EXACT CHECK + field-degree argument | Irreducible sextic, cubic+cubic factorization in `director_check.py`; written argument in `DIRECTOR_FINDING.md`. | Identify the exact CM ring-class correspondence. |
| D2 | The regular field-trace Gram has signature(4,2), and multiplication by u is trace-self-adjoint. | EXACT CHECK | Exact root count, rational Gram, LDL congruence; no Weil-form identification. | Test any proposed explicit operator map against this signature. |
| D3 | Positive self-adjoint multiplication is impossible on a nonzero finite-dimensional unital Q-representation, extended to R. | PROVED HERE from D1/D2 | The irreducible minimal polynomial has nonreal roots. A one-dimensional real scalar through one embedding is not excluded. | Other constructions remain open. |
| D4 | c0 and phi have identical absolute chord-response sequences. | PROVED HERE, elementary | c0=2-phi gives complex-conjugate characters for every integer q. | Retain a separate cubic / discriminant mark. |
| D5 | The residual cubic has discriminant -163 times an F-square, F=Q(sqrt(5)); its Galois group over F is S3. | PROVED HERE from exact identities and the classical cubic criterion | `CUBIC_RESOLVENT.md`; independent fresh Terra recomputation in `logs/resolvent-review.md`. The square class also has representative -815. | Identify the conductor-5 ring class field and preserve the original CM mark. |
