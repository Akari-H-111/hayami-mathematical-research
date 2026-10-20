# A cyclic quartic with a golden conjugacy ratio

Date: 2026-10-19. This is a written deduction with an exact certificate, not a claim of historical novelty.

Let phi=(1+sqrt(5))/2, c0=phi^-2=2-phi, and delta=sqrt(163(1+c0))>0. Since c0^2-3c0+1=0, eliminating c0 gives

    f(X)=X^4-815 X^2+132845,
    f(delta)=0.                                         (1)

This polynomial is Eisenstein at 5. Hence delta generates a degree-four field A=Q(delta). Conversely sqrt(5)=5-2 delta^2/163 belongs to A. All four roots are

    delta, phi*delta, -delta, -phi*delta.                 (2)

They lie in A because phi=3-delta^2/163. Define sigma by

    sigma(delta)=3 delta-delta^3/163=phi*delta.           (3)

The exact checker verifies f(sigma(delta))=0 and the four iterates modulo f:

    delta -> phi*delta -> -delta -> -phi*delta -> delta.

Thus A/Q is Galois with cyclic group C4. At the second step sigma(phi)=1-phi=-phi^-1, so sigma^2(delta)=-delta. It would be incorrect to iterate (3) while holding phi fixed. The unique quadratic subfield is Q(sqrt(5)).

The exact radical certificate in DIRECTOR_CERTIFICATE.md places delta inside Q(t), where t=r((1+i sqrt(163))/2)^5. More explicitly, w(u)<0 at the selected embedding and

    delta=(t+1/t)/w(u),   u=t-1/t.

Therefore the golden conjugacy is realized by an explicit cyclic quartic subfield of the degree-twelve Rogers–Ramanujan value field. This gives a smaller object in which to study the c0/163 relationship. It does not make exp(pi sqrt(163)) algebraic.

This quartic construction exists for every positive integer d coprime to 5, replacing 163 by d. Its polynomial X^4-5d X^2+5d^2 is Eisenstein at 5, and the same automorphism is 3X-X^3/d. The construction alone does not establish an embedding into a particular singular-value field for every d; that requires the appropriate CM and branch analysis. Thus the golden cyclic quartic is structural, whereas its certified embedding here uses the Heegner-163 calculation.

Replay: `/Users/akari_hayami_64/RH_Research_Workspace/.venv/bin/python -B verification/director_quartic.py` from this packet. The polynomial discriminant is distinct from the field discriminant. The latter and conductor 815 are established separately in DIRECTOR_INTEGRAL_MODEL.md, using an integral basis, a squarefree relative-discriminant argument, and an explicitly cited conductor theorem.
