# Bicomplex 後繼論文：範圍清單與公開計畫

> **狀態（2026-10-03）：已公開。** §0–§13 是發佈前的範圍計畫與編輯紀錄，屬歷史快照；其中「請作者確認」「尚未公開」「等作者通讀」「下一步」等語只描述當時，已被取代。發佈紀錄見 §14，收尾與交接見 §15，目前的入口與開放問題見 [`../README.md`](../README.md) 的 “Start here”。

2026-10-02。作者已同意以下架構：寫兩篇新論文，並在舊 ResearchGate 頁面加上取代說明。本文件是論文一的範圍清單，**請作者確認後才開始整合正文**。它只規劃，不新增任何數學宣稱。

## 0. 公開紀錄現況（2026-10-02 唯讀回讀）

本節來自瀏覽器的唯讀回讀。瀏覽器當時以作者帳號登入，但沒有點擊任何編輯、上傳或隱藏功能。

- ResearchGate publication `408878000`：Preprint，2026 年 7 月，DOI `10.13140/RG.2.2.17048.15361`，CC BY 4.0。
- 公開檔案有兩個：`…v12.pdf`（預設顯示，PDF 內頁日期為 August 2026）與 `…v11.pdf`。本機只有 v12（hash-locked 權威）。**v11 的內容尚未在本機核對。**
- **公開描述（abstract 欄位）仍是 v7 時期的文字，與 v12 正文不同。** 其中仍然宣稱：
  - 由 momentum map 加功率約束「導出」曲面；
  - 「恰好兩個」immersion singularities；
  - condensed／compactological 實現；
  - 經由 Artusa 的 Weil-étale 與 Pontryagin duality 相連；
  - 「`i*Ψ^!Z ≅ Z[−1]`」fold smoothness failure；
  - Akari–Hilbert endomorphism of the constant condensed sheaf；
  - `C = √5 ln S`（標為 conjectural）。

  所以 continuation 0.04 對這些說法的判定，修正的是**目前公開顯示的內容**，引用公開描述即可，不需要公開未發表的 v7 草稿。

## 1. 論文一：舊頁面的修正後繼版

**定位：** 說清楚這個信號模型能實現什麼、不能實現什麼，並對 v12 與公開描述做逐項更正。

**語言：** 英文。**預估篇幅：** 正文約 18–22 頁，另加更正附錄。

### 題名候選（請作者選擇或修改）

| 候選 | 說明 |
| --- | --- |
| A（建議）*Realization Limits of the Bicomplex Signal Surface: Analytic Rigidity, Observation Monodromy and Corrections* | 保留「Bicomplex Signal」以便從舊頁找到；去掉已被否定的「Geometric Realization」；明示含更正 |
| B *The Bicomplex Signal Surface Revisited: What a Moment Map Can and Cannot Realize* | 敘事性較強，但「corrections」不在題名中 |
| C *Moment-Map Realizations of a Ruled Signal Surface, with Corrections to “Geometric Realization of Bicomplex Signal Manifolds”* | 不用「Bicomplex」當主名詞，直接引用舊題名 |

### 正文章節與來源

