"""Build the pinned source and fail closed on holes or incomplete axiom audits."""
from pathlib import Path
import re
import subprocess

ROOT = Path(__file__).resolve().parent
ALLOWED = {"propext", "Classical.choice", "Quot.sound"}


def run(*args):
    result = subprocess.run(args, cwd=ROOT, text=True, stdout=subprocess.PIPE,
                            stderr=subprocess.STDOUT)
    if result.returncode:
        raise SystemExit(result.stdout)
    return result.stdout


def main():
    files = [ROOT / "StokesV5.lean", *sorted((ROOT / "StokesV5").glob("*.lean"))]
    names = set()
    for path in files:
        text = path.read_text()
        # Comments are not proof terms; nested block comments occur in documentation.
        text = re.sub(r"/\*.*?\*/", "", text, flags=re.S)
        text = re.sub(r"/-.*?-/", "", text, flags=re.S)
        text = re.sub(r"--[^\n]*", "", text)
        if re.search(r"\b(sorry|admit|native_decide|unsafe|axiom)\b", text):
            raise SystemExit(f"FAIL proof boundary: {path.name}")
        names.update(re.findall(r"(?m)^(?:@\[[^]]*\]\s*)?theorem\s+(\w+)", text))
    audit = (ROOT / "StokesV5/Audit.lean").read_text()
    declared = re.findall(r"#print axioms StokesV5\.(\w+)", audit)
    if len(declared) != len(set(declared)) or set(declared) != names:
        raise SystemExit(f"FAIL audit coverage: missing {names - set(declared)}, extra {set(declared) - names}")
    run("lake", "-q", "build", "StokesV5")
    run("lake", "-q", "env", "lean", "StokesV5/Status.lean")
    output = run("lake", "-q", "env", "lean", "StokesV5/Audit.lean")
    found = set()
    for name, axioms in re.findall(r"'StokesV5\.(\w+)' depends on axioms: \[(.*?)\]", output, re.S):
        found.add(name)
        unexpected = {a.strip() for a in axioms.split(",") if a.strip()} - ALLOWED
        if unexpected:
            raise SystemExit(f"FAIL unexpected axioms: {name}: {unexpected}")
    found.update(re.findall(r"'StokesV5\.(\w+)' does not depend on any axioms", output))
    if found != names:
        raise SystemExit(f"FAIL audit output coverage: {names - found}")
    print(f"PASS {len(names)} public named theorems; build/status/axioms/proof-hole scan")


if __name__ == "__main__":
    main()
