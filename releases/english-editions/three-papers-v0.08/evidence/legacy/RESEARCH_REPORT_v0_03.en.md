# Three papers v0.03: proof reinforcement and research closeout within the framework

Date: 2026-09-05. This round completed proof reinforcement, exact reconstruction, and PDF revision within the existing three-paper framework.
No images generated or preprint uploaded; v0.02 and earlier originals retained.

## Conclusion

This did not simply revert v0.02's narrowed sentences; it obtained three different kinds of results:

| Previous issue | Result this round | Status |
|---|---|---|
| Paper I: missing early cubic helper | Direct reconstruction of 54-column weak equations, all strict equations, Groebner ideal, all-order rational section | Core cubic evidence restored |
| Paper I: only cubic germ near base point stated | Affine scheme of the same fixed B is a rank-three finite flat family, with special fiber identified | New proposition and proof within the framework |
| Paper II: response defined only on one-dimensional direction | Obstruction map, maximal domain, exact no-go that “output quotient eliminates the resonant line” | Necessary restriction proved; erroneous two-dimensional claim cannot be restored |
| Paper II: v0.48/v0.53 material missing | Boundary intersections, 560-dimensional extension, source-tilt identities recomputed from existing cochain certificate | Self-contained alternative checks for claims used in the paper |
| Paper III: K required closed | Stable-core characteristic/minimal floor proved for the same original full tilt orbit | Assumption removed |
| Paper III: entire landing kernel required closed | Weaker necessary/sufficient local descent on stable image; future-output quotient when it fails | Partly relaxed, with static/dynamic distinction retained |
| Paper III: seed image required onto | Necessary/sufficient condition that transported source module generates target seeds | Precisely weakened |
| Paper III: only separate pipeline stages verified | Shared model with nonzero syzygy, nonscalar mark, source, landing, nonclosed normalization | End-to-end model passed |

“New within the framework” means new relative to current manuscripts, not a literature-priority claim.

## Paper I: restore cubic foundations and identify the same family's special fiber

The new verifier starts from the fixed finite algebra action reconstructed in v0.47, regenerating:

- Weak-equation rank 45, 54 unknowns, hence weak-fiber dimension 9.
- All left/right/mixed strict relations, not just rereading the listed Groebner basis.
- Strict tangent differential rank 7.
- Full written cubic ideal and rational section for all residuals.
- Lambda-normalized residual and exact unit normalization, not a finite-order truncated conjecture.

After eliminating six linear transverse variables, the same affine coordinate algebra is

    A = C[u,e,v] / (e^2, ev, (1+2u)e + 3v^2).

This round proves A has free basis (1,v,e) over C[u], hence is finite flat of relative degree 3.

- For nonzero q = 1+2u: fiber C[v]/(v^3).
- At u = -1/2: fiber C[e,v]/(e,v)^2.
- Both have length 3, with embedding dimensions 1 and 2 respectively.
- Original base point u=0 completed local ring fully retained; special fiber not confused with original base point.

Proof uses explicit multiplication matrices; independence follows directly by acting on basis vectors,
not by inferring flatness from equal fiber lengths.

Boundary: this round did not reconstruct all earlier four-point, dual-number, square-zero examples,
presentation quartic no-go, and high-order transfer helpers. The appendix still separates historical results
from this round's newly verified cubic main line.

## Paper II: maximal response domain and replayable completion/source no-go

### Maximal domain is not a conservative guess

Let Z=Z1,Vres=d^{-1}(Lres), and define

    o(a) = (D_a restricted to Z, quotient(D_a restricted to Vres)).

It is proved exactly that Tresp = ker(o) is the maximal primitive-independent response domain preserving
the same marked boundary line and unchanged bracket. Actual cubic cochains give:

    [alpha,alpha] = [alpha,xi] = 0,
    [xi,xi] = 2 beta != 0,
    D_alpha E = 2 dE.

Thus Tresp = C alpha. For a=s alpha+t xi with nonzero t, descent of Q D_a to the primitive
quotient requires Q(beta)=0. Expanding the domain by forcing an output quotient eliminates the desired line.
This is a necessary no-go, not a restriction awaiting a clever technique.

### Alternative checks for missing historical helpers

Original v0.48 JSON and v0.53 helper were not found or fabricated under the same filenames.

New verify_proof_recovery_v0_03.py constructs Hochschild d1,d2 from actual finite algebra action,
recomputing from the original existing cochain certificate:

- Constrained C1 dimension 90,rank d1=88,Z1 exactly span(alpha,xi);
- rank d|U16=35；
- Source dimensions 100,23,116 and intersection dimension 7;
- full boundary dimension 88；
- Old/combined sources each have boundary-intersection dimension 1;
- F intersect dU16 has dimension 1;
- h_old(dE)=E；
- 16 new source directions, each with 35-dimensional free values, hence extension dimension 560;
- Three g3 source identities, nonzero boundary E-tilt, nonclosed K-tilt, d²K=0.

