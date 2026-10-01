"""Replay this PDF-free source distribution, failing closed on payload drift."""
from pathlib import Path
import hashlib
import json
import os
import re
import shutil
import subprocess
import sys

ROOT = Path(__file__).resolve().parent


def run(command, cwd=ROOT):
    result = subprocess.run(command, cwd=cwd, text=True, stdout=subprocess.PIPE,
                            stderr=subprocess.STDOUT)
    if result.returncode:
        raise SystemExit(result.stdout)
    return result.stdout


def manifest():
    expected = {}
    for line in (ROOT / "SHA256SUMS.txt").read_text().splitlines():
        digest, name = line.split("  ", 1)
        path = Path(name)
        if not re.fullmatch(r"[0-9a-f]{64}", digest) or path.is_absolute() or ".." in path.parts or name in expected:
            raise SystemExit(f"FAIL malformed manifest: {name}")
        expected[name] = digest
    actual = set()
    for directory, children, files in os.walk(ROOT):
        children[:] = [n for n in children if n not in {".lake", "__pycache__", "local"}]
        actual.update(str((Path(directory) / n).relative_to(ROOT)) for n in files if n != "SHA256SUMS.txt")
    assert actual == set(expected), "FAIL payload inventory"
    assert not any(Path(n).suffix.lower() == ".pdf" for n in actual), "FAIL PDF publication is deferred"
    for name, digest in expected.items():
        assert hashlib.sha256((ROOT / name).read_bytes()).hexdigest() == digest, f"FAIL hash: {name}"
    print(f"PASS manifest: {len(expected)} source-only files; no PDF assets", flush=True)


def main():
    if sys.flags.optimize:
        raise SystemExit("FAIL Python optimization disables required assertions")
    assert shutil.which("lake"), "FAIL missing lake"
    import sympy
    assert sympy.__version__ == "1.14.0", "Use requirements.txt"
    manifest()
    metadata = json.loads((ROOT / "METADATA.json").read_text())
    assert metadata["software_version"] == "0.03" and metadata["pdf_files_distributed"] is False
    assert all(metadata[k] is None for k in ("article_doi", "software_version_doi", "software_concept_doi"))
    paper = ROOT / "papers/legacy-geometry/orthogonal-circle-ruled-surface"
    for script in [ROOT / "verification/shared/orthogonal_circle_surface/verify_shared_surface_core.py",
                   *[paper / "verification" / n for n in ("verify_observation_field.py", "verify_signal_claim_counterexample.py", "verify_revision.py")]]:
        print(run([sys.executable, "-B", str(script)]), end="", flush=True)
    for name, count in (("stokes-caustic-v5", 258), ("ruled-surface-v5", 224)):
        project = ROOT / "companions/lean" / name
        if not (project / ".lake/packages/mathlib").exists():
            print(run(["lake", "exe", "cache", "get"], project), end="", flush=True)
        assert "version 4.33.1" in run(["lake", "env", "lean", "--version"], project)
        for package in json.loads((project / "lake-manifest.json").read_text())["packages"]:
            if package["type"] == "git":
                path = project / ".lake/packages" / package["name"]
                assert run(["git", "rev-parse", "HEAD"], path).strip() == package["rev"]
                assert not run(["git", "status", "--porcelain", "--untracked-files=no"], path).strip()
        report = run([sys.executable, "-B", "verify_lean.py"], project)
        assert f"PASS {count} public named theorems;" in report
        print(report, end="", flush=True)
    manifest()
    print("PASS source distribution: exact replay, pinned Lean build, complete axiom audits and proof-hole scans; PDF publication deferred", flush=True)


if __name__ == "__main__":
    main()