| 章 | 內容 | 來源（皆相對 Bicomplex 目錄） | 證據／原創性定位 |
| --- | --- | --- | --- |
| 1 | 引言：舊稿宣稱什麼、本文證明什麼；與 Ruled v5、Stokes v5、論文二的關係 | — | 說明性 |
| 2 | 模型、completed source、五個 rank 標籤；Ψ=(N,M) 只在 D∘ 有定義 | v13 `prop:atlas`；**引用** Ruled v5（DOI 10.5281/zenodo.23073642）的 atlas、five rank singularities、dipole 與 fold 定理 | 引用已發表成果，不重新算成新結果 |
| 3 | Realization 理論：quadrature realization、power-coordinate 端點障礙、three-Hermitian no-go；phase-invariant／mixed-state no-go；analytic rigidity；C^∞ realization；half-source（analytic 可、affine 不可）；edge criterion；bicomplex 多項式也被排除（BC≅C⊕C，乘法並非本質） | 0.02 `thm:realization`、`prop:powerboundary`、`prop:hermitian`；0.04 `prop:gauge`、`lem:analytic`、`thm:rigidity`、`cor:excluded`、`thm:smooth`、`prop:half`、`rem:data` | **本文主要新結果**；正文證明加 exact／finite replay |
| 4 | Observation monodromy：dipole indices（引用 Ruled v5）、square-root lifting 與兩次繞行恢復、√F cover 的 π_*Z 在 Z 上不可分解；sign system、normalization defect 與 fold involution 三者分立；exceptional pullback 定理（更正公開描述） | v13 `thm:dipole`、`sec:sheaf`；0.04 `prop:carrier`、`thm:shriek`、`cor:shift`、`prop:detect` | 新判定加標準 Verdier duality（KNP、Scholze 已核對） |
| 5 | Residual geometry：sublevel 3/4 與 capacity no-go；選定的 A3 completion、Milnor fiber、MHS；real link figure-eight；weighted orbit；actual principal-curvature cusp | v13 `sec:residual`、`sec:links`、`prop:cusp`；v12 5.3–5.13 | 多為標準理論套用到明示模型；cusp 是模型專屬的計算 |
| 6 | 仍成立的譜論部分（精簡）：Mellin 的 measure 與 domain、對所有 T>0 的 Gram independence 與 conditioning、Hardy evaluation、Bohr–Haar；log／linear window 判定 | v13 `sec:mellin`、`sec:gram`、`sec:hardy`；0.04 `prop:windows` | 標明為標準事實，不宣稱新 |
| 7 | Scope limits：ambient SU(2)、mass ratio 帶長度尺度、power coordinates Poisson commute、sign-circle η=0、Weil realization 範圍 | v13 `sec:limits`；v12 8.25–9.6 | 保留 v12 已有的正確限制，並註明非本文首創 |
| 附錄 A | v12 全部 66 個區塊與公開描述的逐項更正表（下節） | `claims/CLAIM_MAP.json`、`claims/V7_DRAFT_INDEX.md` | 每項附上證據類型 |
| 附錄 B | 驗證與形式化範圍：verifiers、33 個 own Lean theorems 的實際範圍 | Lean `COVERAGE.md` | 不稱全文 Lean 化 |

**不放進論文一的內容：** scalar Green／point-interaction 理論（放論文二）；Dirac／Pin（論文二的開放問題）；v7 草稿本身（不公開，只引用公開描述與 v12）。

## 2. 論文一附錄 A 的更正分類（依 v12 66 區塊）

分類依據 `claims/CLAIM_MAP.json` 的審計狀態加上 0.02–0.04 overlay，正文寫作時會逐條附證明位置。

| 類別 | v12 區塊 |
| --- | --- |
| 成立（保留，可能補 domain 或假設） | 3.2, 3.3, 4.2, 4.3, 5.1, 5.3–5.13, 7.2, 7.4, 7.5, 7.7, 7.8, 8.1–8.7, 8.10, 8.16, 8.18, 8.19, 8.25–8.30, 9.1–9.6 |
| 陳述需更正（可修正後保留） | 4.1（F 的 domain）、4.4（parity 解釋錯）、5.2（Jacobian sign 與 orientation）、6.1、6.2（三點→五個 rank 標籤）、7.1（measure 衝突）、7.3（σ>1/2 的陳述）、7.6（門檻只是充分條件；independence 對所有 T>0 成立）、8.8（漏掉的餘項）、8.9（角點）、8.11（漏端點）、8.17（範圍） |
| 依原定義被反證 | 8.13（H_min 的 (2,2)／U(2)）、8.14（舊 minimum 的 Markov 唯一性）、8.15（Krein kernel 實為無窮維，不是二維） |
| 未證，改列為開放問題 | 8.12（actual uniform front／seam 估計）、8.21（actual parametrix）；8.20、8.22–8.24 只保留條件或模型層級的結果 |
| 定義缺口，本文判定 | 3.1（analytic readout 不存在；C^∞ 構造存在且不 canonical） |

**公開描述的額外更正：**

| 描述中的宣稱 | 更正 |
| --- | --- |
| 由 momentum map 導出曲面 | analytic rigidity 定理 |
| 「恰好兩個」immersion singularities | 共五個 rank 標籤 |
| condensed／Weil-étale／Pontryagin 橋 | 無此橋，見 v12 7.7、8.5、8.7 的限制 |
| `i*Ψ^!Z≅Z[−1]` | 錯，見 0.04 `cor:shift` |
| Akari–Hilbert endomorphism | End(Z)=Z，見 0.04 `prop:carrier` |
| `C=√5 ln S` | 撤回，改為 3/4 resolution law 加 capacity no-go |
| 「T>2(M−1)/δ 時 independent」 | independence 對所有 T>0 成立，該門檻只控制 conditioning |

