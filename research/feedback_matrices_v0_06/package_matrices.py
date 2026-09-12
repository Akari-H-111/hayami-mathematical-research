"""Seal the verified matrix supplement and check its extracted matrix payload."""
import csv
import hashlib
import json
from pathlib import Path
import subprocess
import sys
import tempfile
import zipfile
import sympy as sp

ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / "releases/archive/legacy-output/matrices"
BASE = OUT / "feedback_v0_06"
ARCHIVE = OUT / "feedback_matrices_v0_06_bundle.zip"


def sha(data):
    return hashlib.sha256(data).hexdigest()


def main():
    if sys.flags.optimize:
        raise SystemExit("Assertions must remain enabled.")
    for name in ["BUILD_LOG.txt", "VERIFICATION_LOG.txt", "V0_05_COUNTERCHECK_LOG.txt"]:
        assert (BASE / name).read_text().rstrip().endswith("EXIT STATUS: 0")
    assert "ALL MATRIX AND SINGLE-CONTRACTION CHECKS PASSED" in (BASE / "VERIFICATION_LOG.txt").read_text()
    old_bundle = ROOT / "releases/archive/three-papers/three_papers_v0_05_bundle.zip"
    old_digest = sha(old_bundle.read_bytes())
    assert old_digest == "263bc65d36c0f30e6a04dc5289b429cfa80bd88964d573aca1c1bf5f1a34fd28"
    names = """README.md MATHEMATICAL_NOTE.md RESEARCH_LOG.md requirements-repro.txt
        build_matrices.py verify_matrices.py audit_v0_05.py record_run.py
        BUILD_LOG.txt VERIFICATION_LOG.txt V0_05_COUNTERCHECK_LOG.txt
        base/reconstruct.py base/complete_and_verify.py base/complete_splitting.json
        base/transfer_through_22.json
        base/verification/verify_cubic_support_multigrading_v0_47.py
        base/verification/low_rail_oos_arity23_factorization_v0_33_certificate.json
        results/blocks.json results/projection.json results/homotopy.json results/transfer.json
        results/rhs_and_solution_22.csv
        audit/PROBE_LOG.txt audit/U16_PROBE_LOG.txt audit/U16_REVISED_PROBE_LOG.txt
        audit/SECTOR_PROBE_LOG.txt audit/U16_COMPATIBLE_PROBE_LOG.txt""".split()
    names += [f"results/{stem}_{n}.{ext}" for n in range(19, 24)
              for stem, ext in [("feedback", "json"), ("matrix", "csv")]]
    payload = {name: (BASE / name).read_bytes() for name in sorted(names)}
    manifest = "".join(f"{sha(data)}  {name}\n" for name, data in payload.items())
    with (BASE / "SHA256SUMS.txt").open("x") as stream:
        stream.write(manifest)
    payload["SHA256SUMS.txt"] = manifest.encode()
    with zipfile.ZipFile(ARCHIVE, "x", zipfile.ZIP_DEFLATED, compresslevel=6) as archive:
        for name, data in payload.items():
            archive.writestr(f"{BASE.name}/{name}", data)
    with zipfile.ZipFile(ARCHIVE) as archive:
        assert archive.testzip() is None
        assert len(archive.namelist()) == len(payload)
        assert all(archive.read(f"{BASE.name}/{name}") == data for name, data in payload.items())
        print("ZIP PASS", len(payload), "files; every byte matches verified payload", flush=True)
        with tempfile.TemporaryDirectory(prefix="feedback-v06-portable-", dir=OUT) as folder:
            archive.extractall(folder)
            extracted = Path(folder) / BASE.name
            check = subprocess.run(["shasum", "-a", "256", "-c", "SHA256SUMS.txt"],
                                   cwd=extracted, text=True, capture_output=True)
            assert check.returncode == 0, check.stdout+check.stderr
            print("EXTRACTED HASH PASS", len(payload)-1, "payload hashes", flush=True)
            for n in range(19, 24):
                record = json.loads((extracted / f"results/feedback_{n}.json").read_text())
                M, rhs, solution = [sp.Matrix(record[key]) for key in ["matrix", "rhs", "solution"]]
                assert M*solution == rhs
                P = M[:, record["pivot_columns"]]
                assert P*sp.Matrix(record["pivot_inverse"]) == sp.eye(M.rows)
                assert str(P.to_DM().det()) == record["pivot_determinant"]
                with (extracted / f"results/matrix_{n}.csv").open() as stream:
                    assert sp.Matrix(list(csv.reader(stream))) == M
                print("EXTRACTED MATRIX PASS", n, M.shape, flush=True)
            subprocess.run([sys.executable, "-B", "audit_v0_05.py"], cwd=extracted, check=True)
    receipt = {"date": "2026-09-06", "archive": ARCHIVE.name,
        "sha256": sha(ARCHIVE.read_bytes()), "bytes": ARCHIVE.stat().st_size,
        "files": len(payload), "zip_crc_and_byte_equality_passed": True,
        "extracted_manifest_passed": True, "extracted_five_matrix_checks_passed": True,
        "extracted_v0_05_comparison_assertions_passed": True,
        "full_global_source_replay_before_packaging_passed": True,
        "full_source_replay_not_repeated_after_extraction": True,
        "previous_three_paper_bundle_sha256_unchanged": old_digest,
        "new_contraction_vanishing_through": 23, "arity23_controlled_not_held_out": True,
        "historical_bytes_recovered": False, "pdfs_changed": False,
        "images_generated": False, "preprint_uploaded": False}
    with (OUT / "feedback_matrices_v0_06_bundle.receipt.json").open("x") as stream:
        stream.write(json.dumps(receipt, indent=2)+"\n")
    print("DELIVERY PASS: exact matrix supplement sealed and extraction tested", flush=True)


if __name__ == "__main__":
    main()
