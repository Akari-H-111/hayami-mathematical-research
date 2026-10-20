# Sources and immutable inputs

## External sources used in this packet

| Source | Exact location used | Use | SHA-256 |
| --- | --- | --- | --- |
| J. S. Milne, *Class Field Theory* | Chapter V, conductor discussion and Example 3.10 (printed pp. 158–159), note after Exercise 3.13 (p. 160), Theorem 3.27 and Remark 3.28 (p. 165; PDF p. 174) | Conductor--discriminant formula, rational ray/cyclotomic fields, and the character/Artin splitting law | PDF: `50d79af78250a9f1117ad9d337e0b231704a533fc707966ed1bfa52e13d498f5` |
| W. Duke, *Continued Fractions and Modular Functions* | Proposition 2, Equation (3.2), printed p. 7 | The Rogers–Ramanujan modular-inversion formula and its golden matrix normalization | PDF: `fcf69ec30dae5fb372818aef3152b7adf326f244dda52844df5fa5048d38cbe5` |
| Bryden Cais and Brian Conrad, *Modular Curves and Ramanujan's Continued Fraction* | Theorem 3.2 (printed p. 8), Corollary 3.3 (printed p. 9), Eq. (4.8) (printed p. 10), and Corollary 5.7 (printed p. 14) | The level-5 class-field description, (j_5=1/r), and the equality (K(j_5(\tau))=K_{(5)}) for a maximal-order 5-unit CM point | PDF: `b35daca31a0b20a487723f87cc60c4ed91fa7f5e71b3fca85f455a4e4628de2c` |

The cached PDF is `logs/sources/cais-conrad.pdf`; its plain-text extraction,
used only to locate passages, is `logs/sources/cais-conrad.txt` with SHA-256
`cf5157405db4c0da792e803cc266d836755194b41f36d9c8d15ff805ebcff03d`.
The supplied canonical URL is
<https://virtualmath1.stanford.edu/~conrad/papers/J5final.pdf>.
Milne's source URL is <https://www.jmilne.org/math/CourseNotes/CFT.pdf>;
its cached text extraction has SHA-256
933791dff22cc727f98628fd7f1230e03e40c0eaf78d053570c284fa34b56f0e.
The verifier binds the Cais--Conrad and Milne PDF/text hashes before checking mathematics.
Duke's URL is <https://www.math.ucla.edu/~wdduke/preprints/bams4.pdf>;
its cache is `logs/sources/duke-bams4.pdf`, bound by the first review's frozen
input manifest. All three PDF hashes are also recorded in
`logs/DIRECTOR_SOURCE_HASHES.json`.

## Inherited, read-only mathematical inputs

The ring-class identification and the cubic splitting data are prior results,
not silently recomputed as new CM theorems here.  A copied baseline replay
passed with the registered interpreter and produced the same `RESULTS.json`
hash (`e6277f641318caa8167dc73655d0d682947dec448fc538a03fb3832566a8da2c`).

| Read-only artifact | SHA-256 | Role in this continuation |
| --- | --- | --- |
| `../continuation-v0.2-ring-class/MATHEMATICS.md` | `0e78a9ccf77db51b360e44fd1c8b64cd243be157b9ed905a9e4bcbf8221cf9bf` | (K(u)=H_5), ([E:\mathbb Q]=6), (F\subset E), and the exact coordinate normalization |
| `../continuation-v0.2-ring-class/GENERAL_GENUS_MECHANISM.md` | `736674382fc63b70651519a5fbd4cd189bf740928c30d693d4c4f00e08c23771` | General golden genus-layer boundary |
| `../continuation-v0.2-ring-class/REVIEW_RESOLUTION.md` | `ece91ae3d4b29ce1bb65ebc3dbe2741605c32e47fab3d01f7a0fbddba09faed8` | Prior status and the exact open target resolved here |
| `../CUBIC_RESOLVENT.md` | `ce50abcd8082f4226f06aea20537b660802e2fb179b766bd0d5275fe924634dc` | The supplied \(\alpha,\beta\) cubic resolvent identity |
| `logs/DIRECTOR_SQUARE_CUBIC.txt` | `72f542993e4222ed751ddfd63f34d9af3bb8714afae0053ece4d71e49fbcd14c` | Supplied exploratory cubic-form witness; independently reduced anew |
| `logs/DIRECTOR_SQUARE_PROBE.json` | `43925f280827854317caf52d1eb846df6230bc859734c7842306c751f2b26399` | Supplied candidate rational witness; independently verified by the new exact checker |

## In-scope supplementary records preserved read-only

These records appeared in the continuation packet after its initial
inventory.  They were not edited by this continuation; their elementary
quartic claims were independently rechecked in the minimal verifier.

| Artifact | SHA-256 | Role |
| --- | --- | --- |
| DIRECTOR_CERTIFICATE.md | d440a0a391fc9dc85b49284679d3cefa00e194a86ba6350de91c4602c87673e1 | Compact \(\mathbb Q(\sqrt5)\)-coefficient square witness and branch-sign analysis |
| DIRECTOR_QUARTIC.md | bab49bfc80297dc7824b45d967ba9bc306a2ba67d5ace44381a332164a5b05f2 | Cyclic-quartic calculation |
| DIRECTOR_INTEGRAL_MODEL.md | 04b603d62a90e691586563ee0652042fa05ab9d6efd6ed57508e7e7ceb185765 | Integral-order and conductor argument |
| REVIEW_RESOLUTION.md | 1e24e07e1fd5baa7134177fe01386b3725fa1aa51ce570fa8015df6e59e84c0c | Preserved independent-review scope and limitations |

## Classical inherited background

The inherited (K(u)=H_5) statement depends on the first main theorem of CM
and the order class-number formula.  Its source binding is D. A. Cox,
*Primes of the Form \(x^2+ny^2\)*, Theorem 7.24 (printed p. 146) and
Theorem 11.1 (printed p. 220; parent cached-PDF p. 232).  The read-only
parent cache is `../continuation-v0.2-ring-class/logs/sources/cox.pdf`,
SHA-256 `f7ad9babf95257295d21114774c48b38967c1f604eecdbeb04749252ab829c34`.

The standard ray/ring exact sequences in `MATHEMATICS.md` are used as
class-field-theory inputs.  Their specialization is made reviewable by the
fully enumerated \(\mathbb F_{25}^\times\) certificate in
`verification/check.py`; the finite calculation is not presented as a
replacement for Artin reciprocity.

## What source hashes do and do not establish

A hash pins the bytes that were read.  It does not prove an external theorem.
The external theorem, written deduction, exact computation, numerical
diagnostic, and remaining limits are separately labeled in
`MATHEMATICS.md` and `CLAIM_LEDGER.md`.