> 註：論文一正文承接 v12 的 3.1–8.9 與 8.25–9.6。8.10–8.24（Galerkin、capacity、Green／Markov／Krein，以及 Dirac／Pin 開放問題）的證明與替代理論由論文二處理；附錄 A 對這些區塊只列判定並預告論文二。

## 3. 論文二（概要，下一階段）

- **暫定題名：** *Point Interactions at Whitney Cross-Caps: Logarithmic Green Domains on the Orthogonal-Circle Ruled Surface*。
- **內容：**
  - capacity、compactness 與正的 Dirichlet gap（v13 `thm:capacity`、`thm:compact`）；
  - 舊 H₀ 的無窮 deficiency 反例（`thm:outer`）；
  - actual point traces 與修正後的 A（0.02）；
  - 對數 Green 係數、Markov 唯一性、reference-length 唯一性與 parity（0.03）；
  - Krein extension。
- **開放問題：** actual singular Dirac／Pin（v13 `sec:spin` 的條件結果、0.02 的曲率 Lᵖ）。
- **發表前必做：** 取得 Grieser 2002 全文；比對 point interactions 在 singular surfaces 與 cones 上的文獻，以及 degenerate Markov uniqueness 的文獻；據此定原創性措辭。

## 4. 公開流程（每篇各自執行）

1. 整合稿 → 重建 claim map 與 verifier → 編輯審閱（參照 Ruled 的 r1／r2）→ 逐頁 QA 與 hash 綁定 → 作者核准最終檔案。
2. Zenodo 新論文 DOI；GitHub source-only release，Lean 與 verifier 另給 software DOI；ResearchGate 開新條目；以上都要做公開回讀。
3. 舊頁 `408878000`：保留題名、日期、DOI、原描述與 v11／v12 檔案；在描述最前面加上取代說明，指向新稿，並簡列主要更正。不刪除，也不覆寫。
4. Git：論文一完成驗收後，從 `research/bicomplex-continuation-0.04` 分支延伸，再決定 push 的範圍。

## 5. 需要作者決定的事

1. 論文一題名：A、B、C 或自訂。
2. 第 5 章（residual geometry：A3、MHS、link、cusp）是否收入。建議收入：它們是 v12 公開過的正確結果，後繼版應該交代。
3. v11 檔案：要更正公開紀錄，最好核對 v11 實際含有哪些宣稱。請作者提供檔案，或同意從 ResearchGate 下載 `…v11.pdf`（唯讀下載，存入 `source-registry/historical_drafts/`，非權威）。


## 6. 作者決定（2026-10-02）與 v11 核對結果

作者全部同意建議：
- 論文一題名採 A：*Realization Limits of the Bicomplex Signal Surface: Analytic Rigidity, Observation Monodromy and Corrections*；
- 第 5 章 residual geometry 收入；
- 同意下載 v11。

v11 已依作者核准取回並登錄，見 `../claims/V11_COMPARISON.md`。同時確認公開 v12 與本機權威 byte-identical。

結論：v11 與 v12 在 3.1–8.20 逐塊相同，只有 4.2 例外。v11 把 √F 的符號翻轉等同於 Whitney fold 換 sheet，這需要更正，0.04 `prop:carrier`(3) 已給出依據。v11 對 Dirac 部分只寫成 remark，比 v12 謹慎。附錄 A 因此以 v12 的 66 區塊為主，另加「v11 4.2」與「公開描述」兩組更正。

## 7. 論文一工作稿完成（2026-10-02）

`Realization_Limits_Bicomplex_Signal_Surface.tex`／`.pdf`，15 頁，題名 A。三次匯出零 diagnostics，15 頁全部逐頁檢視；hash 綁定在 `qa/VISUAL_QA.json`。`../verification/verify_successor_paper1.py` 通過，檢查內容如下：
- v12、v11 的 hash；
- 66 個 v12 區塊在附錄 A.3 中各出現一次，且分類與審計一致；
- 所有交互引用與文獻引用都能解析；
- 串接重播 v13、0.02、0.04 的 exact verifier。

附錄 A.3 的分類以正文為準：H 43、C 13、S 1、R 3、O 2、M 3、D 1。第 2 節的初步分組有幾處移動：5.10 改為 C，8.10、8.16 改為 H，8.17 改為 C。

狀態：**工作稿，尚未做編輯審閱，未經作者核准公開**。下一步：
1. 編輯審閱 r1（讀者角度：語言、段落、證明可讀性、引用核對）；
2. 作者通讀；
3. 開始論文二的文獻比對與整合。

