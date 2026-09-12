# Claim ledger: Stokes caustic v5

| PDF location | item | reconstruction status | verification target |
| --- | --- | --- | --- |
| p. 2, Thm. 2.1 | full Jacobian factorization and `C0` plus `C1` decomposition | CAS-passed on `Q!=0` | `verification/verify_exact_geometry.py` |
| p. 2, Prop. 2.2 | rational critical branch away from `s=0` and `B(c)=0` | CAS-passed | factorization in the same verifier |
| p. 3, Prop. 2.3 | unique `cb` and physical rational-fold interval `cb <= c <= 1` | CAS-passed | `verification/verify_sturm_certificate.py`: exact Sturm count and rational isolation |
| pp. 3--4, Thm. 2.4 | ordinary folds on `C0` for `u>0`, ordinary signed arms away from the meeting point, and exceptional intersection | CAS-passed for displayed determinants and root-free factors | both verifiers |
| p. 4, Def. 2.5 | observation discriminant is the critical-value image | PDF-locked definition | preserve separately from the source critical locus and radial image |
| pp. 4--5, Prop. 2.6 | two critical-value branches and tangency at `(0,1)` | re-derived / finite expansion | source TeX proof plus exact local expansion; not a global injectivity claim |
| p. 6, Def. 3.1 and Rem. 3.2 | normalized spherical radial fold map; three-map separation | PDF-locked | non-negotiable scope boundary |
| pp. 6--7, Thms. 3.3--3.4 | common endpoints and regular radial starting point | CAS-passed | `verification/verify_exact_geometry.py` |
| p. 8, Thm. 4.1 | monotone third spherical component and boundary maximum | CAS-passed | derivative factor plus exact root-free `Q17` certificate |
| pp. 8--9, Rem. 4.2 and disposition table | boundary is not automatically a caustic/APS/spinorial object; earlier claims disposition | PDF-locked limitation | negative-scope checklist |
| p. 10, Appendix A | standard-library certificate data | reproduced | the local verifier is split into exact geometry and exact Sturm scripts |

No statement from the earlier ruled-surface draft may be used to collapse the three maps distinguished by this paper.
