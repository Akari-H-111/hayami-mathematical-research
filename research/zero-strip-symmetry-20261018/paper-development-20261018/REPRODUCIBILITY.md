# Reproducibility and verification scope

From this directory run:

```sh
sh verification/replay_continuation.sh
```

It runs two standard-library Python verifiers, their fail-closed regression,
and the two real scalar Lean inequalities in `Lean/EmpiricalStability.lean`.
Python runs with `-B` and assertions enabled. The negative guard test compiles
source with optimization levels 1 and 2 inside an ordinary Python process;
it requires RuntimeError before any PASS output. No Python -O launch is used.

The default read-only Lean reference checkout is
`/Users/akari_hayami_64/Documents/prime-spherical-fold`. To use an already
prepared equivalent environment elsewhere:

```sh
ZERO_STRIP_LEAN_ROOT=/absolute/path/to/prepared/project sh verification/replay_continuation.sh
```

The script requires `leanprover/lean4:v4.33.1`, Mathlib commit
`0df444a360eaa60ab8c11dca51a86af692955474`, and no tracked Mathlib changes.
It does not install or update dependencies. It compiles with warningAsError.
A clean-machine dependency installation has not been tested. Copy replay
using the same existing pinned dependency environment is a separate check.

For just the portable standard-library finite checks:

```sh
python3 -B verification/verify_canonical_product.py
python3 -B verification/verify_complex_factors.py
python3 -B verification/test_assertion_guard.py
```

These independently exercise geometric-series identities, finite complex
paired products, prescribed roots, positive-axis samples and dyadic count
endpoints. They support regression of formulas, not universal holomorphy,
zero-divisor, density, equidistribution or RH claims. Those remain written
proofs with the external inputs listed in SOURCE_AUDIT.md.

Build the paper using an installed Tectonic and inspect it with Poppler:

```sh
mkdir -p tmp/pdfs/draft
tectonic --outdir tmp/pdfs/draft manuscript/main.tex
qpdf --check tmp/pdfs/draft/main.pdf
pdftoppm -r 110 -png tmp/pdfs/draft/main.pdf tmp/pdfs/page
```

Inspect every page after any source change. The final delivered PDF lives in
`output/pdf/`; its source and PDF hashes are recorded in ACCEPTANCE.json.
The authoring tool is Tectonic 0.17.0 on this host; exact PDF bytes may depend
on the TeX bundle, so cross-machine byte identity is not claimed.

The parent `verification/replay.sh` was replayed before this continuation.
It covers its earlier 23 named Lean theorems plus finite diagnostics, not the
new analytic manuscript. Its successful log and continuation logs are kept
local under ignored `logs/`, including failed authoring attempts.