These are recomputations, not writing expected integers into JSON and reading them back.
Text separately gives a linear-algebra proof of boundary-compatible extension;
remaining unassigned cohomology representatives may vary with contraction completion.

Important distinction: combined-source intersection with cycles has dimension 2,
while intersection with boundaries has dimension 1. Initial erroneous inference and failed checks remain in RESEARCH_LOG.md;
subsequent direct boundary-image computation did not hide failure as PASS.

Original E-rail formulas for all n follow from A(E)=-2E; finitely many values are not an all-orders proof.

## Paper III: actually remove normalized-closure assumption

Let H=qD,K=ker(H), retaining original tilt family A_tau=A+tau H.
Let n=dim R, and define

    U = intersection_{j=0}^{n-1} ker(H A^j).

This round adds a full proof:

    gcd_tau chi(A_tau) = chi(A restricted to U),
    gcd_tau mu(A_tau)  = mu(A restricted to U).

No A(K) subset K assumption is needed. The key is retaining the original tilt family invariant on all K,
rather than silently relaxing to invariance on U alone.

Proof steps:

1. Cayley–Hamilton gives finite computation of U, its maximal invariance, and invariance throughout the orbit.
2. Induced observation pair on R/U is observable.
3. Self-contained spectral-avoidance lemma: kernel complement and nonzero resultant
   select allowed perturbations avoiding any finite spectral set over an infinite field.
4. Choose two representatives with coprime complementary quotient spectra, also coprime to core spectrum.
5. Characteristic gcd follows directly from block factorization;
   minimal gcd uses Bezout primary decomposition for possible off-diagonal extensions.

The final step cannot infer minimal gcd from characteristic gcd; the text gives a separate argument.
Field is still assumed infinite; tilt family still must be the complete linear parameter space specified throughout the paper.

These tools relate directly to classical observability and Kalman decomposition.
Checked [Sontag, Section 6.2](https://sontaglab.org/mct.html)
and full book pp. 271–272 provided by its author, retaining
[Boyd–Lall observability notes](https://ee263.stanford.edu/lectures/observ.pdf)。
Standard control theory is not renamed and claimed new.

### Assembly improvements

With global landing descent, the original second kernel-invariance assumption can be removed.
New assembly on the stable quotient

    W / ker(Lambda),  W=intersection ker(Gamma_eq T^j)

gives two exact floors of the original orbit. When original normalization is closed,
W=ker Gamma_eq, retaining old formulas as a special case.

If global descent fails, on the stable image only check
T(W intersect ker Lambda) subset (W intersect ker Lambda)。
If even this local condition fails, the future-output quotient remains definable but preserves output history,
not the original static landing space. Renaming symbols cannot hide this distinction.

### Shared end-to-end model

New example uses nonzero P1 -> P0 and a nonscalar chain mark; H0 action generates a two-dimensional diagonal algebra.
One seed generates normalized source; coupling to explicitly supplied D,Lambda,T
yields the paper's three-dimensional nonclosed-normalization example.

Characteristic polynomials of two allowed tilt representatives are

    (S-2) S^2,       (S-2)(S^2+1).

also their respective minimal polynomials; both gcds are S-2.
Also checked: noncyclic Jordan core, rational conjugacy, multiple outputs, empty core,
local-only descent, and non-onto seeds with complete generation.

## Verification and delivery limits

- Three TeX manuscripts compiled; cross-references, citations, QPDF structure, and pagewise text boundaries checked.
- Complete verify_all.py executed this round; VERIFICATION_LOG.txt preserves actual stdout.
- 12 top-level runs: Paper I aggregate contains 7 verifiers,
  Paper II 5,Paper III 5,plus this round's supplement;
  supplement retains v0.02 regression checks.
- Existing SymPy 1.14.0,Tectonic,QPDF,pypdf,pdfplumber used; no new dependencies installed.
- Finite models and symbolic checks are not full-paper machine-checked formalization.
- No image generation or PNG rasterization, so full pagewise visual acceptance is not claimed.
- Three original v0.02 PDFs match previously recorded SHA-256; three earlier TeX files also unchanged.
- Suggested figure count remains 6; new finite flat family can enter an I-1 inset;
  III-1/III-2 descriptions updated to stable assembly, without increasing figure count.

This round is closed; seeking stronger wording does not justify calling quintic q-spectrum an unmarked invariant again,
pretending D,Lambda,T follow from a bare complex, or describing unfound historical files as completed archaeology.
