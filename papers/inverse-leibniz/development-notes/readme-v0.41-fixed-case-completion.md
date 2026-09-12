# v0.41 fixed-case completion

This directory now contains a fixed-case completion candidate for the inverse Leibniz paper.  The scope is deliberately frozen at the cubic example and its verified finite spectral extension.  The abstract problem with a general homogeneous multiplicity vector

\[
m_A(S)=\prod_\lambda(S-\lambda)^{e_\lambda}
\]

is recorded as the next research problem, not silently treated as proved by the fixed example.

The original `inverse_leibniz_problem_progress_v0_41.tex` and its PDF are preserved.  The edited candidate is `inverse_leibniz_problem_v0_41_fixed_case_completion.tex`.

## Reproducibility

The exact verifiers use Python's standard library plus SymPy.  With an environment containing the pinned dependency in `requirements-repro.txt`, run:

```sh
python verify_fixed_case_v0_41.py
```

The runner executes the verifiers in historical order:

- v0.32: railwise equality of frozen $Y_{17}$ prediction and independent arity-22 data;
- v0.34: all-order residual-module identities;
- v0.36: finite residual landing maps;
- v0.37: complete landing operators;
- v0.38: one-axis spectral stratification;
- v0.39: two-axis stratification and the $(g_F,g_H)$ counterexample;
- v0.40: three-level stratification.

The two v0.34/v0.36 verifiers default to the supplied `low_rail_oos_arity23_factorization_v0_33_certificate.json` beside the scripts and accept `--certificate PATH` for an external copy.  This replaces the former machine-specific `/mnt/data` path.

The v0.32 certificate contains the frozen prediction, the independently computed arity-22 value, and the stored SHA-256 digest.  Its companion verifier independently compares all four rail records and checks the rank/shape metadata; because the certificate does not record the canonical serialization convention used to produce its stored digest, it checks the digest's integrity format rather than recomputing that digest.  The v0.33 verifier does recompute the canonical $Y_{18}$ digest and checks the complete triangular source reconstruction.

## Verified checkpoints

The current run with SymPy 1.14.0 reports:

- frozen $Y_{17}$ prediction = independent arity-22 actual, on rails 2, 3, 4, and 5;
- frozen $Y_{18}$ prediction = independent arity-23 actual, with SHA-256 `e9193f458cc84f575fd367543a358bef296432d7747d7558a624b8a21b7e7dcc`;
- $m_A(S)=(S+2)q(S)$, with
  $q(S)=S^5-4S^4+12S^3-32S^2+80S-192$;
- residual ranks $(1,2,8)$ and $p_3=(S+2)^2q$, $p_4=(S+2)^3q$, $p_5=(S+2)^4q^2$;
- landing checks: $Lambda_4$ rank 1 in the resonant kernel and $Lambda_5$ Krylov rank 6;
- stratification counts: 64, 128, and 708 nonzero plus the zero datum, i.e. 709 total;
- rational reductions: eight nonzero strata plus zero.

These are exact certificate and symbolic checks for the fixed data.  They do not prove the general triangular theorem posed in the paper's open-problem section.

## Literature positioning

The candidate manuscript adds a bounded comparison with algebra deformations, Artin/DGLA deformation theory, Gerstenhaber--Schack deformation complexes for morphisms and diagrams, Laudal's module deformations, Cuntz--Quillen noncommutative differential forms, and Van den Bergh / Berest--Khachatryan--Ramadoss representation-space frameworks.  The comparison states the fixed-data distinction explicitly: $A$, $V$, and $B$ are fixed while the two actions are reconstructed.  It is not an exhaustive novelty claim.

The candidate also proves the fixed-$B$ gauge boundary.  The pointwise stabilizer of $B(A,A)$ acts by simultaneous conjugation; when $V=\operatorname{span}B(A,A)$ it is trivial.  Therefore the four strict points in the finite example are not a hidden conjugation orbit.
