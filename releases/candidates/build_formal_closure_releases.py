"""Seal the 2026-10-17 companion releases (Stokes v0.05, Ruled v0.04, Bicomplex 1.1).

Each package is source-only and keeps repository-relative paths, so its own
`verify.py` runs the included Lean verifiers (in dependency order) and the
exact Python verifiers. The builder copies the payload from this checkout,
writes the manifest, replays `verify.py` in place, writes a ZIP, replays the
extracted copy, and writes a receipt. Lean dependency/build caches (`.lake`)
are never packaged; for the two replays they are APFS-cloned from this
checkout (same-host pinned cache reuse, disclosed in each receipt).

Usage (never with python -O):
    <python with sympy, mpmath, numpy, matplotlib> -B build_formal_closure_releases.py [name ...]
"""
from __future__ import annotations

import hashlib
import json
from pathlib import Path
import shutil
import subprocess
import sys
import tempfile
import zipfile

assert not sys.flags.optimize, "never run with -O"

REPO = Path(__file__).resolve().parents[2]
OUT = Path(__file__).resolve().parent
DATE = "2026-10-17"
AUTHOR = "Akari Hayami (Jian-Yu Huang)"
LEAN = {"stokes": "companions/lean/stokes-caustic-v5",
        "ruled": "companions/lean/ruled-surface-v5",
        "bicomplex": "companions/lean/bicomplex-signal-manifolds"}
SKIP_PARTS = {".lake", "__pycache__", ".DS_Store"}

LICENSE = """# License

Copyright 2026 Akari Hayami (Jian-Yu Huang).

- Lean and Python source, including the formalization, verification and figure
  tools, is licensed under the Apache License, Version 2.0 (`Apache-2.0`):
  <https://www.apache.org/licenses/LICENSE-2.0>.
- Documentation, notes, figures, metadata and original research material are
  licensed under the Creative Commons Attribution 4.0 International License
  (`CC-BY-4.0`): <https://creativecommons.org/licenses/by/4.0/legalcode>.

Third-party dependencies (Lean, Mathlib and their dependencies, Python
libraries) retain their own licenses. Earlier sealed packages are unchanged.
"""

VERIFY = '''"""Fail-closed replay of this package. Never run with python -O."""
from pathlib import Path
import hashlib
import subprocess
import sys

assert not sys.flags.optimize, "verifiers rely on assertions"
ROOT = Path(__file__).resolve().parent
LEAN = {lean!r}
PYTHON = {python!r}


def run(command, cwd):
    result = subprocess.run(command, cwd=cwd, text=True, errors="replace",
                            stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    if result.returncode:
        print(result.stdout)
        raise SystemExit(f"FAIL: {{' '.join(command)}} in {{cwd}}")
    return result.stdout


def main():
    manifest = ROOT / "SHA256SUMS.txt"
    for line in manifest.read_text(encoding="utf-8").splitlines():
        expected, name = line.split("  ", 1)
        if hashlib.sha256((ROOT / name).read_bytes()).hexdigest() != expected:
            raise SystemExit(f"FAIL payload hash: {{name}}")
    print("PASS payload hashes", flush=True)
    for project in LEAN:
        directory = ROOT / project
        if not (directory / ".lake" / "packages" / "mathlib").exists():
            run(["lake", "exe", "cache", "get"], directory)
        print(run([sys.executable, "-B", "verify_lean.py"], directory).strip().splitlines()[-1],
              f"[{{project}}]", flush=True)
    for script in PYTHON:
        print(run([sys.executable, "-B", str(ROOT / script)], ROOT).strip().splitlines()[-1],
              f"[{{script}}]", flush=True)
    print("PASS complete package replay", flush=True)


if __name__ == "__main__":
    main()
'''

STOKES_NOTE = "papers/legacy-geometry/stokes-caustic"
RULED_NOTE = "papers/legacy-geometry/orthogonal-circle-ruled-surface"
BIC = "papers/legacy-geometry/bicomplex-signal-manifolds"

