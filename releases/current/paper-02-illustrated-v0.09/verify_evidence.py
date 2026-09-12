"""Replay the unchanged Paper II suites and verify the corrected figure claims."""
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
scripts = sorted((ROOT / 'evidence/verification/part_II').glob('verify_*.py'))
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
# General block form: all 42 free parameters, including the six off-diagonal entries.
S = sp.symbols('S')
C = sp.Matrix(6, 6, sp.symbols('c:36'))
ell = sp.Matrix(1, 6, sp.symbols('ell:6'))
B = sp.zeros(7)
B[0, 0] = -2
B[0, 1:] = ell
B[1:, 1:] = C
assert len(B.free_symbols) == 42
assert B[:, 0] == sp.Matrix([-2, 0, 0, 0, 0, 0, 0])
# A nonzero off-diagonal entry explicitly shows the complement need not be invariant.
example = sp.diag(-2, 0, 1, 2, 3, 4, 5)
example[0, 1] = 1
assert example[0, 1] != 0
assert sp.expand(example.charpoly(S).as_expr() - (S+2)*example[1:, 1:].charpoly(S).as_expr()) == 0
B0, B3 = sp.diag(-2, 0, 0, 0, 0, 0, 0), sp.diag(-2, 3, 3, 3, 3, 3, 3)
assert sp.gcd(B0.charpoly(S).as_expr(), B3.charpoly(S).as_expr()) == S+2
assert sp.gcd(S*(S+2), (S-3)*(S+2)) == S+2
u, v = sp.symbols('u v')
w = -v**2/(1+2*u)
assert sp.cancel(w+v**2+2*u*w) == 0
report = {'scope': 'Six unchanged finite-evidence entry points plus corrected figure regressions; not proof-assistant formalization or a new replay of Paper I high-arity completions.',
          'runs': results, 'block_parameters': 42, 'noninvariant_complement_witness': True,
          'characteristic_and_minimal_gcd': 'S+2', 'cancellation_MC_equation': 'PASS',
          'sympy_version': sp.__version__}
(ROOT / 'qa/EVIDENCE_REPLAY.json').write_text(json.dumps(report, indent=2) + '\n')
print('PASS: six finite-evidence entry points and corrected figure regressions.')
