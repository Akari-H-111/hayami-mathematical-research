# Verification guide

[Home](../README.md) · [Research board](../RESEARCH_BOARD.md)

Run checks from the repository root unless a section says otherwise. Use Python
without `-O`. No one command proves every paper: source hashes, exact algebra,
seeded numerical diagnostics, written proofs, external theorems and Lean modules
have distinct scopes. Commands below may need dependencies or build artifacts
listed by the linked workstream guides.

## Navigation and imported sources (Python standard library)

```sh
python3 -B verification/verify_navigation.py
```

Checks local Markdown destinations and fragments in the reader-facing guides,
the ten-paper catalogue, imported source hashes and required TeX inputs. It does
not test live DOI endpoints or certify mathematics.

## Information Topology (NumPy and SymPy)

```sh
cd papers/information-topology
python3 -B scripts/verify_restructured_series.py
python3 -B scripts/build_series_plot_data.py --check
```

The [series guide](../papers/information-topology/README.md) records the tested
runtime and compile commands. Default finite replay: 6,633 checks, seed
`20260916`, samples `32`. Infinite limsup and Hausdorff-dimension statements are
outside this verifier's scope.

## Legacy geometry exact baseline (SymPy)

```sh
python3 -m venv local/cache/python/legacy-reconstruction-venv
local/cache/python/legacy-reconstruction-venv/bin/python -m pip install -r verification/legacy-reconstruction/requirements.txt
local/cache/python/legacy-reconstruction-venv/bin/python -B verification/legacy-reconstruction/verify_all.py
```

This checks historical PDF hashes and reconstructed finite/exact statements.
Expected counterexamples and boundary-scope findings are preserved; a passing
baseline does not validate every historical claim.

## Bicomplex successors

```sh
python3 -B papers/legacy-geometry/bicomplex-signal-manifolds/verification/verify_successor_paper1.py
python3 -B papers/legacy-geometry/bicomplex-signal-manifolds/verification/verify_successor_paper2.py
```

The [Bicomplex guide](../papers/legacy-geometry/bicomplex-signal-manifolds/README.md)
provides the runtime and PDF replay table. The root-level Lean project and the
software ZIP both need sibling Ruled and Stokes projects. Public Ruled sources
are in the sealed source package, so prepare an isolated layout from a fresh
checkout (use a new empty destination if this one already exists):

```sh
mkdir -p local/replay/lean
cp -R companions/lean/bicomplex-signal-manifolds local/replay/lean/
cp -R companions/lean/stokes-caustic-v5 local/replay/lean/
cp -R releases/current/ruled-surface-v5-source-v0.03/companions/lean/ruled-surface-v5 local/replay/lean/
python3 -B local/replay/lean/bicomplex-signal-manifolds/verify_lean.py
```

This requires the pinned Lean/Lake toolchain; it is a setup route, not a claim
of a fresh Lean build in the navigation update. Lean covers 33 selected named theorems;
written and external operator/PDE proofs are not certified by the finite scripts.

## Ruled and Stokes Lean companions

```sh
python3 -B releases/current/ruled-surface-v5-source-v0.03/companions/lean/ruled-surface-v5/verify_lean.py
python3 -B companions/lean/stokes-caustic-v5/verify_lean.py
```

Requires the project-pinned Lean/Lake toolchains and dependencies. Read the
[Ruled coverage map](../releases/current/ruled-surface-v5-source-v0.03/companions/lean/ruled-surface-v5/COVERAGE.md) (224 own public
theorems, 258 separately audited dependencies) and the
[Stokes coverage map](../companions/lean/stokes-caustic-v5/FULL_PAPER_COVERAGE.md)
(258 public named theorems). These counts concern the mapped asserted results,
not unresolved research questions or physical interpretations.

The Stokes v0.04 complete package replay is:

```sh
python3 -B releases/candidates/stokes-caustic-v5-v0.04/verify.py
```

Historical v0.02 remains in `releases/current/stokes-caustic-v5/`; historical
v0.03 is criterion-level. Their sealed scopes never inherit v0.04 results.

## Inverse-Leibniz illustrated releases

```sh
python3 -B releases/current/paper-01-illustrated-v0.09/verify_integrated.py
python3 -B releases/current/paper-02-illustrated-v0.09/verify_evidence.py
python3 -B releases/current/paper-02-illustrated-v0.09/verify_integrated.py
python3 -B releases/current/paper-03-illustrated-v0.09/verify_evidence.py
python3 -B releases/current/paper-03-illustrated-v0.09/verify_integrated.py
```

These also need the PDF tools, Python packages and build/evidence logs specified
in each [release guide](../papers/inverse-leibniz/README.md). Run evidence replay
before the corresponding integrated checks. Use each release's existing
`SHA256SUMS.txt`; never regenerate a sealed manifest to make a mismatch pass.
