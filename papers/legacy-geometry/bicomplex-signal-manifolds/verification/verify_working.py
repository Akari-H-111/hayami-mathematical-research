"""Replay the actual local Bicomplex working tree and hash-bound PDF acceptance.

PDF checks reuse the frozen Ruled v0.03 acceptance pattern. Dependency caches
may be reused; each source is built and all axiom inventories are re-audited.
"""
from pathlib import Path
import hashlib
import json
import re
import shutil
import subprocess
import sys
import tempfile

ROOT = Path(__file__).resolve().parents[4]
PAPER = ROOT / "papers/legacy-geometry/bicomplex-signal-manifolds"
QA = PAPER / "revision/qa"


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def run(command, cwd=ROOT):
    result = subprocess.run(command, cwd=cwd, text=True, stdout=subprocess.PIPE,
                            stderr=subprocess.STDOUT)
    if result.returncode:
        raise SystemExit(result.stdout)
    return result.stdout


def verify_pdfs():
    visual = json.loads((QA / "VISUAL_QA_FINAL.json").read_text())
    native = json.loads((PAPER / "revision/NATIVE_COMPILATION.json").read_text())
    native_sources = {d["source"]: d for d in native["documents"]}
    for document in visual["documents"]:
        source, pdf = ROOT / document["source"], ROOT / document["pdf"]
        assert sha(source) == document["source_sha256"]
        assert sha(pdf) == document["pdf_sha256"]
        assert native_sources[document["source"]]["source_sha256"] == sha(source)
        assert native_sources[document["source"]]["kind"] == "success"
        assert len(document["page_checks"]) == document["pages"]
        receipt = native_sources[document["source"]]
        assert sha(ROOT / receipt["diagnostics"]) == receipt["diagnostics_sha256"]
        run(["qpdf", "--check", str(pdf)])
        accepted_text = run(["pdftotext", "-layout", str(pdf), "-"])
        with tempfile.TemporaryDirectory(prefix="bicomplex-working-pdf-") as directory:
            build = Path(directory)
            shutil.copy2(source, build / source.name)
            for _ in (1, 2, 3):
                run(["pdflatex", "-interaction=nonstopmode", "-halt-on-error", source.name], build)
            log = (build / (source.stem + ".log")).read_text()
            assert "Overfull" not in log and "undefined" not in log.lower()
            rebuilt = build / pdf.name
            run(["qpdf", "--check", str(rebuilt)])
            info = run(["pdfinfo", str(rebuilt)])
            assert re.search(rf"Pages:\s+{document['pages']}\b", info)
            assert "595.276 x 841.89 pts (A4)" in info
            assert run(["pdftotext", "-layout", str(rebuilt), "-"]) == accepted_text
            run(["pdftoppm", "-r", str(visual["dpi"]), "-png", str(rebuilt), str(build / "page")])
            for page in document["page_checks"]:
                assert page["visually_inspected"]
                assert sha(ROOT / page["render"]) == page["render_sha256"]
                assert sha(build / f"page-{page['page']:0{len(str(document['pages']))}d}.png") == page["render_sha256"], "FAIL rebuilt rendering needs fresh visual QA"
        print(f"PASS {document['kind']}: source/native/PDF binding, isolated rebuild, all-page render equality", flush=True)


def main():
    if sys.flags.optimize:
        raise SystemExit("FAIL Python optimization disables assertions")
    missing = [name for name in ("lake", "pdflatex", "qpdf", "pdfinfo", "pdftotext", "pdftoppm")
               if not shutil.which(name)]
    if missing:
        raise SystemExit(f"FAIL missing commands: {missing}")
    import sympy
    assert sympy.__version__ == "1.14.0", "Use the registered pinned Python environment"
    claim_paths = [PAPER / "claims/CLAIM_MAP.json", PAPER / "claims/CLAIM_MAP.md"]
    before = [sha(path) for path in claim_paths]
    print(run([sys.executable, "-B", str(PAPER / "verification/build_claim_map.py")]), end="", flush=True)
    assert [sha(path) for path in claim_paths] == before, "FAIL claim-map rebuild drift"
    inventory = json.loads(claim_paths[0].read_text())
    claims = inventory["claims"]
    assert len(claims) == 66 and len({c["id"] for c in claims}) == 66
    source = (PAPER / "revision/Bicomplex_Signal_Manifolds_v13_working.tex").read_text()
    for claim in claims:
        label = claim["written_proof"].split("#", 1)[1]
        assert r"\label{" + label + "}" in source, f"FAIL missing written proof route: {claim['id']}"
    for result in inventory["continuation"]:
        for route in result["written_proofs"]:
            path, label = route.split("#", 1)
            assert r"\label{" + label + "}" in (PAPER / path).read_text(), route
    print("PASS complete page-pinned claim inventory and written-proof routes", flush=True)
    for script in (ROOT / "verification/legacy-reconstruction/verify_all.py",
                   PAPER / "verification/verify_revision.py",
                   PAPER / "verification/verify_continuation.py"):
        print(run([sys.executable, "-B", str(script)]), end="", flush=True)
    for name, expected in (("stokes-caustic-v5", 258), ("ruled-surface-v5", 224),
                           ("bicomplex-signal-manifolds", 33)):
        project = ROOT / "companions/lean" / name
        if not (project / ".lake/packages/mathlib").exists():
            # Lockfiles pin every dependency; lake update is not an acceptance step.
            print(run(["lake", "exe", "cache", "get"], project), end="", flush=True)
        assert "version 4.33.1" in run(["lake", "env", "lean", "--version"], project)
        report = run([sys.executable, "-B", "verify_lean.py"], project)
        assert f"PASS {expected} public named theorems;" in report
        print(report, end="", flush=True)
    verify_pdfs()
    print("PASS working continuation: exact replay, 33 own/224 Ruled/258 Stokes audits, PDFs; partial coverage, unpublished", flush=True)


if __name__ == "__main__":
    main()
