# Heegner level-5 fibre and the HMR golden parameter

**Current paper:** [Golden Coordinates at Level Five, portrait v0.2](paper/README.md)
— a 10-page article with a 14-page landscape supplement.
**Earlier checkpoint:** [v0.1 article and atlas](paper-v0.1/README.md).
**Agent entry point:** [HANDOVER.md](HANDOVER.md).
**Navigation:** [Repository home](../../README.md) · [Research index](../README.md).

**Status.** A public research archive on GitHub. It is outside the repository's
ten-paper catalogue: no DOI, Zenodo record or sealed release exists, and no
external human reading is recorded. The sentence "Local draft; no commit,
upload, or publication" in the v0.2 packet records its state at completion and
describes its sealed bytes; it is not the current repository state. Lean covers
the algebraic core only ([FORMALIZATION.md](FORMALIZATION.md)). The
[literature audit](studies/novelty-audit-20261019/README.md) establishes no
substantive novelty for the later continuation, so no novelty, priority or RH
claim is made. Next gate: a fresh external reading of the CM branch enclosure and
the analytic proof flow.

## Result

This package proves a bounded field-reconstruction statement, conditional only
on the classical CM value and Klein level-5 equation recorded in
[SOURCES.md](SOURCES.md).  For

$$
\tau_{163}=\frac{1+i\sqrt{163}}{2},\qquad
t=r(\tau_{163})^5,
$$

there are coprime $A,B\in\mathbb Z[t]$ with

$$
P_{163}(t)=A(t)^2-5B(t)^2=0.
$$

The analytic $q$-product branch is rationally isolated and has
$A(t)/B(t)=-\sqrt5$.  Hence

$$
\phi=\frac{B(t)-A(t)}{2B(t)},\qquad
\gamma=\phi^{-1}=-\frac{A(t)+B(t)}{2B(t)},\qquad
c_0=\phi^{-2}=\frac{3B(t)+A(t)}{2B(t)}.
$$

Thus $\mathbb Q(\sqrt5)\subset\mathbb Q(t)$, and the exact $c_0$
used by the current HMR ruled-surface source is reconstructed from the
specified $-163$ level-5 CM value.  This is a field-membership result, not a
decimal fit.

The universal mechanism is also identified: for every $j$, the degree-12
icosahedral fibre is $t^6$ times a sextic in $u=t-t^{-1}$.  It is therefore
important that $j=1,2$ remain irreducible over $\mathbb Q(\sqrt5)$: the
golden subfield is not a universal consequence of that sextic rewriting.

## Replay

The exact checker needs Python 3 with SymPy and mpmath. Run from this directory:

```sh
python3 -B verification/check.py
```

Never use `-O`: the checker refuses assertion-stripped execution. It rewrites
`verification/RESULTS.json`; on another interpreter only the recorded Python
version changes (a 2026-10-22 run on Python 3.9.6 with SymPy 1.14.0 and mpmath
1.3.0 passed, against the committed record from Python 3.14.6). It verifies:

- exact quotient, factorization, coprimality, and field-reconstruction algebra;
- rational isolation and sign selection for the $-163$ $t$- and real
  $s$-branches;
- all nine maximal and four nonmaximal class-number-one-order controls;
- exact $j=1,2$ countercontrols; and
- direct product versus continued-fraction evaluations at 100 and 200 digits.

The Lean layer is replayed separately with `sh Lean/replay.sh`. It needs a
prepared Lean `v4.33.1` checkout with the pinned Mathlib commit named in
[Lean/README.md](Lean/README.md); set `HEEGNER_LEAN_ROOT` to that checkout. A
clean-machine build has not been tested.

## Claim boundary

| Item | Status |
| --- | --- |
| Universal $t-t^{-1}$ sextic quotient | PROVED HERE; Lean algebraic core |
| $-163$ golden-field reconstruction and branch sign | PROVED HERE, conditional on classical CM/modular inputs; Lean branch implication conditional on its sign hypotheses |
| Thirteen CM-order component factorizations | EXACT CHECK; analytic component matching is NUMERICAL at 100/200 digits |
| HMR Boolean-signature obstruction | PROVED HERE as a corollary of the current HMR definition/proposition |
| Ray-class stabilizer explanation | OPEN in this package |
| CM input, q-product enclosure, Sturm counts, coprimality certificate | NOT FORMALIZED in Lean; see [FORMALIZATION.md](FORMALIZATION.md) |
| Novelty, intrinsic geometric map, or RH consequence | NOT CLAIMED |

Read [MATHEMATICS.md](MATHEMATICS.md) for proofs,
[SURVEY.md](SURVEY.md) for source coverage, [CLAIM_LEDGER.md](CLAIM_LEDGER.md)
for status boundaries, and [FINAL_REPORT.md](FINAL_REPORT.md) for the handoff.
The new bounded Lean layer is indexed in [FORMALIZATION.md](FORMALIZATION.md)
and [Lean/README.md](Lean/README.md).

## Deeper director result

For F=Q(sqrt(5)) and u=t-t^-1, the residual cubic is irreducible and its
discriminant is -163 times a square in F. Its S3 splitting field has quadratic
resolvent Q(sqrt(5),sqrt(-163)). Read [CUBIC_RESOLVENT.md](CUBIC_RESOLVENT.md)
for the explicit coefficients, exact certificate and marking ambiguity:
-163 and -815 have the same square class over F, so the resolvent alone does
not uniquely select the original rational quadratic field.

The director's other exact checks and the finite rational trace-form
obstruction are in [DIRECTOR_FINDING.md](DIRECTOR_FINDING.md). The clean
rewritten task is in [RESEARCH_PROMPT.md](RESEARCH_PROMPT.md).

Final local review scope and resolved findings: [REVIEW_RESOLUTION.md](REVIEW_RESOLUTION.md).

## Directory map

| Path | Purpose |
| --- | --- |
| `paper/` | Current v0.2 portrait article, supplement, source bundle and completion evidence |
| `paper-v0.1/` | Frozen v0.1 article, twelve plates and fourteen-page atlas |
| `figures/` | Shared native-vector plates, exported figures, saved data and atlas |
| `studies/` | Continuations, literature audits, editorial reviews and paper-closure studies |
| `Lean/` | Kernel-checked algebraic core of the level-five reconstruction |
| `verification/` | Root exact checker and recorded results |
| `FORMALIZATION.md` | Formalization map and explicit non-formalized boundary |
| `HANDOVER.md` | Agent-oriented status, replay environment and next actions |

The version packets and their verification records keep their internal
structure and hashes; this map describes the public entry points after the
20 October 2026 directory reorganization.
