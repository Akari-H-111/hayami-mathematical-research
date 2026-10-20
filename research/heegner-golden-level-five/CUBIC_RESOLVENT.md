# The residual cubic has a resolvent containing the imaginary Heegner field

This is a late director derivation, distinct from the initial CLI packet.
It is an exact algebraic result using the already recorded Klein/CM inputs;
no worldwide novelty or RH claim is made.

Let F=Q(sqrt(5)), u=t-1/t, and let G163 be the irreducible sextic in
DIRECTOR_FINDING.md. Write G163=alpha^2-5 beta^2, where

    alpha(U)=U^3-131268706320384342 U^2
               -2896632145572621512 U-15979661797307720544,
    beta(U)=-58705150130167150 U^2
               -1295413276662289800 U-7146322007247306400.

Both monic cubic factors alpha plus/minus sqrt(5) beta are irreducible over F,
as checked by exact factorization. Put g=alpha+sqrt(5) beta. Direct calculation
gives the exact identity

    Disc(g)=-163 (m+n sqrt(5))^2,
    m=130605881159290836097272600000000,
    n= 58408725706686669664104300000000.

The checker independently compares the symbolic discriminant with the explicit
monic-cubic coefficient formula b^2 c^2-4c^3-4b^3 d-27d^2+18bcd, then verifies
the displayed square factor. The conjugate cubic has the conjugate factor
and the same square class -163.

Since F is real, -163 is not a square in F. The Galois group of an
irreducible cubic is a transitive subgroup of S3, hence A3 or S3. The square
root of its discriminant is the Vandermonde product of root differences;
even permutations fix it and odd permutations negate it. The nonsquare
discriminant therefore excludes A3. Thus Gal(splitting field(g)/F)=S3,
and its unique quadratic intermediate extension is exactly

    F(sqrt(Disc(g)))=Q(sqrt(5),sqrt(-163)).

Thus the residual cubic above the golden field has a quadratic resolvent
containing the original imaginary quadratic field Q(sqrt(-163)). The
quadratic layer records sqrt(5), and the cubic discriminant records the
F-square class represented by -163. Discarding the cubic after extracting
phi loses this additional field information in the specified CM construction.

The quadratic resolvent alone does not uniquely identify an unmarked integer
label: -163 and -815 represent the same square class over F, since 5 is a
square in F. The biquadratic field also contains Q(sqrt(-815)). Selecting the
original K=Q(sqrt(-163)) therefore uses the original CM embedding/order mark;
it is not recovered uniquely from the abstract resolvent without that mark.

This does not establish first discovery. CM, modular curves and ring class
fields already predict deep relations of this type. Identification of this
explicit splitting field with the appropriate conductor-5 ring class field
requires the additional correspondence described in the mechanism lead;
that is not assumed as a proved result here. No arithmetic scheme has yet
been transported into an HMR geometric/operator object.

Replay with the registered RH interpreter:

    /Users/akari_hayami_64/RH_Research_Workspace/.venv/bin/python -B verification/director_check.py

The result is recorded in verification/DIRECTOR_RESULTS.json. Read
REVIEW_RESOLUTION.md for the final review scope when available.
