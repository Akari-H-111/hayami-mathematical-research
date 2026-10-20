# Claim ledger

| ID | Claim | Status | Evidence and boundary |
| --- | --- | --- | --- |
| R1 | (K(r(\tau))=K_{(5)}) | **EXTERNAL THEOREM APPLIED** | Cais--Conrad Eq. (4.8) identifies (j_5=1/r); Cor. 5.7 applies because (τ) has maximal order and is a 5-unit. This is not inferred from a degree match. |
| R2 | (K_{(5)}=H_5(\zeta_5)) | **WRITTEN DEDUCTION** | The ray/ring Artin quotient is certified as (C_{12}), with scalar subgroup (C_2) and cyclotomic norm kernel (C_3) intersecting trivially. It uses standard class-field exact sequences. |
| R3 | (H_5\cap K(\zeta_5)=K(\sqrt5)) | **WRITTEN DEDUCTION** | The generated Artin subgroup has order 6, so the intersection has degree 2 over (K); the scalar calculation identifies it with the golden layer. |
| C1 | (u^2+4=163(1+c_0)w(u)^2) for an explicit (w\in\mathbb Q[U]) | **EXACT COMPUTATION** | `verification/check.py` verifies the cleared polynomial congruence modulo irreducible (G), with no floating-point input. |
| C2 | (ℚ(t)=E(\sqrt{163(1+c_0)})=E(\sqrt{163(4-c_0)})) | **WRITTEN DEDUCTION** | Follows from C1, (t^2-ut-1=0), the nonsquare norm (163^2\cdot5), and ([E:F]=3). |
| C3 | (K(t)=K(r)=K_{(5)}), with ([\mathbb Q(t):\mathbb Q]=12) | **WRITTEN DEDUCTION** | Combine C2 with the exact cyclotomic radical realization and R2; R1 independently supplies the (r)-field equality. |
| C4 | A=Q(delta) subset Q(t), delta^2=163(1+c0), is cyclic quartic | **EXACT COMPUTATION + WRITTEN DEDUCTION** | Its Eisenstein polynomial is X^4-815X^2+132845; the checker verifies the C4 action, and C2 embeds delta in Q(t). |
| C5 | disc(A)=3321125 and cond(A)=815 | **EXACT COMPUTATION + EXTERNAL THEOREM APPLIED** | Exact trace-Gram and squarefree-relative-discriminant checks give the field discriminant; Milne V.3.27/Remark V.3.28 supplies the conductor-discriminant step. |
| C6 | The quartic character is chi5(n) times Legendre(n,163); arithmetic Frobenius is sigma^(-k) when chi(p)=i^k | **WRITTEN RECIPROCITY DEDUCTION** | `DIRECTOR_SPLITTING_LAW.md`; conductor-815 classification, orientation at 3, third independent review. The 166 splitting and 165 p-power checks are finite controls of the written law. |
| M1 | The modular-inversion matrix squares to (1+c0)I | **EXTERNAL THEOREM + EXACT ALGEBRA** | Duke Proposition 2 gives the transformation. The independent certificate verifies the matrix and cyclotomic identities. Its normalization is coordinate-specific. |
| B1 | The selected compact witness is negative for u>1, fixing the small negative t root | **EXACT INTEGER CERTIFICATE** | `DIRECTOR_CERTIFICATE.md` and `verification/director_certificate.py`; the phase/product evaluation remains a separate numerical diagnostic. |
| D1 | The chosen analytic branch has (\arg(r)/\pi=0.2), (t<0) | **NUMERICAL DIAGNOSTIC** | 260-digit product evaluation in `RESULTS.json`; it is not used for field equality or the polynomial certificate. |
| G1 | The Artin layer has an inert-prime extension pattern | **BOUNDED WRITTEN STATEMENT** | It applies to inert 5 with only (±1) units, after the standard ray/ring sequences. It does not assert a universal (w_D). |
| O1 | An intrinsic HMR bridge, RH consequence, first-discovery claim, or publication readiness | **NOT CLAIMED** | Outside the scope of this packet. |
| O2 | A new formula or bound for the near-integer error of exp(pi sqrt(163)) | **OPEN** | The algebraic golden layer and its Artin action are established; a new analytic error relation has not been obtained. |
