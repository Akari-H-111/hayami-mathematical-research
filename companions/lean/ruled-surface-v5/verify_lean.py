"""Fail closed on build errors, holes, unexpected axioms, or missing audit entries."""
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
    names = set()
    for path in [ROOT / "RuledV5.lean", *sorted((ROOT / "RuledV5").glob("*.lean"))]:
        source = re.sub(r"/-.*?-/", "", path.read_text(), flags=re.S)
        source = re.sub(r"--[^\n]*", "", source)
        if re.search(r"\b(sorry|sorryAx|admit|axiom|unsafe|native_decide)\b", source):
            raise SystemExit(f"FAIL proof boundary: {path.name}")
        names.update(re.findall(r"(?m)^theorem\s+(\w+)", source))
    declared = re.findall(r"#print axioms RuledV5\.(\w+)", (ROOT / "RuledV5/Audit.lean").read_text())
    if len(declared) != len(set(declared)) or set(declared) != names:
        raise SystemExit(f"FAIL audit inventory: missing {names-set(declared)}, extra {set(declared)-names}")
    logs = ROOT / ".lake/build/verification"
    logs.mkdir(parents=True, exist_ok=True)
    (logs / "build.txt").write_text(run("lake", "-q", "build", "RuledV5"))
    (logs / "status.txt").write_text(run("lake", "-q", "env", "lean", "RuledV5/Status.lean"))
    output = run("lake", "-q", "env", "lean", "RuledV5/Audit.lean")
    (logs / "axioms.txt").write_text(output)
    found = set()
    for name, axioms in re.findall(r"'RuledV5\.(\w+)' depends on axioms: \[(.*?)\]", output, re.S):
        found.add(name)
        extra = {a.strip() for a in axioms.split(",") if a.strip()}-ALLOWED
        if extra:
            raise SystemExit(f"FAIL unexpected axioms: {name}: {extra}")
    found.update(re.findall(r"'RuledV5\.(\w+)' does not depend on any axioms", output))
    if found != names:
        raise SystemExit(f"FAIL audit output: missing {names-found}, extra {found-names}")
    print(f"PASS {len(names)} public named theorems; build/status/full axiom audit/proof-hole scan")


if __name__ == "__main__":
    main()
