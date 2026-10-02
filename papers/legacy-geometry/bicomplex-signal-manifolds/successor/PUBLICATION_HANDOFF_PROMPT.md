# 交接 prompt：Bicomplex 兩篇後繼論文的公開發佈（2026-10-02）

> **已執行完畢（2026-10-02 至 2026-10-03）。歷史任務 prompt，不是待辦清單。** 本文中的 commit SHA、分支現況、授權敘述、「尚未保留 DOI」「待建立」等步驟都只描述 2026-10-02 當時。實際結果見 [`SCOPE_AND_PLAN.md`](SCOPE_AND_PLAN.md) §14–§15 與 `../../../../releases/candidates/bicomplex-successor-v1-publication.json`；兩者與本文不同時，以後者為準。實際執行時另有兩點與本文不同：commit 的 Co-Authored-By 依實際執行模型（Claude Sonnet 5.5）填寫；Zenodo 的軟體草稿與 DOI 保留改用官方 REST 介面完成（網頁按鈕在背景分頁不刷新）。

請在 `/Users/akari_hayami_64/Documents/hayami-mathematical-research` 接手，完成 Bicomplex 兩篇後繼論文的公開發佈。作者已**全權授權**，原話是「全權授權，全部按照Claude推薦的來」。下列方案已經定案，照做即可，不必重新討論。

## 0. 先做的事

- 先讀 `AGENTS.md`、`RESEARCH_BOARD.md`，以及 `papers/legacy-geometry/bicomplex-signal-manifolds/successor/` 下的 `SCOPE_AND_PLAN.md`（§4、§12、§13）、`EDITORIAL_R2.md`、`EDITORIAL_R3.md`。
- **權限。** 上一個窗口曾被自動權限分類器拒絕三類操作：Zenodo 建草稿、保留 DOI，以及 git 歷史操作（原因 "Create Public Surface"、"Git Destructive"）。開工前，請作者在互動 `claude` 終端用 `/permissions` 放行瀏覽器操作與 `git push`，或逐一核准權限提示。被拒時不要繞道。
- **需要作者當下確認的兩件事。** ResearchGate 的條款同意，必須取得作者當下的明確回覆（先例：「同意條款，繼續發布」）。Zenodo 按下 publish 之前，把最終 metadata 給作者看一次。

## 1. 目前狀態

**論文一**
- 檔案：`successor/Realization_Limits_Bicomplex_Signal_Surface.tex`／`.pdf`，20 頁、7 圖、2 表，editorial r3。
- 題名：*Realization Limits of the Bicomplex Signal Surface: Analytic Rigidity, Smooth Flexibility and Observation Monodromy*。

**論文二**
- 檔案：`successor/Pseudo_Laplacians_Whitney_Cross_Caps.tex`／`.pdf`，13 頁、4 圖、1 表，editorial r3。
- 題名：*Pseudo-Laplacians at Whitney Cross-Caps: Point Interactions on Surfaces Mapped into Three-Space*。

**圖與 QA**
- 圖由 `verification/build_successor_figures.py` 產生，hash 記錄在 `successor/figures/FIGURES_MANIFEST.json`。
- QA 在 `successor/qa/` 與 `successor/qa_paper2/`，兩個 VISUAL_QA.json 已與 r3 綁定。

**已保留的 Zenodo DOI**（都是私人草稿，只填了 title）
- 論文一 `10.5281/zenodo.23103026`，草稿 https://zenodo.org/uploads/23103026
- 論文二 `10.5281/zenodo.23103056`，草稿 https://zenodo.org/uploads/23103056
- 軟體 companion **尚未保留**，因為被權限阻擋。
- 請先打開兩份草稿，確認 title 確實填在 Title 欄位且內容正確。

**Git**
- 本機分支 `research/bicomplex-continuation-0.04`（2997135）含 r3 的完整歷史，**也含作者私下提供、從未公開的 v7 草稿 PDF**。
- 公開用分支 `publish/bicomplex-successor`（a1340a8）是同樣 8 個 commit 的重寫版。每個 commit 都已移除 `papers/legacy-geometry/source-registry/historical_drafts/Geometric_Realization_of_Bicomplex_Signal_Manifolds_v7.pdf`。它的 base 是 origin/main fb9e1c1，可以 fast-forward。
- **只推送 publish 分支，絕不推送 research 分支。** v7 的 hash 與 `claims/V7_DRAFT_INDEX.md` 可以公開，PDF 只留在本機。
- 本機 `main`（5803d6a）比 origin 超前 1 個 commit（其他窗口的 SAMT 紀錄），工作區另有其他窗口的未提交改動。**不要 commit、merge 或 push 本機 main。** 結束時提醒作者另行同步本機 main。
- commit 一律用 plumbing：暫存 GIT_INDEX_FILE、commit-tree、update-ref。不 checkout，不動 main 的工作區。commit 結尾加 `Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>`。

**解譯器**：`/Users/akari_hayami_64/TAGD_Master_Paper/.agent-venv/bin/python -B`（有 numpy、matplotlib、sympy）。不得使用 `-O`。

## 2. 步驟

1. **保留軟體 DOI。** 開新的 Zenodo upload，選 "No, I need one"，再按 "Get a DOI now!"。title 用 *Verification Companion for Realization Limits and Pseudo-Laplacians at Whitney Cross-Caps*，版本 1.0。

