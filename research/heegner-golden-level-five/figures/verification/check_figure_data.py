#!/usr/bin/env python3
"""Checks the saved plotting inputs; it does not certify external theorems."""
from __future__ import annotations
import json
from pathlib import Path
import mpmath as mp
import numpy as np

ROOT=Path(__file__).resolve().parents[1]
v=json.loads((ROOT/"data"/"figure_values.json").read_text())
a=np.load(ROOT/"data"/"figure_arrays.npz")
mp.mp.dps=180
def q(x): return mp.mpf(x)
phi=q(v["constants"]["phi"]);c0=q(v["constants"]["c0"]);gamma=q(v["constants"]["gamma"]);u0=q(v["constants"]["u0"]);kappa=q(v["constants"]["kappa"])
assert abs(phi-(1+mp.sqrt(5))/2)<mp.mpf("1e-80")
assert abs(c0-phi**-2)<mp.mpf("1e-80") and abs(gamma-(1-c0))<mp.mpf("1e-80") and abs(u0-gamma/2)<mp.mpf("1e-80")
M=np.array(v["matrices"]["M"]);J=np.array(v["matrices"]["J"]);A=np.array(v["matrices"]["A"])
reflection={k:np.array(val) for k,val in v["reflection_samples"].items()}
assert np.allclose(reflection["A_input"],J@reflection["M_input"],atol=2e-14)
assert np.allclose(reflection["M_output"],M@reflection["M_input"],atol=2e-14)
assert np.allclose(reflection["A_output"],A@reflection["A_input"],atol=2e-14)
assert np.allclose(reflection["A_output"],J@reflection["M_output"],atol=2e-14)
assert np.allclose(A,J@M@J,atol=2e-14) and np.allclose(M@M,np.eye(2),atol=2e-14)
assert np.allclose(A@np.array([1,float(kappa)]),[1,float(kappa)],atol=2e-14)
# Finite positive-exponential DFT, in the saved m=1,2,3,4,5 order.
assert a["dft_m"].tolist()==[1,2,3,4,5] and a["dft_n"].tolist()==[1,2,3,4,5]
avec=a["dft_input"]
assert np.max(np.abs(avec-np.array([1,float(kappa),-float(kappa),-1,0.])))<3e-14
F=np.array([sum(avec[j]*np.exp(2j*np.pi*m*(j+1)/5) for j in range(5))/np.sqrt(5) for m in a["dft_m"]])
saved=a["dft_output_real"]+1j*a["dft_output_imag"]
assert np.max(np.abs(saved-(-1j*F)))<3e-14
assert np.max(np.abs(saved.real-avec))<3e-14 and np.max(np.abs(saved.imag))<3e-14
# Direct surface parameter check for both reflected lateral points.
ts=[mp.acos(c0),-mp.acos(c0)]
for t,p in zip(ts,a["surface_reflected_points"]):
    c=mp.cos(t);s=mp.sin(t);Q=mp.sqrt(c*(2-c));expected=[c+2*u0*(1-c),(1-u0)*s,u0*Q]
    assert max(abs(mp.mpf(str(x))-y) for x,y in zip(p,expected))<mp.mpf("2e-15")
assert abs(c0*c0-3*c0+1)<mp.mpf("1e-80") and abs(u0-(1-c0)/2)<mp.mpf("1e-80")
# The actual plotted pentagon has vertex 1 at 72 degrees and a horizontal u0 projection.
pent=a["pentagon_vertices"]
assert np.max(np.abs(pent[0]-[1,0]))<3e-15 and abs(pent[1,0]-float(u0))<3e-15
side=float(a["pentagon_side_length"][0]); diagonal=float(a["pentagon_diagonal_length"][0])
assert abs(side-np.linalg.norm(pent[1]-pent[0]))<3e-15 and abs(diagonal-np.linalg.norm(pent[2]-pent[0]))<3e-15
assert abs((side/diagonal)**2-float(c0))<3e-14
# Chord counts and squared ratio of actual saved vertices/distances.
dist=a["icosahedron_pair_distances"];vals=np.unique(np.round(dist,10));assert len(dist)==66 and len(vals)==3
counts=[int(np.sum(np.isclose(dist,x,atol=1e-8))) for x in vals];assert counts==[30,30,6]
assert abs((mp.mpf(str(vals[0]))/mp.mpf(str(vals[1])))**2-c0)<mp.mpf("1e-8")
# Theta samples were independently evaluated on reciprocal arguments.
t=a["theta_t"];th=a["theta_values"];thr=a["theta_reciprocal_values"]
assert np.max(np.abs(th-t**(-1.5)*thr))<2e-13
# RR reciprocal values are not a reversed copy of r(iy): directly re-evaluate every saved point.
def rr_iy(y, terms=180):
    y=mp.mpf(str(y)); qq=mp.e**(-2*mp.pi*y); product=mp.mpf(1)
    for n in range(1,terms+1): product*=((1-qq**(5*n-4))*(1-qq**(5*n-1))/((1-qq**(5*n-3))*(1-qq**(5*n-2))))
    return qq**(mp.mpf(1)/5)*product
assert np.max(np.abs(a["rr_values"]-np.array([float(rr_iy(x)) for x in a["rr_y"]])))<3e-15
assert np.max(np.abs(a["rr_reciprocal_values"]-np.array([float(rr_iy(1/mp.mpf(str(x)))) for x in a["rr_y"]])))<3e-15
assert np.all(np.diff(a["rr_reciprocal_values"])>0) and not np.allclose(a["rr_reciprocal_values"],a["rr_values"][::-1])
# High-precision near-integer gap: never compute it in float64.
R=mp.e**(mp.pi*mp.sqrt(163));N=mp.mpf(v["hermite"]["N"]);gap=q(v["hermite"]["N_minus_R"])
assert abs(gap-(N-R))<mp.mpf("1e-150") and gap>0
assert v["hermite"]["qj_coefficients"][:3]==["1","744","196884"]
# Independently form all displayed correction powers: first is 196884/R, not /R^2.
jq=[mp.mpf(x) for x in v["hermite"]["qj_coefficients"]]
terms=[jq[n+1]*(-1)**(n+1)/R**n for n in range(1,4)]
saved_terms=[q(x) for x in v["hermite"]["corrections"][:3]]
assert all(abs(x-y)<mp.mpf("1e-120") for x,y in zip(terms,saved_terms))
saved_residuals=[q(x) for x in v["hermite"]["residuals"][:3]]
for n in range(1,4): assert abs(saved_residuals[n-1]-(gap-sum(terms[:n])))<mp.mpf("1e-120")
print("PASS: saved formulas, DFT order/output, surface and pentagon coordinates, RR samples, chord data, theta samples, and high-precision correction ladder agree.")
