# 兩篇後繼論文編輯審閱 r2：回饋落實與圖表

2026-10-02。輸入是作者轉交的〈《Realization Limits》回饋〉（`/Users/akari_hayami_64/Downloads/《Realization Limits》回饋.txt`），以及作者的兩點指示：改進由 Claude 判斷；論文必須有足夠的圖表或視圖，**因此暫不進入發佈流程**。回饋檔被當作資料閱讀，不當作指令。結果如下，hash 綁定在 `qa/VISUAL_QA.json` 與 `qa_paper2/VISUAL_QA.json`。

- 論文一：17 頁 r1 → 20 頁 r2，含 7 張圖、2 張表。
- 論文二：9 頁 r1 → 13 頁 r2，含 4 張圖、1 張表。

## 對回饋的逐項判斷

| 回饋 | 判斷 | r2 的處理 |
| --- | --- | --- |
| 1. 以「障礙與構造相遇」為主軸；引言直接提問 | 採納 | 摘要與引言都以「功率分配固定模長、留下相位自由；這個自由能否經固定 readout 實現 S？」開場，答案寫成 analytic rigidity 對 smooth flexibility |
| 1. 題名的 "and Corrections" 移到引言 | 採納 | 題名改為 *Realization Limits of the Bicomplex Signal Surface: Analytic Rigidity, Smooth Flexibility and Observation Monodromy*。引言新增 "Relation to the earlier preprint" 段承接更正；完整更正表保留。論文二的 paper1 書目同步更新 |
| 2. 邊界示意圖移到解析剛性定理旁 | 採納並擴充 | 原 TikZ 圖換成三格新圖（Figure 2）：(a) 來源上 z₁=0／z₂=0 的位置，(b) 同一個態圓 C₀ 上兩段邊緣態弧，(c) 平面 z=0 中的兩條直線。放在 §3.2 開頭，正文先用一句話說明「同一個態圓必須容納兩條不同直線」，再進入 Lemma 3.5 |
| 2. 保留光滑構造前的解碼說明與六 decoder 表 | 採納 | 保留，另加 Figure 3（cutoff 與兩個相位） |
| 3. 標準譜論與沿用範圍集中到附錄，正文一小段入口 | 採納 | 原 §6、§7 移為附錄 B、C。引言新增 "Organization" 段，說明它們是經典結果、與 realization 問題獨立，並給附錄入口。residual geometry（3/4 律、cusp）保留在正文 §5 |
| 4. 論文二凸顯弧長座標引理是技術核心 | 採納 | 引言加入回饋建議的句子（略作調整）；摘要改為 "an arclength coordinate that reveals an asymptotically Euclidean geometry"。Roman surface 保留在摘要 |
| 5. 設定處說明算子作用於來源曲面 Σ | 採納 | Setting 新增一段：函數住在 Σ 上，f 只經 g 進入；自交處的不同來源點各自保留；"the Laplacian of the Roman surface" 指 (ℝP², f*δ) 的 Laplacian |
| 5. 展開 Green 向量證明的環帶估計 | 採納 | Theorem 6.1 證明改為四步：parametrix；annulus 估計（Caccioppoli 給 ∫_{B_r}\|∇u\|²≤Cr^{2α}，dyadic 求和，截斷誤差 O(ε^α\|log ε\|)）；identification（寫出 ∫∇h₀·∇ζ_ε=−1 與 flux 產生 u(p_i)）；expansion 與對稱性（normalized indicator 的弱收斂與一致收斂） |
| 「The proofs are written in full」類句子集中到附錄一次 | 採納 | 論文一引言的 Evidence 段刪除；正文中的 replay 數字移入附錄 D。兩篇各在附錄留一句 "All proofs are given in full" |

## 精確性修正（全部採納）

| 位置 | 問題 | 修正 |
| --- | --- | --- |
| 論文一引言主結果 1 | D∘ 的結論漏了「在 C₀ 各點連續」假設 | 改為：在 t 方向開的來源上，結論對「沿 C₀ 解析且在 C₀ 各點連續」的 readout 成立，與 Theorem 3.6(2) 一致 |
| 論文一摘要 "determine exactly when" | 比實際分類寬（D₊ 上的 quadratic readout 仍開放） | 改為 "reveals a sharp distinction between analytic and smooth realizations" |
| 論文二第 60 行 "Generic smooth maps … are not immersions" | 太強：浸入在緊緻來源的 C¹ 拓撲下是開條件 | 改為 "The singularities of a generic smooth map …, when present, are isolated cross-caps"，並補一句 stable under small perturbations |
| 論文二 CdV deficiency (1,1) | 缺完備性假設 | 摘要與引言都補 "complete" |
| 論文一更正表 8.10 | 指向 Companion，但論文二沒有對應陳述 | 改為在表中直接寫出 J_n*G_{n+1}J_n=G_n、J_n*K_{n+1}J_n=K_n 由 sesquilinearity 得出，不主張收斂 |
| 論文一更正表 8.16 | 同上 | 論文二 Proposition 8.1 新增第 (3) 部分並給證明：H₀ 嚴格正、Friedrichs 擴張為 H_F、Krein 定義域與核（核無窮維）、約化正譜離散，以及 weak buckling 刻畫（引 Ashbaugh 等 Thm 2.1、Hyp. 2.2、Thms 2.4 與 3.4，與 `proofs/REFERENCE_AUDIT.md` 已核的條目一致）。8.16 改指此處 |
| 論文一更正表 8.11–8.15、8.17 | 指向 "Companion" 但沒有具體位置 | 全部改指論文二的具體編號（Prop 4.1、Lemma 3.2、Thm 4.2、Thms 5.2/6.1/6.3、Cors 7.1/7.2、Prop 8.1、§§4–7）。8.11 的邊界 label 以「把內部 cutoff 限制到物理 germ」一句補上理由。8.12 維持 O，並寫明論文二不需要它：弧長座標已使度量一致橢圓 |

