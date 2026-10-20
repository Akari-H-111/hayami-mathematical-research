"""Exact finite controls of the separately proved quartic Artin law."""
import hashlib
import json
from math import gcd
from pathlib import Path
import warnings
import sympy as sp
from sympy.utilities.exceptions import SymPyDeprecationWarning

if not __debug__:
    raise RuntimeError("Run with assertions enabled")
warnings.filterwarnings("ignore",category=SymPyDeprecationWarning)


def run():
    X=sp.symbols("X")
    f=X**4-815*X**2+132845
    h=X**4-X**3-204*X**2+204*X+8201
    assert sp.discriminant(h,X)==3321125*1559**2
    assert 1559%2==1
    log5={1:0,2:1,4:2,3:3}
    units=[n for n in range(815) if gcd(n,815)==1]
    exponents={n:(log5[n%5]+(0 if sp.legendre_symbol(n,163)==1 else 2))%4 for n in units}
    assert len(units)==648 and sum(k==0 for k in exponents.values())==162
    assert set(exponents.values())=={0,1,2,3}
    for a in units:
        for b in units:
            assert exponents[a*b%815]==(exponents[a]+exponents[b])%4
    sigma=3*X-X**3/sp.Integer(163)
    images=[X,sigma,-X,-sigma]
    def modular(poly,p):
        return sp.Poly.from_dict({(i,):int(c.p)%p*pow(int(c.q),-1,p)%p
                                  for (i,),c in sp.Poly(poly,X).terms()},X,modulus=p)
    assert exponents[3]==1
    assert sp.Poly(f,X,modulus=3).is_irreducible
    assert modular(images[3]-X**3,3).is_zero
    rows=[]
    for p in sp.primerange(2,1000):
        if p in (5,163):
            continue
        k=exponents[p%815]
        degree=4//gcd(4,k)
        actual=sorted(int(sp.degree(g,X)) for g,m in sp.factor_list(h if p==2 else f,X,modulus=p)[1] for _ in range(m))
        predicted=[degree]*(4//degree)
        assert actual==predicted,(p,actual,predicted)
        if p!=2:
            frob=sp.rem(sp.Poly(X**p,X,modulus=p),sp.Poly(f,X,modulus=p))
            assert frob==modular(images[-k%4],p),(p,frob,images[-k%4])
        rows.append({"prime":int(p),"character_exponent":int(k),"factor_degrees":actual})
    return {"status":"PASS","unit_count":648,"kernel_size":162,"prime_controls":len(rows),
            "character":"chi5(n)*Legendre(n,163), chi5(2)=i",
            "arithmetic_Frobenius":"sigma^(-k), chi(p)=i^k",
            "scope":"Written reciprocity proof is separate; these are exact finite controls.","rows":rows}


if __name__=="__main__":
    root=Path(__file__).resolve().parents[1]
    assert hashlib.sha256((root/"logs/sources/milne-cft.pdf").read_bytes()).hexdigest()=="50d79af78250a9f1117ad9d337e0b231704a533fc707966ed1bfa52e13d498f5"
    result=run()
    Path(__file__).with_name("DIRECTOR_SPLITTING.json").write_text(json.dumps(result,indent=2)+"\n")
    print({k:v for k,v in result.items() if k!="rows"})
