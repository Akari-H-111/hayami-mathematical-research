# Established research directions

Updated: 2026-10-03

This document records research lines established by existing results and user decisions. Unproved bridges remain research questions, not premature general theorems.

## A. Inverse-Leibniz series

### A1. From filtered complexes to a character-torus Diophantine locus

This is a separate research line, not part of the current main theorems of Papers I–III.

First select filtered complexes with explicit marking, norm and filling/nonextension invariants. Construct a concrete map into a designated character torus, prove it bi-Lipschitz with explicit constants, and identify its image with an exact Diophantine locus.

Research gates, in order:

1. Fix the source class, equivalence relation, metric and filling/nonextension data.
2. Fix the character torus, distance, coordinates and Diophantine locus.
3. Give computable forward and inverse maps.
4. Prove injectivity/surjectivity or describe the image exactly.
5. Prove both Lipschitz constants and test sharpness on finite models.
6. Discuss theorem-level integration with Papers I–III only after 1–5.

Before then, do not assert the three layers “filtered complex → marked spectral data → Diophantine locus” as one general theorem, or treat renamed overlap phenomena as a bridge proof.

### A2. Stability beyond a fixed contraction

Use v0.05/v0.06 finite models to study which higher-order vanishing, nonvanishing and feedback-rank data persist under specified comparison morphisms, markings or contraction classes. Seek counterexamples and minimal necessary assumptions first; do not presume unmarked invariance.

### A3. Algorithmic extensions of Paper III

Organize stable-core closure, local/global landing descent, future-output quotients and spectral floors as finite-dimensional algorithms. Prove termination and conditions for representation-independent output before extending to general filtered/graded inputs.

## B. Legacy geometry series

### B1. Complete Whitney-fold formalization of Stokes v5

This was the highest-priority internal mathematics line: explicit Fréchet derivative and Jacobian factorization, ordinary-branch rank one and kernel transversality, exceptional common endpoint, then plane-to-plane fold criterion or equivalent local normal form. See `LEAN_ROADMAP.md` for its subsequent completed status.

### B2. Corrected ruled surface v4

Establish a valid atlas at the `Q=0` boundary or explicitly restrict theorems to the `Q>0` interior. Replace Theorem 5.3 with a provable statement including retracing/symmetry and phase-lock assumptions. Do not port the entire paper to Lean before correction.

### B3. Bicomplex (successor papers v1 public; open directions below, no mandatory next task)

2026-10-03: all 66 named v12 blocks checked and classified (H 43, C 13, S 1, R 3, O 2, M 3, D 1; paper one Appendix A.3). Two successor papers and software 1.0 were published on 2026-10-02. DOIs, evidence types and replay commands are in the Bicomplex README “Start here.” The earlier four-layer plan in `claims/MODULE_INDEX.md` was superseded by the 66-block audit and two papers; original v12 claims are not pending proof targets.

Resolved, not pending: no readout real-analytic along C₀ exists (C^∞ and half-source analytic readouts exist, but are not canonical); `i*Ψ^!Z ≅ Z[−1]`, ±1 sectors of the constant sheaf, “sheet exchange equals √F sign change,” and original compact-core H₀ claims of (2,2) deficiency / Markov uniqueness / two-dimensional Krein kernel are refuted or withdrawn. Historical moment-map derivation is unrecovered; new construction is not recovery.

Open, without priority order: actual singular Dirac / Pin (closed operators, graph domains, singular cut traces, Clifford-compatible transmission); a new bridge from sheaf data to analytic operators (new sign-twisted or spinorial targets required); paper-one questions (quadratic readout on half sources at original powers, principles for choosing nonanalytic readouts); paper-two questions (explicit regular part of B_η, ρ log(1/ρ) rate and next term for arbitrary Whitney germs, Weyl law of H_F and cross-cap heat contributions, cuspidal edges and S_k^± singularities); propositions requiring bicomplex multiplication; independent signal / physical models (capacity, mass, clock, chirality); full literature comparison of originality / priority; Lean formalization of analysis and operator proofs. See README “What is genuinely open.”

## C. Closure criteria

A line is `READY TO CLOSE` only when all conditions hold:

- Complete theorem statements, assumptions and negative scope;
- Actual passes at corresponding symbolic/CAS/Lean/finite-model entry points;
- Manuscript, figures, verifiers and release manifest cross-locatable;
- Renewed visual QA and SHA-256 bindings after PDF compilation;
- External claims distinguish manuscript proof, CAS certificate, Lean theorem and invoked external theorem;
- No known blocker that would change the main conclusion.

When remaining issues form independent research questions and the current manuscript's claims / evidence are closed, close that manuscript and start another line rather than indefinitely extending one paper.