2. **定稿 TeX。** release PDF 會因此改變，重建後必須更新 QA 紀錄。
   - 兩篇的 `\date` 去掉 "Working draft"，改為 "October 2026" 加 "Version 1"。論文一保留 "corrected successor to *Geometric Realization of Bicomplex Signal Manifolds* (v11/v12)" 這句。
   - 論文一的 `\bibitem{companion}` 填入論文二的 DOI。論文二的 `\bibitem{paper1}` 填入論文一的 DOI，並把 "in preparation" 改成 "preprint, Zenodo, 2026"。
   - 兩篇的 evidence 附錄都加上軟體 companion 的 DOI。
   - 執行下列四個腳本，全部必須 PASS：
     - `verification/build_successor_paper1_pdf.py`
     - `verification/build_successor_paper2_pdf.py`
     - `verification/verify_successor_paper1.py`
     - `verification/verify_successor_paper2.py`
   - 用 `pdftoppm -r 80 -png` 把所有頁面重新渲染到 `qa/`、`qa_paper2/`，逐頁目視檢查。
   - 更新兩個 VISUAL_QA.json：source、pdf、pdftotext、各頁 PNG 的 hash，以及 status。

3. **組裝發佈檔**，放在 `releases/candidates/bicomplex-successor-v1/`。
   - 每篇論文：PDF，以及 source zip（tex 加 `figures/`）。
   - 軟體 source zip，內容包括：
     - `verification/` 中的 successor verifiers 與 `build_successor_figures.py`；
     - `FIGURES_MANIFEST.json`、`claims/CLAIM_MAP.json`／`.md`；
     - Lean companion `companions/lean/bicomplex-signal-manifolds/`（33 個 theorem，只是部分覆蓋）；
     - README 與 SHA256SUMS。
   - 解壓後重播所有 verifiers。

4. **GitHub。**
   - 用 plumbing 在 `publish/bicomplex-successor` 上 commit 定稿檔與發佈紀錄。
   - 確認 `origin/main` 仍是 fb9e1c1，再執行 `git push origin publish/bicomplex-successor:main`。
   - 建立 source-only release，tag 例如 `bicomplex-successor-v1.0`。只附軟體 source zip 與 SHA256SUMS，不附論文 PDF。這是 Ruled companion 0.03 的先例。

5. **Zenodo。** 以下 metadata 先給作者看一次，再 publish。
   - **共同設定**：作者 "Hayami, Akari (Jian-Yu Huang)"，語言 English。
   - **論文一**：Preprint，v1，CC-BY-4.0；檔案為 PDF 與 source zip。related identifiers：
     - isNewVersionOf `10.13140/RG.2.2.17048.15361`（publication-preprint）
     - references 論文二 DOI
     - isSupplementedBy 軟體 DOI
     - references `10.5281/zenodo.23073642`（Ruled）與 `10.5281/zenodo.22728902`（Stokes）
   - **論文二**：Preprint，v1，CC-BY-4.0。related identifiers：
     - references 論文一 DOI
     - isSupplementedBy 軟體 DOI
     - references Ruled DOI
   - **軟體**：Software，1.0。程式碼用 Apache-2.0，文字用 CC-BY-4.0，並在描述中說明哪些材料各適用哪個授權。related identifiers：
     - isSupplementTo 兩篇論文 DOI
     - isSupplementTo GitHub release URL
   - **描述**：語氣振奮但謙虛，不寫防禦性語句。寫明這是 ResearchGate 408878000（v11/v12）的修正後繼版，而舊紀錄保留不動。
   - **發佈後回讀**：官方 API `https://zenodo.org/api/records/<id>`、免登入下載的 SHA-256，以及 doi.org 解析。

6. **ResearchGate。**
   - 兩篇各建一個新的 Preprint 條目：上傳 PDF，填 Zenodo DOI，授權 CC BY 4.0，單一作者 Jian-Yu Huang／Akari Hayami。做法同 Ruled 新頁 415049397。條款需作者當下同意。
   - 舊頁 https://www.researchgate.net/publication/408878000：保留題名、日期、DOI、v11／v12 檔案與原描述，不刪除也不覆寫。只在描述**最前面**加一段 superseded-by 說明，指向兩個新條目與兩個 DOI，並簡列主要更正：
     - 解析 readout 不存在，C^∞ readout 存在；
     - i*Ψ^!Z≃Z[−1] 不成立；
     - 原 H₀ 的 (2,2) 宣稱不成立，修正後的算子見論文二；
     - √F 的換號不等於 fold 的換 sheet。
   - 用登入後的公開頁面回讀，並用官方下載核對 PDF 的 SHA-256。

7. **紀錄。**
   - 新增 `releases/candidates/bicomplex-successor-v1-publication.json`，格式比照 `ruled-surface-v5-editorial-r2-publication.json`。
   - 更新 `EXTERNAL_ACTIONS.md`、`RESEARCH_BOARD.md`、`SCOPE_AND_PLAN.md`（新增 §14）、Bicomplex 的 `README.md`，以及適用時的 `CITATION.cff`。
   - 所有失敗都如實記錄。

## 3. 不可違反

- 最終 PDF、封存檔、receipt 與 SHA-256 manifest 都不可修改。
- 不可宣稱整篇論文已 Lean 形式化；只能說列出的模組（33 個 theorem）通過。
- 新定理與歷史恢復分開記錄。
- v7 PDF 不公開。
- 不要把其他窗口的改動帶進 commit。