## 8. 編輯審閱 r1 完成（2026-10-02）

作者提供分析，並定下寫作方針（振奮人心但謙虛、不防禦），也明示最終判斷由 Claude 決定。r1 的變更：
- 依分析補強 Thm 3.8 decoder 表、Lemma 3.9 analytic retraction、Prop 4.3／4.6 的完整論證、Thm 5.1／5.2 的細節，以及 Prop 5.3(3) 的 jet 計算；
- 重寫 bicomplex 定位；
- 全文改為正面敘事語氣。

逐項判斷見 `EDITORIAL_R1.md`。17 頁，verifier、export 與逐頁 QA 皆 PASS。下一步：作者通讀，必要時做 r2，然後最終驗收。論文二的文獻比對可並行。

## 9. 論文二文獻比對第一輪（2026-10-02）

見 `PAPER2_LITERATURE.md`。主要結果：
- Grieser 全文確認 0.02 的座標法屬前人，0.03 的 arclength 細化不在其中；
- 定位為 Colin de Verdière pseudo-laplacian 的 cross-cap 推廣；
- 建議把論文二擴大成「具 Whitney cross-cap 的緊緻浸入曲面」的一般定理，以 S 為主例。這需要先證明一般情形的全域緊緻性。

仍待取得：Albeverio 等關於 2D point interaction 尺度與 Markov 性的經典文獻。

## 10. 論文二：一般定理第一版完成（2026-10-02）

作者同意把論文二擴大，並授權自由使用本機檔案、網路檢索與原創研究。新稿為 `Pseudo_Laplacians_Whitney_Cross_Caps.tex`／`.pdf`，9 頁，題名 *Pseudo-Laplacians at Whitney Cross-Caps: Point Interactions on Surfaces Mapped into Three-Space*。

- **一般定理。** 對象是緊緻曲面映到 ℝ³、除有限個 Whitney cross-cap 外為 immersion 的映射，分 Dirichlet（D）與 closed（N）兩種情形。結論：
  - compactness；
  - point traces；
  - (k,k)、U(k) 延拓族與 Krein resolvent formula；
  - Green 向量領頭項為通用的 −(1/2π)log d_g（亦可用外在半徑）；
  - 幾何邊界座標與 2π pairing；
  - Markov 唯一性、reference-length 唯一性、兩 sheet 係數相同；
  - 必須固定外邊界（反例）。

  由 Whitney 的定理，這涵蓋 generic map。
- **新證明的部分。**
  - 一般情形下的緊緻性：在 sector 上用 Hardy 估計，加上 Rellich；
  - Intrinsic distance 推論：d_g=ρ(1+O(ρ^{1/2}))，使正規化與 Colin de Verdière 的形式完全一致；
  - Steiner Roman surface：6 個 cross-cap 經精確驗證，Whitney determinant 為 ±2；
  - 由 symmetry 推得 Green 矩陣 B_η=rI+γ⊥P⊥+γ∘P∘，最多 3 個特徵值，重數 1、2、3。
- **ruled surface S 作為例子**，含邊界 sector germs；反射對稱給出 2×2 的 B_η。
- **驗證。** `verify_successor_paper2.py`、export 與 9 頁逐頁 QA 皆 PASS，記錄在 `qa_paper2/`。
- **論文一同步。** 對應的 companion 書目改為新題名；只有第 17 頁改變，已重新檢視。

**狀態：** 第一版，尚未做編輯審閱。下一步：論文二編輯審閱 r1；補 Albeverio 等經典文獻；考慮 Weyl law 等開放問題。

## 11. 論文二編輯審閱 r1 完成（2026-10-02）

r1 的變更：
- 補 Lemma 3.1 的 kernel 說明；
- 新增標準 cross-cap 的閉式 arclength 座標（已精確驗證）；
- 補 Dom A* 分解的論證；
- 新增 Corollary 5.3（|N_H−N_{H_F}|≤k）；
- 新增 Remark 6.2（總角 2π 的說明）；
- 調整引言語氣、壓縮附錄。

仍為 9 頁；verifier、export、逐頁 QA 皆 PASS。逐項記錄見 `EDITORIAL_P2_R1.md`。兩篇都已完成 r1，等作者通讀後再決定公開範圍。

## 12. 回饋落實與圖表：兩篇 r2（2026-10-02）

作者轉交〈《Realization Limits》回饋〉，並指示改進由 Claude 判斷、論文需要足夠的圖表，因此暫不進入發佈流程。r2 的結果：

