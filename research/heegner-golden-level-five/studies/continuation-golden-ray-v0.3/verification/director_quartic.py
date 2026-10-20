"""Exact cyclic-quartic consequence of the independently checked radical."""
import json
from pathlib import Path
import sympy as sp

if not __debug__:
    raise RuntimeError("Run with assertions enabled")


def run():
    X=sp.symbols("X")
    d=163
    f=sp.Poly(X**4-5*d*X**2+5*d*d,X)
    assert f.is_irreducible
    assert all(int(c)%5==0 for c in f.all_coeffs()[1:])
    assert int(f.TC())%25!=0  # Eisenstein at 5 gives an elementary proof.
    sigma=3*X-X**3/d
    assert sp.rem(f.as_expr().subs(X,sigma),f.as_expr(),X)==0
    image=X
    images=[]
    for _ in range(4):
        image=sp.rem(image.subs(X,sigma),f.as_expr(),X)
        images.append(image)
    assert images == [sigma,-X,-sigma,X]
    phi=3-X**2/d
    assert sp.rem(phi**2-phi-1,f.as_expr(),X)==0
    assert sp.rem(phi*X-sigma,f.as_expr(),X)==0
    assert sp.discriminant(f)==2000*d**6
    beta=(X+phi)/2
    reduce=lambda p: sp.rem(p,f.as_expr(),X)
    assert reduce(beta**2-phi*beta+41*phi-122)==0
    basis=[sp.Integer(1),phi,beta,phi*beta]
    def trace(p):
        p=sp.Poly(reduce(p),X)
        return 4*p.nth(0)+10*d*p.nth(2)
    gram=sp.Matrix([[trace(a*b) for a in basis] for b in basis])
    field_disc=125*d*d
    assert gram.det()==field_disc
    assert sp.isprime(d) and sp.legendre_symbol(5,d)==-1
    # Maximality uses the squarefree relative discriminant proof in the note.
    conductor=5*d
    assert field_disc==5*conductor**2
    return {"status":"PASS", "minimal_polynomial":str(f.as_expr()),
            "irreducibility":"Eisenstein at 5", "Galois_group":"C4",
            "sigma":"delta -> 3*delta-delta^3/163 = phi*delta",
            "iterates":[str(x) for x in images],
            "quadratic_subfield":"Q(sqrt(5))", "polynomial_discriminant":str(sp.discriminant(f)),
            "integral_basis":[str(a) for a in basis], "trace_gram_matrix":[[int(a) for a in row] for row in gram.tolist()],
            "field_discriminant":str(field_disc), "field_conductor":conductor,
            "boundary":"Maximality is a written relative-discriminant proof; conductor uses Milne V.3.27."}


if __name__=="__main__":
    output=run()
    Path(__file__).with_name("DIRECTOR_QUARTIC.json").write_text(json.dumps(output,indent=2)+"\n")
    print(json.dumps(output,indent=2))
