# Primary works and comparison sources

Retrieved/checked 2026-10-19. Local source bytes are bound in
`logs/SOURCE_SHA256.json`. Cached PDFs remain unchanged, including title pages
and rights notices. Failed access is not treated as evidence of absence.

## Hermite's original work

Charles Hermite, *Sur la theorie des equations modulaires et la resolution de
l'equation du cinquieme degre*, Paris: Mallet-Bachelier, 1859.
[GDZ record](https://gdz.sub.uni-goettingen.de/id/PPN598770909),
[complete scan](https://gdz.sub.uni-goettingen.de/download/pdf/PPN598770909/PPN598770909.pdf).

The downloaded file has 77 PDF pages. Its embedded text is nearly empty; the
director used rendered page images. Complete relevant pages inspected:

- Printed 1-2 (PDF 10-11): quintic, radical impossibility, elliptic representation.
- Printed 40 (PDF 49): low-level modular examples, contextual reading only.
- Printed 47 (PDF 56): six transforms and class-number reduction.
- Printed 48 (PDF 57): small-nome argument, -43, -67, -163 and initial nines.
- Table of contents (PDF 8): confirms the opening quintic essay and modular
  equations section at printed p. 29.

Images and a source-faithful paraphrase are in logs/sources/. Printed p. 48
has 196880 in the reciprocal term; the modern coefficient is 196884. This
was independently checked before consulting the following modern commentary.
No verbatim claim is silently altered. A mathematical forum was used only to
locate the original book; its historical assertions were not used in place
of reading Hermite.

## Modular geometry and CM

- W. Duke, [*Continued Fractions and Modular Functions*](https://www.math.ucla.edu/~wdduke/preprints/bams4.pdf),
  2005 author version: Section 3, especially pp. 4-7 and Proposition 2,
  for the icosahedral action and RR modular transformations. The new graph
  and complete Gram-matrix certificate are derived directly in this packet.
- Bryden Cais and Brian Conrad,
  [*Modular Curves and Ramanujan's Continued Fraction*](https://virtualmath1.stanford.edu/~conrad/papers/J5final.pdf),
  author version dated March 8, 2006: Section 2 for the level structures and
  Weil-pairing normalization; Section 4's twelve-cusp SL2 action; Eq. (4.8),
  j5=1/r; Corollary 5.7, printed p. 14, for the CM ray field with its hypotheses.
- J. S. Milne, [*Class Field Theory*](https://www.jmilne.org/math/CourseNotes/CFT.pdf),
  v4.03, 2020: Artin reciprocity and conductor/cyclotomic descriptions.
- Andrew Snowden,
  [Math 679, Lecture 2: Elliptic curves](https://websites.umich.edu/~asnowden/teaching/2013/679/L02.html),
  2013, final section 'The Weil pairing': Galois equivariance and
  det(rho)=cyclotomic character. The official author page was readable via
  the web tool; a direct curl request was denied. We use the stated pairing
  properties, not every ancillary formula in the notes.

## Modern context and source discrepancy

- Masanobu Kaneko,
  [*Fourier coefficients of the elliptic modular function j(tau)*](https://www2.math.kyushu-u.ac.jp/~mkaneko/papers/jcoeff_Kobe.pdf),
  Japanese lecture notes, preface dated September 3, 2001; printed p. 14
  discusses Hermite's erroneous 196880. This confirms the discrepancy observed
  in the primary scan; it is not the basis for the original-page claim.
- Andrew V. Sutherland,
  [*Computing Hilbert class polynomials with the Chinese Remainder Theorem*](https://arxiv.org/abs/0903.2785v4),
  v4 (2013), Mathematics of Computation 80 (2011), 501-538. The abstract
  explicitly connects CM construction to pairing-friendly prime-order curves.
  Used as context for separating curve construction from hardness; no claimed
  performance or security comparison.
- Castryck, Lange, Martindale, Panny and Renes,
  [*CSIDH: An Efficient Post-Quantum Commutative Group Action*](https://eprint.iacr.org/2018/383),
  2018 ePrint record, revised November 23, 2018. The primary abstract supplies
  the class-group-action/isogeny connection. PDF requests returned403; no
  uninspected theorem, present-day security level or attack resistance is used.

No current cryptosystem recommendation is made. A prime-field reduction,
curve order, subgroup, protocol and observable public data would all have to
be specified before assessing a practical cryptographic implication.

## Preserved local inputs

The v0.3 packet's FINAL_REPORT.md, DIRECTOR_CERTIFICATE.md and MATHEMATICS.md
provide the exact w witness, selected branch, h(-163)=1, K(u)=H and
K(t)=H(zeta5)=L. They are inherited mathematical inputs, preserved by hashes.
The novelty audit remains an historical assessment; it does not impose the
scope of this user-redirected study.
