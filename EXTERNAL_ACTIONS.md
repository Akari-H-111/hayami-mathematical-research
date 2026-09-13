# 接下來要對外做的處理

更新日期：2026-09-13

## 已完成

- 公開 GitHub repository：`https://github.com/Akari-H-111/hayami-mathematical-research`。
- Inverse-Leibniz Papers I–III 的 Zenodo preprint DOI 已發布：
  - Paper I：`10.5281/zenodo.22668484`
  - Paper II：`10.5281/zenodo.22668533`
  - Paper III：`10.5281/zenodo.22668633`
- 三篇共同重現材料：`10.5281/zenodo.22663942`。
- Stokes v5 final preprint：`10.5281/zenodo.22728902`。
- Stokes v5 Lean companion v0.02：GitHub release `stokes-v5-companion-v0.02` 與 software DOI `10.5281/zenodo.22726977`。
- Stokes v5 Lean companion v0.03：GitHub release `stokes-v5-companion-v0.03` 已公開；Zenodo v0.03 DOI 尚未建立，因官方 record/UI/API 於 2026-09-13 連續回傳 504 或 timeout。
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
| 1 | Zenodo 發布 Stokes v5 Lean companion v0.03 | Zenodo record/UI/API 恢復可達 | GitHub release `stokes-v5-companion-v0.03` 的 ZIP、receipt、PDF；沿用 concept DOI `10.5281/zenodo.22726976` | 新 version DOI、同一 concept DOI、三個檔案與 SHA-256 公開 API 回讀一致 |
| 2 | 對 Papers I–III 規劃 arXiv 提交 | 作者確認分類、endorsement 與最後 metadata | `releases/current/submission-v0.09-zenodo/paper_*_v0_09_arxiv_source.zip`; `metadata/` | 每篇公開 arXiv 頁面、PDF、作者與 DOI relation 回讀一致 |
| 3 | 統一 GitHub/Zenodo/ResearchGate 的引用文字 | Stokes v5 companion v0.03 Zenodo DOI 已取得 | `CITATION.cff`; 各 release README | 各平台引用中不再混淆 article DOI、collection DOI、software DOI |
| 4 | 發布 v4 修正版 | v4 邊界 atlas 與 Theorem 5.3 修正通過 | v4 claim ledger 與 verifier | 新版本另立記錄；舊 v4 不覆寫，明列修正關係 |
| 5 | 發布 v12 模組成果 | 每一模組通過其自身的數學審核 | v12 module index | 只發布已閉合模組；不宣稱整篇已重證 |

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
