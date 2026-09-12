"""Exact, explicitly chosen partial contraction; never historical recovery.

Uses the existing v0.47 algebra and low-rail payload. The two differentials are
the same normalized Hochschild formulas independently checked in v0.03.
No unspecified harmonic detector or pre-recorded high-arity rank is used.
"""
import argparse
from fractions import Fraction as Q
from itertools import product
import json
from pathlib import Path
import runpy
import time

ROOT = Path(__file__).resolve().parents[2]
ALGEBRA = Path(__file__).resolve().parent / "verification/verify_cubic_support_multigrading_v0_47.py"
if not ALGEBRA.is_file():
    ALGEBRA = ROOT / "releases/archive/three-papers/v0.04/verification/part_II/verify_cubic_support_multigrading_v0_47.py"
V = runpy.run_path(str(ALGEBRA))
SBAR, SID = V["SBAR"], V["SID"]
add = V["c2_add"]
MU = {s: V["matsparse"](V["L"][s[0]] * V["R"][s[1]]) for s in SBAR}


def flatten(f):
    return {SID[s]*9+r*3+c:Q(z) for s,m in f.items() for (r,c),z in m.items() if z}


def unflatten(f):
    out = {}
    for k,z in f.items():
        i,rc = divmod(k,9)
        out.setdefault(SBAR[i],{})[divmod(rc,3)] = z
    return out


def scale(f,c):
    return {k:c*z for k,z in f.items() if c*z}


def bracket(f,g):
    return V["bracket"](unflatten(f),unflatten(g))


def d1(f):
    f = unflatten(f)
    out = {}
    for s,t in product(SBAR,repeat=2):
        st = (s[0]+t[0],s[1]+t[1])
        z = V["madd"](V["mmul"](MU[s],f.get(t,{})),f.get(st,{}),-1)
        z = V["madd"](z,V["mmul"](f.get(s,{}),MU[t]))
        out.update({V["idx2"](s,t,rc):Q(c) for rc,c in z.items()})
    return out


def d2(q):
    pairs = {}
    for k,z in q.items():
        s,t,rc = V["unidx2"](k)
        pairs.setdefault((s,t),{})[rc] = z
    out = {}
    for s,t,u in product(SBAR,repeat=3):
        st,tu = (s[0]+t[0],s[1]+t[1]),(t[0]+u[0],t[1]+u[1])
        z = V["madd"](V["mmul"](MU[s],pairs.get((t,u),{})),pairs.get((st,u),{}),-1)
        z = V["madd"](z,pairs.get((s,tu),{}))
        z = V["madd"](z,V["mmul"](pairs.get((s,t),{}),MU[u]),-1)
        out.update({((SID[s]*15+SID[t])*15+SID[u])*9+r*3+c:Q(v)
                    for (r,c),v in z.items()})
    return out


class Basis:
    """Sparse rational column echelon basis with one linear companion."""
    def __init__(self):
        self.rows = {}

    def reduce(self,v,companion=None):
        v, companion = v.copy(), (companion or {}).copy()
        for p in sorted(self.rows):
            if p not in v:
                continue
            b,c = self.rows[p]
            coefficient = v[p]
            v = add(v,b,-coefficient)
            companion = add(companion,c,-coefficient)
        return v,companion

    def insert(self,v,companion=None):
        v,companion = self.reduce(v,companion)
        if not v:
            return False,companion
        p = min(v)
        c = 1/v[p]
        self.rows[p] = scale(v,c),scale(companion,c)
        return True,{}

    def __len__(self):
        return len(self.rows)


def encode(q):
    return [[k,z.numerator,z.denominator] for k,z in sorted(q.items())]


