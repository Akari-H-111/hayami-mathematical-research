# 接下來要對外做的處理

- 2026-10-03 Bicomplex 後繼論文與軟體 companion 1.0：**已公開並重測**。Zenodo 論文一 `10.5281/zenodo.23103026`、論文二 `10.5281/zenodo.23103056`、軟體 `10.5281/zenodo.23103299`（concept DOI `…23103025`／`…23103055`／`…23103298`）；官方 API、六個檔案的免登入下載 SHA-256 與六個 DOI 的 doi.org 解析均 PASS（2026-10-02 發佈時與 2026-10-03 各一次）。GitHub tag／release `bicomplex-successor-v1.0`（source-only，tag 指向 `aceb055`；asset digest 與本機一致）。ResearchGate 新條目 `415154912`、`415164048`（CC BY 4.0、單一作者、填 Zenodo DOI、官方登入下載的 PDF SHA-256 一致、圖庫 7＋4 張）；舊頁 `408878000` 保留原內容，描述最前面有 superseded-by 段落。Zenodo 帳號沒有遺留的 Bicomplex 草稿或未發布 DOI。條款同意、Zenodo metadata 與 RG 下載都在當下取得作者確認。**尾項：** (1) 舊頁 `408878000` 的 superseded-by 措辭潤飾被 RG「Edit limit reached」擋下（2026-10-02、10-03），文字存於 `releases/candidates/bicomplex-successor-v1-researchgate-pending-edits.md`，現有段落內容正確可保留；(2) 本機 `main` 與 origin/main 分岔，見下方「本機 main 同步」。證據：`releases/candidates/bicomplex-successor-v1-publication.json`、`releases/candidates/bicomplex-successor-v1-figures-publication.json`。

更新日期：2026-10-03

## 已完成

- Ruled surface v5 verification companion v0.03：GitHub `ruled-surface-v5-companion-v0.03` 已公開（software/source-only，沒有新 PDF）。公開 API／頁面及三檔免登入下載 SHA-256／API digest 一致；224 own／258 依賴 audit、source-only 原位／解壓重播 PASS。公開紀錄見 `releases/candidates/ruled-surface-v5-v0.03-github-publication.json`。作者指定後續先檢閱論文的自然語言、段落、版面與圖片引導，再提 ResearchGate／Zenodo PDF 發布；新 DOI 尚未指派。

- 公開 GitHub repository：`https://github.com/Akari-H-111/hayami-mathematical-research`。
- Inverse-Leibniz Papers I–III 的 Zenodo preprint DOI 已發布：
  - Paper I：`10.5281/zenodo.22668484`
  - Paper II：`10.5281/zenodo.22668533`
  - Paper III：`10.5281/zenodo.22668633`
- 三篇共同重現材料：`10.5281/zenodo.22663942`。
- Stokes v5 final preprint：`10.5281/zenodo.22728902`。
- Stokes v5 Lean companion v0.02：GitHub release `stokes-v5-companion-v0.02` 與 software DOI `10.5281/zenodo.22726977`。
- Stokes v5 Lean companion v0.03：GitHub release `stokes-v5-companion-v0.03` 與 Zenodo version record `22735974` 已公開；software version DOI 為 `10.5281/zenodo.22735974`，沿用 concept DOI `10.5281/zenodo.22726976`。官方 API 的三檔與公開下載 SHA-256 已回讀一致。
- Stokes v5 Lean companion v0.04：GitHub release `stokes-v5-companion-v0.04` 與 Zenodo record `23057630` 已公開，software version DOI `10.5281/zenodo.23057630`、concept DOI `10.5281/zenodo.22726976`。兩平台的公開 API／三檔下載雜湊均與封存一致；Zenodo API 為 `done`／`submitted=true`。`doi.org` 解析尚待回讀（首次 HTTP 404），可直接使用 `https://zenodo.org/records/23057630`。記錄見 `releases/candidates/stokes-caustic-v5-v0.04-publication.md`。
- ResearchGate final-v5 新 Preprint 條目：`https://www.researchgate.net/publication/414264187_Observation_Discriminant_and_Spherical_Fold_Image_of_the_Orthogonal-Circle_Ruled_Surface`；新條目公開顯示 final-v5 PDF 與論文 DOI `10.5281/zenodo.22728902`，舊條目保留 ResearchGate DOI `10.13140/RG.2.2.23759.04006`。

