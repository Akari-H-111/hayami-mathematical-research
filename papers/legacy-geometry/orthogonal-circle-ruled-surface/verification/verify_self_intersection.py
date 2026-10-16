"""Exact algebra for SELF_INTERSECTION.md; run with python3 -B, never -O."""
import platform
import sympy as s

if not __debug__:
    raise SystemExit("FAIL: assertions require Python without -O")

COUNT = 0


def zero(expr):
    global COUNT
    assert s.cancel(s.together(expr)) == 0, s.factor(expr)
    COUNT += 1


def positive_on_quarter(poly, variable):
    """Positive rational Bernstein coefficients certify positivity on [0,1/4]."""
    global COUNT
    p = s.Poly(s.expand(poly.subs(variable, variable / 4)), variable)
    n = p.degree()
    coefficients = [sum(p.nth(j) * s.binomial(k, j) / s.binomial(n, j)
                        for j in range(k + 1)) for k in range(n + 1)]
    reconstructed = sum(co*s.binomial(n, k)*variable**k*(1-variable)**(n-k)
                        for k, co in enumerate(coefficients))
    assert s.expand(p.as_expr()-reconstructed) == 0
    assert all(c > 0 for c in coefficients), coefficients
    COUNT += 1
    return coefficients


def main():
    global COUNT
    print(f"Python {platform.python_version()}; SymPy {s.__version__}", flush=True)
    c, d, a, b, x, y, v, k, z, A, B, C, E = s.symbols(
        "c d a b x y v k z A B C E")
    F = (16*(1-x)*y**3 - 4*(3*x**2+4*x-8)*y**2
         + 4*(x+1)*(x-2)**2*y - x**2*(x-2)**2)
    D = F.subs({x: 2-c-d, y: (1-c)*(1-d)})
    supplied = (16*c**4*d**3-60*c**4*d**2+68*c**4*d-25*c**4
                +16*c**3*d**4-136*c**3*d**3+364*c**3*d**2
                -384*c**3*d+140*c**3-60*c**2*d**4+364*c**2*d**3
                -814*c**2*d**2+788*c**2*d-276*c**2+68*c*d**4
                -384*c*d**3+788*c*d**2-696*c*d+224*c
                -25*d**4+140*d**3-276*d**2+224*d-64)
    zero(D-supplied)
    zero(D-D.xreplace({c: d, d: c}))
    zero(D.subs(d, c)-32*(c-1)**3*(c*c-3*c+1)*(c*c-2*c+2))
    zero(D.subs(c, 0)+(d-2)**2*(5*d-4)**2)
    zero(F.subs(y, 0)+x*x*(x-2)**2)
    # Independent recovery of the resultant asserted in the brief.
    u, up = s.symbols("u up")
    ux = (d-c+2*up*(1-d))/(2*(1-c))
    fy = s.cancel(4*(1-c)**2*((1-ux)**2*(1-c*c)-(1-up)**2*(1-d*d)))
    fz = s.cancel(4*(1-c)**2*(ux**2*c*(2-c)-up**2*d*(2-d)))
    zero(s.resultant(fy, fz, up)+16*(c-1)**4*(c-d)**4*D)
    # Coplanarity certificate, with the four square roots left symbolic.
    cop = (a+b)*(A*C+B*E)-2*a*B*C-2*b*A*E
    ex = -a+2*a*u+b-2*b*up
    ey = (1-u)*A-(1-up)*B
    ez = u*E-up*C
    zero(cop-((A*C-B*E)*ex+2*(a*C-b*E)*ey+2*(a*B-b*A)*ez))
    sign = -2*y*y-2*x*y-x*x-2*y+2*x
    Hab = sign.subs({x: a+b, y: a*b})
    root_squares = {A: a*(2-a), B: b*(2-b), C: 1-b*b, E: 1-a*a}
    paired = s.expand(cop*((a+b)*(A*C+B*E)+2*a*B*C+2*b*A*E))
    for root, square in root_squares.items():
        p = s.Poly(paired, root)
        paired = s.expand(sum(co*square**(mo[0]//2)*root**(mo[0] % 2)
                              for mo, co in p.terms()))
    zero(paired-(a-b)**2*(Hab+2*A*B*C*E))
    zero(Hab**2-4*a*(2-a)*b*(2-b)*(1-a*a)*(1-b*b)
         +F.subs({x: a+b, y: a*b}))
    # Blowup and rational normalization; z=y+1, k=2+x/(y+1).
    Ak = -k**4+12*k**3-60*k*k+112*k-64
    Bk = 12*k*k-16*k
    zero(-Ak-(k-2)*((k-2)*(k-4)**2+8*(k-2)+16))
    zero(F.subs({x: (k-2)*z, y: z-1})-z*z*(Ak*z*z+Bk*z-4*k*k))
    zero(Bk*Bk+16*Ak*k*k+16*k*k*(k-4)**2*(k-3)*(k-1))
    h = v**3+7*v*v+3*v+5
    X = 2*(1+v)*(3+v*v)/h
    Y = (1+v)**2*(1+3*v*v)/((1-v)*h)
    delta = 16*(1+v)**3*(1+v*v)*(1-4*v-v*v)/((1-v)*h*h)
    L = (1+v)*(1+3*v*v)/h
    zero(F.subs({x: X, y: Y}))
    zero(X*X-4*Y-delta)
    zero(1-X+Y-4*v*v*(v*v+3)/((1-v)*h))
    zero(2-X-4*(3*v*v+1)/h)
    zero(sign.subs({x: X, y: Y})
         -8*v*(v-3)*(v+1)*(v*v+3)*(3*v*v+1)/((1-v)**2*h*h))
    zero(Y-L*X+L*L-8*v*(v+1)**3*(3*v*v+1)/((1-v)*h*h))
    zero(X-2*L-4*(1-v)*(v+1)**2/h)
    K = s.cancel(2+X/(Y+1))
    zero(K-(3+v*v)/(1+v*v))
    r = (2*Ak*z+Bk)/(4*k*(k-4))
    zero((r/(k-1)).subs({k: K, z: Y+1})-v)
    # Inverse parametrization on the normalized conic.
    kv = (3+v*v)/(1+v*v)
    rv = 2*v/(1+v*v)
    zv = s.cancel((-Bk+4*k*(k-4)*s.Symbol('r'))/(2*Ak))
    zero(zv.subs({k: kv, s.Symbol('r'): rv})-(Y+1))
    # Both image labels have u=(a-L)/(2a); squared identities are sufficient
    # because all factors have the nonnegative signs proved in the note.
    image_x = 1-L
    image_y2 = (3-v)**2*(1+v)*(1+v*v)*(1+3*v*v)/((1-v)*h*h)
    image_z2 = 8*v*v*(1+v)*(v*v+3)/((1-v)*h*h)
    for poly in [(a+L)**2*(2-a)-4*image_y2*a,
                 (a-L)**2*(1-a*a)-4*image_z2*a*a]:
        remainder = s.rem(poly, a*a-X*a+Y, a)
        for co in s.Poly(remainder, a).all_coeffs():
            zero(co)
    zero(s.diff(image_x, v)+2*(9*v**4+8*v**3+22*v*v+8*v+1)/h**2)
    N = 3*v**7-v**6-29*v**5+7*v**4-87*v**3+29*v*v-47*v-3
    T = 3*v**6-2*v**5+21*v**4-4*v**3+5*v*v+6*v+3
    zero(s.diff(delta, v)-32*(v+1)**2*N/((1-v)**2*h**3))
    zero(s.diff(delta, v)**2-4*delta*s.diff(X, v)**2
         -2048*v*(3-v)*(v+1)**3*T/((1-v)**4*h**4))
    print("Bernstein(-N), [0,1/4]:", positive_on_quarter(-N, v))
    print("Bernstein(T), [0,1/4]:", positive_on_quarter(T, v))
    # Exact endpoints, including the completed edge coordinate q.
    zero(X.subs(v, 0)-s.Rational(6, 5))
    zero(Y.subs(v, 0)-s.Rational(1, 5))
    zero(image_x.subs(v, 0)-s.Rational(4, 5))
    zero(image_y2.subs(v, 0)-s.Rational(9, 25))
    zero(image_z2.subs(v, 0))
    star = s.sqrt(5)-2
    alpha = (s.sqrt(5)-1)/2
    for expr in [X-2*alpha, Y-alpha*alpha, delta, L-alpha*(1-alpha)]:
        zero(s.radsimp(expr.subs(v, star)).expand())
    # Endpoint jet a=1-3v^2+O(v^3), q(a)=sqrt(6)*v+O(v^2).
    aa = (X+s.sqrt(delta))/2
    zero(aa.subs(v, 0)-1)
    zero(s.diff(aa, v).subs(v, 0))
    zero(s.diff(aa, v, 2).subs(v, 0)+6)
    zero(s.diff(Y, v).subs(v, 0)-s.Rational(12, 25))
    factors = s.factor_list(F)[1]
    assert len(factors) == 1 and factors[0][1] == 1
    COUNT += 1
    # Verify the singularity data in the brief independently of the normalization.
    singular = s.groebner([F, s.diff(F, x), s.diff(F, y)], x, y)
    assert list(singular) == [x-6*y**3-16*y*y-12*y-2, s.expand(y*(y+1)**3)]
    COUNT += 1
    w, beta = s.symbols("w beta")
    node = s.Poly(s.expand(F.subs(x, 2+w)), w, y)
    zero(sum(co*w**i*y**j for (i, j), co in node.terms() if i+j == 2)
         +4*w*w+48*y*y)
    tacnode = s.Poly(s.expand(F.subs({x: w-2*beta, y: beta-1})), w, beta)
    zero(sum(co*w**i*beta**j for (i, j), co in tacnode.terms() if 2*i+j == 4)
         +4*(w*w+4*w*beta*beta+16*beta**4))
    infinity = -x*(x**3-4*x*x*y+12*x*y*y+16*y**3)
    zero(s.discriminant(infinity.subs(y, 1), x)+5439488)
    assert infinity.subs({x: 1, y: 0}) != 0
    COUNT += 1
    print(f"PASS self-intersection: {COUNT} exact identities and sign certificates")


if __name__ == "__main__":
    main()
