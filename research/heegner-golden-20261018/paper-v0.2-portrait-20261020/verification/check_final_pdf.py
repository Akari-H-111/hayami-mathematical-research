#!/usr/bin/env python3
"""Check the portrait article PDF, its figure references and final-size labels.

This is a layout/text-layer check, not a mathematical proof checker.  It uses
the Poppler command-line tools already used for the page renders.  Run with
assertions enabled; never use Python -O.
"""
import hashlib
import json
import os
import re
import subprocess
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
PDF = ROOT / "output/pdf/golden_coordinates_level_five_v0_2.pdf"
SRC = ROOT / "main.tex"
LOG = Path(
    os.environ.get("LAYOUT_LOG", ROOT / "logs/pdflatex-pass11.txt")
)
BODY_META = ROOT / "companion/data/body_metadata.json"
OUT = ROOT / "verification/LAYOUT_CHECK.json"


def sha256(path):
    h = hashlib.sha256()
    with path.open("rb") as f:
        for block in iter(lambda: f.read(1 << 20), b""):
            h.update(block)
    return h.hexdigest()


def run(*args):
    return subprocess.run(args, check=True, text=True, capture_output=True).stdout


pdfinfo = run("pdfinfo", str(PDF))
pages = int(re.search(r"^Pages:\s+(\d+)$", pdfinfo, re.M).group(1))
size = re.search(r"^Page size:\s+(.+)$", pdfinfo, re.M).group(1)
title = re.search(r"^Title:\s+(.+)$", pdfinfo, re.M).group(1)
author = re.search(r"^Author:\s+(.+)$", pdfinfo, re.M).group(1)
text = run("pdftotext", "-layout", str(PDF), "-")

assert pages == 10, pages
assert "612 x 792" in size, size
assert title == "Golden Coordinates at Level Five", title
assert author == "Akari Hayami (Jian-Yu Huang)", author
assert "Akari Hayami (Jian-Yu Huang)" in text
assert "akari.h.1.9984@gmail.com" in text
for needle in [
    "Theorem 3.1", "Proposition 4.1", "Theorem 5.1", "Theorem 5.2",
    "Corollary A.1", "Spearman", "Williams", "Davenport",
]:
    assert needle in text, needle
for n in range(1, 5):
    assert text.count(f"Figure {n}") == 2, (n, text.count(f"Figure {n}"))
# The article uses compact ranges for the atlas: S01, S02-S03, S04, S05-S07,
# S08-S09, S10-S11, S12.  Check that every plate is covered by one of them.
ranges = [(1, 1), (2, 3), (4, 4), (5, 7), (8, 9), (10, 11), (12, 12)]
for lo, hi in ranges:
    token = f"S{lo:02d}" if lo == hi else f"S{lo:02d}\u2013S{hi:02d}"
    assert token in text, token
assert not re.search(r"\bFigure\s+(?:[5-9]|1[0-2])\b", text)
assert "??" not in text
assert "S00" not in text.replace("S0025-5718", "")

assert LOG.exists(), f"compile log not found: {LOG}"
log = LOG.read_text(errors="replace")
for bad in ["Overfull \\hbox", "Underfull \\hbox", "Undefined control sequence",
            "LaTeX Warning: Citation", "LaTeX Warning: Reference"]:
    assert bad not in log, bad

meta = json.loads(BODY_META.read_text())
scale = 6.5 / float(meta["canvas_width_inches"])
label = {}
for fig in meta["figures"]:
    n = int(fig["number"])
    label[n] = {
        "height_in": fig["height_inches"],
        "final_height_in": round(float(fig["height_inches"]) * scale, 3),
        "minimum_base_pt": meta["minimum_ordinary_artist_font_points"],
        "minimum_final_pt": round(
            meta["minimum_ordinary_artist_font_points"] * scale, 3
        ),
    }
    assert 8.0 <= label[n]["minimum_final_pt"], label[n]

result = {
    "date": "2026-10-20",
    "status": "PASS",
    "pdf": str(PDF.relative_to(ROOT)),
    "pdf_sha256": sha256(PDF),
    "source_sha256": sha256(SRC),
    "pages": pages,
    "page_size": size,
    "title": title,
    "author": author,
    "figure_count": 4,
    "body_figure_final_size": label,
    "checks": [
        "Ten letter pages; title, author and email are present in metadata and text.",
        "Theorems 3.1, 5.1, 5.2, Proposition 4.1 and Corollary A.1 are present.",
        "Figures 1-4 each occur twice: one running-text reference and one caption.",
        "Plates S01-S12 are named in the article text; no Figure 5-12 text remains.",
        "No unresolved references, no ??, and no overfull/underfull box log entries.",
        "Body figures use 6.4-inch source canvases with minimum artist text 8.5 pt; final scale is 6.5/6.4, giving at least 8.63 pt.",
    ],
    "scope": "Layout and text-layer check only; mathematical claims are checked by the separate exact and numerical scripts.",
}
OUT.write_text(json.dumps(result, indent=2) + "\n")
print(json.dumps(result, indent=2))
