"""Consistency checks for successor paper 1 (Realization Limits of the Bicomplex Signal Surface).

Checks source identities, that the correction appendix covers every v12 named
block exactly once with a valid category consistent with the audited claim map,
and that every cross-reference label exists. It then replays the exact/finite
verifiers whose identities the paper uses. It certifies no analytic proof.
"""
from pathlib import Path
import hashlib
import json
import re
import subprocess
import sys

PAPER = Path(__file__).resolve().parents[1]
REGISTRY = PAPER.parent / "source-registry"
TEX = PAPER / "successor/Realization_Limits_Bicomplex_Signal_Surface.tex"
HASHES = {
    REGISTRY / "final_pdfs/Geometric_Realization_of_Bicomplex_Signal_Manifolds_v12.pdf":
        "4ebb8f0a7d6e88a6c5cd97f65d224b4e938867cabad54f057d3ceafb24167d5a",
    REGISTRY / "historical_drafts/Geometric_Realization_of_Bicomplex_Signal_Manifolds_v11.pdf":
        "207a51feed62fe7f5a6dd7c9190258dd1b9c996c8b2735e799aff569bb017ec2",
}
# Categories fixed by the audited claim map and continuation overlays.
EXPECTED = {"D": {"3.1"}, "R": {"8.13", "8.14", "8.15"}, "O": {"8.12", "8.21"},
            "M": {"8.20", "8.22", "8.23"}, "S": {"7.6"}}


def main():
    assert not sys.flags.optimize
    for path, digest in HASHES.items():
        assert hashlib.sha256(path.read_bytes()).hexdigest() == digest, path
    claims = json.loads((PAPER / "claims/CLAIM_MAP.json").read_text())["claims"]
    ids = [c["id"] for c in claims]
    assert len(ids) == 66
    tex = TEX.read_text()
    table = tex[tex.index(r"\begin{longtable}"):tex.index(r"\end{longtable}")]
    rows = re.findall(r"^(\d+\.\d+) & ([HCSROMD]) & ", table, flags=re.M)
    found = [r[0] for r in rows]
    assert sorted(found) == sorted(ids) and len(found) == len(set(found)), \
        (set(ids) - set(found), set(found) - set(ids))
    category = dict(rows)
    for cat, expected in EXPECTED.items():
        assert {k for k, v in category.items() if v == cat} == expected, cat
    refuted = {c["id"]: c for c in claims if c["id"] in EXPECTED["R"]}
    assert "REFUTED" in refuted["8.13"]["status"]
    assert "infinite" in (refuted["8.15"]["issue"] + refuted["8.15"]["corrected_statement"]).lower()
    labels = set(re.findall(r"\\label\{([^}]+)\}", tex))
    refs = set(re.findall(r"\\ref\{([^}]+)\}", tex))
    assert refs <= labels, refs - labels
    cites = set(c for group in re.findall(r"\\cite(?:\[[^]]*\])?\{([^}]+)\}", tex) for c in group.split(","))
    bibs = set(re.findall(r"\\bibitem\{([^}]+)\}", tex))
    assert cites <= bibs, cites - bibs
    print(f"PASS paper 1: v12/v11 hashes; 66/66 v12 blocks categorized once ({dict((k, len(v)) for k, v in EXPECTED.items())} fixed); refs and citations resolve")
    manifest = json.loads((PAPER / "successor/figures/FIGURES_MANIFEST.json").read_text())["figures"]
    used = re.findall(r"\\includegraphics(?:\[[^]]*\])?\{([^}]+)\}", tex)
    assert len(used) >= 7
    for name in used:
        figure = PAPER / "successor/figures" / name
        assert hashlib.sha256(figure.read_bytes()).hexdigest() == manifest[name], name
    print(f"PASS paper 1: {len(used)} included figures exist and match FIGURES_MANIFEST.json")
    for script in ("verify_revision.py", "verify_continuation.py", "verify_continuation_0_04.py"):
        out = subprocess.run([sys.executable, "-B", str(PAPER / "verification" / script)],
                             text=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
        if out.returncode:
            raise SystemExit(out.stdout)
        print(out.stdout.strip().splitlines()[-1])
    print("PASS successor paper 1 consistency and exact replay; written proofs and external theorems are not machine-certified")


if __name__ == "__main__":
    main()
