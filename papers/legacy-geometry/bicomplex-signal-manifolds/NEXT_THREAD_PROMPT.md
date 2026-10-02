# Bicomplex：下一 thread 執行 prompt

> **歷史指令（2026-10-01），已執行完畢。** 它指導了 v13 working、continuation 0.02–0.04 與兩篇後繼論文的整條工作，結果已公開；其中的「下一步」「publication hold」不再適用。目前入口：[`README.md`](README.md) “Start here”。

整理日期：2026-10-01（Asia/Taipei）。這是下一 thread 的任務指令；交接整理當輪未開始新證明、Lean 或修稿。

---

請在既有本地專案
`/Users/akari_hayami_64/Documents/hayami-mathematical-research`
開始下一主線 **Bicomplex 的驗證、必要修正、Lean 形式化與論文優化**。
不要只提出計畫，請實際推進正文證明、精確計算與可重播驗證；以逐項核對全文已宣稱數學結果為目標，不停在有限代數模組。

先閱讀工作目錄的實際內容：

@/Users/akari_hayami_64/Documents/hayami-mathematical-research/AGENTS.md
@/Users/akari_hayami_64/Documents/hayami-mathematical-research/RESEARCH_BOARD.md
@/Users/akari_hayami_64/Documents/hayami-mathematical-research/LEAN_ROADMAP.md
@/Users/akari_hayami_64/Documents/hayami-mathematical-research/papers/legacy-geometry/source-registry/SOURCE_REGISTRY.md
@/Users/akari_hayami_64/Documents/hayami-mathematical-research/papers/legacy-geometry/bicomplex-signal-manifolds/README.md
@/Users/akari_hayami_64/Documents/hayami-mathematical-research/papers/legacy-geometry/bicomplex-signal-manifolds/claims/MODULE_INDEX.md
@/Users/akari_hayami_64/Documents/hayami-mathematical-research/papers/legacy-geometry/bicomplex-signal-manifolds/claims/LEDGER.md
@/Users/akari_hayami_64/Documents/hayami-mathematical-research/papers/legacy-geometry/bicomplex-signal-manifolds/proofs/SPECTRAL_AUDIT.md
@/Users/akari_hayami_64/Documents/hayami-mathematical-research/papers/legacy-geometry/source-registry/final_pdfs/Geometric_Realization_of_Bicomplex_Signal_Manifolds_v12.pdf

需要重用前序成果時，按需閱讀：

@/Users/akari_hayami_64/Documents/hayami-mathematical-research/companions/lean/ruled-surface-v5/COVERAGE.md
@/Users/akari_hayami_64/Documents/hayami-mathematical-research/companions/lean/stokes-caustic-v5/FULL_PAPER_COVERAGE.md

承接背景與來源權威：

- Ruled v5／companion 0.03 已完成已宣稱結果的逐項正文／Lean coverage、驗收與 GitHub／Zenodo／ResearchGate 正式發布，224 own 定理與 258 依賴另行 audit。論文 DOI `10.5281/zenodo.23073642`、software version DOI `10.5281/zenodo.23073654`、software concept DOI `10.5281/zenodo.23073653` 分立；四張 ResearchGate 圖庫另有完成紀錄。獨立 open germ／image／observation 研究不阻擋 Bicomplex。
- Stokes v5／companion 0.04 已宣稱結果與發布主線完成；DOI 解析尾項及 open germ／unfolding 分開，不重開封存版本。Papers I–III 暫無新修訂；資訊拓樸一般 filtered-complex／Diophantine bridge 獨立。其他窗口的 SAMT／SA-MGHP 工作保留。
- **Bicomplex 的歷史權威是 43 頁 final v12 PDF**，SHA-256 `4ebb8f0a7d6e88a6c5cd97f65d224b4e938867cabad54f057d3ceafb24167d5a`。`source_ancestor/signal_manifolds_v2.tex` 為 1908 行祖本，配原兩圖重建為 26 頁；不是遺失 final source，後期內容須從 final PDF 核對。
- 2026-10-01 已有 legacy baseline PASS，含三個 Bicomplex 精確代數 verifier；§7 有部分正文重推。這不是全文證明、Bicomplex Lean coverage 或新 PDF 驗收。啟動時仍需自行核對，不只相信交接完成標記。

工作順序與完成判準：

1. **核對本地狀態與重播。** 先 `git status --short`，保留所有無關未提交／未追蹤改動；核對來源 hash 後，從專案根目錄執行：

   ```bash
   local/cache/python/legacy-reconstruction-venv/bin/python -B \
     verification/legacy-reconstruction/verify_all.py
   ```

   禁止 Python `-O`。成功重現 Ruled v4 Theorem 5.3 反例與 Q=0 scope warning，不代表原定理通過；不要把歷史警告直接搬成新 Bicomplex 結論。

