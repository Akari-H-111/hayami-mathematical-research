# 論文一編輯審閱 r1

2026-10-02。輸入有兩項：作者提供的〈分析：主結果〉，以及作者的寫作方針「振奮人心但又謙虛，而不是過度防禦性寫作」。作者明示最終判斷以 Claude 為準。結果：15 頁工作稿成為 17 頁 r1，hash 綁定在 `qa/VISUAL_QA.json`。

## 證明可讀性：對分析的逐項判斷

| 分析建議 | 判斷 | r1 的處理 |
| --- | --- | --- |
| Thm 3.6：補寫 \|z₁\|²=cos tₙ→0；其餘保持精短 | 採納；同意不擴寫 | 第 (2) 部分加這一句 |
| Thm 3.2：說明 ζ₊ 在 edge chart 中解析 | 採納 | t=ε·arccos C(r) 對 r 解析 |
| Prop 3.4：寫出 \|ρ₁₂\|²≤ρ₁₁ρ₂₂ | 採納 | 已寫入 |
| Thm 3.8：加 decoder-domain lemma 或表格；bump 的步驟寫完整 | 採納 | 新增 Table 1，列出六個 decoder 的使用範圍、光滑原因與取值；bump 改為 V⊂Ū⊂U 的寫法。另外修正 caption：arg 的 branch cut 由開集論證處理，不是靠 cutoff 消失 |
| Prop 3.9(2)：補 analytic tubular-neighbourhood lemma，並說明 corners | 採納 | 新增 Lemma 3.9（Analytic retraction），附證明並引用 Krantz–Parks 的解析反函數定理；明寫用來繞開 corners 的開解析曲面 M 由哪兩張 chart 構成 |
| Prop 4.3(2)：寫出 End ring 與 idempotent 對應 splitting | 採納 | End(π_*Z)≅End_{π₁}(Z[C₂])≅Z[C₂]，並直接解 idempotent 方程 |
| Prop 4.3(3)：把「induces」改為「不可等同」 | 採納 | 改為 "cannot be identified: the first fixes the fold arc, the second is free" |
| Prop 4.3(4)：在本文內重做 stalk 計算，不回指舊稿 | 採納 | proper base change、單／雙原像處的 stalk、sheet exchange 作用 −1、pinch stalk 為零，以及 Hom 的伴隨計算 |
| Thm 4.4(2)：寫出完整的推導鏈 | 採納 | 改為顯示式 Ψ^!Z≃Ψ^!D(Z[2])≃DΨ^*(Z[2])=…=ω[−2] |
| Prop 4.6：逐 stalk 計算 cokernel | 採納，並**另作判斷** | 不去辨認 comparison morphism 本身的具體形式，只算 kernel 與 cokernel 的 stalk。Off L 時映射為同構，on L 時是 0→Z。再用滿射 Z_L→i*𝒞 逐 stalk 為雙射，得 𝒞≃i_*Z_L。這樣 ±1 的符號問題自然消失，比分析建議的路線更直接 |
| Thm 5.1：補證「指數在 smooth change 下不變」 | 採納 | density 與 source Jacobian 都是 const+o(1)；target 方向用 V(ε/b)≤V′≤V(ε/a) 夾住 |
| Thm 5.2：寫出 μ=τ=3 | 採納 | 寫出 Milnor algebra C[X,Y]/(2X,4Y³) 與 Euler identity |
| Prop 5.3(3)：在正文展示實際 jet 計算，replay 只作驗證 | 採納 | 正文寫出 \|A\|²、⟨A,B⟩²、R、Gram–Schmidt 公式、恆等式 b²+ac²=0、pedal 公式與 cusp determinant |

## 「bicomplex」定位

同意分析的數學判斷。引言改寫為：保留這個名稱，是因為它是 [record] 中模型的名字。用 idempotent 分解寫出 BC≅C⊕C，以及三個 conjugation (ā,b̄)、(b,a)、(b̄,ā)。明寫一句 "statements about two-component complex state families; they do not require bicomplex multiplication as additional structure"。bicomplex 代數在本文中作為一類自然的 readout 出現，並整類被 Corollary 3.7 涵蓋。題名保留不改。

## 語氣改寫（依作者方針）

- **摘要與引言改以正面陳述開場。** 主軸改為「我們精確決定何時能 realize」，強調 dichotomy、障礙集中在單一幾何特徵，以及移除該特徵後即恢復解析性。
- **刪除重複的防禦句。** 例如：「assigns no physical clock」、「carries no content」、「has nothing to explain」、「we keep the name only for continuity」、「priority has not been systematically established」。每項範圍只在適當處正面陳述一次，例如 "The restoration is topological: it counts traversals"。
- **文獻定位改為正面表述。** "The tools used here are standard … The contribution is their application to this model, which yields the dichotomy and the carrier classification"。不再列出未確立事項。
- **開放問題寫成邀請。** 例如："an interesting open question"、"a natural object to construct"、"a natural starting point for quantization"。
- **附錄改以 "Review of the earlier record" 為標題。** 類別名稱改為中性用語（holds after correction、does not hold as defined、missing definition, settled here）。

## 未採取的作法

- 沒有擴寫 Theorem 3.6；分析也認為其長度正好。
- 沒有為了顯得完整而在正文重述 Ruled、Stokes 已發表的證明，維持引用加 sketch。

## 下一步

作者通讀 r1。必要時再做 r2，然後做公開前的最終驗收。論文二的文獻比對可與作者通讀並行。