SPECS = {
    "stokes": {
        "package": "stokes-caustic-v5-companion-v0.05",
        "tag": "stokes-v5-companion-v0.05",
        "title": "Stokes caustic v5 Lean companion",
        "version": "0.05",
        "lean": [LEAN["stokes"]],
        "paths": [LEAN["stokes"], f"{STOKES_NOTE}/notes",
                  f"{STOKES_NOTE}/verification/verify_exceptional_germ.py",
                  f"{STOKES_NOTE}/verification/verify_restricted_symmetry_breaking.py",
                  f"{STOKES_NOTE}/verification/build_exceptional_germ_figures.py"],
        "python": [f"{STOKES_NOTE}/verification/verify_exceptional_germ.py",
                   f"{STOKES_NOTE}/verification/verify_restricted_symmetry_breaking.py"],
        "theorems": {"StokesV5": 268},
        "concept_doi": "10.5281/zenodo.22726976",
        "previous": "v0.04, software DOI 10.5281/zenodo.23057630",
        "paper_doi": "10.5281/zenodo.22728902",
        "summary": """New in v0.05 (research beyond the published paper): the exceptional
point (t,u) = (0,0) of the observation map is fully classified. The map
factors as F(t,u) = G(cos t, u), where G is an ordinary Whitney fold at (1,0)
whose kernel and critical curve are transverse to the ramification line c = 1.
Lean (`StokesV5/ExceptionalNormalForm.lean`) constructs actual smooth
two-sided source and target charts taking the actual observation map to
(X, X y^2 + y^4) near the exceptional point, with a source chart that
intertwines t -> -t and y -> -y (`exceptional_hasFoldOfFoldNormalFormAt`,
`exceptional_equivariant_charts`), and proves the quotient fold
(`quotient_hasWhitneyNormalFormAt`). The proof note
`papers/legacy-geometry/stokes-caustic/notes/EXCEPTIONAL_GERM.md` (with five
reproducible figures) adds written results: the real-analytic version,
non-finite A-determinacy (via Moya-Perez and Nuno-Ballesteros 2020,
Cor. 2.2(3)), recentred persistence under even perturbations, the labels
11_(2k+1) for odd perturbations (checked in Kabata 2016), and the absence of a
finite-parameter marked versal unfolding for the restricted odd-quotient class
at the even base. A versal family at a selected 11_5 member remains open.

All 268 public named StokesV5 theorems pass build, status, exhaustive axiom
audit (only propext, Classical.choice, Quot.sound) and the proof-hole scan.
The published paper is not Lean-formalized as a whole; the statement-level
coverage map is `companions/lean/stokes-caustic-v5/FULL_PAPER_COVERAGE.md`.""",
    },
    "ruled": {
        "package": "ruled-surface-v5-companion-v0.04",
        "tag": "ruled-surface-v5-companion-v0.04",
        "title": "Ruled surface v5 verification companion",
        "version": "0.04",
        "lean": [LEAN["stokes"], LEAN["ruled"]],
        "paths": [LEAN["stokes"], LEAN["ruled"], f"{RULED_NOTE}/notes",
                  f"{RULED_NOTE}/verification/verify_self_intersection.py",
                  f"{RULED_NOTE}/verification/self_intersection_table.py"],
        "python": [f"{RULED_NOTE}/verification/verify_self_intersection.py"],
        "theorems": {"RuledV5": 246, "StokesV5 (dependency)": 268},
        "concept_doi": "10.5281/zenodo.23073653",
        "previous": "v0.03, software DOI 10.5281/zenodo.23073654",
        "paper_doi": "10.5281/zenodo.23073642",
        "summary": """New in v0.04 (research beyond the published article): the global
self-intersection of the surface S(t,u) = (c + 2u(1-c), (1-u) sin t, u sqrt(c(2-c)))
on the closed rectangle is classified. Distinct labels share an image exactly
on the u = 1 seam or on two mirror double arcs; each arc's source closure runs
from the edge label (+-pi/2, 2/5) through the interior cross-cap to the base
label (+-arccos(4/5), 0), and the common image starts at (4/5, +-3/5, 0). The
quotient double curve has an explicit rational parametrization.

Lean (`RuledV5/SelfIntersection.lean`, `DoubleFamily.lean`,
`DoubleNormalization.lean`) proves, for the actual surface: the seam iff,
mirror-half separation, the exact boundary double points, the universal
elimination certificate, sufficiency of the explicit family for every
0 <= v < sqrt 5 - 2 with its actual image, and the converse in each open
angular half (two distinct labels with equal images are exactly the explicit
pair for a unique v). The closed-rectangle assembly, global two-label bound,
cross-cap singleton fibers, smoothness of the source arcs and the quotient
homeomorphism are written proofs in
`papers/legacy-geometry/orthogonal-circle-ruled-surface/notes/SELF_INTERSECTION.md`.
The exceptional germ is classified in the Stokes companion v0.05.

All 246 public named RuledV5 theorems and the 268 StokesV5 dependency
theorems pass build, status, exhaustive axiom audit and proof-hole scan; the
two inventories are separate. The article is not Lean-formalized as a whole;
see `companions/lean/ruled-surface-v5/COVERAGE.md`.""",
    },
    "bicomplex": {
        "package": "bicomplex-successor-v1.1-software",
        "tag": "bicomplex-successor-v1.1",
        "title": "Verification Companion for Realization Limits and Pseudo-Laplacians at Whitney Cross-Caps",
        "version": "1.1",
        "lean": [LEAN["stokes"], LEAN["ruled"], LEAN["bicomplex"]],
        "paths": [LEAN["stokes"], LEAN["ruled"], LEAN["bicomplex"],
                  f"{BIC}/claims/CLAIM_MAP.json", f"{BIC}/claims/CLAIM_MAP.md",
                  f"{BIC}/claims/V11_COMPARISON.md", f"{BIC}/claims/V7_DRAFT_INDEX.md",
                  f"{BIC}/source_ancestor/signal_manifolds_v2.tex",
                  f"{BIC}/successor/Pseudo_Laplacians_Whitney_Cross_Caps.tex",
                  f"{BIC}/successor/Realization_Limits_Bicomplex_Signal_Surface.tex",
                  f"{BIC}/successor/figures",
                  *[f"{BIC}/verification/{name}" for name in (
                      "build_successor_figures.py", "build_successor_paper1_pdf.py",
                      "build_successor_paper2_pdf.py", "verify_continuation.py",
                      "verify_continuation_0_04.py", "verify_crosscap_models.py",
                      "verify_local_algebra.py", "verify_revision.py",
                      "verify_spectral_algebra.py", "verify_successor_paper1.py",
                      "verify_successor_paper2.py")],
                  "papers/legacy-geometry/source-registry/final_pdfs/Geometric_Realization_of_Bicomplex_Signal_Manifolds_v12.pdf",
                  "papers/legacy-geometry/source-registry/historical_drafts/Geometric_Realization_of_Bicomplex_Signal_Manifolds_v11.pdf"],
        "python": [f"{BIC}/verification/verify_successor_paper1.py",
                   f"{BIC}/verification/verify_successor_paper2.py"],
        "theorems": {"Bicomplex": 105, "RuledV5 (dependency)": 246, "StokesV5 (dependency)": 268},
        "concept_doi": "10.5281/zenodo.23103298",
        "previous": "1.0, software DOI 10.5281/zenodo.23103299",
        "paper_doi": "10.5281/zenodo.23103026 (paper 1) and 10.5281/zenodo.23103056 (paper 2)",
        "summary": """New in 1.1: the Lean project now gives partial coverage of 105 selected
statements of the two published successor papers (1.0: 33). Eleven new
modules formalize, on the actual objects and with the papers' hypotheses:
the endpoint obstructions and the affine/Bloch no-go (Paper 1, prop:twoobs),
phase-invariant and density-matrix readouts (prop:gauge), analytic curves and
readout rigidity (lem:analytic, thm:rigidity part 1), the log-scale and
linear-scale windows (prop:windows), the Roman surface tangent rank and
normalized Whitney jets (Paper 2, prop:roman), the signed-permutation pair
orbits and invariant matrix form (thm:romanB, finite part), the
reference-length shear and Friedrichs plane (cor:scale), and the model
logarithmic cutoff energy (prop:capacity, scalar core). Two precision notes
are recorded in COVERAGE.md: the printed window bound needs delta != 0, and
the Roman multiplicities 1, 2, 3 are block dimensions. Operator/PDE results,
the analytic construction of B_eta and Whitney recognition remain written or
external; neither paper is Lean-formalized.

Unlike 1.0, this package includes the sibling RuledV5 and StokesV5 projects,
so it builds on its own. All three inventories pass build, status,
exhaustive axiom audit and proof-hole scan separately.""",
    },
}


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def tracked(rel: str) -> list[str]:
    out = subprocess.run(["git", "ls-files", "--", rel], cwd=REPO, text=True,
                         check=True, stdout=subprocess.PIPE).stdout.split()
    if not out:
        raise SystemExit(f"FAIL nothing tracked at {rel}")
    return out