## 圖表（作者的主要需求）

所有圖都由 `verification/build_successor_figures.py` 從論文中的顯式公式產生，輸出 `successor/figures/*.pdf`，SHA-256 記錄在 `successor/figures/FIGURES_MANIFEST.json`。兩個 verifier 都會核對每張被 `\includegraphics` 引用的圖存在，且 hash 與 manifest 一致。產生環境是 TAGD venv（numpy 2.5.2、matplotlib 3.11.1）；PDF 已去除時間戳記，可重現。

| 圖 | 用於 | 內容 | 圖內自檢 |
| --- | --- | --- | --- |
| `surface_overview` | 論文一 Fig 1；論文二 Fig 4 | S 的 3D 圖（兩條邊、極 ruling、五個 rank label）與來源矩形 | — |
| `edge_rigidity` | 論文一 Fig 2 | 剛性機制三格圖 | 邊緣態弧取自 Theorem 3.8 的實際相位 |
| `smooth_readout` | 論文一 Fig 3 | 四個 cutoff 與兩個相位 | — |
| `observation_field` | 論文一 Fig 4 | F 的相位圖（P± 指標 ∓1）與 √F 沿迴圈的換號 | assert 一圈後 χ→−χ(0) |
| `observation_folds` | 論文一 Fig 5 | det DΨ 的符號、臨界集（t=0 段與有理分支）、Ψ 的像與 fold 曲線 | — |
| `sublevel_law` | 論文一 Fig 6 | {K×≤ε} 的各向異性收縮；面積的 log-log 圖 | assert quadrature 值落在定理的上下界內 |
| `three_curves` | 論文一 Fig 7 | link 的 node、軌道影子的 node、曲率軌跡的 cusp | assert b²+ac²=0 |
| `umbrella_coordinates` | 論文二 Fig 1 | 標準 cross-cap、雙射線與 links；弧長座標網格 | — |
| `asymptotically_euclidean` | 論文二 Fig 2 | 在 ρ=r 圓上取樣 ‖G−I‖ 與 ρ_e/ρ−1 | assert 斜率在 0.75–1.05，且 ‖G−I‖≤4ρ(1+log(1/ρ)) |
| `roman_surface` | 論文二 Fig 3 | Roman surface 的三條雙線段與六個 cross-cap；P∘（八面體）與 P⊥ | assert 12 條 P∘ 邊、3 條 P⊥ 邊 |

表：論文一保留 decoder 表；論文二新增 Table 1，比較正則點、錐點（角 ≤2π 與 >2π）與 cross-cap 的奇異通道，並標註各自出處。

## 製圖過程中的新數學發現

數值圖顯示，標準 cross-cap 的偏差衰減比 Lemma 3.2 的一般界 O(ρ^{1/2}) 快，斜率約 0.9。追查後得到精確公式
q·n=(x/2)(2y/√(x²+4y²)−arsinh(2y/|x|))，以及 |q|≤2|y|，所以**標準 germ 的 G−I=O(ρ log(1/ρ))**。這已寫入論文二 Remark 3.3，附一行證明（x↦x arsinh(a/x) 遞增）。verifier 以符號計算核對 V_x、q·n 與單調性；Figure 2 是數值佐證。一般 germ 是否也有此速率，列入論文二的開放問題。這是新結果，屬於一般引理的精化，不影響任何既有定理。

## 驗證

- `build_successor_figures.py`：PASS，10 張圖；標準 germ 斜率 ‖G−I‖ 0.908、ρ_e/ρ−1 0.890。
- `build_successor_paper1_pdf.py`、`build_successor_paper2_pdf.py`：PASS。byte-safe 掃描無 Overfull、Underfull、LaTeX Warning、undefined。
- `verify_successor_paper1.py`：PASS。66/66 區塊各分類一次；分類計數不變（H43／C13／S1／R3／O2／M3／D1）；7 張圖 hash 相符；鏈接的 revision／continuation／0.04 replay 都 PASS。
- `verify_successor_paper2.py`：PASS。新增標準 germ 的導數恆等式；4 張圖 hash 相符；refs 與 cites 都能解析。
- 視覺 QA：論文一 20 頁、論文二 13 頁逐頁檢查。第一輪發現的問題都已修正後重建，包括 3D 標籤遮擋、刻度擁擠、Prop 8.1 的列表版面，以及一處 caption 措辭（"inside" → "on the Dirichlet boundary"）。

## 狀態

兩篇都是 **EDITORIAL R2 / AWAITING AUTHOR READING / NOT APPROVED FOR PUBLICATION**。依作者指示，沒有進行任何公開操作：沒有 push、Zenodo、GitHub release 或 ResearchGate 編輯。