- **論文一（20 頁，7 圖 2 表）。** 題名改為 *Realization Limits of the Bicomplex Signal Surface: Analytic Rigidity, Smooth Flexibility and Observation Monodromy*，"and Corrections" 移到引言。摘要與引言改為直接提問，主軸是解析剛性對光滑彈性。剛性機制圖（同一個態圓 C₀ 對兩條直線）放在 §3.2。原 §6 譜論與 §7 沿用範圍移為附錄 B、C，正文以 Organization 段給入口。精確性修正包括：D∘ 的連續性假設、"sharp distinction" 的措辭，以及更正表 8.10–8.17 改指論文二的具體編號或直接寫出恆等式。
- **論文二（13 頁，4 圖 1 表）。** 加入 "complete" 假設；generic 的說法改為 "when present, are isolated cross-caps"；引言凸顯弧長座標引理。Setting 說明算子作用在來源 Σ 上。Theorem 6.1 證明展開為四步，含環帶估計。Proposition 8.1 新增 H₀ 的 Krein／buckling 陳述與證明。新增通道比較表，以及標準 germ 的精化 G−I=O(ρ log(1/ρ))（Remark 3.3）；後者是製圖時發現的新結果。
- **圖。** 由 `verification/build_successor_figures.py` 產生，hash 記錄在 `figures/FIGURES_MANIFEST.json`，兩個 verifier 都會核對。
- **驗證。** verifier、export 與逐頁 QA 全部 PASS，分別記錄在 `qa/` 與 `qa_paper2/`。逐項判斷見 `EDITORIAL_R2.md`。

**狀態：** 兩篇 r2 等作者通讀，尚未公開。公開範圍與時程依 §4 與 §6 的既定方案：兩篇新稿、Zenodo DOI、GitHub 只放 source、新 RG 條目，加上舊頁的取代說明。每一步都要作者核准最終檔案後才執行。

## 13. 圖說、標示與分頁：兩篇 r3（2026-10-02）

作者轉交〈圖與標示〉建議，仍由 Claude 判斷。r3 經核對後採納全部建議，逐項記錄見 `EDITORIAL_R3.md`。

- 論文一 Figure 5 改以實際原像數著色。因為 Ψ 對 t 是偶函數，舊圖說的「兩個原像」只在單一 fold 鄰域成立。
- 論文二 Figure 1(b) 改正座標說明。
- 論文二 Figure 2 改標 fitted slope，並註明擬合區間。
- Remark 3.3 補上半徑比 ρ_e/ρ=1+O(ρ log(1/ρ)) 的證明。
- 色標、箭頭、軸名、cusp 放大圖、字級、目錄與浮動圖位置也都已修正。

頁數不變（20 頁、13 頁）。verifier、export 與 QA 全部 PASS。狀態：等作者通讀，未公開。

## 14. 公開發佈完成（2026-10-02）

作者「全權授權，全部按照 Claude 推薦的來」。兩篇後繼論文與軟體 companion 已公開；權威紀錄是 `releases/candidates/bicomplex-successor-v1-publication.json`，驗收日誌在 `releases/candidates/bicomplex-successor-v1-acceptance/`。

