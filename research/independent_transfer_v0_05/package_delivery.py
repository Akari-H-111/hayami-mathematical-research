"""Package the exact approved files; test extracted consumers and legacy suite."""
import hashlib
import json
from pathlib import Path
import subprocess
import sys
import tempfile
import zipfile

ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / "releases/archive/paper-01"
NEW = OUT / "independent-reconstruction-v0.05"
ARCHIVE = ROOT / "releases/archive/three-papers/three_papers_v0_05_bundle.zip"
FILES = """
README.md RESEARCH_REPORT.md RESEARCH_LOG.md requirements-repro.txt
paper_I_fixed_cubic_v0_05.tex paper_I_fixed_cubic_v0_05.pdf paper_I_fixed_cubic_v0_05.log
reconstruct.py complete_and_verify.py verify_frozen_projection.py verify_all.py record_run.py qa_pdf.py
transfer_through_22.json complete_splitting.json heldout_arity23.json
BASELINE_VERIFICATION_LOG.txt INDEPENDENT_REPLAY_LOG.txt FROZEN_PROJECTION_LOG.txt
FROZEN_REPLAY_LOG.txt FINAL_REPLAY_LOG.txt PDF_QA.json VISUAL_REVIEW.json
verification/verify_cubic_support_multigrading_v0_47.py
verification/low_rail_oos_arity23_factorization_v0_33_certificate.json
verification/verify_pdf_outputs.py
""".split()


def sha(data):
    return hashlib.sha256(data).hexdigest()


def main():
    if sys.flags.optimize:
        raise SystemExit("Assertions must be enabled.")
    if ARCHIVE.exists():
        raise SystemExit(f"Refusing to overwrite {ARCHIVE}")
    replay = (NEW / "FINAL_REPLAY_LOG.txt").read_text()
    assert replay.rstrip().endswith("EXIT STATUS: 0")
    assert "ALL EXACT MATHEMATICAL REPLAY CHECKS PASSED" in replay
    qa = json.loads((NEW / "PDF_QA.json").read_text())
    assert qa["structural_and_text_qa_passed"] and qa["manual_review_passed"]
    assert qa["sha256"] == sha((NEW / "paper_I_fixed_cubic_v0_05.pdf").read_bytes())
    original_hashes = {
        "inverse_leibniz_problem_v0_41_fixed_case_completion.tex": "5a3fcc821954021e50033ab63dd58be25d49a182d51fdbdf2f6b888a6ecbe890",
        "paper_II_homotopy_tilt_naturality_v0_01.tex": "bab3b90106a329186819e797c07554c9112550a12d6d83c2da08f1fef16592a9",
        "paper_III_general_spectral_floor_v0_01.tex": "e15a5c059bd087593b31d17aeb66bd833e356b871f9b01f5ced5805409cfe466",
    }
    assert all(sha((ROOT / name).read_bytes()) == expected for name, expected in original_hashes.items())
    old_path = OUT / "three_papers_v0_04_bundle.zip"
    assert sha(old_path.read_bytes()) == "266b65c7431f392ae0813e73760190b2f613bec18945d05f6985d58003ed514c"
    payload = {"DELIVERY_INDEX_v0_05.md": (OUT / "DELIVERY_INDEX_v0_05.md").read_bytes()}
    with zipfile.ZipFile(old_path) as old:
        assert old.testzip() is None
        for member in old.infolist():
            if not member.is_dir():
                assert member.filename.startswith("three_papers_v0_04/")
                payload[member.filename] = old.read(member)
                assert (OUT / member.filename).read_bytes() == payload[member.filename]
    payload.update({f"{NEW.name}/{name}": (NEW / name).read_bytes() for name in FILES})
    assert all(not Path(name).is_absolute() and ".." not in Path(name).parts for name in payload)
    assert all(Path(name).suffix.lower() not in {".png", ".jpg", ".svg", ".webp"} for name in payload)
    manifest = "".join(f"{sha(data)}  {name}\n" for name, data in sorted(payload.items()))
    with (OUT / "SHA256SUMS_v0_05.txt").open("x") as stream:
        stream.write(manifest)
    payload["SHA256SUMS.txt"] = manifest.encode()
    with zipfile.ZipFile(ARCHIVE, "x", compression=zipfile.ZIP_DEFLATED, compresslevel=6) as bundle:
        for name, data in sorted(payload.items()):
            bundle.writestr(name, data)
    with zipfile.ZipFile(ARCHIVE) as bundle:
        assert bundle.testzip() is None
        assert set(bundle.namelist()) == set(payload)
        assert all(bundle.read(name) == data for name, data in payload.items())
        print(f"ZIP PASS: {len(payload)} files, all contents byte-exact", flush=True)
        with tempfile.TemporaryDirectory(prefix="inverse-leibniz-v05-portable-", dir=OUT) as name:
            temp = Path(name)
            bundle.extractall(temp)
            assert all((temp / name).read_bytes() == data for name, data in payload.items())
            portable = temp / NEW.name
            commands = [
                (temp, ["shasum", "-a", "256", "-c", "SHA256SUMS.txt"]),
                (portable, [sys.executable, "-B", "verify_frozen_projection.py",
                            "transfer_through_22.json", "complete_splitting.json", str(temp / "heldout.json")]),
                (portable, [sys.executable, "-B", "qa_pdf.py"]),
                (temp / "three_papers_v0_04", [sys.executable, "-B", "verify_all.py"]),
                (temp / "three_papers_v0_04", [sys.executable, "-B", "verify_pdf_outputs.py"]),
            ]
            for cwd, command in commands:
                print(f"PORTABLE RUN: {cwd.name} {command}", flush=True)
                subprocess.run(command, cwd=cwd, check=True)
            assert (temp / "heldout.json").read_bytes() == (NEW / "heldout_arity23.json").read_bytes()
    receipt = {
        "date": "2026-09-06", "archive": ARCHIVE.name,
        "sha256": sha(ARCHIVE.read_bytes()), "bytes": ARCHIVE.stat().st_size,
        "files": len(payload), "zip_crc_and_all_member_hashes_passed": True,
        "extracted_manifest_passed": True, "preview_images_in_archive": False,
        "full_exact_replay_before_packaging_passed": True,
        "extracted_frozen_arity23_replay_byte_exact": True,
        "extracted_legacy_12_top_level_runs_passed": True,
        "extracted_new_and_legacy_pdf_qa_passed": True,
        "full_kernel_and_inverse_not_recomputed_again_after_extraction": True,
        "note": "Extracted code/data are byte-identical to the full replay inputs. The frozen consumer and legacy suite were additionally executed from the extracted directories.",
        "latest_pdf_pages": {"I_v0_05": 56, "II_v0_04": 8, "III_v0_04": 11},
        "original_tex_hashes_verified_unchanged": original_hashes,
        "all_48_legacy_bundle_files_verified_unchanged": True,
        "no_preprint_uploaded": True,
    }
    with (OUT / "three_papers_v0_05_bundle.receipt.json").open("x") as stream:
        stream.write(json.dumps(receipt, indent=2) + "\n")
    print("DELIVERY PASS: archive integrity and extracted portability checks", flush=True)


if __name__ == "__main__":
    main()
