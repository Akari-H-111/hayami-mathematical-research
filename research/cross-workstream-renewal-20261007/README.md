# 2026-10-07 New round of research results

> English edition of the original Traditional Chinese report (original
> SHA-256 `9305d9adfa361ccc2e5ba693b199e40a2662c17d23661ee2f99690a6b39e8f41`),
> prepared on 2026-10-07 to follow the rule that all externally published or
> shared content is written in English. The translation is faithful; the
> mathematical content is unchanged. Statements describe the state at the time
> of the original report (for example "no commit, push or public operation");
> later events are recorded in the
> [save note](../cross-workstream-save-20261007/README.md).

This round carried out derivations, constructions, code and new-data
experiments. The starting point is restored from the current source drafts:
RH-SPIRAL v1.2.1 (the optimal exponent / rightmost zero bound and the external
Lean 7/8 result already exist), the GIR covering tower and the catalogue prime
kernel, and the AHR sampling-alias diagnostics. What follows is what this round
added. No finite computation was treated as a general proof, and no old draft,
PDF, sealed archive or upstream formalization result was modified.

## RH: the sign criterion is completed, and a counterexample for higher-order heat moments is found

[Full proof and replay](/Users/akari_hayami_64/RH-SPIRAL/research/heat-sign-and-resolution-20261007/README.md).
Let E_j = K_j - B_j, where K_j uses the same prime-shell spectrum and kernel
(t p(p+1))^j e^(-t p(p+1)) as the current manuscript.
New written theorem: E_0 keeping a constant sign at all sufficiently small
scales is **equivalent to RH**; under RH it actually stays negative. The
centered running dimension keeping a constant sign at all sufficiently small
scales is likewise equivalent to RH, and under RH it is positive. The converse
direction uses Landau's theorem for the Mellin transform together with an
analytic continuation that has no zeros on the real axis; it does not infer
anything from finite-scale signs. For the forward direction a rational upper
bound is also given that does not depend on an approximate sum over 100 zeros.
This applies the classical oscillation method; it does not claim a new general
Landau theory or a proof of RH.

A more substantive counterexample: for **every fixed integer j>=40**, E_j
unconditionally takes both positive and negative values at arbitrarily small
scales. The proof first derives RH from constant sign, and then, under RH,
excludes constant sign because the Bohr coefficient of the first zero is larger
than the mean; no simplicity or linear-independence conjecture for the zeros is
needed. For j=40 the amplitude of the first pair of zeros relative to the
square bias is about 2.158, whereas for j=0 it is only 0.0002013. Raising the
resolution therefore changes the sign mechanism, and the j=0 criterion cannot
be transplanted directly. 147 finite heat-moment samples and three
high-precision recomputations support this observation, but the general
conclusion is given by the written proof.

The small-u range of the DCT bound in section 7 was also repaired: the correct
exponent for j=0 is 3/8, not the 5/8 drafted in the review; the derived limit
still holds. The gamma-decay scale for off-line zeros has been written as a
computable model; low-height examples are explicitly marked as formal examples
excluded by the existing finite-height RH verifications, and are not treated as
possible actual zeros. The theorems of this round have not yet had independent
peer review or new Lean formalization.

## GIR: the n-energy is derived from an inter-sheet action, and a finite heat trace is obtained

[Construction, general proofs and 114 checks](/Users/akari_hayami_64/RH-SPIRAL/research/gir-fiber-action-20261007/README.md).
On the fiber of the actual n-sheeted cyclic cover, add a non-local action that
counts each pair of sheets once at unit cost,
q_n = Σ_(a<b) |v_a - v_b|², which yields exactly V_n = n(I - E_n). The energy n
comes from summing the action, not from a presupposed spherical shell or from
back-solving a target dimension; the unit cost and the choice of sum are
themselves an explicitly declared model convention. The normalized pullback
along intermediate covers satisfies V_n U_(n,b) = (n/b) U_(n,b) V_b.

The direct sum of the constant-free fibers has a self-adjoint closed operator,
compact resolvent and the exact finite heat trace e^(-2t)/(1 - e^(-t))².
Keeping one character line with the complete phase specification gives, for each
n, one copy of the energy n; the existing intermediate-cover incidence then
selects the prime kernel, which gives a new linear prime heat trace
Σ_p e^(-tp) whose optimal fluctuation exponent is 1 - Θ. Citing the upstream
7/8 gives a decay exponent of 1/8; this changes the observable and does not
improve the zero-free region of ζ.

