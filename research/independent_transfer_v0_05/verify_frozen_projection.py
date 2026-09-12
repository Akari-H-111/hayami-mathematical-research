"""Consume complete h2,p2 and test arity 23 without refitting either map."""
import argparse
from fractions import Fraction as Q
import hashlib
import json
from pathlib import Path
import reconstruct as R


def decode(rows):
    return {k:Q(a,b) for k,a,b in rows}


def run(certificate,splitting,output):
    data,full = json.loads(certificate.read_text()),json.loads(splitting.read_text())
    assert hashlib.sha256(certificate.read_bytes()).hexdigest()==full["input_sha256"]
    h = [decode(c["h"]) for c in full["h2_p2_columns"]]
    p = [decode(c["p"]) for c in full["h2_p2_columns"]]
    assert len(h)==len(p)==2025

    def linear(q,columns):
        out = {}
        for k,z in q.items():
            out = R.add(out,columns[k],z)
        return out

    for row in data["boundary_basis"]:
        b,f = decode(row["dF"]),decode(row["F"])
        assert linear(b,h)==f and not linear(b,p)
    for j,rows in enumerate(full["H2_representatives"]):
        z = decode(rows)
        assert not linear(z,h) and linear(z,p)=={j:Q(1)}
    for rows in full["W2_basis"]:
        w = decode(rows)
        assert not linear(w,h) and not linear(w,p)
    for row in data["sources"]:
        q,f = decode(row["source"]),decode(row["F"])
        assert linear(q,h)==R.scale(f,-1) and not linear(q,p)
    for q,hq in R.V["HB"].values():
        assert linear(q,h)==R.flatten(hq) and not linear(q,p)
    print("FROZEN PASS: all global splitting identities, stored sources 7--22 and 100 original assignments",flush=True)

    F = {}
    for row in data["F"]:
        F.setdefault(row["arity"],{})[tuple(row["monomial"])] = decode(row["cochain"])
    # The exact content hash is recorded *before* the new source is evaluated.
    frozen_digest = hashlib.sha256(splitting.read_bytes()).hexdigest()
    print(f"FROZEN h2,p2 SHA256 {frozen_digest}; computing held-out arity 23",flush=True)
    rn = R.source(F,23)
    rows = []
    for key,q in sorted(rn.items()):
        fn = R.scale(linear(q,h),-1)
        pn = linear(q,p)
        rows.append({"monomial":list(key),"source":R.encode(q),"F23":R.encode(fn),"pR23":R.encode(pn)})
        print(f"ARITY 23 monomial {key}: harmonic nonzero coordinates={len(pn)}",flush=True)
    assert frozen_digest==hashlib.sha256(splitting.read_bytes()).hexdigest()
    expected = R.flatten(R.V["rails"][5][18])
    actual = next(decode(row["F23"]) for row in rows if row["monomial"]==[18,5])
    assert actual==expected
    result = {"kind":"held-out arity 23 of a fully frozen independent contraction",
              "splitting_sha256_frozen_before_source":frozen_digest,
              "number_of_nonzero_harmonic_coefficients":sum(bool(row["pR23"]) for row in rows),
              "low_rail_18_5_matches_archived_oos":True,"coefficients":rows}
    assert result["number_of_nonzero_harmonic_coefficients"]==18
    assert [row["monomial"][1] for row in rows if row["pR23"]]==list(range(23,5,-1))
    witness = next(decode(row["pR23"]) for row in rows if row["monomial"]==[1,22])
    assert witness[8]==Q(4,9)
    output.write_text(json.dumps(result,separators=(",",":"))+"\n")
    print(f"HELD-OUT COMPLETE: nonzero harmonic monomials={result['number_of_nonzero_harmonic_coefficients']}",flush=True)


if __name__=="__main__":
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("certificate",type=Path)
    parser.add_argument("splitting",type=Path)
    parser.add_argument("output",type=Path)
    args = parser.parse_args()
    if args.output.exists():
        parser.error("output exists; choose a new filename")
    run(args.certificate,args.splitting,args.output)
