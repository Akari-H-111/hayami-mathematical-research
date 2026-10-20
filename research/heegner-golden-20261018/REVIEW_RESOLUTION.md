# Local review resolution

Date: 2026-10-18 (Asia/Taipei). This is a local mathematical research checkpoint,
not a publication, a proof-assistant certificate, or a worldwide novelty verdict.

## Review outcome

The requested worker and both fresh read-only reviewers were launched with
exact model gpt-5.6-terra. Session IDs and completion evidence are in
`logs/final-session-provenance.json`; the selected research model is also
verified from its CLI turn context in `logs/worker-model-evidence.json`.

- The full review found the packet mathematically sound at its stated scope:
  branch conventions, coprime norm factorization, rational isolation, sextic
  field tower, information loss, and finite rational spectral obstruction.
- The focused review independently recomputed the residual cubic coefficients,
  discriminant and conjugate identity, irreducible factor degrees, and analytic
  branch selection. Its S3 and quadratic-resolvent conclusions passed.
- Raw reviews are preserved in `logs/fresh-review.md` and
  `logs/resolvent-review.md`; they are local evidence, not peer review.

## Resolved precision findings

1. The spectral no-go now explicitly concerns a unital representation on a
   nonzero finite-dimensional Q-vector space, then scalar extension to R. A
   selected real embedding acting as a real scalar is explicitly not excluded.
2. Duke Theorem 3 is attributed to the standard r(tau) for algebraic tau in
   the upper half-plane, not the phase-stripped real s-branch.
3. Source descriptions now refer to the recovered full Duke author PDFs;
   the worker's earlier DNS failure remains preserved in the CLI log.
4. The degree comparison proving Q(sqrt(5)) is contained in Q(u), with relative
   degree3, is written explicitly in DIRECTOR_FINDING.md.
5. The cubic resolvent is stated to contain the original imaginary quadratic
   field. It does not uniquely select it without the original CM mark:
   -163 and -815 are the same square class over Q(sqrt(5)).
6. Galois-group/resolvent entries in the JSON are labelled written consequences
   of the checked irreducibility and discriminant, not a separate automated
   Galois-group computation.

## Verification and preserved failures

The main checker passed the universal sextic identity, exact norm factors and
coprimality, certified -163 t/s branch isolation, thirteen CM-order controls,
j=1,2 countercontrols, and independent 100/200-digit product/continued-fraction
diagnostics for -163. The director checker separately passed the field tower,
trace-form signature(4,2), exact reduced-form enumeration, and cubic
discriminant certificate. Commands are in README.md and DIRECTOR_FINDING.md.

The first CLI research attempt hit its usage limit before delivering files;
its raw log and failure record remain. The successful worker's first numerical
control run exposed a precision-context error. It was corrected and replayed
successfully; the failed run remains in the CLI event log. Early exploratory
serialization/API errors were not used as mathematical evidence.

HMR navigation/source-integrity checking passed. Git status outside this
packet matched the initial HMR and RH inventories; that is a status comparison,
not a new byte-level audit of every unrelated file. No source manuscript,
sealed PDF, receipt, board or Lean project was edited. No commit or push.

## Remaining research

The explicit ring-class-field identification, genus-character normalization,
worldwide novelty, and any intrinsic map into HMR geometry or the zeta Weil
form remain open here. The full reviewer supplied the concrete next target:
verify the X0(5) eta-quotient direction and identify Q(u) with
Q(j(5*tau_163)), then use the conductor-5 order of discriminant -4075.

The wider HMR/RH archive was surveyed at the stated entrypoint depth rather
than fully peer-reviewed. Existing full research verifiers, Lean builds, and
a clean-machine dependency installation were not rerun.