def source(F,n):
    out = {}
    for i in range(1,n//2+1):
        j = n-i
        c = Q(1,2) if i==j else Q(1)
        for (a,b),f in F[i].items():
            for (e,g),h in F[j].items():
                key = a+e,b+g
                out[key] = add(out.get(key,{}),bracket(f,h),c)
    return {k:v for k,v in out.items() if v}


def reconstruct(arity,seed_history=True):
    start = time.monotonic()
    U = [flatten(f) for f in V["U16"]]
    alpha,xi = flatten(V["alpha"]),flatten(V["dec_c1"](V["DATA"]["xi"]))
    E,K,P,Qco,R,W,T,A,B,C,D = U[:11]
    boundaries = Basis()
    transverse = []
    candidates = U+[flatten(f) for f in V["weak"]]
    candidates += [flatten(V["basis_c1"]((i,j),(r,c)))
                   for i,j,r,c in product(range(1,4),range(1,4),range(3),range(3))]
    for f in candidates:
        df = d1(f)
        assert not d2(df)
        independent,_ = boundaries.insert(df,f)
        if independent:
            transverse.append(f)
    assert len(boundaries)==len(transverse)==88
    assert not d1(alpha) and not d1(xi)
    assert not bracket(alpha,alpha) and not bracket(alpha,xi)
    assert bracket(xi,xi)==scale(d1(E),-2)
    assert bracket(alpha,E)==scale(d1(E),2)
    zeta = add(bracket(xi,E),d1(K))
    assert not d2(zeta)
    assert boundaries.reduce(zeta)[0]
    print("BASE PASS: all 88 boundaries; Z1=<alpha,xi>; nonzero cubic class",flush=True)

    # History contains corrected sources W=q-dh(q), not raw sources.
    history = Basis()
    history_columns = []

    def place(w,label):
        dw = d2(w)
        remainder,closed = history.reduce(dw,w)
        if not remainder:
            assert not closed, ("inconsistent corrected complement",label,encode(closed))
            return False
        independent,_ = history.insert(dw,w)
        assert independent
        history_columns.append({"label":label,"W":encode(w),"dW":encode(dw)})
        return True

    if seed_history:
        for pivot,(q,hq) in V["HB"].items():
            place(add(q,d1(flatten(hq)),-1),f"HB:{pivot}")
        assert len(history)==99
        print("BASE PASS: saved low-rail h extends with corrected-history rank 99",flush=True)

    F = {
        1:{(1,0):alpha,(0,1):xi},
        2:{(0,2):E},
        3:{(1,2):scale(E,-2),(0,3):K},
        4:{(2,2):scale(E,4),(1,3):scale(P,-1),(0,4):scale(Qco,-1)},
        5:{(3,2):scale(E,-8),(2,3):scale(R,-1),(1,4):scale(W,-1),(0,5):scale(T,-1)},
        6:{(4,2):scale(E,16),(3,3):scale(A,-1),(2,4):scale(B,-1),
           (1,5):scale(C,-1),(0,6):scale(D,-1)},
    }
    for n in range(2,7):
        for key,q in source(F,n).items():
            w = add(q,d1(F[n].get(key,{})))
            if (n,key)==(3,(0,3)):
                assert w==zeta
            else:
                place(w,f"initial:{n}:{key}")
    print(f"BASE PASS: one compatible h through arity 6; history rank {len(history)}",flush=True)
    all_sources,stages,obstructions = [],[],[]
    next_lift = 11
    for n in range(7,arity+1):
        rn = source(F,n)
        F[n] = {}
        before = len(history)
        stage_obstructions = []
        for key,q in sorted(rn.items(),reverse=True):
            dq = d2(q)
            remainder,closed = history.reduce(dq,q)
            if remainder:
                f = scale(transverse[next_lift % len(transverse)],-1)
                next_lift += 1
                F[n][key] = f
                place(add(q,d1(f)),f"new:{n}:{key}")
                decision = "new-complement"
            else:
                residual,negative_lift = boundaries.reduce(closed)
                if residual:
                    stage_obstructions.append({"monomial":list(key),"closed":encode(closed),
                                                "boundary_remainder":encode(residual)})
                    decision = "nonzero-closed-residual"
                else:
                    f = negative_lift
                    if f:
                        F[n][key] = f
                    assert not add(closed,d1(f))
                    decision = "recycled-boundary"
            all_sources.append({"arity":n,"monomial":list(key),"source":encode(q),
                                "decision":decision,"F":encode(F[n].get(key,{}))})
        stages.append({"arity":n,"source_count":len(rn),"history_rank":len(history),
                       "new_history_columns":len(history)-before,"obstruction_count":len(stage_obstructions)})
        print(f"ARITY {n}: sources={len(rn)}, history={len(history)}, new={len(history)-before}, "
              f"closed obstructions={len(stage_obstructions)}, seconds={time.monotonic()-start:.1f}",flush=True)
        if stage_obstructions:
            obstructions = stage_obstructions
            break
    return {"kind":"independent contraction experiment, not historical recovery",
            "seed_saved_low_rail_history":seed_history,"requested_arity":arity,
            "completed_vanishing_through":stages[-1]["arity"]-(1 if obstructions else 0),
            "boundary_rank":len(boundaries),"boundary_basis":[{"pivot":p,"dF":encode(b),"F":encode(f)}
                 for p,(b,f) in sorted(boundaries.rows.items())],
            "zeta":encode(zeta),"history_columns":history_columns,"stages":stages,
            "sources":all_sources,"obstructions":obstructions,
            "F":[{"arity":n,"monomial":list(k),"cochain":encode(f)} for n,fn in F.items() for k,f in fn.items()]}


if __name__=="__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--arity",type=int,default=12)
    parser.add_argument("--without-saved-history",action="store_true")
    parser.add_argument("--output",type=Path,required=True)
    args = parser.parse_args()
    if args.arity<7:
        parser.error("arity must be at least 7")
    if args.output.exists():
        parser.error("output exists; use a new experiment filename")
    result = reconstruct(args.arity,not args.without_saved_history)
    args.output.write_text(json.dumps(result,separators=(",",":"))+"\n",encoding="utf-8")
    print(f"WROTE {args.output}; vanishing through {result['completed_vanishing_through']}",flush=True)
    if result["obstructions"]:
        raise SystemExit(2)
