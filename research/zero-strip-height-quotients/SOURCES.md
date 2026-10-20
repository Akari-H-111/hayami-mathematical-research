# Source register

All URLs were accessed on 2026-10-18.  The role and hypotheses are recorded so
that a citation is not silently upgraded into a claim.

| ID | Source and stable URL | Used location / hypothesis | Use here |
|---|---|---|---|
| S1 | NIST DLMF, [§25.4](https://dlmf.nist.gov/25.4) | Equations 25.4.3--25.4.4: definition of xi and `xi(s)=xi(1-s)` | Entire completed function and functional equation |
| S2 | NIST DLMF, [§25.10(i)](https://dlmf.nist.gov/25.10) | Distribution paragraph, especially its statement that nontrivial zeros lie in the strip and are symmetric about real axis and critical line | Zero-location/symmetry cross-check; it explicitly refers to Titchmarsh §4.17 |
| S3 | E. C. Titchmarsh, revised by D. R. Heath-Brown, *The Theory of the Riemann Zeta-function*, 2nd ed. (1986), Theorem 9.3, pp. 212--213 | Standard bibliographic location for the zero-counting formula; these exact pages were not directly inspected in this cycle | Bibliographic corroboration; S8 is the directly retrieved analytic input |
| S4 | H. von Mangoldt, “Zu Riemann's Abhandlung ‘Ueber die Anzahl der Primzahlen unter einer gegebenen Grösse’,” *J. reine angew. Math.* **127** (1905), 1--20 | Original proof lineage for Riemann's zero-counting formula | Primary historical source; this cycle did not rely on an OCR transcription for endpoint notation |
| S5 | D. Montgomery, “Topological Transformation Groups,” ICM 1954 proceedings, p. 185, [scan](https://www.mathunion.org/fileadmin/ICM/Proceedings/ICM1954.3/ICM1954.3.ocr.pdf) | Theorem 1: every locally Euclidean group is a Lie group | Open-Mobius no-topological-group argument |
| S6 | D. Montgomery and L. Zippin, *Topological Transformation Groups* (1955), and the cited ICM account | Locally Euclidean means a neighborhood of identity is Euclidean; no pre-existing differentiable structure assumed | Book authorship is distinct from attribution of the theorem to Gleason, Montgomery and Zippin |
| S7 | D. Husemoller, *Fibre Bundles*, GTM 20, [publisher record](https://link.springer.com/book/10.1007/978-1-4757-4008-0) | Mapping tori / line-bundle viewpoint | Standard cylinder/Mobius and orientation-cover descriptions; elementary computations are supplied in the text |
| S8 | T. Trudgian, “[An improved upper bound for the argument of the Riemann zeta-function on the critical line II](https://arxiv.org/pdf/1208.5846v2)” (2012) | Corollary 1, p. 2; its `N(T)` is explicitly defined in §2 as zeros with `0<β<1`, `0<γ<T` | Independently retrieved explicit logarithmic-error RvM bound; supports the eventual-periodicity strengthening in `SUPERVISOR_NO_GO.md` |
| S9 | I. Goldbring, [Hilbert's fifth problem for local groups](https://homepages.math.uic.edu/~isaac/ltop.pdf) | Introduction p. 1 recalls the global locally Euclidean group theorem; bibliography [4], [13] gives Gleason and Montgomery-Zippin's original 1952 papers | Directly retrieved primary research paper recording the precise classical global input; not a new proof of that input here |
| S10 | NIST DLMF, [25.2.3](https://dlmf.nist.gov/25.2.E3) | Alternating-series representation for Re(s)>0; our use is real 0<s<1, where the denominator is nonzero | The adjacent-pair bound in `MATHEMATICS.md` proves zeta(s)<0 throughout that real interval |

## Retrieval limitation

S8 was directly retrieved and supplies the count estimate actually used.
S3 is bibliographic corroboration; its exact book pages were not directly
inspected in this cycle. Endpoint conventions for the asymptotic are handled
by monotonicity in `MATHEMATICS.md`, not by an unverified convention in S3.
The NIST pages do not give the full counting asymptotic. S4 is historical
provenance. The supervisor's direct fetch of the S5 scan exceeded the browser
tool's size limit; S9 is the directly inspected source for the global group
theorem. No scan-fetch success is inferred from a search result.

The conjugation identity for xi is immediate from the displayed definition in
S1, the corresponding real structures of gamma and zeta, and real `pi`; it is
not an uncredited extra hypothesis.
