# 已確立的論文與研究記錄

更新日期：2026-10-03

本表只記錄已存在於專案、可由正文或驗證材料定位的成果。「已確立」不等於「全文已由 Lean 證明」；正式狀態以各列的範圍說明為準。

## Inverse-Leibniz 系列

| 論文 | 目前狀態 | 已確立範圍 | 正文與驗證 | 對外識別碼 |
| --- | --- | --- | --- | --- |
| Paper I — *The Inverse Leibniz Problem: Reconstruction Fibers, Rigidity, Obstructions, and Deformation DGLAs* | `SEALED`、Zenodo preprint 已公開 | v0.09 保留 v0.08 的數學正文，加入 14 幅已檢查的向量圖；固定 contraction、有限階證書與「新構造不等於歷史復原」的界線不可省略 | `releases/current/paper-01-illustrated-v0.09/`; `research/independent_transfer_v0_05/`; `research/feedback_matrices_v0_06/` | DOI `10.5281/zenodo.22668484` |
| Paper II — *Resonance-Marked Naturality and Homotopy-Tilt Non-Invariance in the Inverse-Leibniz Cubic Case* | `SEALED`、Zenodo preprint 已公開 | 七維 recurrent envelope、完整 tilt orbit、marked response line 與 strict resonance-faithful naturality；不可改寫成 bare quasi-isomorphism 不變量 | `releases/current/paper-02-illustrated-v0.09/`; `EVIDENCE_MAP.md` 與 `qa/EVIDENCE_REPLAY.json` 位於該目錄 | DOI `10.5281/zenodo.22668533` |
| Paper III — *General Spectral Floors from Marked Deformation Presentations* | `SEALED`、Zenodo preprint 已公開 | marked presentation、stable core、landing/future-output quotient 與有限 spectral-floor 構造；輸入 marking 與映射是給定資料，不是 bare filtration 的自然產物 | `releases/current/paper-03-illustrated-v0.09/`; `EVIDENCE_MAP.md` 與 `qa/EVIDENCE_REPLAY.json` 位於該目錄 | DOI `10.5281/zenodo.22668633` |

三篇共同的重現材料已由 Zenodo collection DOI `10.5281/zenodo.22663942` 發布。`releases/current/submission-v0.09-zenodo/` 是目前的 DOI 綁定封包；個別 preprint DOI 與 collection DOI 不可混用。

## Legacy geometry 系列

| 論文 | 目前狀態 | 已確立範圍 | 權威來源與驗證 | 發布界線 |
| --- | --- | --- | --- | --- |
| *The Orthogonal Circle Ruled Surface*, v4 | `PDF-LOCKED`、部分 `CAS-PASSED`、需修正文 | 內部圖上的參數化、非可展性、觀察場與 fold 代數已部分重證；原文的全域邊界圖與 Theorem 5.3 不可直接保留為正確定理 | `papers/legacy-geometry/source-registry/final_pdfs/The_Orthogonal_Circle_Ruled_Surface_v4.pdf`; `papers/legacy-geometry/orthogonal-circle-ruled-surface/claims/LEDGER.md` | 修正版定理與邊界 atlas 完成前，不作「全文驗證完成」發布 |
| *Observation Discriminant and Spherical Fold Image of the Orthogonal-Circle Ruled Surface*（Stokes caustic v5） | `PUBLISHED`；Lean companion v0.04 兩平台已公開／下載驗證 | `FULL_PAPER_COVERAGE.md` 所列已宣稱數學結果以 258 公開 Lean 定理涵蓋：actual ordinary `(x,y^2)` charts、physical locus/discriminant/radial、展開／Big-O、exceptional no-fold 與 ordinary four-jet、輔助 quintic／maximum、固定 Sturm 表與有理數值界；全文 germ classification／versal unfolding 仍為原文開放問題，不由 four-jet 關閉 | `papers/legacy-geometry/source-registry/final_pdfs/The_Stokes_Caustic_of_the_Orthogonal_Circle_Ruled_Surface_v5.pdf`; `companions/lean/stokes-caustic-v5/FULL_PAPER_COVERAGE.md`; Zenodo record `23057630` | 論文 DOI `10.5281/zenodo.22728902`；v0.04 software DOI `10.5281/zenodo.23057630`（`doi.org` 解析待回讀）；歷史 v0.03 `10.5281/zenodo.22735974` 保持 criterion-level；software concept `10.5281/zenodo.22726976`，不可互換 |
| *Geometric Realization of Bicomplex Signal Manifolds*, v12 → 兩篇後繼論文 v1（Bicomplex） | v12 `PDF-LOCKED`；後繼論文 v1 與 software 1.0 `PUBLISHED`（2026-10-02，2026-10-03 重測）；v13／0.02／0.03 為 sealed 本地檢查點（歷史） | 論文一：解析剛性 vs 光滑彈性、observation monodromy 的載體與 exceptional pullback、residual geometry，並逐項更正 v12 全部 66 區塊、v11 4.2 與公開描述；論文二：Whitney cross-cap 上 pseudo-Laplacian 的一般定理（point traces、(k,k)／U(k) 擴張、Green 係數、Markov／reference-length 唯一性）。Lean 為 33 個 theorem 的部分覆蓋 | `papers/legacy-geometry/bicomplex-signal-manifolds/README.md`（“Start here”）; `…/successor/*.tex`; `companions/lean/bicomplex-signal-manifolds/COVERAGE.md`; `releases/candidates/bicomplex-successor-v1-publication.json` | 論文 DOI `10.5281/zenodo.23103026`／`10.5281/zenodo.23103056`；software DOI `10.5281/zenodo.23103299`；RG `415154912`／`415164048`；歷史 RG `408878000` 保留。Written／external／exact／Lean 分開，不稱整篇 Lean 化；歷史 moment-map 導出未追回；actual singular Dirac／Pin 仍 open |

