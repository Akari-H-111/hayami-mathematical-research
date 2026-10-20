"""Independent rational-ring certificate; no algebraic factorization is used."""
import json
from pathlib import Path
import sympy as sp

if not __debug__:
    raise RuntimeError("Run with assertions enabled")

U, S = sp.symbols("U S")
ALPHA = U**3 - 131268706320384342*U**2 - 2896632145572621512*U - 15979661797307720544
BETA = -58705150130167150*U**2 - 1295413276662289800*U - 7146322007247306400
G = (U**2 - 228*U + 496)**3 - 640320**3*(U+11)**5
DEN = 1574580000
NUM = ((312119004989-139583862445*S)*U**2
       + (6858643496508-3067324783740*S)*U
       + 37679427598544-16850735555920*S)


def run():
    assert sp.expand(ALPHA**2-5*BETA**2-G) == 0
    assert sp.gcd(sp.Poly(BETA,U),sp.Poly(G,U)).degree() == 0
    # The cleared identity is checked in Q[S,U]/(S^2-5, ALPHA+S*BETA).
    residual = 163*(5-S)*NUM**2 - 2*DEN**2*(U**2+4)
    residual = sp.rem(residual,ALPHA+S*BETA,U)
    residual = sp.rem(residual,S**2-5,S)
    assert residual == 0
    # Each coefficient except the constant is negative at S=+sqrt(5).
    a2,b2=312119004989,139583862445
    a1,b1=6858643496508,3067324783740
    at1,bt1=44850190100041,20057644202105
    assert 0 < a2*a2 < 5*b2*b2
    assert 0 < a1*a1 < 5*b1*b1
    assert sp.expand(NUM.subs(U,1)-(at1-bt1*S)) == 0
    assert 0 < at1*at1 < 5*bt1*bt1
    # Hence w(U)<w(1)<0 for U>1, covering the inherited isolated CM root.
    golden = (3-S)/2
    assert sp.rem((4-golden)-(1+golden)*((1+S)/2)**2,S**2-5,S) == 0
    assert a2 == sp.lucas(55) and b2 == sp.fibonacci(55)
    # This unit identity is a coordinate property, not a new approximation theorem.
    assert a2*a2-5*b2*b2 == -4
    # Duke Proposition 2 gives the universal modular inversion in this coordinate.
    gamma=(S-1)/2
    M=sp.Matrix([[-1,gamma],[gamma,1]])
    for entry in M*M-(1+golden)*sp.eye(2):
        assert sp.rem(entry,S**2-5,S) == 0
    assert sp.rem(M.det()+(1+golden),S**2-5,S) == 0
    Z=sp.symbols("Z")
    cyclo=Z**4+Z**3+Z**2+Z+1
    zinv=Z**4
    g=sp.rem(Z+zinv,cyclo,Z)
    c=sp.rem(g*g,cyclo,Z)
    theta=sp.rem(Z**2-Z**3,cyclo,Z)
    assert sp.rem(c*c-3*c+1,cyclo,Z) == 0
    assert sp.rem(theta**2+1+c,cyclo,Z) == 0
    return {"status":"PASS", "coefficient_ring":"Q[S,U]/(S^2-5, alpha+S beta)",
            "identity":"u^2+4 = 163*(1+c0)*w(u)^2",
            "cleared_residual":str(residual), "branch_w_sign_for_u_gt_1":"negative",
            "selected_t":"-2/(u-sqrt(163*(1+c0))*w(u))",
            "squareclass_equivalence":"(4-c0)/(1+c0)=phi^2",
            "leading_unit":"(Lucas(55)-sqrt(5)*Fibonacci(55))/2=-phi^-55",
            "modular_inversion_matrix_square":"(1+c0)*I",
            "cyclotomic_radical":"(zeta5^2-zeta5^-2)^2=-(1+c0)"}


if __name__ == "__main__":
    output=run()
    Path(__file__).with_name("DIRECTOR_CERTIFICATE.json").write_text(json.dumps(output,indent=2)+"\n")
    print(json.dumps(output,indent=2))
