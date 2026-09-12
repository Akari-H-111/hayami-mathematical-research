#!/usr/bin/env python3
"""Rebuild located TeX sources and measure text alignment to the final PDFs."""

from __future__ import annotations

import re
import shutil
import subprocess
from dataclasses import dataclass
from difflib import SequenceMatcher
from pathlib import Path


ROOT = Path(__file__).resolve().parent
BUILD = ROOT / "_build"
PAPERS = ROOT.parent.parent / "papers" / "legacy-geometry"


@dataclass(frozen=True)
class Candidate:
    name: str
    source_dir: Path
    tex: str
    final_pdf: Path
    expected_pages: int
    minimum_ratio: float
    classification: str


CANDIDATES = (
    Candidate(
        "ruled-v4",
        PAPERS / "orthogonal-circle-ruled-surface" / "source_ancestor",
        "hayami_ruled_surface_final.tex",
        PAPERS / "source-registry" / "final_pdfs" / "The_Orthogonal_Circle_Ruled_Surface_v4.pdf",
        13,
        0.60,
        "ancestor",
    ),
    Candidate(
        "stokes-v5",
        PAPERS / "stokes-caustic" / "source_candidate",
        "The_Stokes_Caustic_of_the_Orthogonal_Circle_Ruled_Surface_v5.tex",
        PAPERS / "source-registry" / "final_pdfs" / "The_Stokes_Caustic_of_the_Orthogonal_Circle_Ruled_Surface_v5.pdf",
        10,
        0.98,
        "content-aligned candidate",
    ),
    Candidate(
        "bicomplex-v12",
        PAPERS / "bicomplex-signal-manifolds" / "source_ancestor",
        "signal_manifolds_v2.tex",
        PAPERS / "source-registry" / "final_pdfs" / "Geometric_Realization_of_Bicomplex_Signal_Manifolds_v12.pdf",
        26,
        0.45,
        "ancestor",
    ),
)


def run(*args: str, cwd: Path | None = None) -> str:
    completed = subprocess.run(args, cwd=cwd, check=True, text=True, capture_output=True)
    return completed.stdout


def tokens(path: Path) -> list[str]:
    text = path.read_text(encoding="utf-8", errors="replace").lower()
    # This is deliberately a word-token comparison. PDF engines encode and
    # extract math glyphs differently even when the manuscript text agrees.
    return re.findall(r"[A-Za-z0-9]+", text)


def page_count(pdf: Path) -> int:
    info = run("pdfinfo", str(pdf))
    match = re.search(r"^Pages:\s+(\d+)$", info, re.MULTILINE)
    if not match:
        raise AssertionError(f"no page count in pdfinfo output for {pdf}")
    return int(match.group(1))


def build(candidate: Candidate) -> None:
    out = BUILD / candidate.name
    if out.exists():
        shutil.rmtree(out)
    out.mkdir(parents=True)
    run("tectonic", "--keep-logs", "--outdir", str(out), candidate.tex, cwd=candidate.source_dir)
    rebuilt = out / Path(candidate.tex).with_suffix(".pdf").name
    pages = page_count(rebuilt)
    if pages != candidate.expected_pages:
        raise AssertionError(f"{candidate.name}: expected {candidate.expected_pages} pages, got {pages}")

    final_text = out / "final.txt"
    rebuilt_text = out / "rebuilt.txt"
    run("pdftotext", "-raw", str(candidate.final_pdf), str(final_text))
    run("pdftotext", "-raw", str(rebuilt), str(rebuilt_text))
    final_tokens = tokens(final_text)
    rebuilt_tokens = tokens(rebuilt_text)
    ratio = SequenceMatcher(None, final_tokens, rebuilt_tokens, autojunk=False).ratio()
    if ratio < candidate.minimum_ratio:
        raise AssertionError(f"{candidate.name}: text alignment {ratio:.6f} below {candidate.minimum_ratio}")
    print(
        f"PASS {candidate.name}: {pages} pages; text alignment={ratio:.6f}; "
        f"classification={candidate.classification}"
    )


def main() -> None:
    for tool in ("tectonic", "pdfinfo", "pdftotext"):
        if shutil.which(tool) is None:
            raise RuntimeError(f"required command not found: {tool}")
    for candidate in CANDIDATES:
        build(candidate)


if __name__ == "__main__":
    main()
