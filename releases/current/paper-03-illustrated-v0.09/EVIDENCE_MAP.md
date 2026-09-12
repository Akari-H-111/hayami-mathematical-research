# Paper III figure and evidence map

The current manuscript is paper_III_spectral_floor_v0_09.tex. Its mathematical
body is byte-identical to the preserved v0.08 after removing delimited editorial
additions and reversing the edition and explicitly requested author-name updates.
The cited v0.08 companion editions remain available in the existing three-paper
archive. This package does not replace or revise those companions.

| New figure | Supplied round6 figure | Manuscript location | Finite evidence |
|---|---|---|---|
| 1, master pipeline | 1 | Introduction; stable assembly theorem | v0.03 end-to-end model; v0.57--v0.61 |
| 2, invariant tilt floor | 2 | Normalized-tilt spectral-floor theorem | v0.57; v0.02 two-witness and zero-space checks |
| 3, stable-core floor | 3 | Stable-core theorem for the unchanged orbit | v0.03 same-orbit, noncyclic Jordan and multiple-output checks |
| 4, landing and future outputs | 4 | Local-descent / future-output proposition | v0.58; v0.02 missing-descent and v0.03 local/future-output checks |
| 5, generated source | 5 | Minimality and functoriality | v0.59; v0.03 generated-seed coverage |
| 6, syzygies and effective algebra | 6 | Effective-algebra comparison | v0.60 and v0.61 |
| 7, finite stable assembly | 7 | Stable assembly theorem | v0.59 closure ranks; v0.61 algebra; v0.03 end-to-end model |
| 8, exact noninvariant floor | 9 | Exact noninvariant-normalization example | v0.03 two cyclic rational witnesses with gcd S-2 |
| 9, marked realization | 10 | End-to-end marked example | v0.03 chain-map, homology, seed and landing identities |
| 10, marked scope boundary | 8 | Scope boundary; reconstruction model | v0.61 algebra dimensions 4/10, conjugacy and contractible summands |

The five stage scripts are in evidence/verification/part_III/. The recovery
entry point is evidence/verify_proof_recovery_v0_03.py; it imports
evidence/verify_revision_claims.py, whose cubic helper and certificate remain
under evidence/verification/part_II/. These files are unchanged copies of
existing portable evidence. Historical helper contents are not new claims.

Run `python -B verify_evidence.py`. The six logs and SHA256-bound script records
are written under qa/. They establish the listed finite exact models and
identities; general theorems are supported by the preserved manuscript proofs.
This is not proof-assistant formalization, independent peer review, publication,
or a fresh replay of Paper I's high-arity v0.05/v0.06 constructions.
