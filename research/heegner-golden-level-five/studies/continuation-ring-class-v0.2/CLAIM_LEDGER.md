# Claim ledger

| ID | Claim | Status | Basis | Limit |
| --- | --- | --- | --- | --- |
| C1 | \(x=-(u+11)=(\eta(\tau)/\eta(5\tau))^6\), and the stated \(j(\tau),j(5\tau)\) formulas have the displayed direction. | PROVED HERE conditional on Duke and Maier | Written reciprocal-normalization calculation; exact denominator-cleared checks. | The eta identity and modular parametrization are external classical inputs. |
| C2 | \([1,5\tau]=\mathcal O_5\) has discriminant \(-4075\), class number 6, and cyclic class group \(C_6\). | PROVED HERE conditional on the class-number formula/form correspondence | Written order calculation, formula hypotheses, complete exact six-form enumeration, and finite-group argument. | No new class-number theorem is claimed. |
| C3 | \(\mathbb Q(u)=\mathbb Q(j(5\tau))\) and \(K(u)=H_5\). | PROVED HERE conditional on CM | Exact degree-six sextic/resultant plus Cox Theorem 11.1 and degree comparison. | This identifies a known ring class field, not a new CM theorem. |
| C4 | The chosen cubic over \(F\) has \(S_3\) splitting field \(H_5\); its quadratic discriminant field is \(K(\sqrt5)\). | PROVED HERE conditional on C3 | Exact irreducibility and discriminant identity, then degree/containment argument. | The bare biquadratic field also contains \(\mathbb Q(\sqrt{-815})\); it does not alone mark \(K\). |
| C5 | \(F=\mathbb Q(\sqrt5)\) is the unique quadratic genus layer of \(H_5/K\), explaining \(\phi\) and \(c_0=\phi^{-2}\). | PROVED HERE conditional on C3--C4 | \(C_6/C_6^2\cong C_2\), together with the verified inclusion \(F\subset\mathbb Q(u)\). | This explains a field layer, not a canonical HMR object. |
| C6 | The trace-3 golden axis has primitive translation length \(4\log\phi\), and the quotient distance from \(\tau_d\) is \(\frac12\log(d/5)\) for \(d>5\). | PROVED HERE | Trace bound, transformed integral quadratic-geodesic height bound, and vertical equality path. | The axis has an orbifold symmetry through \(i\); translation-length and un-oriented segment conventions must not be conflated. |
| D1 | Six direct CM evaluations and the Rogers--Ramanujan-to-\(j(5\tau)\) comparison agree at 120 and 180 digits. | DIAGNOSTIC | Generated `RESULTS.json`. | Numerical agreement is not a proof of algebraic coefficients or CM. |
| D2 | An unweighted resultant residual is rejected; only a coefficient-weighted residual is reported. | DIAGNOSTIC LIMIT | Preserved exploratory failure and the checker implementation. | Large exact coefficients make the unweighted quantity uninformative about relative cancellation. |
| O1 | Give an explicit Shimura-reciprocity description of the analytic \(r(\tau)^5\) branch and match its cubic factor/root to an Artin class, without relying on a posteriori degree equality. | OPEN NEXT THEOREM | The ring-class field is now identified, so the remaining issue is a marked action calculation. | Must distinguish the \(X_1(5)\) Rogers--Ramanujan coordinate from the \(X_0(5)\) coordinate. |
| O2 | Construct a source-defined map from this ring-class datum to an HMR geometric/operator object, or derive an RH consequence. | OPEN / NOT CLAIMED | None. | A shared scalar \(c_0\), a common genus layer, or a geodesic identity is insufficient. |

## Director extensions

| ID | Claim | Status | Basis / limitation |
| --- | --- | --- | --- |
| G1 | General golden-field inclusion for the stated principal CM mark and all order discriminants D coprime5. | WRITTEN PROOF using classical CM / Artin reciprocity | GENERAL_GENUS_MECHANISM.md; independent review passed.17 exact form-count controls are supplementary. |
| T1 | lambda^n+c0^n is integral, Fibonacci error is c0^n/q, and the golden/HMR liminf is1/sqrt5. | ELEMENTARY WRITTEN PROOF | DIRECTOR_TRACE_BRIDGE.md;40 exact finite checks. The universal upper bound over all irrational numbers is external Hurwitz. |
| T2 | T5(J) and T-163(J) are Fourier data of the fixed BFI Maass form H(w,J). | APPLICATION OF EXTERNAL THEOREM | THETA_LIFT_BRIDGE.md; input, orientation and trace factors independently reviewed. No algebraic identity between coefficients follows. |
| D3 | Golden-cycle j-average is706.32481354081258205596032480346066543... . | NUMERICAL DIAGNOSTIC | Director45/65-digit runs and reviewer50/70-digit runs agree. No certified quadrature bound or algebraicity inference. |

The full Maass form has other principal, zero and square-index terms. The
golden translation length alone is not a Fourier coefficient; T5 is the cycle
integral, with the stated length normalization.
