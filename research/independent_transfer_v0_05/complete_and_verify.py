"""Replay the certificate and complete the degree-two splitting over Q.

The second differential is independently evaluated on matrix-unit cochains,
then extended linearly, rather than using the generator's triple-loop routine.
The output specifies h2 and p2 on all 2025 matrix-unit coordinates.
"""
import argparse
from fractions import Fraction as Q
import hashlib
from itertools import product
import json
from pathlib import Path
import time
import sympy as sp
from sympy.polys.matrices import DomainMatrix
import reconstruct as R


def decode(rows):
    return {k:Q(a,b) for k,a,b in rows}


SPLITS = {s:[] for s in R.SBAR}
for s,t in product(R.SBAR,repeat=2):
    st = s[0]+t[0],s[1]+t[1]
    if st in SPLITS:
        SPLITS[st].append((s,t))


def d2_unit(k):
    a,b,(r,c) = R.V["unidx2"](k)
    out = {}

    def emit(s,t,u,i,j,z):
        key = ((R.SID[s]*15+R.SID[t])*15+R.SID[u])*9+i*3+j
        out[key] = out.get(key,Q(0))+z
        if not out[key]:
            del out[key]

    for s in R.SBAR:
        for (i,j),z in R.MU[s].items():
            if j==r:
                emit(s,a,b,i,c,z)
            if i==c:
                emit(a,b,s,r,j,-z)
    for s,t in SPLITS[a]:
        emit(s,t,b,r,c,Q(-1))
    for t,u in SPLITS[b]:
        emit(a,t,u,r,c,Q(1))
    return out


UNITS = [d2_unit(k) for k in range(2025)]


def d2(q):
    out = {}
    for k,z in q.items():
        out = R.add(out,UNITS[k],z)
    return out


def rank(columns):
    keys = sorted(set().union(*(set(c) for c in columns)))
    rows = {k:i for i,k in enumerate(keys)}
    M = sp.MutableSparseMatrix(len(keys),len(columns),
        {(rows[k],j):sp.Rational(z) for j,c in enumerate(columns) for k,z in c.items()})
    return DomainMatrix.from_Matrix(M).convert_to(sp.QQ).rank()