- **定稿。** 兩篇 `\date` 改為 "October 2026" 加 "Version 1"，論文一保留 "corrected successor" 一句。互相引用與軟體 companion 的 DOI 已填入，兩篇的 evidence 附錄都引用軟體 companion。PDF 重建後為 20 頁與 13 頁，三次匯出無 diagnostics，33 頁重新渲染並逐頁檢視，兩個 `VISUAL_QA.json` 的 source、pdf、pdftotext 與各頁 PNG hash 已更新。四個 verifier 全部 PASS。
- **發佈檔。** `releases/candidates/bicomplex-successor-v1/`：兩篇 PDF、兩個 article source zip、軟體 source zip 與 SHA256SUMS，由 `verification/build_successor_release.py` 決定性產生。軟體 zip 解壓後 SHA256SUMS 全部吻合，`verify.py` 重播兩個 successor verifier（連同被它們重播的早期 verifier）PASS，並從解壓目錄重建兩篇 PDF（`pdftotext -layout` 與發佈 PDF 相同）與十張圖（hash 與 manifest 相同）。v7 PDF 不在任何發佈檔或 push 的 commit 中。為此 `verify_continuation_0_04.py` 改為：v7 檔案存在才核對其 hash，否則印出「未發佈」並繼續；其餘檢查不變。
- **Lean。** 原位 fresh `verify_lean.py` PASS：33 個 own theorem，build、status、完整 axiom audit 與 proof-hole scan。這是對選定陳述的部分覆蓋，不是兩篇論文的形式化。Lean 專案依賴同倉庫的 `ruled-surface-v5` 與 `stokes-caustic-v5`，所以沒有只憑軟體 zip 重建。
- **GitHub。** 只推送 `publish/bicomplex-successor` 到 `origin/main`（fb9e1c1→aceb055，fast-forward）；research 分支未推送。tag／release `bicomplex-successor-v1.0` 為 source-only，附軟體 zip 與 SHA256SUMS，不附論文 PDF；免登入下載 SHA-256 與本機一致。
- **Zenodo。** 論文一 `10.5281/zenodo.23103026`（concept `…23103025`）、論文二 `10.5281/zenodo.23103056`（concept `…23103055`）、軟體 `10.5281/zenodo.23103299`（concept `…23103298`）。metadata 於 publish 前給作者確認。發佈後回讀官方 API、六個檔案的免登入下載 SHA-256（與本機一致）與 doi.org 解析（六個 DOI 皆 200）。
- **ResearchGate。** 新條目 `415154912`（論文一）與 `415164048`（論文二）：Preprint、CC BY 4.0、單一作者 Jian-Yu Huang（移除自動抽取的重複別名）、填 Zenodo DOI、僅公開 PDF。條款同意於當下取得作者確認。官方登入下載的 PDF SHA-256 與 Zenodo 一致。舊頁 `408878000`：只在描述最前面加 superseded-by 段落（兩個新 DOI、兩個新條目與四項主要更正），標題、日期、DOI、v11／v12 與原描述不變。

### 過程中的失敗與處理（如實記錄）

- 重建論文一時，新增的 DOI 行造成一個 Overfull hbox，export 依規則失敗；改用可斷行的 DOI 排版後三次匯出通過。
- Zenodo 新草稿的網頁按鈕在背景分頁中不刷新，resource type 與 DOI 按鈕沒有生效；改以已登入工作階段呼叫 Zenodo 官方 REST 介面建立草稿並保留軟體 DOI（結果等同按鈕）。上一窗口被拒的兩類操作（保留 DOI、git 歷史）此次在作者當下放行後執行。
- 第一次 publish 被 Zenodo 驗證擋下（缺 publisher 欄位），補上 `Zenodo` 並修正 rights 欄位格式後三筆發佈成功。
- 下載回讀時 Python `urllib` 遇到一次 IncompleteRead，改用 `curl` 重試後完成；並非檔案問題。

### 範圍與限制

- 同機同直譯器的回讀，不是獨立主機證據。
- RG 條目需登入才能回讀，不宣稱匿名存取。
- 本機 `main`（5803d6a）未合併也未推送，工作區有其他窗口的未提交改動；需作者另行同步本機 `main`（`git fetch` 後再處理與 origin/main 的分歧）。
- 倉庫層 `CITATION.cff` 的 preferred-citation 仍是 Stokes companion，這次不改。
- 未決與 open：actual singular Dirac／Pin、歷史 moment-map 導出（只有新構造，沒有追回）、原創性優先權（論文二為 Colin de Verdière pseudo-Laplacian 的 cross-cap 推廣，座標法屬 Grieser 既有方法）。

### 補充：ResearchGate 圖庫（2026-10-02，作者要求）

兩個新條目都已補上圖庫，做法同 Ruled `415049397`：論文一 `415154912` 共 7 張（RG 原本自動抽取了圖 6、7 但圖說有 PDF 抽取錯字，已改成乾淨文字；圖 1–5 為新上傳），論文二 `415164048` 共 4 張。圖為 `successor/figures/` 原圖以 300 dpi 轉成 PNG，圖說逐張輸入。新舊頁登入回讀：圖序、圖說與圖片網址 slug 一致。紀錄：`releases/candidates/bicomplex-successor-v1-figures-publication.json`。過程中論文一第一批上傳的圖 5 因沒有圖說而被丟棄，已補傳。

**未完成：** 舊頁 `408878000` 開頭說明的措辭潤飾與新條目描述的 Unicode 潤飾，被 ResearchGate 的「Edit limit reached」擋下，沒有繞過；待改文字見 `releases/candidates/bicomplex-successor-v1-researchgate-pending-edits.md`，現有說明內容正確、可以保留。

