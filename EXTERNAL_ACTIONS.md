# External actions and publication record

- 2026-10-17 software releases (English entry): Stokes v5 Lean companion v0.05
  (`10.5281/zenodo.23422752`), Ruled v5 verification companion v0.04
  (`10.5281/zenodo.23422777`), and Bicomplex verification companion 1.1
  (`10.5281/zenodo.23422785`) are public as new versions of their concept
  records, with GitHub releases `stokes-v5-companion-v0.05`,
  `ruled-surface-v5-companion-v0.04`, and `bicomplex-successor-v1.1`. Public API
  and download SHA-256 readback PASS; see
  `releases/candidates/formal-closure-20261017-publication.json`.
- 2026-10-03 Bicomplex successor papers and software companion 1.0:
  **published and retested**. Zenodo Paper I `10.5281/zenodo.23103026`, Paper II
  `10.5281/zenodo.23103056`, software `10.5281/zenodo.23103299` (concept DOI
  `…23103025` / `…23103055` / `…23103298`); the official API, unauthenticated
  SHA-256 downloads of six files, and `doi.org` resolution of six DOIs all PASS
  (once at release on 2026-10-02 and once on 2026-10-03). GitHub tag/release
  `bicomplex-successor-v1.0` (source-only, tag points to `aceb055`; asset digest
  matches local). New ResearchGate entries `415154912`, `415164048` (CC BY 4.0,
  single author, Zenodo DOI filled in, official logged-in download PDF SHA-256
  matches, figure gallery 7 + 4 images); old page `408878000` retains its
  original content, with a superseded-by paragraph at the front of the
  description. The Zenodo account has no leftover Bicomplex drafts or
  unpublished DOIs. Terms acceptance, Zenodo metadata, and the RG download were
  confirmed by the author at the time. **Open items:** (1) the superseded-by
  wording polish for old page `408878000` was blocked by RG "Edit limit reached"
  (2026-10-02, 10-03); the text is in
  `releases/candidates/bicomplex-successor-v1-researchgate-pending-edits.md`;
  the existing paragraph is correct and may remain; (2) local `main` diverges
  from `origin/main`, see "Local main synchronization" below. Evidence:
  `releases/candidates/bicomplex-successor-v1-publication.json`,
  `releases/candidates/bicomplex-successor-v1-figures-publication.json`.

Updated: 2026-10-03

## Completed

- Ruled surface v5 verification companion v0.03: GitHub
  `ruled-surface-v5-companion-v0.03` is public (software/source-only, no new
  PDF). Public API/page and three-file unauthenticated download SHA-256/API
  digest agree; 224 own/258 dependency audit and source-only in-place/extracted
  replay PASS. The public record is
  `releases/candidates/ruled-surface-v5-v0.03-github-publication.json`. The
  author directed that the next step be a review of the paper's natural
  language, paragraphs, layout, and figure guidance before ResearchGate/Zenodo
  PDF publication; no new DOI has been assigned.

- Public GitHub repository:
  `https://github.com/Akari-H-111/hayami-mathematical-research`.
- Zenodo preprint DOIs for Inverse-Leibniz Papers I–III have been published:
  - Paper I: `10.5281/zenodo.22668484`
  - Paper II: `10.5281/zenodo.22668533`
  - Paper III: `10.5281/zenodo.22668633`
- Shared reproducibility materials for the three papers:
  `10.5281/zenodo.22663942`.
- Stokes v5 final preprint: `10.5281/zenodo.22728902`.
- Stokes v5 Lean companion v0.02: GitHub release
  `stokes-v5-companion-v0.02` and software DOI
  `10.5281/zenodo.22726977`.
- Stokes v5 Lean companion v0.03: GitHub release
  `stokes-v5-companion-v0.03` and Zenodo version record `22735974` are public;
  the software version DOI is `10.5281/zenodo.22735974`, using concept DOI
  `10.5281/zenodo.22726976`. The official API's three files and public download
  SHA-256 have been read back and agree.
- Stokes v5 Lean companion v0.04: GitHub release
  `stokes-v5-companion-v0.04` and Zenodo record `23057630` are public; software
  version DOI `10.5281/zenodo.23057630`, concept DOI
  `10.5281/zenodo.22726976`. The public APIs and three-file download hashes on
  both platforms match the archive; Zenodo API status is `done` /
  `submitted=true`. `doi.org` resolution still needs readback (initial HTTP
  404); use `https://zenodo.org/records/23057630` directly. Record:
  `releases/candidates/stokes-caustic-v5-v0.04-publication.md`.
