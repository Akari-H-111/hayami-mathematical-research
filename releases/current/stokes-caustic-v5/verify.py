"""Fail-closed replay for the Stokes caustic v5 Lean companion."""

from __future__ import annotations

import difflib
import hashlib
import importlib.util
from pathlib import Path
import re
import shutil
import subprocess
import sys
import tempfile


ROOT = Path(__file__).resolve().parent
PDF = ROOT / "final_pdf" / "The_Stokes_Caustic_of_the_Orthogonal_Circle_Ruled_Surface_v5.pdf"
TEX = ROOT / "source_candidate" / "The_Stokes_Caustic_of_the_Orthogonal_Circle_Ruled_Surface_v5.tex"
PDF_SHA256 = "4e48c805c1550dbaee9171a56264bf4ff5275ef5ff5b64f9cd116803283c11c0"
TOOLS = ("lake", "tectonic", "qpdf", "pdfinfo", "pdftotext")


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def run(command: list[str], cwd: Path = ROOT) -> str:
    result = subprocess.run(command, cwd=cwd, text=True, stdout=subprocess.PIPE,
                            stderr=subprocess.STDOUT)
    if result.returncode:
        print(result.stdout)
        raise SystemExit(f"FAIL ({result.returncode}): {' '.join(command)}")
    print("PASS", " ".join(command), flush=True)
    return result.stdout


def words(path: Path) -> list[str]:
    text = run(["pdftotext", "-raw", str(path), "-"])
    return re.findall(r"[A-Za-z0-9]+", text.lower())


def verify_manifest() -> None:
    manifest = ROOT / "SHA256SUMS.txt"
    if not manifest.exists():
        return
    for line in manifest.read_text(encoding="utf-8").splitlines():
        expected, name = line.split("  ", 1)
        target = ROOT / name
        if sha256(target) != expected:
            raise SystemExit(f"FAIL payload hash: {name}")
    print("PASS payload hashes", flush=True)


def main() -> None:
    missing = [tool for tool in TOOLS if shutil.which(tool) is None]
    if missing:
        raise SystemExit(f"FAIL missing commands: {', '.join(missing)}")
    if importlib.util.find_spec("sympy") is None:
        raise SystemExit("FAIL missing Python dependency: install requirements.txt")
    verify_manifest()
    if sha256(PDF) != PDF_SHA256:
        raise SystemExit("FAIL authoritative PDF hash")
    print("PASS authoritative PDF hash", flush=True)
    run(["qpdf", "--check", str(PDF)])
    info = run(["pdfinfo", str(PDF)])
    if "Pages:           10" not in info or "Page size:       612 x 792 pts (letter)" not in info:
        raise SystemExit("FAIL authoritative PDF geometry")

    run([sys.executable, "-B", "verify_exact_geometry.py"], ROOT / "verification")
    run([sys.executable, "-B", "verify_sturm_certificate.py"], ROOT / "verification")

    lean_root = ROOT / "formalization"
    if not (lean_root / ".lake" / "packages" / "mathlib").exists():
        run(["lake", "update"], lean_root)
    run(["lake", "exe", "cache", "get"], lean_root)
    run(["lake", "-q", "build", "StokesV5"], lean_root)
    run(["lake", "-q", "env", "lean", "StokesV5/Status.lean"], lean_root)
    run(["lake", "-q", "env", "lean", "StokesV5/Audit.lean"], lean_root)
    for path in [lean_root / "StokesV5.lean", *sorted((lean_root / "StokesV5").glob("*.lean"))]:
        if re.search(r"(?m)^\s*sorry\b", path.read_text(encoding="utf-8")):
            raise SystemExit(f"FAIL sorry found: {path.relative_to(ROOT)}")
    print("PASS Lean sorry scan", flush=True)

    with tempfile.TemporaryDirectory(prefix="stokes-v5-source-") as temporary:
        build = Path(temporary)
        shutil.copy2(TEX, build / TEX.name)
        run(["tectonic", "--keep-logs", TEX.name], build)
        rebuilt = build / PDF.name
        rebuilt_info = run(["pdfinfo", str(rebuilt)], build)
        if "Pages:           10" not in rebuilt_info:
            raise SystemExit("FAIL recovered-source page count")
        ratio = difflib.SequenceMatcher(None, words(PDF), words(rebuilt), autojunk=False).ratio()
        if ratio < 0.98:
            raise SystemExit(f"FAIL recovered-source similarity: {ratio:.6f}")
        print(f"PASS recovered-source similarity {ratio:.6f}", flush=True)

    print("PASS complete v5 companion replay", flush=True)


if __name__ == "__main__":
    main()