## 15. 收尾與交接（2026-10-03）

本節只整理文檔與 Git；沒有改變任何證明、PDF、圖、發布檔、QA 紀錄或封存檔案。目前的入口與開放問題在 [`../README.md`](../README.md) 的 “Start here”。

### 15.1 最終狀態（以實際 source、公開回讀與下載 hash 為準；2026-10-03 重測）

| 項目 | 狀態 | 證據 |
| --- | --- | --- |
| Zenodo 論文一 `10.5281/zenodo.23103026`（concept `…23103025`） | 已發布（`state=done`、`submitted=true`），v1，CC-BY-4.0 | 官方 API；PDF 與 source zip 的免登入下載 SHA-256 等於 `releases/candidates/bicomplex-successor-v1/SHA256SUMS.txt` |
| Zenodo 論文二 `10.5281/zenodo.23103056`（concept `…23103055`） | 同上 | 同上 |
| Zenodo 軟體 1.0 `10.5281/zenodo.23103299`（concept `…23103298`） | 已發布，Apache-2.0 加 CC-BY-4.0 | zip 與 SHA256SUMS 檔的下載 SHA-256 相符 |
| 六個 DOI | doi.org 皆回 200，導向對應 Zenodo 記錄 | 2026-10-03 |
| GitHub tag／release `bicomplex-successor-v1.0` | 已發布（非 draft、非 prerelease），目標 commit `aceb055`，source-only | 兩個 asset 的 digest 與免登入下載 SHA-256 等於本機 |
| ResearchGate 新條目 `415154912`、`415164048` | 公開；標題、October 2026、Zenodo DOI、CC BY 4.0、單一作者回讀（2026-10-03）；圖庫 7＋4（2026-10-02 回讀）；官方登入下載的 PDF SHA-256 與 Zenodo 一致（2026-10-02） | 登入後公開頁；`bicomplex-successor-v1-publication.json`、`…-figures-publication.json` |
| ResearchGate 舊頁 `408878000` | 標題、July 2026、DOI、v11、v12 與原描述保留；描述最前面是 superseded-by 段落（2026-10-03 回讀）。措辭潤飾**未完成** | 被 RG「Edit limit reached」擋下（2026-10-02、10-03）；文字在 `releases/candidates/bicomplex-successor-v1-researchgate-pending-edits.md` |
| 私人草稿、已保留未發布的 DOI | 沒有。Zenodo 帳號另有兩個更早的未發布草稿（22668482：Inverse-Leibniz 論文的草稿，2026-09-09；22664115：無標題，2026-09-08），與本工作無關，未動 | 帳號的 `is_published:false` 列表 |

操作失敗與處理：§14 已列 export 的 Overfull、Zenodo 網頁按鈕在背景分頁不刷新、首次 publish 缺 publisher、`urllib` 的 IncompleteRead；另有 RG 論文一圖 5 因無圖說被丟棄一次（已補傳）、RG 的 Edit limit（**未解決**），以及下文的一次檔案誤截斷。

本節新發現的失誤：收尾腳本先以寫入模式開檔、再讀同一個檔案，清空了工作區的 `papers/legacy-geometry/source-registry/SOURCE_REGISTRY.md`（其中有其他窗口尚未提交的 Ruled 段落）。以 publish 分支的版本加上先前 `git diff` 顯示的 32 行 hunk 還原。現在 `git diff -U0 publish/bicomplex-successor -- 該檔` 只剩原來的 `@@ -18,0 +19,32 @@` 一個 hunk；第一段與封存 Ruled v0.03 payload 內的副本逐位元組相同，後兩段由當時顯示的 diff 逐字還原，沒有第二份來源可比對。Ruled 窗口若有尚未提交的相關修改，請用 `git diff` 核對這個檔案。教訓已記入 `LESSONS.md`。

### 15.2 Git（收尾開始時的實況）