這些 DOI 的類型不同：個別 preprint、共同材料、數學論文與 software companion 不可互相代替。

## ResearchGate final v5：已完成

狀態：`COMPLETED / VERIFIED`。

已依 `research/researchgate_handoff_v1.md` 建立 final v5 的新 Preprint 條目、上傳 final-v5 PDF、填入論文 DOI `10.5281/zenodo.22728902`，並完成新舊公開頁回讀。官方登入後頁面顯示：新頁只有 `v5.pdf` 且明列取代舊版；舊頁只有歷史 `v3.pdf`、保留原標題與 DOI `10.13140/RG.2.2.23759.04006`，並有指向 final v5 與新 DOI 的 superseded-by 說明。無需再刪除或改寫公開記錄。

本項依下列判準關閉：

1. 新條目的標題、作者、PDF 與 Zenodo DOI 均公開可見。
2. 舊條目的 DOI 未變。
3. 舊條目出現指向 final v5 的 superseded 說明。

## 之後的外部工作

| 優先序 | 工作 | 前置條件 | 可用材料 | 完成判準 |
| ---: | --- | --- | --- | --- |
| 1 | Zenodo 發布 Stokes v5 Lean companion v0.03 | `COMPLETED` | Zenodo version DOI `10.5281/zenodo.22735974`；concept DOI `10.5281/zenodo.22726976` | 官方 API `published`/`done`、三檔 MD5 與公開下載 SHA-256 已一致 |
| 2 | 對 Papers I–III 規劃 arXiv 提交 | 作者確認分類、endorsement 與最後 metadata | `releases/current/submission-v0.09-zenodo/paper_*_v0_09_arxiv_source.zip`; `metadata/` | 每篇公開 arXiv 頁面、PDF、作者與 DOI relation 回讀一致 |
| 3 | 統一 GitHub/Zenodo/ResearchGate 的引用文字 | `COMPLETED / VERIFIED 2026-09-30` | `CITATION.cff`; 各 release README | 最新 software v0.04 為 `10.5281/zenodo.23057630`；paper `10.5281/zenodo.22728902`、歷史 software v0.03 `10.5281/zenodo.22735974`、concept `10.5281/zenodo.22726976` 不變。Zenodo 公開 description 含 Citation boundary；ResearchGate paper DOI 不變。 |
| 4 | Ruled v5 PDF 發布前的讀者檢閱 | `GITHUB SOURCE PUBLISHED / PDF EDITORIAL REVIEW` | 224 own／258 依賴已驗證，完整本地 v0.03 候選不改；來源 release 已回讀 | 先完成語言／段落／版面／圖片引導檢閱及新 PDF QA/hash/replay，最終 artifacts 核准後才發 ResearchGate／Zenodo；舊 v4 不覆寫 |
| 5 | Bicomplex 後繼論文 v1＋software 1.0 公開 | `COMPLETED / VERIFIED 2026-10-02; RECHECKED 2026-10-03` | `releases/candidates/bicomplex-successor-v1-publication.json`; Zenodo `23103026`／`23103056`／`23103299`; GitHub `bicomplex-successor-v1.0`; ResearchGate `415154912`／`415164048`／`408878000` | Zenodo API／免登入下載 SHA-256／六個 DOI 解析、GitHub asset digest、RG 登入頁面回讀皆 PASS；舊頁原內容保留；Lean 僅 33 定理的部分覆蓋 |
| 6 | 發布 Stokes v5 Lean companion v0.04 | `PUBLISHED / API+DOWNLOAD VERIFIED; DOI RESOLUTION PENDING` | `releases/candidates/stokes-caustic-v5-v0.04-publication.md`; `https://zenodo.org/records/23057630` | 原位／解壓 replay、兩平台公開 API／三檔 SHA-256 全 PASS。新 software DOI 已指派；只待 `doi.org` 解析回讀，不重發或更換 DOI。paper DOI 與舊版本不變。 |
| 7 | Bicomplex 舊頁 `408878000` 的 superseded-by 措辭潤飾 | `PENDING / BLOCKED BY RESEARCHGATE EDIT LIMIT` | `releases/candidates/bicomplex-successor-v1-researchgate-pending-edits.md`（溫和版全文；另可選：兩個新條目描述改用 Unicode 數學符號） | 額度恢復後只替換描述第一段；回讀確認標題／日期／DOI／v11／v12 檔案／原描述不變；結果寫回 publication JSON 旁的紀錄 |
| 8 | 本機 `main` 與 origin/main 同步 | `PENDING / AUTHOR` | 下方「本機 main 同步」 | 作者先把其他窗口的工作提交或暫存，再合併；`main` 未被本次收尾移動 |

