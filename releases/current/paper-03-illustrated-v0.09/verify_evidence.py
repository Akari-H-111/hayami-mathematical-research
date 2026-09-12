"""Replay the unchanged Paper III suites and the unchanged finite recovery models."""
from pathlib import Path
import hashlib
import json
import os
import subprocess
import sys
import sympy as sp

ROOT = Path(__file__).resolve().parent
if sys.flags.optimize:
    raise SystemExit('Assertions must be enabled; do not use Python -O.')
logs = ROOT / 'qa/evidence'
logs.mkdir(parents=True, exist_ok=True)
scripts = sorted((ROOT / 'evidence/verification/part_III').glob('verify_*.py'))
scripts += [ROOT / 'evidence/verify_proof_recovery_v0_03.py']
assert len(scripts) == 6
results = []
for script in scripts:
    print('RUN', script.relative_to(ROOT), flush=True)
    log = logs / (script.stem + '.txt')
    with log.open('w') as stream:
        run = subprocess.run([sys.executable, '-B', '-u', str(script)], cwd=script.parent,
                             stdout=stream, stderr=subprocess.STDOUT,
                             env={**os.environ, 'PYTHONDONTWRITEBYTECODE': '1'})
    if run.returncode:
        print(log.read_text())
        raise SystemExit(f'FAILED {script.name}: exit {run.returncode}; see {log}')
    results.append({'script': str(script.relative_to(ROOT)), 'exit_code': 0,
                    'script_sha256': hashlib.sha256(script.read_bytes()).hexdigest(),
                    'log_sha256': hashlib.sha256(log.read_bytes()).hexdigest()})
    print('PASS', script.name, flush=True)
report = {'scope': 'Five unchanged v0.57--v0.61 verifiers and the v0.03 recovery entry point with its v0.02 checks. Finite exact models, not proof-assistant formalization or Paper I high-arity replay.',
          'runs': results, 'sympy_version': sp.__version__}
(ROOT / 'qa/EVIDENCE_REPLAY.json').write_text(json.dumps(report, indent=2) + '\n')
print('PASS: six finite-evidence entry points.')
