# Paper II illustrated edition: evidence map

Author: Akari Hayami (Jian-Yu Huang). Edition v0.09, 2026-09-08.

The mathematical body is preserved from v0.08. The scripts below are unchanged copies from the v0.08 three-paper companion. They are replacement computational checks, not claims to have recovered the absent historical v0.48 JSON or v0.53 helper. The copied v0.33 cochain certificate is in `evidence/verification/part_II/`.

| Manuscript claim / figure | Local evidence |
|---|---|
| Cubic support, weak axes, U16, saved homotopy values (Figures 1–2) | `evidence/verification/part_II/verify_cubic_support_multigrading_v0_47.py` |
| 19-dimensional forced domain and 7-dimensional recurrent envelope (Figure 2) | `evidence/verification/part_II/verify_extension_independent_forced_core_v0_49.py` |
| Stable recurrent image and selected characteristic polynomial (Figures 2–3) | `evidence/verification/part_II/verify_intrinsic_partial_contraction_forced_core_v0_50.py` |
| Bounded partial-contraction comparisons | `evidence/verification/part_II/verify_partial_contraction_comparison_v0_51.py` |
| Closed source intersection, 42-dimensional internal orbit, contrasting spectra and S+2 floor (Figure 3) | `evidence/verification/part_II/verify_homotopy_tilt_quotient_v0_54.py` |
| Full constrained differential; source/cycle/boundary intersections; g3 identities and splitting dependence; maximal response domain (Figures 2, 4–5) | `evidence/verify_proof_recovery_v0_03.py` |
| Typed naturality and the independent four-generator cancellation model (Figures 6–7) | `evidence/verify_revision_claims.py`, called by the v0.03 recovery script |
| Corrected block form, 42 free coordinates, noninvariant complement witness, characteristic/minimal gcd and cancellation equation | Additional regressions in `verify_evidence.py` |
| Exact original-body preservation, authorized author expansion, figure captions/references, PDF bounds, vector content and evidence log hashes | `verify_integrated.py`, reusing `evidence/verify_pdf_outputs.py` |

Run `python -B verify_evidence.py` for all six finite-evidence entry points. Its JSON report records each script and log hash. Some unchanged recovery checks also verify Paper I/III examples; the runner does not re-run Paper I's high-arity v0.05/v0.06 completion certificates.

The all-n rail identity follows from the manuscript eigenrelation, not sampled n-values. General descent and naturality statements remain manuscript proofs; finite checks are supporting evidence.

For the full three-paper provenance and the earlier high-arity certificates, use the preserved `three_papers_v0_08_bundle.zip`, referenced by the manuscript bibliography. That broader archive is not duplicated here. No public deposit or new historical-data recovery is asserted.