On any fixed **compact regular GIR core** with piecewise smooth boundary, D/N
bracketing after cutting gives a heat-trace bound that is uniform over all
characters, so with the inter-sheet action included the heat trace of the whole
geometric direct sum is finite. For all nontrivial characters / one character
per degree / one character per prime, the leading running dimensions are
6 / 4 / 4 respectively. Uniform estimates at the cross-caps and the outer
boundary of the full punctured GIR locus remain the next concrete analytic
problem; the result for the regular core is not extended to the global setting,
which is not yet proved.

## AHR: the sampling improvement is newly confirmed, and the positive and negative joint-phase results are both preserved

[New entry point in the private research repository](/Users/akari_hayami_64/Documents/adaptive-harmonic-reconstruction/research/joint_phase_support/README.md).
This round ran two batches, each frozen before confirmation, with 3,136 new
synthetic cases in total; development data may be reused, and the confirmation
seeds of the two batches are disjoint from each other and from the development
set. In the near f0=8000/29 groups of the two batches (128 and 64 cases), the
gcd errors of the odd-even split, 89 / 40, drop to 0 / 0 for the aperiodic
split. This is a sampling comparison at equal waveform and equal sample count;
it does not claim to beat full-sample static. The full invariant lattice also
proves that [6,10,15] needs two saturated basis invariants, of degrees 5 and 7;
a single fifth-order feature cannot see u_6, and no collection of phase
invariants can identify a common integer multiple scaling of the labels.

In the 512 weak-harmonic cases of v0.03, the reconstruction MSE difference of
signed joint relative to raw is -2.0591e-4, with an individual paired 95%
interval [-3.6623e-4, -6.1215e-5], about 1.56% lower; the interval for
gcd 79→77 still crosses zero. The pure-noise confidence upper bound of signed,
3.055%, slightly exceeds the preset 3%. For the new projective-axis squared
statistic the noise upper bound, 2.533%, passes, but its reconstruction is worse
than signed: the difference +1.5560e-4 has an interval that does not cross
zero. Both sides of this result are preserved; no claim of full-gate success or
of a universal advantage is made.

From the failure a **training-weighted soft-root mixture e-value** is derived:
for each root, the product of the noncentral-t density ratios of its independent
windows, then mixed with training weights; the conditional expectation is
exactly one, and Markov plus Bonferroni controls the null risk. A positive
chi-integral representation and an executable prototype were added, repairing
the partial tail NaN of the installed SciPy; the root weights have not been
fitted and no waveform performance confirmation has been done. This
construction keeps the uncertain sign information and provides a concrete next
step that interpolates continuously between the single root and the
equal-weight phase axis.

## Verification and continuation

At the start of this round the following passed: the current-draft verifier
(27 exact identities, sieve to 10^7, comparison with old results), the AHR
original drift sealed replay (1,760 cases and 48×4 outputs), and the 30-item GIR
covering baseline. The read-only replays of the two new RH/GIR result files,
the AHR full-row re-aggregation of both batches, and the 9×4 / 9×5 output
replays also all passed. General mathematical theorems rest on the proofs in the
documents; the programs verify only the listed finite / exact content. The
environment is the registered Python 3.12.14 with assertions enabled and no new
packages installed.

The most worthwhile continuations now are: (1) controlled errors and
finite-scale observations for higher-order heat moments; (2) a global cut-cell
heat bound for GIR, or whether a sparser action still preserves the energy
growth; (3) training of AHR soft-root weights and calibration of signal-drift
mismatch. One can start directly from the proofs, full rows, failure records and
read-only commands of each new entry point. These data and models are all
registered, so later performance claims need a separate freeze / new data.

Complete local hashes and the execution scope are in the
[receipt](RECEIPT.json); this round made no commit, push or public operation.

Read-only check of sources, archives and seeds:

```sh
/Users/akari_hayami_64/Documents/hayami-mathematical-research/the-Self-Adjoint-Arithmetic-Mellin-Transform/post_s11_discovery/.venv/bin/python -B \
 /Users/akari_hayami_64/Documents/hayami-mathematical-research/research/cross-workstream-renewal-20261007/verify_receipt.py
```
