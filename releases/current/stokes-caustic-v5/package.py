"""Verify, seal, extract, and independently replay this release directory."""

from __future__ import annotations

import hashlib
import json
from pathlib import Path
import subprocess
import sys
import tempfile
import zipfile


ROOT = Path(__file__).resolve().parent
PACKAGE_NAME = "stokes_caustic_v5_lean_companion_v0_02"
ARCHIVE = ROOT / f"{PACKAGE_NAME}.zip"
RECEIPT = ROOT / f"{PACKAGE_NAME}_receipt.json"


def sha256(path: Path) -> str:
    return hashlib.sha256(path.read_bytes()).hexdigest()


def run(command: list[str], cwd: Path) -> None:
    subprocess.run(command, cwd=cwd, check=True)


manifest = ROOT / "SHA256SUMS.txt"
files = sorted(path for path in ROOT.rglob("*") if path.is_file()
               and path.name not in {manifest.name, ARCHIVE.name, RECEIPT.name, ".DS_Store"}
               and ".lake" not in path.relative_to(ROOT).parts)
manifest.write_text("".join(
    f"{sha256(path)}  {path.relative_to(ROOT).as_posix()}\n" for path in files
), encoding="utf-8")
run([sys.executable, "-B", "verify.py"], ROOT)

with zipfile.ZipFile(ARCHIVE, "w", zipfile.ZIP_DEFLATED, compresslevel=9) as archive:
    for path in [*files, manifest]:
        archive.write(path, PACKAGE_NAME + "/" + path.relative_to(ROOT).as_posix())
    if archive.testzip() is not None:
        raise SystemExit("FAIL ZIP CRC")

with tempfile.TemporaryDirectory(prefix="stokes-v5-release-") as temporary:
    extracted_root = Path(temporary)
    with zipfile.ZipFile(ARCHIVE) as archive:
        archive.extractall(extracted_root)
    extracted = extracted_root / PACKAGE_NAME
    run([sys.executable, "-B", "verify.py"], extracted)

receipt = {
    "release": PACKAGE_NAME,
    "date": "2026-09-12",
    "archive": ARCHIVE.name,
    "archive_sha256": sha256(ARCHIVE),
    "archive_bytes": ARCHIVE.stat().st_size,
    "members": len(files) + 1,
    "authoritative_pdf_sha256": sha256(ROOT / "final_pdf" / "The_Stokes_Caustic_of_the_Orthogonal_Circle_Ruled_Surface_v5.pdf"),
    "zip_crc": "PASS",
    "local_replay": "PASS",
    "extracted_replay": "PASS",
    "scope": "Lean-certified observation-map chart and differentiability, finite algebra, and real root barriers; CAS-certified full Jacobian bridge; Whitney-fold criterion not formalized.",
    "license": "Apache-2.0 for code; CC-BY-4.0 for scholarly and documentation material; see LICENSE.md.",
}
RECEIPT.write_text(json.dumps(receipt, indent=2) + "\n", encoding="utf-8")
print("SEALED", ARCHIVE)
print("SHA256", receipt["archive_sha256"])