2. **建立全文逐項 claim map。** 對照 final PDF 與 module index／ledger，補齊原命題、頁碼、定義域、問題／反例、修正命題、正文證明、精確計算、Lean theorem、外部定理及未完成義務。先解決 §7 的頁碼差異：ledger pp.14–16，spectral audit pp.13–15；核對 PDF 物理頁與印刷頁，記錄所用慣例。核對後期 §§8–9，不以 ancestor 缺段為已恢復。

3. **優先關閉 §§3–6 的真正幾何／拓樸義務。** 核對 Q=0 邊界 atlas、half-cross-cap／cross-cap／cusp、observation dipole／small-circle degree、square-root monodromy／lifting、sublevel asymptotics、figure-eight 與明示 complexified `A3` 模型。Ruled 的 atlas／rank 分類與 Stokes 的 fold charts 只有在 map、domain、smoothness、orientation 及其餘假設匹配後才可引用；二階 jet、有限多項式或參數圖不能代替實際 germ 等價與全域拓樸證明。分清實幾何與 holomorphic completion；Milnor 等外部定理逐項核對假設。優先保留全域內容；必要限域時證明原因並列出失去的結論。

4. **補 §7 的分析證明。** 明示 Hilbert space、measure、inner-product convention、dense core、閉包／adjoint domains 與 boundary terms。證實際 integration by parts、formal adjoint 與 finite-time Gram 的積分、operator-norm／positivity／conditioning／logdet bounds，保留 `T>0`、有限 distinct frequencies、`delta>0` 等條件。不得把 `C_c^infinity((1,infinity))` 上的 formal symmetry 當作 half-line self-adjointness；generalized eigenfunctions 不自動屬於 L2。需要 deficiency-index 結果時另證或只引用適用的外部定理。

5. **推進 §§8–9，不能永久停放為 specialist audit。** 為 Mellin／Hardy／Bohr–Haar、capacity／coercivity、Green parametrix／boundary channels／Krein extensions／buckling、Dirac／spin／Pin、defect sheaf／recollement、mixed-Hodge／Deligne–Weil 逐項建立實際對象、算子與定義域、映射／範疇、邊界條件及外部定理假設。分清必要條件、充分條件、反例、無法橋接與模型內的條件式結果。Poisson／eta／有限 symplectic-plane 計算不取代無窮維分析；物理解讀維持 observation，除非獨立建立模型與證明。

6. **難題先查材料。** 先查內部證明與原始文獻；需要外部核對時查 primary sources。記錄失敗、反例與適用假設，不默默弱化目標，不把候選假設直接當成充分條件，不靠未證橋接。若真有阻擋，列具體證據、仍能推進的部分及所需決策。

7. **逐項 Lean coverage。** 沿用適合的既有 Lean／Mathlib 工具鏈與定理，為 Bicomplex 建立自己的 proof sources 與 coverage；形式化實際數學命題及邊界假設，不只驗證代數代理。禁止 `sorry`、`admit` 或自訂公理補洞。完成 build、完整 axiom audit、proof-hole scan 與獨立精確計算；依賴定理另 audit。未覆蓋部分列明；不得以少數 modules 或 theorem count 宣稱全文 Lean 化。

8. **另製修稿與 companion，再做讀者導向檢閱。** 不覆寫歷史 PDF、祖本、舊封包／receipt／manifest。重用 README 已定義的目錄分工；新稿放該工作流的 `revision/`，Lean 放 `companions/lean/bicomplex-signal-manifolds/`，需要首個實際產出時才建立。以人類自然語言、段落銜接、圖表引導與學生般流暢敘述改善閱讀，避免反覆防禦式驗收話語，同時保留必要假設與負面結果。檢查引用和最古老材料中可用的圖，數學圖由明確公式／資料生成，保留來源與重播指令；圖像與數值抽樣不是證明。

9. **新稿驗收與發布準備。** 使用原生 LaTeX 編輯器建立／持續編輯新稿，保留 source 與 compilation diagnostics；內建編譯器 檢查成功後，逐頁視覺 QA、SHA-256 綁定、原位與 ZIP 解壓重播。對每個 PDF／封包記錄具體版本與已驗證範圍；不改寫舊 sealed artifacts，不冒稱同機重播是獨立主機。驗證完成才提出版本、metadata、引用文字及具體公開範圍。**此 prompt 授權本地研究、修稿、驗證與發布準備；正式 GitHub／Zenodo／ResearchGate 操作前另取得作者確認。** 發布後另回讀公開頁／API、核對下載 SHA-256，區分 paper DOI、software version DOI 與 concept DOI。

每個完成里程碑同步更新 `RESEARCH_BOARD.md`、該工作流 README、claim ledger／module index／coverage 與必要的狀態文件；數學證明、Lean、精確計算、數值抽樣、外部定理、歷史恢復及開放問題分欄記錄。其他工作流與封存成果保持其原有範圍。
