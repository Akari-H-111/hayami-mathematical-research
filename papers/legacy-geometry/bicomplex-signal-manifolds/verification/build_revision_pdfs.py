"""Export the native-editor-checked standalone sources and retain build diagnostics."""
from pathlib import Path
import shutil
import subprocess

ROOT = Path(__file__).resolve().parents[4]
PAPER = ROOT / "papers/legacy-geometry/bicomplex-signal-manifolds/revision"
SOURCES = [PAPER / "Bicomplex_Signal_Manifolds_v13_working.tex",
           PAPER / "Bicomplex_Companion_v0_01_working.tex"]


def main():
    for source in SOURCES:
        output = ROOT / "local/cache/bicomplex-audit/latex" / source.stem
        output.mkdir(parents=True, exist_ok=True)
        for pass_number in (1, 2, 3):
            result = subprocess.run(["pdflatex", "-interaction=nonstopmode", "-halt-on-error",
                                     "-output-directory", str(output), str(source)],
                                    cwd=source.parent, text=True, stdout=subprocess.PIPE,
                                    stderr=subprocess.STDOUT)
            (output / f"pass-{pass_number}.txt").write_text(result.stdout)
            if result.returncode:
                raise SystemExit(result.stdout)
        diagnostics = (output / (source.stem + ".log")).read_text()
        if "Overfull" in diagnostics or "undefined" in diagnostics.lower():
            raise SystemExit(f"FAIL PDF layout/reference diagnostics: {output}")
        shutil.copyfile(output / (source.stem + ".pdf"), source.with_suffix(".pdf"))
        print(f"PASS standalone PDF export: {source.name}")


if __name__ == "__main__":
    main()
