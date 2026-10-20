# Conductor-5 identification for the `-163` level-5 fibre

This local continuation now has three additional explanations of the original
Heegner/golden-ratio question, alongside the conductor5 case below:

| Result | Reading route | Evidence status |
| --- | --- | --- |
| The golden geodesic period and the -163 CM integer occur in one specified weight1/2 Maass form. | [Theta-lift bridge](THETA_LIFT_BRIDGE.md) | Application of the existing BFI theorem; independently reviewed. |
| Every imaginary-quadratic order discriminant prime to5, with the specified principal CM mark, yields the same golden subfield after conductor enlargement by5. | [General genus mechanism](GENERAL_GENUS_MECHANISM.md) | Written CM/class-field proof; independently reviewed. |
| The exact HMR parameter c0 controls both golden-power near integers and Fibonacci rational-approximation errors. | [Golden trace bridge](DIRECTOR_TRACE_BRIDGE.md) | Elementary all-n proof and exact finite replay; independently reviewed. |

These are separate statements with separate dependencies. The common Maass-form
framework is established prior literature, not a claim of world-first discovery.
[Review resolution](REVIEW_RESOLUTION.md) records scope, precision fixes,
preserved failures, and the next marked-action problem.

## Result

Let

\[
 \tau=\frac{1+\sqrt{-163}}2,\quad t=r(\tau)^5,\quad
 u=t-t^{-1},\quad K=\mathbb Q(\sqrt{-163}),\quad F=\mathbb Q(\sqrt5).
\]

Using the standard Rogers--Ramanujan eta identity, the level-5 modular
equations, the CM main theorem, and the exact checks recorded here, this
continuation proves the following conditional classical identification:

\[
 \mathbb Q(u)=\mathbb Q\bigl(j(5\tau)\bigr),\qquad
 K(u)=H_5,
\]

where \(H_5\) is the ring class field of the order
\(\mathcal O_5=\mathbb Z+5\mathcal O_K\), of discriminant \(-4075\).
The order has class group \(C_6\).  Its unique quadratic genus layer over
\(K\) is \(K(\sqrt5)\), which explains why the previously recovered
golden field is a quadratic layer and leaves a cubic layer above it.

The checked cubic over \(F\) has discriminant \(-163\) times an
\(F\)-square.  Its splitting field is exactly \(H_5\) and has Galois group
\(S_3\) over \(F\).  This is an identification of a classical ring class
field, not a novelty claim.

## Replay

Run from this directory with the registered interpreter:

```sh
/Users/akari_hayami_64/RH_Research_Workspace/.venv/bin/python -B verification/check.py
```

The checker is assert-based and rewrites only this package's
`RESULTS.json`.  It verifies the source hashes, eta-coordinate algebra,
the exact resultant and its irreducibility, reduced-form enumeration,
the cubic discriminant certificate, and bounded high-precision diagnostics.

## Reading order

- [MATHEMATICS.md](MATHEMATICS.md) gives the proof and the geometric
  synthesis.
- [SOURCES.md](SOURCES.md) records exact pages, equations, local hashes, and
  source boundaries.
- [CLAIM_LEDGER.md](CLAIM_LEDGER.md) separates proofs, external theorems,
  finite checks, diagnostics, and open work.
- [RESULTS.json](RESULTS.json) is the generated verification record.

## Boundaries

The eta and CM inputs are classical external results.  Decimal evaluations
are diagnostics only; no integer coefficient is inferred from rounding.
The scalar equality \(c_0=\phi^{-2}\) does not supply a canonical map to
the HMR ruled surface, nor any consequence for RH.  The parent archive,
its manifests, and its raw logs are read-only and were not changed.

## Additional exact replay

```sh
/Users/akari_hayami_64/RH_Research_Workspace/.venv/bin/python -B verification/director_trace_check.py
```

This checks the golden identities at n=1,...,40; the written induction and norm
argument cover all n and all denominators. It does not numerically prove the
classical universal Hurwitz theorem. The main checker requires the six pinned
PDFs in the local ignored source cache; clean-machine replay was not tested.
