# Sources, local evidence, and dependency labels

## External classical inputs

| Source | Exact location used | Role here |
| --- | --- | --- |
| W. Duke, *Continued Fractions and Modular Functions*, Bull. AMS 42 (2005), 137-162 | Eq. (2.5), Eq. (7.7), and §8, especially the paragraph citing Cox Theorem 11.1 | The Rogers--Ramanujan convention, \(r^{-5}-11-r^5=(\eta(\tau)/\eta(5\tau))^6\), and the CM framework. The read-only parent author PDF is `../logs/sources/duke-bams4.pdf`; its byte-identical continuation copy `logs/sources/duke-bams4.pdf` is hash-checked here. |
| R. S. Maier, *On Rationally Parametrized Modular Equations*, arXiv:math/0611041v4 | Eq. (3.2), Table 2 on printed p. 11, Table 7 on printed p. 18 | Maier's coordinate is \(t_5^{\rm M}=125\eta(5\tau)^6/\eta(\tau)^6=125/x\); its two displayed rational functions fix which formula is \(j(\tau)\) and which is \(j(5\tau)\). |
| D. A. Cox, *Primes of the Form \(x^2+ny^2\)* | Theorem 7.24, printed p. 146; Theorem 11.1, printed p. 220 (PDF p. 232) | Respectively the order class-number formula and the first CM theorem \(K(j(\mathfrak a))\) equals the ring class field. The cached PDF is scanned; its two cited pages were visually checked from preserved PNGs. |
| W. Luo, Z. Rudnick, P. Sarnak, *The Variance of Arithmetic Measures Associated to Closed Geodesics on the Modular Surface* | §1.2, printed p. 4 | The standard trace/translation-length convention and the modular-orbifold setting for the geometric synthesis. |

The use of Cox's theorem also invokes the standard correspondence between
proper order-ideal classes and primitive positive binary quadratic forms.
The six-form enumeration itself is carried out exactly in this package rather
than copied from a table.

## Local source identity

The raw files below were read in place and not modified.  `verification/check.py`
asserts their SHA-256 values before performing mathematics.

| Local raw file | SHA-256 |
| --- | --- |
| `logs/sources/maier.pdf` | `ca51653bb995355b0191fb0acc04a72f742e08ca67873f7e84a036bacf81ead5` |
| `logs/sources/cox.pdf` | `f7ad9babf95257295d21114774c48b38967c1f604eecdbeb04749252ab829c34` |
| `logs/sources/luo-rudnick-sarnak.pdf` | `4226b4c9d9af5a7f1ce08e28cd693eef48dc2edf51a41cd489286985ae698410` |

`logs/sources/SHA256.json`, `logs/cli-events.jsonl`,
`logs/prior-checkpoint-verified.json`, and `logs/DIRECTOR_PROBE.json` are
preserved input evidence.  They are not regenerated or overwritten here.

## Local mathematical provenance

- The prior 19-file checkpoint is recorded as `PASS` in
  `logs/prior-checkpoint-verified.json`.  This continuation independently
  recalculates the specific algebra it needs; it does not import
  `director_check.py`, whose top level writes a parent result file.
- The current HMR ruled-surface source defines
  \(c_0=(3-\sqrt5)/2\) in its rank-singularity display (read-only source:
  `../../../papers/legacy-geometry/orthogonal-circle-ruled-surface/revision_v5/working_fullproof/Orthogonal_Circle_Ruled_Surface_v5_fullproof_working.tex`, around line 238).
  This establishes only the target scalar identity \(c_0=\phi^{-2}\).

## What is not used as proof

The high-precision CM evaluations in `RESULTS.json` are diagnostic.  No
coefficient, field inclusion, or class-field statement is inferred from a
floating-point approximation.  Recent literature and the parent package's
broader HMR/RH survey are not used to claim priority, a geometric realization,
or an RH implication.

The preserved exploratory record also matters: an unweighted evaluation of
the enormous resultant polynomial was rejected as a diagnostic because it
does not measure cancellation relative to coefficient scale.  The checker
therefore reports only coefficient-weighted residuals.  Likewise, it asserts
that every coefficient after `QQ.monic()` has denominator one before integer
conversion, and checks the exact coefficient list, rather than making a claim about
SymPy's internal integer-versus-rational coefficient representation.  Neither
exploratory behavior is mathematical evidence.

## Added director-source bindings

The main checker now also binds the following cached primary PDFs. A hash
check establishes source identity, not the validity of a cited theorem.

| Local raw file | SHA-256 |
| --- | --- |
| `logs/sources/duke-bams4.pdf` | `fcf69ec30dae5fb372818aef3152b7adf326f244dda52844df5fa5048d38cbe5` |
| `logs/sources/bruinier-funke-imamoglu.pdf` | `e04d45790cc82bc1dfc5ea4dc601140694fd2c550701e20c591e79fddebdc805` |
| `logs/sources/bengoechea-imamoglu.pdf` | `7daece19c2e6fd4c9614c03cb98061ce41bf55bf3361f000cabdfe28a827c376` |

The BFI revised manuscript theorem1.2 is the external theorem applied in
THETA_LIFT_BRIDGE.md. Bengoechea-Imamoglu section2.1 independently supplies
cycle-integral conventions. Original and corrected read-only review records
remain in logs; the temporary review snapshot needed its own source cache.
The actual package already contained the initial three cached source PDFs.
