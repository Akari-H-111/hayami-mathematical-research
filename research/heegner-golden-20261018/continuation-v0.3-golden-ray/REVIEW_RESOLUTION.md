# Independent review resolution — 2026-10-19

Three fresh read-only Codex CLI invocations selected gpt-5.6-terra with high reasoning effort. The primary researcher selected the same requested model with max reasoning effort. The director also performed independent exact computations with the registered Python -B runtime. Selected-model execution metadata is recorded in logs/MODEL_PROVENANCE.json; it is not an attestation about backend identity.

## Radical, field and modular mechanism

Review report: logs/director-review.md. Frozen inputs and expected SHA-256 values: logs/DIRECTOR_REVIEW_INPUT_HASHES.json and logs/director-review-snapshot/.

All four audit items PASS: exact cubic/rational radical identity, positive-sqrt(5) branch and negative w sign; ray/ring class-field identification using Cais–Conrad and inherited CM facts; Duke's modular-inversion law and its cyclotomic normalization; and the distinction between algebraic results and the open exponential-error question. The reviewer recomputed the residual and sign checks independently in memory and inspected the frozen primary PDFs.

The reviewer noted that the short frozen director note did not separately declare an expected Cais–Conrad PDF hash. The source file was already bound by the review input manifest; the live core verifier additionally pins the PDF and extracted text hashes. logs/DIRECTOR_SOURCE_HASHES.json now explicitly records all three director-source PDFs. This was a provenance presentation issue, not a changed mathematical claim.

## Quartic, integral model and conductor

Review report: logs/quartic-review.md. Frozen inputs and hashes: logs/QUARTIC_REVIEW_INPUT_HASHES.json and logs/quartic-review-snapshot/.

All four audit items PASS: irreducibility and cyclic automorphism; integral basis, squarefree relative discriminant, maximal order and trace determinant; application of Milne V.3.27/Remark 3.28 to conductor 815; and the scope of the general d construction versus the certified CM embedding. The reviewer independently replayed the exact calculations and matched all six frozen input hashes.

A standalone-clarity suggestion was applied after review: DIRECTOR_QUARTIC.md now explicitly repeats c0=phi^-2=2-phi when defining the selected positive delta. This single-sentence clarification does not change the reviewed script, constants or claims. The frozen original remains unchanged. The explanatory pentagon paragraph in FINAL_REPORT.md is an elementary trigonometric rewrite of the reviewed cyclotomic radical.

## Character and oriented Artin action

Review report: logs/splitting-review.md. Frozen inputs and hashes: logs/SPLITTING_REVIEW_INPUT_HASHES.json and logs/splitting-review-snapshot/.

All four items PASS: the conductor-815 character classification; orientation by arithmetic Frobenius at 3; exact multiplicativity on all 648 units and the finite prime controls; and external-theorem/finite-check/novelty boundaries. All seven frozen input hashes and the generated JSON were checked. The reviewer suggested explicitly separating the counts: 166 splitting types and 165 p-power comparisons, since the prime 2 uses the integral polynomial only. That wording clarification is applied to the live splitting note without changing its reviewed script or proof. The universal character statement comes from the written reciprocity deduction, not an inference from the finite controls.

## Failure handling and boundaries

The first exploratory reconstruction chose the wrong radical sign. Its failed numerical output is retained under logs/DIRECTOR_BRANCH.json; the exact sign proof and stable corrected reconstruction are recorded separately. An initial extended-quartic run passed its exact assertions but failed when serializing SymPy Integers to JSON; explicit int conversion repaired that output step. See logs/DIRECTOR_FAILURES.md. Neither failure is omitted or counted as a successful diagnostic.

The director also corrected the primary mathematics note's cyclotomic sign convention: with sqrt(-163)=i sqrt(163) and zeta=exp(2 pi i/5), the positive radical is -sqrt(-163)*(zeta^2-zeta^-2). The earlier plus sign generated the same field but conflicted with the later positive-delta convention. See logs/DIRECTOR_CORE_REVIEW.md. No polynomial certificate or field equality changed.

The class-field, conductor and Artin conclusions are written deductions using established external theorems. Exact scripts verify the displayed algebra, integer comparisons, finite residue-field calculations, trace determinant and finite splitting controls; they do not constitute Lean proofs of those external theorems. Numerical branch checks and the earlier 166-prime exploratory JSON retain their original diagnostic/finite labels.

The exp(pi sqrt(163)) near-integer error has no new formula or bound in this packet. Historical novelty has not been established. Previous checkpoints, sealed releases and unrelated dirty research are preserved; no commit, push or publication is performed.