- `main` 在 `5803d6a`（本機獨有、與 Bicomplex 無關的 SAMT 記錄 commit）；`origin/main` 與 `publish/bicomplex-successor` 同在 `5959e1e`；tag `bicomplex-successor-v1.0` 指向 `aceb055`；本機獨有的 `research/bicomplex-continuation-0.04` 在 `2997135`，含私有 v7 PDF，絕不 push。
- `main` 與 `origin/main` 自 `fb9e1c1` 分岔（main 多 1 個、origin 多 11 個 commit）。`git merge-tree --write-tree main origin/main` 沒有衝突；阻礙在工作區，作法見 `../../../../EXTERNAL_ACTIONS.md` 的「本機 main 同步」。
- 工作區共有 93 個 `git status --short` 項目，其中約 47 個與 Bicomplex 無關（`git status --short | grep -vi bicomplex | wc -l`；含共用文件中其他系列的段落，以及 Ruled、資訊拓樸、SAMT、SA-MGHP 等）。本次沒有 stage、commit、移動或刪除其中任何一項；共用文件只在 Bicomplex 區塊定點修改。`AGENTS.md` 已被別的窗口改寫，沒有碰。
- 收尾 commit 用隔離流程（暫存 `GIT_INDEX_FILE`、`git commit-tree`、`git update-ref`）建在 `publish/bicomplex-successor` 上，範圍是 Bicomplex 檔案與共用文件的 Bicomplex 部分，並沿用作者已核准的範圍推送到 `origin/main`。沒有新的 tag 或 release。
- **v7 檢查（不只看工作樹）：** v7 PDF 的 git blob（`30dec24d…`）不在 `origin/main`、所有遠端 tag、`publish/bicomplex-successor` 的任何可達物件中；遠端只有 `main` 與五個 tag；三個發布 zip 的所有成員 SHA-256 皆不等於 v7 的 `6cefa525…`。只有本機分支 `research/bicomplex-continuation-0.04` 含有它。

### 15.3 本回檢查（2026-10-03）

- legacy baseline（`verification/legacy-reconstruction/verify_all.py`）PASS。
- 八個 Bicomplex verifier（revision、continuation、0.04、successor 1 與 2、local algebra、spectral algebra、crosscap models）在兩個 interpreter（`PY_LEGACY`、`PY_TAGD`）各自 PASS；`build_claim_map.py` 重建後 `CLAIM_MAP.json`／`.md` 的 SHA-256 不變。
- 文檔檢查：新增與修改的行裡的連結與路徑在工作樹與 publish 樹都能解析（例外只有 `V/` 縮寫、git 分支名與刻意不公開的 v7 路徑）；三個 DOI 與兩個 RG 條目的對應一致；Start here 中沒有把「未公開」「publication hold」當作現況的語句（只有一句明示引用舊 receipt 標籤）。
- 沒有重跑：Lean（最近一次是 2026-10-02 的 fresh 原位 PASS，不是本回）、PDF 重建與圖形重建（2026-10-02）、舊封存檢查點的 `verify.py`。這些檔案本回沒有變，因此沒有新的 PDF／QA／hash 綁定需要更新。

### 15.4 本回的文檔變更

Bicomplex 目錄：`README.md`（新增 “Start here”，舊內容標為歷史快照）、本檔（頂部狀態與本節）、`PUBLICATION_HANDOFF_PROMPT.md`、`../NEXT_THREAD_PROMPT.md`、`../HISTORICAL_CLAIMS_NEXT_THREAD_PROMPT.md`、`EDITORIAL_R2.md`、`EDITORIAL_R3.md`（歷史標示）、`claims/LEDGER.md`、`claims/MODULE_INDEX.md`、`proofs/ORIGINALITY_AND_GAPS.md`（狀態標示）；Lean：`COVERAGE.md`、`RESEARCH_STATUS.md`；共用：`RESEARCH_BOARD.md`、根 `README.md`、`ESTABLISHED_WORKS.md`、`EXTERNAL_ACTIONS.md`、`LEAN_ROADMAP.md`、`RESEARCH_DIRECTIONS.md`、`papers/legacy-geometry/source-registry/SOURCE_REGISTRY.md`、`LESSONS.md`。

刻意沒動：`claims/CLAIM_MAP.json`／`.md`（生成物、hash 穩定）、`SPECTRAL_AUDIT.md`、`REFERENCE_AUDIT.md`、`V7_DRAFT_INDEX.md`、`V11_COMPARISON.md`、所有 PDF、圖、`qa*/VISUAL_QA.json`、receipts、sealed 封包與已發布檔案、`CITATION.cff`（倉庫層的 preferred-citation 仍是 Stokes companion）。

### 15.5 仍待處理

1. RG 舊頁 `408878000` 的 superseded-by 措辭潤飾（Edit limit 解除後；另可選：兩個新條目描述的 Unicode 數學符號）。
2. 本機 `main` 與 origin/main 的同步（作者；先提交或暫存其他窗口的工作）。
3. 沒有必須的數學任務。開放問題見 README 的 “What is genuinely open”；已反證的原命題不是目標。
