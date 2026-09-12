"""Read-only structural/text QA, with a separate hash-bound visual review record."""
import hashlib
import json
import re
import subprocess
from pathlib import Path

import pdfplumber
from pypdf import PdfReader

BASE = Path(__file__).resolve().parent
ORIGINALS = {
    "inverse_leibniz_problem_v0_41_fixed_case_completion.tex": "5a3fcc821954021e50033ab63dd58be25d49a182d51fdbdf2f6b888a6ecbe890",
    "paper_II_homotopy_tilt_naturality_v0_01.tex": "bab3b90106a329186819e797c07554c9112550a12d6d83c2da08f1fef16592a9",
    "paper_III_general_spectral_floor_v0_01.tex": "e15a5c059bd087593b31d17aeb66bd833e356b871f9b01f5ced5805409cfe466",
}
STEMS = [
    "paper_I_fixed_cubic_v0_04",
    "paper_II_marked_naturality_v0_04",
    "paper_III_spectral_floor_v0_04",
]


def digest(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def check_paper(stem):
    pdf = BASE / (stem + ".pdf")
    tex = pdf.with_suffix(".tex").read_text()
    log = pdf.with_suffix(".log").read_text()
    bib = set(re.findall(r"\\bibitem(?:\[[^\]]*\])?\{([^}]+)\}", tex))
    citations = [
        key.strip()
        for group in re.findall(r"\\cite(?:\[[^\]]*\])?\{([^}]+)\}", tex)
        for key in group.split(",")
    ]
    labels = re.findall(r"\\label\{([^}]+)\}", tex)
    references = set(re.findall(r"\\(?:eqref|ref|pageref)\{([^}]+)\}", tex))
    reader = PdfReader(pdf)
    pages = []
    with pdfplumber.open(pdf) as document:
        for number, page in enumerate(document.pages, 1):
            chars = page.chars
            outside = [
                c.get("text", "")
                for c in chars
                if c["x0"] < -0.5 or c["x1"] > page.width + 0.5
                or c["top"] < -0.5 or c["bottom"] > page.height + 0.5
            ]
            bounds = None if not chars else [
                round(min(c["x0"] for c in chars), 2),
                round(max(c["x1"] for c in chars), 2),
                round(min(c["top"] for c in chars), 2),
                round(max(c["bottom"] for c in chars), 2),
            ]
            pages.append({
                "page": number, "size_pt": [page.width, page.height],
                "character_count": len(chars), "text_bounds_x0_x1_top_bottom": bounds,
                "outside_page_characters": outside,
                "embedded_image_count": len(page.images),
            })
    qpdf = subprocess.run(["qpdf", "--check", str(pdf)], capture_output=True, text=True)
    log_issues = [
        line for line in log.splitlines()
        if re.search(r"Overfull|Underfull|undefined|Missing character|LaTeX Warning|Package .+ Warning", line, re.I)
    ]
    checks = {
        "missing_citation_keys": sorted(set(citations) - bib),
        "uncited_bibliography_keys": sorted(bib - set(citations)),
        "undefined_label_references": sorted(references - set(labels)),
        "duplicate_labels": sorted({label for label in labels if labels.count(label) > 1}),
        "log_issues": log_issues,
        "blank_pages": [p["page"] for p in pages if p["character_count"] == 0],
        "pages_with_outside_text": [p["page"] for p in pages if p["outside_page_characters"]],
    }
    passed = qpdf.returncode == 0 and not any(checks.values())
    return {
        "file": pdf.name, "sha256": digest(pdf), "pages": len(reader.pages),
        "bibliography_entries": len(bib), "citation_key_uses": len(citations),
        "metadata": {str(k): str(v) for k, v in (reader.metadata or {}).items()},
        "qpdf_exit_status": qpdf.returncode,
        "qpdf_output": (qpdf.stdout + qpdf.stderr).replace(str(BASE), "."),
        "checks": checks, "page_geometry": pages,
        "embedded_image_count": sum(p["embedded_image_count"] for p in pages),
        "structural_and_text_qa_passed": passed,
    }


def main():
    originals = []
    for name, expected in ORIGINALS.items():
        path = BASE.parents[2] / name
        actual = digest(path) if path.is_file() else None
        originals.append({
            "file": name, "sha256_before": expected, "sha256_after": actual,
            "unchanged": actual == expected,
        })
    papers = [check_paper(stem) for stem in STEMS]
    visual_path = BASE / "VISUAL_REVIEW.json"
    visual = json.loads(visual_path.read_text()) if visual_path.is_file() else {}
    approvals = {p["file"]:p for p in visual.get("papers",[])}
    for paper in papers:
        approval = approvals.get(paper["file"],{})
        paper["visual_review_record_matches"] = (
            approval.get("sha256") == paper["sha256"]
            and approval.get("reviewed_page_range") == [1,paper["pages"]]
            and approval.get("layout_review_passed") is True
        )
    images = [
        str(p.relative_to(BASE)) for p in BASE.rglob("*")
        if p.suffix.lower() in {".png", ".jpg", ".jpeg", ".svg", ".webp", ".gif"}
    ]
    result = {
        "date": "2026-09-05", "scope": "Automated structural/text QA plus validation of a separate manual visual-review record; not a proof audit.",
        "rasterization_performed_by_this_script": False,
        "existing_pdf_pages_rasterized_for_visual_review": visual.get("existing_pdf_pages_rasterized",False),
        "manual_page_visual_review_performed": all(p["visual_review_record_matches"] for p in papers),
        "visual_review_record": visual_path.name if visual else None,
        "generated_image_files": images, "original_sources": originals, "papers": papers,
        "all_structural_and_text_checks_passed": all(p["structural_and_text_qa_passed"] for p in papers),
    }
    print(json.dumps(result, ensure_ascii=False, indent=2))
    if not result["all_structural_and_text_checks_passed"] or images:
        raise SystemExit(1)
    if visual and not result["manual_page_visual_review_performed"]:
        raise SystemExit("Visual-review record is incomplete or stale; reinspect changed PDFs.")
    # Original files are outside the portable bundle; only compare when present.
    if any(p["sha256_after"] is not None and not p["unchanged"] for p in originals):
        raise SystemExit(1)


if __name__ == "__main__":
    main()
