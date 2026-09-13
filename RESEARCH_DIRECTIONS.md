# 已確認的研究衍生方向

更新日期：2026-09-13

本文件記錄已由現有成果與使用者決策確認的研究線。尚未證成的橋接只列為研究問題，不提前寫成一般定理。

## A. Inverse-Leibniz 系列

### A1. filtered-complex 到 character-torus Diophantine locus

此方向已確定另立研究線，不併入 Papers I–III 的現行主定理。

目標是：先選定一類具明確 marking、norm 與 filling/nonextension invariant 的 filtered complexes，再構造一個具體映射到指定 character torus，證明其在明示常數下雙 Lipschitz，最後識別像集與一個精確的 Diophantine locus。

研究閘門依序為：

1. 固定來源類別、等價關係、metric 與 filling/nonextension 資料。
2. 固定 character torus、距離、座標與 Diophantine locus。
3. 給出可計算的正向與反向映射。
4. 證 injectivity/surjectivity 或精確描述其像。
5. 證兩側 Lipschitz 常數，並用有限模型測試 sharpness。
6. 只有 1–5 完成後，才討論與 Papers I–III 的定理級整合。

在此之前，不得把「filtered complex → marked spectral data → Diophantine locus」三層寫成一條一般定理，也不得把重新命名的重疊現象當成橋接證明。

### A2. 固定 contraction 之外的穩定性

以 v0.05/v0.06 為有限模型，研究哪些高階消失、非消失與 feedback-rank 資料在何種比較態射、marking 或 contraction 類別下保持。優先尋找反例與最小必要假設，不先宣稱 unmarked invariance。

### A3. Paper III 的可算法化推廣

把 stable-core closure、local/global landing descent、future-output quotient 與 spectral-floor 計算整理成有限維演算法；先證終止性與輸出不依賴表示的條件，再考慮更一般的 filtered/graded 輸入。

## B. Legacy geometry 系列

### B1. Stokes v5 的完整 Whitney-fold 形式化

這是目前最高優先的內部數學線。先完成 explicit Fréchet derivative 與 Jacobian factorization，再證 ordinary branches 的 rank-one、kernel transversality、共同起點的 exceptional status，最後形式化 plane-to-plane fold criterion 或等價 local normal form。詳見 `LEAN_ROADMAP.md`。

### B2. Ruled surface v4 修正版

先為 `Q=0` 邊界建立合法 atlas 或把定理明確限制在 `Q>0` 內部；再把 Theorem 5.3 改成帶有 retracing/symmetry 與 phase-lock 條件的可證命題。修正稿完成前，不做整篇 Lean 搬運。

### B3. Bicomplex v12 模組化研究

依 `papers/legacy-geometry/bicomplex-signal-manifolds/claims/MODULE_INDEX.md` 分四層處理：

1. 有限多項式與局部奇點代數。
2. Mellin/Gram 與積分分部的精確 domain。
3. Green/Dirac/extension theory 的 operator-domain 審核。
4. Pin、sheaf、mixed-Hodge 與物理解讀的定義及外部定理核對。

每一層可獨立收尾；不得以第一層通過代替第三、四層。

## C. 收尾判準

一條研究線只有在下列條件同時滿足時才標成 `READY TO CLOSE`：

- 定理敘述、假設與負面範圍完整；
- 對應的 symbolic/CAS/Lean/有限模型入口實際通過；
- 正文、圖、驗證器與 release manifest 可相互定位；
- PDF 重新編譯後已重新綁定視覺 QA 與 SHA-256；
- 對外聲明精確區分 manuscript proof、CAS certificate、Lean theorem 與 invoked external theorem；
- 沒有仍會改變主結論的已知 blocker。

若剩餘問題已成為獨立研究問題，而現稿的聲明與證據已閉合，應讓現稿收尾並另立研究線，不無限延長同一篇論文。