三份 final PDF 的頁數、SHA-256 與來源權限表在 `papers/legacy-geometry/source-registry/SOURCE_REGISTRY.md`。只有 v5 找到內容高度對齊的 TeX source candidate；v4 與 v12 的 TeX 仍是 ancestor，不是遺失 final source。

2026-10-03 跨窗口承接：Bicomplex 後繼論文與 software 1.0 已公開，沒有必須的下一個任務；開放的數學問題與已反證、不是待證目標的原命題見 Bicomplex README 的 “Start here”。不能將部分 Lean 或外部 PDE／operator 證明稱為全文形式化。

## 已封存的研究記錄

| 記錄 | 已確認結果 | 證據路徑 |
| --- | --- | --- |
| Independent intrinsic-transfer reconstruction v0.05 | 新的 degree-two splitting 與固定 projection 通過 exact-rational replay；arity 4–22 在該選定 completion 下消失，frozen arity 23 非零。這是新構造，不是缺失歷史 contraction 的復原 | `research/independent_transfer_v0_05/RESEARCH_LOG.md`; `complete_splitting.json`; `FROZEN_PROJECTION_LOG.txt` |
| Feedback matrices v0.06 | 可重現的新 feedback 系統通過 entries、RHS、solution、inverse 與 determinant 的精確檢查；歷史 `34 x 560` 系統的原始 entries/projection 仍未取得 | `research/feedback_matrices_v0_06/RESEARCH_LOG.md`; `U16_COMPATIBLE_PROBE_LOG.txt` |
| Legacy clean-room reconstruction | 三份 PDF 已 hash-bound；claim ledgers、source classification、CAS baseline 與視覺 QA 已建立 | `verification/legacy-reconstruction/README.md`; `RECONSTRUCTION_LOG.md`; `VISUAL_QA.md` |

## 狀態詞彙

- `PUBLISHED`：公開記錄已由平台 API 或公開頁面確認。
- `SEALED`：本地發布封包、雜湊、重播與視覺 QA 已封存。
- `LEAN-PASSED`：指定 Lean theorem/module 無 `sorry` 編譯通過；不自動涵蓋全文。
- `CAS-PASSED`：指定精確計算入口通過；不自動涵蓋外部定理或分析假設。
- `PDF-LOCKED`：忠實記錄 final PDF 的說法，不代表其數學真實性已重證。
- `ACTIVE`／`PLANNED`／`BLOCKED`／`ARCHIVED`：分別表示進行中、已排程、受明確條件阻擋、保留而不再改動。
