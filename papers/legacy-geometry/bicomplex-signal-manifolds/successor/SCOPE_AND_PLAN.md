# Bicomplex 後繼論文：範圍清單與公開計畫

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
