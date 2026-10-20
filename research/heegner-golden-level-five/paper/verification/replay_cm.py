"""Replay exactly the CM core and 100/200-digit diagnostics used by this paper."""
import json
import runpy
from pathlib import Path

if not __debug__:
    raise RuntimeError('Run with assertions enabled')
root = Path(__file__).resolve().parent
baseline = runpy.run_path(str(root / 'baseline_cm.py'))
result = {
    'exact': baseline['exact_core'](),
    'diagnostics': baseline['d163_diagnostics'](),
    'scope': 'Exact CM core and D=163 diagnostics only; no discriminant-control survey.'
}
(root / 'CM_REPLAY_RESULTS.json').write_text(json.dumps(result, indent=2) + '\n')
print('PASS: exact CM core and separate 100/200-digit diagnostics')
