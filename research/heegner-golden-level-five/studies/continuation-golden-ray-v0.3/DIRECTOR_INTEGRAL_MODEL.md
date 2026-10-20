# An integral model and conductor 815

Date: 2026-10-19. This supplements the cyclic-quartic proof, separating the exact algebra, the maximal-order argument, and the external conductor theorem.

Let A=Q(delta), delta^2=163(1+c0)=163(3-phi), and F=Q(phi). The preceding note proves A/Q is totally real and cyclic of degree four, with unique quadratic subfield F. Its defining polynomial is X^4-815 X^2+132845.

## Integral basis and field discriminant

O_F=Z[phi] and disc(F)=5. Put

    b=(delta+phi)/2.

Since phi^2=phi+1, direct algebra gives

    b^2-phi*b+41*phi-122=0.                              (1)

Thus b is integral over O_F. The relative discriminant of the basis {1,b} is

    phi^2-4(41*phi-122)=163(3-phi)
      =163*sqrt(5)*(phi-1).                             (2)

The last factor phi-1 is a unit. The prime 163 is inert in F because (5/163)=-1; the ideal (sqrt(5)) is the ramified prime above 5, with valuation one. These primes are distinct. Hence the relative discriminant ideal in (2) is squarefree. For an order contained in the maximal order, the square of its index ideal divides its discriminant ideal. Squarefreeness therefore proves O_A=O_F[b]. This is a written maximality argument, rather than trusting a CAS integral-basis label.

The absolute discriminant is consequently

    disc(A)=disc(F)^2 * N_F/Q(163(3-phi))
           =25 * 5 * 163^2
           =3321125.                                   (3)

The checker independently calculates the rational trace Gram determinant of the integral basis {1,phi,b,phi*b}, obtaining the same value. The earlier exploratory SymPy round_two output agrees. The polynomial discriminant 2000*163^6 is much larger and is kept distinct.

## Conductor

Milne, *Class Field Theory*, Chapter V, Theorem 3.27 and Remark 3.28, printed page 165 (PDF page 174), give the conductor–discriminant formula and identify the conductor of a faithful character with that of its field. This is external theorem input. URL: https://www.jmilne.org/math/CourseNotes/CFT.pdf.

A cyclic quartic group has a trivial character, one quadratic character, and two inverse faithful characters. The quadratic field is F, whose character has conductor 5. The two faithful characters have the same conductor f. Thus

    disc(A)=5*f^2,
    f=sqrt(3321125/5)=815=5*163.                         (4)

There is no infinite conductor component because A is totally real. Thus this golden quartic subfield inside the Rogers–Ramanujan value field has exactly conductor 815. The appearance of both 5 and 163 is now visible in its intrinsic arithmetic, beyond a choice of polynomial coordinates.

This is an explicit consequence of classical field theory and the packet's exact embedding certificate. It establishes neither historical priority nor a new estimate for exp(pi sqrt(163))'s distance from an integer.

Replay: `verification/director_quartic.py` with the registered Python -B. Source PDF and SHA-256 are archived under logs/sources and logs/DIRECTOR_SOURCE_HASHES.json. The script checks the algebra and discriminant arithmetic; it does not formally prove the cited class-field theorem.
