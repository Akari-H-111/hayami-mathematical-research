# Primary sources and exact locations

Audit date: 2026-10-19. Cached PDFs remain local, unchanged, with their original
rights notices under ignored `logs/sources/`. Text extracts locate passages;
OCR is not authoritative for formulas. `logs/SOURCE_SHA256.json` binds the
cached PDFs, extracts and inspected page images. This document records URLs
and the theorem-level relationship; no distribution of source PDFs is proposed.

## Decisive quartic prior art

Blair K. Spearman and Kenneth S. Williams, *The conductor of a cyclic quartic
field using Gauss sums*, Czechoslovak Mathematical Journal 47 (1997), no. 3,
453-462. [Repository record](https://dml.cz/handle/10338.dmlcz/127369),
[primary PDF](https://www.dml.cz/bitstream/handle/10338.dmlcz/127369/CzechMathJ_47-1997-3_6.pdf).

- Printed pp. 453-454: Eqs. (1)-(4), standard cyclic quartic parameters.
- Printed p. 454: cases (5) and exponent ell, Eq. (8).
- Printed p. 455: conductor theorem, Eq. (9).
- Printed p. 462: reference [1], K. Hardy, R. H. Hudson, D. Richman,
  K. S. Williams and N. M. Holtz, *Calculation of the class numbers of imaginary
  cyclic quartic fields*, Carleton-Ottawa Mathematical Lecture Note Series 7,
  July 1986, 201 pp. This older item is credited by the 1997 authors but was not
  directly inspected.
- PDF SHA-256: `94679cdd1c82d1f3bb67f928a22d55c0ed5fca40a350d941c349e3aacba2d81a`.

## RR and CM sources

Alice Gee and Mascha Honsbeek, *Singular values of the Rogers-Ramanujan
continued fraction*, chapter in Alice C. P. Gee, *Class fields by Shimura
reciprocity*, University of Amsterdam thesis (2001).
[Primary chapter PDF](https://pure.uva.nl/ws/files/3264828/16631_UBA002000333_06.pdf).

- Printed p. 53, Eqs. (1)-(2): R is the ordinary RR function.
- Printed pp. 59-61, Eqs. (18)-(23): CM class-field action and computation.
- Printed pp. 62-63, Theorem 5: ray-field generation.
- Printed p. 63, Eqs. (25)-(27), Proposition 6: reciprocal pair and compositum.
- Printed pp. 64 onward: computations and radical method, with small-n examples.
- Visually inspected complete printed pages 53 and 63; no fifth powers are
  hidden in Eq. (25). The eta argument is z/5, not z.
- PDF SHA-256: `e50ffeb0f559b9b8965202d4dbe91167f07a24cb8134ab7e358f80371bf0c598`.

[Thesis preface](https://pure.uva.nl/ws/files/3264820/16627_UBA002000333_02.pdf),
PDF p. 4, dates submission of the joint manuscript to June 1999. The repository
cover dates the thesis to 2001. SHA-256:
`e9eae9ec51f4924a2182d3ee22eaea39d5dbc1ce45d2ecda349334bda5d878e0`.
The later journal item has DOI
[10.1007/s11139-006-8477-7](https://doi.org/10.1007/s11139-006-8477-7).
Publisher access failed in this audit; Cais-Conrad reference [11] independently
identifies the 2006 Ramanujan Journal item. All theorem locations here refer
to the inspected thesis version, not assumed identical journal pagination.

Bryden Cais and Brian Conrad, *Modular Curves and Ramanujan's Continued
Fraction*, inspected author version dated March 8, 2006.
[Primary PDF](https://virtualmath1.stanford.edu/~conrad/papers/J5final.pdf).
Eq. (4.8), printed p. 10, fixes j_5=1/r; Corollary 5.7, printed p. 14, supplies
the ray-field theorem with its maximal-order and 5-unit hypotheses. Bibliography
reference [11], printed pp. 62-63, identifies Gee-Honsbeek's 2006 publication.
PDF SHA-256:
`b35daca31a0b20a487723f87cc60c4ed91fa7f5e71b3fca85f455a4e4628de2c`.

W. Duke, *Continued Fractions and Modular Functions*, author manuscript of the
2005 Bulletin of the AMS article.
[Primary PDF](https://www.math.ucla.edu/~wdduke/preprints/bams4.pdf).
Printed pp. 2-4 give classical special values and radical solvability;
Proposition 2, Eq. (3.2), printed p. 7, is the golden RR inversion law.
PDF SHA-256:
`fcf69ec30dae5fb372818aef3152b7adf326f244dda52844df5fa5048d38cbe5`.

## Standard class-field input

J. S. Milne, *Class Field Theory*, version 4.03, August 6, 2020.
[Author PDF](https://www.jmilne.org/math/CourseNotes/CFT.pdf).
Chapter V, Example 3.10, printed pp. 158-159: rational ray fields and cyclotomic
interpretation; Theorem 3.27 and Remark 3.28, printed p. 165 (PDF p. 174):
conductor-discriminant formula. These support routine deductions, not novelty.
PDF SHA-256:
`50d79af78250a9f1117ad9d337e0b231704a533fc707966ed1bfa52e13d498f5`.

## Contemporary screening, not decisive prior-art matches

- Bruce C. Berndt and Örs Rebák,
  [*The Rogers-Ramanujan continued fraction*](https://arxiv.org/html/2512.19952v1),
  v1 (2025): surveyed classical golden evaluations and reciprocity, especially
  Eqs. (2.3)-(2.8). Historical attribution is supported here through that survey,
  not through direct inspection of Ramanujan's original letters.
- John M. Campbell,
  [*Applications of the icosahedral equation for the Rogers-Ramanujan continued fraction*](https://arxiv.org/html/2402.02546v1),
  v1 (2024): exact-evaluation context. No claim of exhaustive comparison or
  a verbatim tau163 match was made from this screen.
- Sumit Kumar Jha,
  [*Cyclic Kronecker Fourier Transforms, Weber Norms, and Rogers-Ramanujan Singular Values*](https://arxiv.org/abs/2610.18910v1),
  v1, October 12, 2026: abstract hypotheses D=-5n and a cyclic class group with
  the ramified prime above 5 differ from our discriminant -163, where 5 is inert.
  This is related recent work, not a direct theorem match. Its asserted theorems
  were not independently validated in this audit.