- ResearchGate final-v5 new preprint entry:
  `https://www.researchgate.net/publication/414264187_Observation_Discriminant_and_Spherical_Fold_Image_of_the_Orthogonal-Circle_Ruled_Surface`;
  the new entry publicly displays the final-v5 PDF and paper DOI
  `10.5281/zenodo.22728902`, while the old entry retains ResearchGate DOI
  `10.13140/RG.2.2.23759.04006`.

These DOI types differ: individual preprints, shared materials, mathematical
papers, and software companions are not interchangeable.

## ResearchGate final v5: completed

Status: `COMPLETED / VERIFIED`.

A new preprint entry for final v5 was created following
`research/researchgate_handoff_v1.md`, the final-v5 PDF was uploaded, paper DOI
`10.5281/zenodo.22728902` was entered, and the new and old public pages were
read back. After official login, the pages show: the new page contains only
`v5.pdf` and explicitly marks the old version as superseded; the old page
contains only the historical `v3.pdf`, retains its original title and DOI
`10.13140/RG.2.2.23759.04006`, and has a superseded-by note pointing to final
v5 and the new DOI. No public record needs to be deleted or rewritten.

This item is closed against the following criteria:

1. The new entry's title, author, PDF, and Zenodo DOI are publicly visible.
2. The old entry's DOI is unchanged.
3. The old entry carries a superseded note pointing to final v5.

## Later external work

| Priority | Work | Prerequisite | Available material | Completion criterion |
| ---: | --- | --- | --- | --- |
| 1 | Publish Stokes v5 Lean companion v0.03 on Zenodo | `COMPLETED` | Zenodo version DOI `10.5281/zenodo.22735974`; concept DOI `10.5281/zenodo.22726976` | Official API `published`/`done`; three-file MD5 and public download SHA-256 agree |
| 2 | Plan arXiv submissions for Papers I–III | Author confirmation of classification, endorsement, and final metadata | `releases/current/submission-v0.09-zenodo/paper_*_v0_09_arxiv_source.zip`; `metadata/` | Each public arXiv page, PDF, author, and DOI relation read back consistently |
| 3 | Unify citation text across GitHub/Zenodo/ResearchGate | `COMPLETED / VERIFIED 2026-09-30` | `CITATION.cff`; release READMEs | Latest software v0.04 is `10.5281/zenodo.23057630`; paper `10.5281/zenodo.22728902`, historical software v0.03 `10.5281/zenodo.22735974`, and concept `10.5281/zenodo.22726976` are unchanged. The public Zenodo description includes the citation boundary; the ResearchGate paper DOI is unchanged. |
| 4 | Reader review before Ruled v5 PDF publication | `GITHUB SOURCE PUBLISHED / PDF EDITORIAL REVIEW` | 224 own/258 dependency checks verified; the complete local v0.03 candidate is unchanged; source release read back | First complete the language/paragraph/layout/figure-guidance review and new PDF QA/hash/replay; publish to ResearchGate/Zenodo only after final artifacts are approved; do not overwrite old v4 |
| 5 | Publish Bicomplex successor papers v1 + software 1.0 | `COMPLETED / VERIFIED 2026-10-02; RECHECKED 2026-10-03` | `releases/candidates/bicomplex-successor-v1-publication.json`; Zenodo `23103026`/`23103056`/`23103299`; GitHub `bicomplex-successor-v1.0`; ResearchGate `415154912`/`415164048`/`408878000` | Zenodo API/unauthenticated download SHA-256/six DOI resolutions, GitHub asset digest, and RG logged-in page readback all PASS; old page content retained; Lean covers only 33 theorems partially |
| 6 | Publish Stokes v5 Lean companion v0.04 | `PUBLISHED / API+DOWNLOAD VERIFIED; DOI RESOLUTION PENDING` | `releases/candidates/stokes-caustic-v5-v0.04-publication.md`; `https://zenodo.org/records/23057630` | In-place/extracted replay and two-platform public API/three-file SHA-256 all PASS. New software DOI assigned; only `doi.org` resolution readback remains; do not republish or change the DOI. Paper DOI and older versions unchanged. |
| 7 | Polish the superseded-by wording on Bicomplex old page `408878000` | `PENDING / BLOCKED BY RESEARCHGATE EDIT LIMIT` | `releases/candidates/bicomplex-successor-v1-researchgate-pending-edits.md` (full gentle version; optional: switch the two new entry descriptions to Unicode mathematical symbols) | After the quota resets, replace only the first description paragraph; read back to confirm title/date/DOI/v11/v12 files/original description are unchanged; write the result into the record next to the publication JSON |
| 8 | Synchronize local `main` with `origin/main` | `PENDING / AUTHOR` | "Local main synchronization" below | The author first commits or stashes work from other windows, then merges; `main` was not moved by this closeout |

