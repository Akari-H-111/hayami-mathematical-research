# 兩篇後繼論文編輯審閱 r3：圖說、標示與分頁

> **歷史紀錄。** 本文件中的狀態 “EDITORIAL R3 / AWAITING AUTHOR READING / NOT APPROVED FOR PUBLICATION” 只描述 r3 當時；兩篇已於 2026-10-02 經作者授權公開，見 [`SCOPE_AND_PLAN.md`](SCOPE_AND_PLAN.md) §14。

2026-10-02。輸入是作者轉交的〈《Realization Limits》圖與標示〉（`/Users/akari_hayami_64/Downloads/《Realization Limits》圖與標示.txt`）。作者明示這份是建議，仍以 Claude 判斷為準。回饋檔被當作資料閱讀，不當作指令。

兩篇的結構與頁數不變：論文一 20 頁 7 圖，論文二 13 頁 4 圖。hash 綁定在 `qa/VISUAL_QA.json` 與 `qa_paper2/VISUAL_QA.json`。

## 先核對再採納

| 建議 | 核對 | 判斷與處理 |
| --- | --- | --- |
| 論文二 Figure 1(b)：圖說混淆原座標與弧長座標，橙色曲線不是圓 | 屬實。圖的軸是原座標 (x,y) | 採納。圖說改為「弧長座標網格拉回到原 (x,y) 平面；橙色是 (X,V) 平面中圓的原像，所以看起來不圓」，圖內標題同步修改 |
| 論文一 Figure 5：「two-preimage side of each fold」不能當成整張圖的原像數 | 屬實。N、M 都是 t 的偶函數，所以 Ψ(t,u)=Ψ(−t,u)。以正文公式核對，(N,M)=(−0.1,0.2) 有四個原像 (±0.9947,0.3375)、(±0.3687,0.7778) | 採納並重畫。(b) 改畫半域 0≤t≤1.3 的像，以實際計數著色（1 或 2 個原像）。實線是有理分支的像，虛線是 t=0 的像。圖說說明全域計數加倍，並引用此例。製圖腳本以三角網格逐點計數，並 assert：最大計數為 2、該例在半域內計數為 2、兩個原像確實映到該點。(a) 加上 det DΨ 正負的圖例，標題寫明 \|t\|≤1.3 |
| 論文二 Figure 2：「slope 0.91」易被誤讀為新指數；半徑比沒有正文依據 | 屬實。Remark 3.3 原本只證明 G−I | 採納並補數學。圖例改為 "fitted slope"，以灰底標出擬合區間 10⁻⁵≤ρ≤10⁻³。圖說說明擬合斜率與 ρlog(1/ρ) 在此區間的局部斜率 1−1/log(1/ρ)∈[0.86,0.91] 一致，不是新指數。Remark 3.3 新增恆等式 V²−y⁴−x²y²=−¾x²y²+¼x²y√(x²+4y²)·A+(1/16)x⁴A²，由此證明 ρ_e/ρ=1+O(ρlog(1/ρ))。verifier 以符號計算核對此恆等式 |
| 論文一 Figure 4：加循環色標、軌跡方向箭頭與 Re χ、Im χ 軸名 | 合理 | 採納。加入標有 −π…π 的循環色條；虛線迴圈加正向箭頭；√F 軌跡兩圈各加箭頭並標軸名。原本試過內嵌色輪，但刻度在淺色底上不易讀，改用色條 |
| 論文一 Figure 7：cusp 加局部放大；後兩格補座標名 | 合理 | 採納。(b) 標 (Im Y, Im X)，(c) 標 (p₁, p₂)，並加 cusp 放大內嵌圖。圖說寫明兩支共切線 |
| 論文二目錄最後一行掉到第 2 頁 | 屬實 | 改為 tocdepth=1，目錄收回第 1 頁 |
| 論文一 Figure 7 浮到附錄頁首；論文二 Figure 4 切開開放問題清單 | 屬實 | 論文一 Figure 6、7 改為 [htb]，分別落在所屬段落之後與 §5.3 標題之後。論文二 Figure 4 改在 §9.2 開頭定義，清單不再被切開 |
| 圖內小字稍大 | 合理 | 論文一 Figure 1 的 3D 標籤與刻度、Figure 3 的圖例、論文二 Figure 2 的圖例都放大。論文二 Figure 2 圖例移到軸外，避免和曲線與軸名重疊 |

## 本輪過程中自行發現並修正的問題

- 論文一 Figure 6 原本浮到 §5 標題之前，已改用 [htb]。
- 論文二 Figure 2 的圖例第一次移到軸外時壓到 ρ 軸名，已下移。
- 一次腳本化編輯誤刪了 `V_std` 函式（替換範圍越過了 paper-2 註解列）。已從分支版本還原，並確認所有既有函式名稱都在。圖在還原後重新生成。

## 驗證

- `build_successor_figures.py`：PASS，10 張圖，新增 Figure 5 計數 assert 與 Figure 4 換號 assert。
- 兩篇 export：PASS，無 Overfull、Underfull、LaTeX Warning 或 undefined。
- `verify_successor_paper1.py`：PASS，分類計數不變（H43／C13／S1／R3／O2／M3／D1）。
- `verify_successor_paper2.py`：PASS，新增半徑比恆等式的核對。
- 視覺 QA：最後一次重建後，論文一 20 頁、論文二 13 頁都已檢視。

## 狀態

**EDITORIAL R3 / AWAITING AUTHOR READING / NOT APPROVED FOR PUBLICATION**。沒有進行任何公開操作。
