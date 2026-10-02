"""Three-pass export of the successor paper 1; fail on layout/reference diagnostics."""
from pathlib import Path
import shutil
import subprocess

ROOT = Path(__file__).resolve().parents[4]
SOURCE = ROOT / "papers/legacy-geometry/bicomplex-signal-manifolds/successor/Realization_Limits_Bicomplex_Signal_Surface.tex"


def main():
    output = ROOT / "local/cache/bicomplex-audit/latex" / SOURCE.stem
    output.mkdir(parents=True, exist_ok=True)
    for pass_number in (1, 2, 3):
        result = subprocess.run(["pdflatex", "-interaction=nonstopmode", "-halt-on-error",
                                 "-output-directory", str(output), str(SOURCE)],
                                cwd=SOURCE.parent, text=True, errors="replace", stdout=subprocess.PIPE,
                                stderr=subprocess.STDOUT)
        (output / f"pass-{pass_number}.txt").write_text(result.stdout)
        if result.returncode:
            raise SystemExit(result.stdout)
    diagnostics = (output / (SOURCE.stem + ".log")).read_text(errors="replace")
    # Case-sensitive TeX diagnostics; package banners such as "info/warning/error" are not warnings.
    markers = [m for m in ("Overfull", "Underfull", "LaTeX Warning", "Warning:") if m in diagnostics]
    if markers or "undefined" in diagnostics.lower():
        raise SystemExit(f"FAIL PDF diagnostics {markers or ['undefined']}: {output}")
    shutil.copyfile(output / (SOURCE.stem + ".pdf"), SOURCE.with_suffix(".pdf"))
    print(f"PASS standalone PDF export: {SOURCE.name}")


if __name__ == "__main__":
    main()