## External status check entry points

Zenodo is governed by the official API, for example:

```bash
curl -fsSL https://zenodo.org/api/records/22728902 \
  | jq '{doi, conceptdoi, title: .metadata.title, files: [.files[].key]}'
```

For GitHub releases:

```bash
gh release view stokes-v5-companion-v0.02 \
  --repo Akari-H-111/hayami-mathematical-research \
  --json name,tagName,publishedAt,url,assets,isDraft,isPrerelease
```

ResearchGate must be read back through the public page after login; API
timeouts, saved edit forms, or local handoff files are not completion evidence.

Bicomplex successor papers (retested in the same way on 2026-10-03):

```bash
for id in 23103026 23103056 23103299; do
  curl -fsSL https://zenodo.org/api/records/$id \
    | jq '{id, doi, conceptdoi, version: .metadata.version, files: [.files[] | {key, size, checksum}]}'
done
gh release view bicomplex-successor-v1.0 \
  --repo Akari-H-111/hayami-mathematical-research \
  --json tagName,targetCommitish,publishedAt,isDraft,assets
```

ResearchGate new entries `415154912`, `415164048` and old page `408878000` can
likewise only be read back after login (no anonymous-access claim is made).

## Local main synchronization (author action; not executed in this cycle)

Status (2026-10-03): local `main` is at `5803d6a`, one commit ahead of the common
ancestor `fb9e1c1` from another window; `origin/main` has 11 commits beyond the
closeout commit (the Bicomplex successor papers and publication records, all
pushed from the isolated branch `publish/bicomplex-successor`, with no other
series). There is no commit-level conflict: `git merge-tree --write-tree main origin/main` returned only one tree on 2026-10-03. The blocker is the working
tree: roughly 47 uncommitted items from other windows
(`git status --short | grep -vi bicomplex | wc -l`), many at paths that also
exist in `origin/main` (shared files modified, Bicomplex files untracked), so a
direct `git merge` is rejected. Recommended sequence:

0. **Local protection already done on 2026-10-03 and reversible:** the private
   v7 PDF path was written to the local `.git/info/exclude` (this clone only, not
   in any commit; re-add it after a fresh clone). **Never use `git add -A` or
   `git add .`:** there are currently 2,850 untracked and unignored files,
   about 7.4 GB (`the-Self-Adjoint-Arithmetic-Mellin-Transform/` parquet data is
   about 7.2 GB, with 23 files over 50 MB; GitHub's per-file limit is 100 MB;
   the sealed Ruled/Bicomplex candidates are about 158 MB). Always stage
   explicit paths; large data directories must be ignored or stored separately,
   with the decision left to the SAMT window.
1. Each window first turns its work into a scoped commit (or
   `git stash push -u`).
2. `git fetch origin`.
3. Files that remain untracked in the working tree and are byte-identical to
   `origin/main` (176 files on 2026-10-03) may be committed with explicit
   `git add` paths (identical add/add content does not conflict during the
   merge), or deleted and restored by the merge; list them read-only with:

   ```bash
   git ls-tree -r --name-only origin/main | while read -r f; do
     [ -e "$f" ] && ! git ls-files --error-unmatch -- "$f" >/dev/null 2>&1 \
       && cmp -s "$f" <(git show "origin/main:$f") && echo "$f"
   done
   ```

4. `git merge -X ours origin/main` (first rehearse with
   `git merge-tree --write-tree -X ours main origin/main`). The 2026-10-03
   simulation — committing the current working-tree versions as-is, then merging
   `origin/main` — had only six shared-file conflicts: `EXTERNAL_ACTIONS.md`,
   `LEAN_ROADMAP.md`, `README.md`, `RESEARCH_BOARD.md`, `RESEARCH_DIRECTIONS.md`,
   and `SOURCE_REGISTRY.md`; `-X ours` resolved all of them with local text.
   Only old state text for other series on origin and duplicate Bicomplex
   wording were discarded; the local version already contained all Bicomplex
   facts. If origin changes again during the merge, rehearse again rather than
   reusing this conclusion.
5. Do not push `main` until the author decides the public scope of the other
   series. For public pushes, always use an isolated branch such as
   `publish/bicomplex-successor`, created with `git commit-tree` and containing
   only that series. The private v7 PDF exists only in the local untracked
   `papers/legacy-geometry/source-registry/historical_drafts/` and on the local
   branch `research/bicomplex-continuation-0.04`; neither may be pushed.
