# Claim ledger: Stokes caustic v5

Working-source Lean extension verified 2026-09-30. The authoritative PDF and
published companion archives are unchanged. Lean paths below are relative to
`companions/lean/stokes-caustic-v5/`; construction and exact domain restrictions
are in `COORDINATE_PROOFS.md`.

The complete asserted-results map is `FULL_PAPER_COVERAGE.md`. In addition
to the geometric claims below, `Expansions`, `RadialExpansions`,
`JacobianExpansion`, `ExceptionalJet`, `OrdinaryJet`, `FoldObstruction`,
`PaperGeometry`, `SturmData`, `Auxiliary`, `NumericalBounds` and `Skeleton`
formalize the displayed remainders, actual exceptional no-fold obstruction,
ordinary four-jet/rescaling, definitions/image decomposition, fixed Sturm
variations, auxiliary maximum/irreducible quintic and rational decimal bounds.
Open exceptional-germ classification and versal unfolding remain open.

| PDF location | item | reconstruction status | verification target |
| --- | --- | --- | --- |
| p. 2, Thm. 2.1 | full Jacobian factorization and `C0` plus `C1` decomposition | Lean-passed on `Q>0`, including the physical strip; CAS-passed independently | `StokesV5/ObservationMap.lean`; `StokesV5/PhysicalLocus.lean`; `verification/verify_exact_geometry.py` |
| p. 2, Prop. 2.2 | rational critical branch away from `s=0` and `B(c)=0` | Lean-passed; explicit exact witness distinguishing the component-zero curve | `physical_foldEquation_iff`; `componentZero_not_rational_branch`; exact CAS verifier |
| p. 3, Prop. 2.3 | unique `cb` and physical rational-fold interval `cb <= c <= 1` | Lean-passed over all `[0,1]`, interval, endpoints and exact rational decimal enclosure | `StokesV5/RootBarriers.lean`; `StokesV5/PhysicalLocus.lean`; `StokesV5/NumericalBounds.lean` |
| pp. 3--4, Thm. 2.4 | ordinary folds and exceptional intersection | Lean-passed actual smooth local normal forms on both ordinary branches, actual exceptional no-fold obstruction, transverse tangents and displayed remainders | `LocalNormalForm`; `RationalNormalForm`; `FoldObstruction`; `JacobianExpansion`; `PaperGeometry` |
| p. 4, Def. 2.5 | observation discriminant is the critical-value image | Lean-encoded definition and complete physical image equality | `physicalDiscriminant`; `full_physical_discriminant`; distinct from radial image |
| pp. 4--5, Prop. 2.6 | two critical-value branches and tangency at `(0,1)` | Lean-passed images, endpoint, tangent, quadratic contact and full delta Big-O displays | `StokesV5/Discriminant.lean`; `StokesV5/Expansions.lean`; no global injectivity claim |
| p. 6, Def. 3.1 and Rem. 3.2 | normalized spherical radial fold map; three-map separation | Lean-encoded actual normalization, surface restriction and translation contrast with Gauss map | `RadialGeometry`; `PaperGeometry`; non-negotiable scope boundary |
| pp. 6--7, Thms. 3.3--3.4 | common endpoints and regular radial starting point | Lean-passed actual normalized vectors, nonzero derivative `(0,1,0)` and all three Taylor component remainders | `StokesV5/RadialGeometry.lean`; `StokesV5/RadialExpansions.lean` |
| p. 8, Thm. 4.1 | monotone third spherical component and boundary maximum | Lean-passed strict monotonicity and unique maximum for the actual radial map, linked to the `t` curve | `StokesV5/RadialMonotonicity.lean`; `StokesV5/RadialGeometry.lean`; exact root-free `Q17` proof |
| pp. 8--9, Rem. 4.2 and disposition table | boundary is not automatically a caustic/APS/spinorial object; earlier claims disposition | PDF-locked limitation | negative-scope checklist |
| p. 10, Appendix A | standard-library certificate data | Lean kernel exact fixed Sturm variations and Q17 polynomial/derivative identities; independent scripts also replayed | `StokesV5/SturmData.lean`; `RadialMonotonicity`; exact geometry/Sturm scripts |

No statement from the earlier ruled-surface draft may be used to collapse the three maps distinguished by this paper.
