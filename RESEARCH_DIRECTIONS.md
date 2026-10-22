# Confirmed research directions

Updated: 2026-10-03

This file records research lines confirmed by existing results and user
decisions. Bridges that are not yet proved are listed only as research
questions; they are not promoted to general theorems in advance.

## A. Inverse-Leibniz series

### A1. Filtered complexes to the character-torus Diophantine locus

This direction is now a separate research line and is not merged into the
current main theorems of Papers I–III.

The goal is: first choose a class of filtered complexes with explicit marking,
norm, and filling/nonextension invariants; then construct a concrete map to a
specified character torus; prove it is bi-Lipschitz with explicit constants;
finally identify the image with a precise Diophantine locus.

Research gates, in order:

1. Fix the source category, equivalence relation, metric, and
   filling/nonextension data.
2. Fix the character torus, distance, coordinates, and Diophantine locus.
3. Give computable forward and inverse maps.
4. Prove injectivity/surjectivity or describe the image exactly.
5. Prove the two Lipschitz constants and test sharpness with finite models.
6. Only after 1–5 are complete, discuss theorem-level integration with Papers
   I–III.

Before then, do not write the three layers "filtered complex → marked spectral
data → Diophantine locus" as one general theorem, and do not treat a renamed
overlap as a bridge proof.

### A2. Stability beyond a fixed contraction

Using v0.05/v0.06 as finite models, study which higher-order vanishing,
nonvanishing, and feedback-rank data persist under which comparison morphisms,
markings, or contraction classes. Look first for counterexamples and minimal
necessary hypotheses; do not claim unmarked invariance in advance.

### A3. Algorithmic generalization of Paper III

Organize stable-core closure, local/global landing descent, the future-output
quotient, and spectral-floor computation into a finite-dimensional algorithm;
first prove termination and representation-independence of the output, then
consider more general filtered/graded inputs.

## B. Legacy geometry series

### B1. Complete Whitney-fold formalization of Stokes v5

This is currently the highest-priority internal mathematics line. First complete
the explicit Fréchet derivative and Jacobian factorization, then prove the
rank-one and kernel transversality of the ordinary branches and the exceptional
status of the common starting point, and finally formalize the plane-to-plane
fold criterion or an equivalent local normal form. See `LEAN_ROADMAP.md`.

### B2. Corrected Ruled surface v4

First build a legitimate atlas for the `Q=0` boundary or restrict the theorem
explicitly to the interior `Q>0`; then restate Theorem 5.3 as a provable
proposition with retracing/symmetry and phase-lock hypotheses. Do not carry out a
whole-paper Lean migration before the corrected draft is complete.

### B3. Bicomplex (successor papers v1 published; the following are open directions, with no mandatory next step)

2026-10-03: all 66 named blocks in v12 have been checked and classified
(H 43, C 13, S 1, R 3, O 2, M 3, D 1; Paper I Appendix A.3); both successor
papers and software 1.0 were published on 2026-10-02. For DOIs, evidence types,
and replay commands, see "Start here" in
`papers/legacy-geometry/bicomplex-signal-manifolds/README.md`. The old
"process in four layers according to `claims/MODULE_INDEX.md`" was a
pre-publication modularization plan; it has been superseded by the 66-block
audit and the two papers; the original v12 claims are no longer proof targets.

Already decided, not open: a readout along C₀ real-analytic does not exist
(C^∞ and half-source analytic readouts exist but are not canonical);
`i*Ψ^!Z ≅ Z[−1]`, the ±1 sector on the constant sheaf, "sheet exchange equals
sign change of √F", and the original compact-core H₀ (2,2)/Markov
uniqueness/two-dimensional Krein kernel have all been refuted or withdrawn. The
historical moment-map derivation has not been recovered; the new construction is
not a recovery.

Genuinely open (no priority order): actual singular Dirac/Pin (closed operators,
graph domains, singular cut traces, Clifford-compatible transmission); a new
bridge from sheaf data to analytic operators (requiring a new sign-twisted or
spinorial target); Paper I questions (whether there is a quadratic readout on
the original-power half source; the principle for choosing a non-analytic
readout); Paper II questions (explicit regular part of B_η, the ρ log(1/ρ) rate
and next term for arbitrary Whitney germs, the Weyl law for H_F and the
heat-trace contribution of each cross-cap, cuspidal edge, and S_k^±
singularities); propositions that genuinely require bicomplex multiplication;
independent signal/physical models (capacity, mass, clock, chirality); a
complete literature comparison for originality and priority; Lean formalization
of analytic and operator proofs. See "What is genuinely open" in the README.

## C. Closeout criteria

A research line is marked `READY TO CLOSE` only when all of the following hold:

- theorem statements, hypotheses, and negative scope are complete;
- the corresponding symbolic/CAS/Lean/finite-model entry points actually pass;
- the main text, figures, verifiers, and release manifest can locate each other;
- after recompiling the PDF, visual QA and SHA-256 have been rebound;
- external claims distinguish manuscript proof, CAS certificate, Lean theorem,
  and invoked external theorem precisely;
- no known blocker remains that would change the main conclusion.

If the remaining questions have become independent research questions and the
current draft's claims and evidence are closed, close the current draft and start
a separate research line; do not extend the same paper indefinitely.
