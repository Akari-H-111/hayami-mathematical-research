#!/usr/bin/env python3
"""Assert the compact-body mappings; this does not certify external theorems."""
from __future__ import annotations

import json
from pathlib import Path

import mpmath as mp
import numpy as np

ROOT = Path(__file__).resolve().parents[1]
values = json.loads((ROOT / "data" / "figure_values.json").read_text())
meta = json.loads((ROOT / "data" / "body_metadata.json").read_text())
arrays = np.load(ROOT / "data" / "figure_arrays.npz")
mp.mp.dps = 180

assert meta["canvas_width_inches"] == 6.4
assert all(item["height_inches"] > 0 for item in meta["figures"])
assert meta["font_points"]["tick_labels"] >= 8.5
c0 = mp.mpf(values["constants"]["c0"]); u0 = mp.mpf(values["constants"]["u0"])
assert abs(u0 - (1 - c0) / 2) < mp.mpf("1e-80")
assert abs(c0 * c0 - 3 * c0 + 1) < mp.mpf("1e-80")  # locus alone is not the full condition
# A point on the necessary line need not have rank loss.
def norm_on_locus(c):
    u=(1-c)/2; sine=np.sqrt(1-c*c);q=np.sqrt(c*(2-c))
    st=np.array([sine*(2*u-1),(1-u)*c,-u*sine*(1-c)/q])
    su=np.array([2*(1-c),-sine,q])
    return np.linalg.norm(np.cross(st,su))
assert norm_on_locus(.5)>.1
assert norm_on_locus(float(c0))<1e-13
layout=json.loads((ROOT/'data/body_layout_audit.json').read_text())
assert len(layout)==4 and all(not x['outside_canvas'] for x in layout)
assert all(x['canvas_inches'][0]==6.4 and x['minimum_base_text_points']>=8.5 for x in layout)
M = np.array(values["matrices"]["M"]); J = np.array(values["matrices"]["J"]); A = np.array(values["matrices"]["A"])
sample = {key: np.array(value) for key, value in values["reflection_samples"].items()}
assert np.allclose(A, J @ M @ J, atol=2e-14)
assert np.allclose(sample["A_input"], J @ sample["M_input"], atol=2e-14)
assert np.allclose(sample["A_output"], J @ sample["M_output"], atol=2e-14)
assert arrays["dft_m"].tolist() == [1, 2, 3, 4, 5]
assert np.allclose(arrays["dft_input"], [1, float(mp.mpf(values["constants"]["kappa"])), -float(mp.mpf(values["constants"]["kappa"])), -1, 0])
R = mp.e ** (mp.pi * mp.sqrt(163)); gap = mp.mpf(values["hermite"]["N_minus_R"])
terms = [mp.mpf(x) for x in values["hermite"]["corrections"]]
residuals = [mp.mpf(x) for x in values["hermite"]["residuals"]]
assert len(terms) == len(residuals) == 6
for count, residual in enumerate(residuals, 1):
    assert abs(residual - (gap - sum(terms[:count]))) < mp.mpf("1e-120")
assert abs(gap - (mp.mpf(values["hermite"]["N"]) - R)) < mp.mpf("1e-150")
print("PASS: body dimensions, rank-loss distinction, correction indexing, and reflection/residue conventions agree with saved data.")