## 外部狀態核對入口

Zenodo 以官方 API 為準，例如：

```bash
curl -fsSL https://zenodo.org/api/records/22728902 \
  | jq '{doi, conceptdoi, title: .metadata.title, files: [.files[].key]}'
```

GitHub release 以：

```bash
gh release view stokes-v5-companion-v0.02 \
  --repo Akari-H-111/hayami-mathematical-research \
  --json name,tagName,publishedAt,url,assets,isDraft,isPrerelease
```

ResearchGate 必須用登入後公開頁面回讀；API timeout、編輯表單暫存或本地 handoff 文件都不是完成證據。

Bicomplex 後繼論文（2026-10-03 已用同樣方式重測）：

```bash
for id in 23103026 23103056 23103299; do
  curl -fsSL https://zenodo.org/api/records/$id \
    | jq '{id, doi, conceptdoi, version: .metadata.version, files: [.files[] | {key, size, checksum}]}'
done
gh release view bicomplex-successor-v1.0 \
  --repo Akari-H-111/hayami-mathematical-research \
  --json tagName,targetCommitish,publishedAt,isDraft,assets
```

ResearchGate 新條目 `415154912`、`415164048` 與舊頁 `408878000` 同樣只能登入後回讀（匿名存取不宣稱）。

## 本機 main 同步（作者處理；本次未執行）

狀態（2026-10-03）：本機 `main` 在 `5803d6a`，比共同祖先 `fb9e1c1` 多 1 個其他窗口的 commit；`origin/main` 在收尾 commit 之前多 11 個 commit（Bicomplex 後繼論文與發布紀錄，皆由隔離分支 `publish/bicomplex-successor` 推送，不含其他系列）。commit 層級沒有衝突：`git merge-tree --write-tree main origin/main` 於 2026-10-03 只回傳一個 tree。阻礙在工作區：其他窗口約 47 個未提交項目（`git status --short | grep -vi bicomplex | wc -l`），其中不少路徑在 origin/main 也存在（共用文件被修改、Bicomplex 檔案未追蹤），直接 `git merge` 會被拒。建議流程：

1. 各窗口先把自己的工作做成 scoped commit（或 `git stash push -u`）。
2. `git fetch origin`。
3. 工作區中仍是未追蹤、且與 origin/main 逐位元組相同的檔案，可刪除後由合併取回；用下列指令列出（唯讀）：

   ```bash
   git ls-tree -r --name-only origin/main | while read -r f; do
     [ -e "$f" ] && ! git ls-files --error-unmatch -- "$f" >/dev/null 2>&1 \
       && cmp -s "$f" <(git show "origin/main:$f") && echo "$f"
   done
   ```

4. `git merge origin/main`。共用文件（`RESEARCH_BOARD.md`、`README.md`、`ESTABLISHED_WORKS.md`、`EXTERNAL_ACTIONS.md`、`LEAN_ROADMAP.md`、`RESEARCH_DIRECTIONS.md`）若衝突，以本機版本為準（它同時含 Bicomplex 現況與其他系列的現況），只補入 origin 版本中本機版本尚缺的 Bicomplex 事實。
5. 在作者決定其他系列的公開範圍之前不要 push `main`。公開 push 一律用像 `publish/bicomplex-successor` 這樣由 `git commit-tree` 建立、只含該系列檔案的隔離分支。私有 v7 PDF 只存在於本機未追蹤的 `papers/legacy-geometry/source-registry/historical_drafts/` 與本機分支 `research/bicomplex-continuation-0.04`，兩者都不得 push。
