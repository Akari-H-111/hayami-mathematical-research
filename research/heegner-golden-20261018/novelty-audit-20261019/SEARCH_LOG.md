# Search coverage and unresolved access, 2026-10-19

This is a human-readable research log, not a claim of exhaustive indexing.
Positive theorem matches carry the verdict; negative hits do not.

## Search approaches

1. Read the preserved v0.3 report, source list and exact claim documents.
2. Search for RR singular values, Shimura reciprocity, class-field generation,
   cyclic quartic conductors, and generator parameterizations; follow primary
   references rather than relying only on exact coefficient searches.
3. Inspect Gee-Honsbeek, Cais-Conrad, Duke, Milne and Spearman-Williams at the
   theorem/equation locations recorded in SOURCES.md.
4. Check exact equivalence of our quartic generator with the published family.
5. Screen contemporary arXiv work and record hypothesis differences.

Representative literal web queries used include:

```text
"163" "Rogers-Ramanujan" golden ratio
"815" "cyclic quartic"
"3321125" field
"Singular values of the Rogers-Ramanujan continued fraction" 2006
"Rogers Ramanujan" "163" "singular" continued fraction exact
"163" "golden ratio" "modular" Ramanujan
"Ramanujan Sato" "U_5" golden
```

Earlier thematic searches in this same audit located the Spearman-Williams
primary paper and Gee-Honsbeek thesis chapter. Formula searches were used as
locators; the decisive match is the generator change and theorem specialization.
Searches on 3321125 mostly returned irrelevant digit matches, illustrating why
nonappearance of a field entry or coefficient string is weak evidence.

## Access and comparison limits

- Williams' primary publication index was readable through web retrieval but
  direct host requests returned HTTP 403. The DML primary PDF succeeded by curl;
  later web-tool retries on its landing page/PDF timed out or failed. The exact
  locally read bytes are hashed.
- The guessed LMFDB path `NumberField/4.4.3321125.1` did not load. Neither the
  existence nor absence of that database label was established.
- The Gee-Honsbeek publisher DOI page failed. The original thesis chapter was
  accessible; its preface and the Cais-Conrad bibliography supply dating checks.
- Poor OCR in Gee-Honsbeek required page-image inspection. In particular,
  R=r, w=eta(z/5)/eta(5z), and their H_5 is a ray field. An OCR-only comparison
  would risk conflating these with our t=r^5, coordinate w(u), and ring field H5.
- The 1986 quartic reference was not obtained. Its 1997 restatement suffices to
  establish prior art; we do not claim firsthand verification of the 1986 text.
- Web hits concerning golden ratios, Ramanujan-Sato series, blogs, speculative
  physics and reposted identity collections were not used to establish a
  mathematical theorem or priority. Further relevant primary literature may
  exist beyond the bounded corpus inspected here.
- No verbatim degree-five coefficient witness was located in the inspected
  sources. This does not establish novelty of the witness, the embedding,
  or the underlying class-field mechanism.

## Review record

The explicitly requested CLI selection gpt-5.6-terra completed a read-only
review with high reasoning. Raw events and its final assessment are under
`logs/`. It used the cached primary sources and an in-memory generator check;
it did not perform independent network searching or inspect page images.
The director supplied those two additional checks and corrected the conductor
theorem's printed page from 454 to 455. This review is a documented check of
the argument, not external peer review or an exhaustive novelty certificate.