def run(path,output,inverse_certificate=None):
    start = time.monotonic()
    data = json.loads(path.read_text())
    assert not data["obstructions"] and data["completed_vanishing_through"]==22
    boundary_data = [(decode(row["dF"]),decode(row["F"])) for row in data["boundary_basis"]]
    assert len(boundary_data)==88
    assert rank([b for b,f in boundary_data])==88
    for b,f in boundary_data:
        assert R.d1(f)==b and not d2(b)
    boundary_span = R.Basis()
    for b,f in boundary_data:
        assert boundary_span.insert(b,f)[0]
    # Verify this is the *full* constrained boundary space, not a chosen box.
    full_c1 = [R.flatten(f) for f in R.V["weak"]]
    full_c1 += [R.flatten(R.V["basis_c1"]((i,j),(r,c)))
                for i,j,r,c in product(range(1,4),range(1,4),range(3),range(3))]
    assert rank(full_c1)==90
    assert all(not boundary_span.reduce(R.d1(f))[0] for f in full_c1)
    W = [decode(row["W"]) for row in data["history_columns"]]
    DW = [d2(w) for w in W]
    assert all(dw==decode(row["dW"]) for row,dw in zip(data["history_columns"],DW))
    assert rank(DW)==len(W)==174
    zeta = decode(data["zeta"])
    assert not d2(zeta) and boundary_span.reduce(zeta)[0]
    assert rank([b for b,f in boundary_data]+[zeta]+W)==263
    print("REPLAY PASS: independent QQ ranks B=88, dW=W=174, B+zeta+W=263",flush=True)

    # Companion indices 0..134 are h2 coordinates; 135+j is H2 coordinate j.
    cycles = R.Basis()
    for b,f in boundary_data:
        assert cycles.insert(b,f)[0]
    assert cycles.insert(zeta,{135:Q(1)})[0]
    harmonics = [zeta]
    history = R.Basis()
    for w,dw in zip(W,DW):
        assert history.insert(dw,w)[0]

    def project_partial(q):
        rd,closed = history.reduce(d2(q),q)
        assert not rd, "source lies outside serialized differential history"
        rem,negative = cycles.reduce(closed)
        assert not rem, "unrepresented closed source"
        return R.scale(negative,-1)

    # Recompute every homogeneous source from F; no supplied rank/decision can
    # make a false polynomial coefficient pass these equalities.
    F = {}
    for row in data["F"]:
        F.setdefault(row["arity"],{})[tuple(row["monomial"])] = decode(row["cochain"])
    stored = {(row["arity"],tuple(row["monomial"])):decode(row["source"]) for row in data["sources"]}
    for n in range(2,23):
        rn = R.source(F,n)
        if n>=7:
            assert set(k for a,k in stored if a==n)==set(rn)
        for key,q in rn.items():
            if n>=7:
                assert q==stored[n,key]
            hp = project_partial(q)
            h = {k:z for k,z in hp.items() if k<135}
            p = {k-135:z for k,z in hp.items() if k>=135}
            assert R.scale(h,-1)==F[n].get(key,{})
            assert p==({0:Q(1)} if (n,key)==(3,(0,3)) else {})
        print(f"REPLAY PASS: actual recursion and one fixed partial h,p, arity {n}",flush=True)
    # All archived h assignments are retained; h need not match a missing p.
    for q,hq in R.V["HB"].values():
        assert project_partial(q)==R.flatten(hq)
    # All available b<=5 values retain their independently verified low rails.
    rail_checks = 0
    for b,seq in R.V["rails"].items():
        for k,f in seq.items():
            if k+b<=22:
                assert F[k+b].get((k,b),{})==R.flatten(f)
                rail_checks += 1
    print(f"REPLAY PASS: 100 archived h assignments and {rail_checks} low-rail values",flush=True)

    # Compute the *whole* kernel without the large chosen-history companions.
    # This sparse 30375 x 2025 integer matrix has only 29430 nonzero entries.
    D = sp.MutableSparseMatrix(30375,2025,{(k,j):sp.Rational(z)
        for j,c in enumerate(UNITS) for k,z in c.items()})
    dm = DomainMatrix.from_Matrix(D).convert_to(sp.QQ)
    Z = dm.nullspace()
    assert (dm*Z.transpose()).is_zero_matrix
    ZM = Z.to_Matrix()
    assert ZM.rows==130
    for i in range(ZM.rows):
        z = {j:Q(v) for j,v in enumerate(ZM.row(i)) if v}
        if cycles.reduce(z)[0]:
            assert cycles.insert(z,{135+len(harmonics):Q(1)})[0]
            harmonics.append(z)
    assert len(cycles)==130 and len(harmonics)==42
    print("COMPLETE PASS: full kernel dimension 130, rank d2=1895, H2=42",flush=True)

    # Extend the 304 independent columns Z2+W22 by coordinate units.
    # An invertible pivot-row minor suffices: the remaining coordinate units
    # form the additional W2 directions. No 2025 x 2025 inverse is needed.
    partial = [b for b,f in boundary_data]+harmonics+W
    M = sp.MutableSparseMatrix(2025,len(partial),{(k,j):sp.Rational(z)
        for j,c in enumerate(partial) for k,z in c.items()})
    _,pivots = DomainMatrix.from_Matrix(M.T).convert_to(sp.QQ).rref()
    assert len(pivots)==len(partial)==304
    square = M.extract(list(pivots),list(range(304)))
    square_dm = DomainMatrix.from_Matrix(square).convert_to(sp.QQ)
    if inverse_certificate is None:
        inverse_dm = square_dm.inv()
    else:
        supplied = json.loads(inverse_certificate.read_text())
        assert supplied["input_sha256"]==hashlib.sha256(path.read_bytes()).hexdigest()
        assert supplied["pivot_rows"]==list(pivots)
        supplied_inverse = sp.Matrix([[sp.Rational(z) for z in row]
                                      for row in supplied["pivot_minor_inverse"]])
        inverse_dm = DomainMatrix.from_Matrix(supplied_inverse).convert_to(sp.QQ)
    assert (square_dm*inverse_dm).to_Matrix()==sp.eye(304)
    inverse = inverse_dm.to_Matrix()
    print("COMPLETE PASS: exact inverse of the 304 x 304 pivot-row minor",flush=True)
    columns = [{"coordinate":k,"h":[],"p":[]} for k in range(2025)]
    for j,k in enumerate(pivots):
        h = {}
        for i,(b,f) in enumerate(boundary_data):
            if inverse[i,j]:
                h = R.add(h,f,Q(inverse[i,j]))
        p = {i:Q(inverse[88+i,j]) for i in range(42) if inverse[88+i,j]}
        columns[k]["h"],columns[k]["p"] = R.encode(h),R.encode(p)
    W += [{k:Q(1)} for k in range(2025) if k not in set(pivots)]
    assert len(W)==1895

    def linear(q,field):
        out = {}
        for k,z in q.items():
            out = R.add(out,decode(columns[k][field]),z)
        return out

    for b,f in boundary_data:
        assert linear(b,"h")==f and not linear(b,"p")
    for j,z in enumerate(harmonics):
        assert not d2(z) and not linear(z,"h")
        assert linear(z,"p")=={j:Q(1)}
    for w in W:
        assert not linear(w,"h") and not linear(w,"p")
    print(f"COMPLETE PASS: C2=2025=B2(88)+H2({len(harmonics)})+W2({len(W)})",flush=True)
    record = {"kind":"new complete degree-two splitting; not historical fixed-detector recovery",
        "input_sha256":hashlib.sha256(path.read_bytes()).hexdigest(),"arity":22,
        "dimensions":{"C1":90,"B2":88,"H1":2,"C2":2025,"Z2":130,"H2":len(harmonics),"W2":len(W)},
        "history_rank":174,"partial_domain_rank":263,"rail_checks":rail_checks,
        "H2_representatives":[R.encode(z) for z in harmonics],
        "W2_basis":[R.encode(w) for w in W],"h2_p2_columns":columns,
        "pivot_rows":list(pivots),"pivot_minor_inverse":[[str(v) for v in inverse.row(i)] for i in range(304)]}
    output.write_text(json.dumps(record,separators=(",",":"))+"\n",encoding="utf-8")
    print(f"WROTE {output}; {time.monotonic()-start:.1f}s",flush=True)


if __name__=="__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("input",type=Path)
    parser.add_argument("output",type=Path)
    parser.add_argument("--inverse-certificate",type=Path,
                        help="verify the supplied exact inverse by multiplication instead of recomputing it")
    args = parser.parse_args()
    if args.output.exists():
        parser.error("output exists; use a new filename")
    run(args.input,args.output,args.inverse_certificate)