def clone_lake(root: Path, spec: dict) -> None:
    for project in spec["lean"]:
        source = REPO / project / ".lake"
        target = root / project / ".lake"
        if not target.exists():
            subprocess.run(["cp", "-c", "-R", str(source), str(target)], check=True)


def replay(root: Path, spec: dict) -> str:
    clone_lake(root, spec)
    result = subprocess.run([sys.executable, "-B", "verify.py"], cwd=root, text=True,
                            errors="replace", stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    print(result.stdout, flush=True)
    if result.returncode or "PASS complete package replay" not in result.stdout:
        raise SystemExit(f"FAIL replay in {root}")
    return result.stdout


def build(key: str) -> None:
    spec = SPECS[key]
    name = spec["package"]
    payload = OUT / name
    if payload.exists():
        shutil.rmtree(payload)
    files = sorted({f for rel in spec["paths"] for f in tracked(rel)})
    for rel in files:
        target = payload / rel
        target.parent.mkdir(parents=True, exist_ok=True)
        shutil.copy2(REPO / rel, target)
    head = subprocess.run(["git", "rev-parse", "HEAD"], cwd=REPO, text=True, check=True,
                          stdout=subprocess.PIPE).stdout.strip()
    counts = "\n".join(f"- {k}: {v} public named theorems" for k, v in spec["theorems"].items())
    readme = f"""# {spec['title']} — version {spec['version']}

{AUTHOR}, {DATE}. Source-only software package; no PDF of a published paper
is redistributed{' except the two historical Bicomplex PDFs carried over from 1.0' if key == 'bicomplex' else ''}.

{spec['summary']}

Lean inventories (each audited separately; counts are not whole-paper coverage):

{counts}

## Replay

Requires Lean 4.33.1 via elan/Lake (Mathlib v4.33.1 is pinned in the lockfiles;
do not run `lake update`) and a Python 3 environment with
`requirements.txt`. From this directory:

```sh
python3 -B verify.py
```

`verify.py` checks every payload hash, runs `verify_lean.py` in each Lean
project in dependency order (fetching the pinned Mathlib build cache with
`lake exe cache get` when absent) and runs the exact Python verifiers. Never
use Python `-O`: the verifiers rely on assertions.

## Citation

Cite the paper(s) ({spec['paper_doi']}) and this software version separately.
All-version software concept DOI: `{spec['concept_doi']}`. Previous version:
{spec['previous']}. Repository:
<https://github.com/Akari-H-111/hayami-mathematical-research>, release tag
`{spec['tag']}`, built from commit `{head}`.

Code: Apache-2.0. Documentation, notes and figures: CC-BY-4.0. See `LICENSE.md`.
"""
    (payload / "README.md").write_text(readme, encoding="utf-8")
    (payload / "LICENSE.md").write_text(LICENSE, encoding="utf-8")
    (payload / "requirements.txt").write_text(
        "sympy==1.14.0\nmpmath==1.3.0\n" + ("numpy\nmatplotlib\n" if key == "bicomplex" else ""),
        encoding="utf-8")
    (payload / "verify.py").write_text(VERIFY.format(lean=spec["lean"], python=spec["python"]),
                                       encoding="utf-8")
    (payload / "CITATION.cff").write_text(f"""cff-version: 1.2.0
message: "If you use this software, please cite the paper(s) and this versioned software package separately."
title: "{spec['title']}"
version: "{spec['version']}"
date-released: {DATE}
type: software
authors:
  - family-names: "Hayami"
    given-names: "Akari"
    alias: "Jian-Yu Huang"
repository-code: "https://github.com/Akari-H-111/hayami-mathematical-research"
license:
  - Apache-2.0
  - CC-BY-4.0
""", encoding="utf-8")
    metadata = {"package": name, "version": spec["version"], "date": DATE, "author": AUTHOR,
                "github_tag": spec["tag"], "source_commit": head,
                "lean_public_named_theorems": spec["theorems"],
                "software_concept_doi": spec["concept_doi"], "previous_version": spec["previous"],
                "paper_doi": spec["paper_doi"], "software_version_doi": None,
                "distribution": "software-and-source-only",
                "license": "Apache-2.0 code; CC-BY-4.0 documentation, notes and figures"}
    (payload / "METADATA.json").write_text(json.dumps(metadata, indent=2) + "\n", encoding="utf-8")

    manifest = payload / "SHA256SUMS.txt"
    members = sorted(p for p in payload.rglob("*") if p.is_file() and p != manifest
                     and not SKIP_PARTS.intersection(p.relative_to(payload).parts))
    manifest.write_text("".join(f"{sha256(p)}  {p.relative_to(payload).as_posix()}\n"
                                for p in members), encoding="utf-8")
    local = replay(payload, spec)

    archive = OUT / f"{name}.zip"
    with zipfile.ZipFile(archive, "w", zipfile.ZIP_DEFLATED, compresslevel=9) as zf:
        for p in [*members, manifest]:
            info = zipfile.ZipInfo(f"{name}/{p.relative_to(payload).as_posix()}",
                                   date_time=(2026, 10, 17, 0, 0, 0))
            info.compress_type = zipfile.ZIP_DEFLATED
            info.external_attr = 0o644 << 16
            zf.writestr(info, p.read_bytes(), compresslevel=9)
    with zipfile.ZipFile(archive) as zf:
        if zf.testzip() is not None:
            raise SystemExit("FAIL ZIP CRC")
        count = len(zf.namelist())
    with tempfile.TemporaryDirectory(prefix=f"{name}-") as temporary:
        with zipfile.ZipFile(archive) as zf:
            zf.extractall(temporary)
        extracted = replay(Path(temporary) / name, spec)

    receipt = {
        "package": name, "date": DATE, "source_commit": head,
        "archive": archive.name, "archive_sha256": sha256(archive),
        "archive_bytes": archive.stat().st_size, "zip_members": count,
        "manifest_sha256": sha256(manifest), "payload_files": len(members),
        "zip_crc": "PASS",
        "local_replay": [l for l in local.splitlines() if l.startswith("PASS")],
        "extracted_replay": [l for l in extracted.splitlines() if l.startswith("PASS")],
        "replay_python": sys.version.split()[0],
        "cache_disclosure": "Lean .lake dependency/build caches were APFS-cloned from the source "
                            "checkout on the same host for both replays; they are not packaged.",
        "status": "LOCAL RELEASE CANDIDATE; publication is recorded separately",
        "lean_public_named_theorems": spec["theorems"],
    }
    (OUT / f"{name}-receipt.json").write_text(json.dumps(receipt, indent=2) + "\n",
                                              encoding="utf-8")
    shutil.rmtree(payload)  # the ZIP, manifest inside it and receipt are the sealed record
    print("SEALED", archive.name, receipt["archive_sha256"], flush=True)


if __name__ == "__main__":
    for key in sys.argv[1:] or list(SPECS):
        build(key)
