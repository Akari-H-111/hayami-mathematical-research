# 論文二：文獻比對（第一輪）

2026-10-02。目的是在整合論文二（Whitney cross-cap 上的 scalar Green／point-interaction 理論）之前，先比對最接近的前人結果，據此決定原創性措辭與論文定位。所有 PDF 都只存放在本 session 的 scratch，不放進 repository；hash 記錄於下表。

## 已取得並閱讀的一手文獻

| 文獻 | 取得方式與 SHA-256 | 閱讀範圍 |
| --- | --- | --- |
| D. Grieser, *Quasiisometry of singular metrics*, Houston J. Math. 28 (2002) 741–752 | 作者在 Oldenburg 大學頁面公開的 PDF（掃描檔，12 頁），`4a03d4b302c8050a1bb603cb53401047162cd211a3e4e137eca58baecd8bf45e` | **全文 12 頁逐頁讀完**（影像）。先前三次取得失敗的限制就此解除 |
| Y. Colin de Verdière, *Pseudo-laplaciens. I*, Ann. Inst. Fourier 32 (1982) 275–286 | Numdam 開放 PDF（13 頁），`fecfe207273d52d82cb7a1c67df4deede52ef2cfb5ec8e3c766325f9ea1e30f5` | 引言、§1 Theorem 1、Lemma 1、Lemma 2 與其證明、Remarques |
| L. Hillairet, A. Kokotov, *Krein formula and S-matrix for Euclidean surfaces with conical singularities*, arXiv:1011.5034v2 | arXiv PDF（25 頁），`0f023ebfc6e05cdf27a93b5e9ad9cb92e5e95e139ad94e0336f99cd736c0cc49` | 摘要、引言、§2、§3 開頭的 dom(Δ*) 展開式 (3.1)–(3.4)、§3.4 resolvent kernel |
| A. Kokotov, K. Lagota, *Green function and self-adjoint Laplacians on polyhedral surfaces*, Canad. J. Math. 72 (2020)；arXiv:1902.03232 | arXiv PDF（27 頁），`4cd8b1452a81567f4e8fe42f8ab3d46ad4271dff728492621b1703d09c178cf8` | **只讀到摘要層級**：用 Roelcke 公式構造 ker Δ* 的 basis，並計算 S(0)。未逐節核對 |

## 前人已做了什麼

1. **Grieser 2002 §1。** 證明 Whitney umbrella 的度量 g_W 經奇異座標變換 x=u√(u²+v²), y=v 後，與 Euclidean 度量 weakly quasi-isometric，用的是 Lemma 1.1 的對角化判準。這就是 continuation 0.02 的 Lemma "Uniform metric comparison"（Ψ(x,y)=(x,yR)，只是變數名對調）。0.02 本來就已註明此法屬 Grieser，現在得到全文確認。§2 給出一般的 weak quasi-isometry 判準，§2.2 有沿 level curve 的 arclength 重參數化，Thm 2.5 與 Cor 2.7 處理 horn。**全文只有 quasi-isometry（有界畸變），沒有漸近等距估計，也沒有任何 Laplacian 或 PDE 分析。**
2. **Colin de Verdière 1982，Theorem 1。** 在完備光滑 Riemann 曲面（d=2,3）上，Δ 限制在 C_c^∞(X∖{x₀}) 的 deficiency 為 1，延拓由 α∈ℝ/πℤ 參數化，條件為 f=λ(sin α·log r/2π+cos α)+o(1)。Lemma 1 說 D(A*) 的元素為 c₁G(r)+c₂+o(1)。Lemma 2 給出 resolvent kernel 的展開 R(λ;x,x₀)=G(r)+F(λ,x₀)+o(1)，其中 F 對 λ 亞純、在極點之間嚴格遞減。證明用的是光滑度量下的極座標與 Sobolev 嵌入。
3. **Hillairet–Kokotov。** 在 flat conical surface 上，角為 θ_p 的錐點處，dom(Δ*) 的元素展開為 a₀⁺+a₀⁻ln r，加上 r^{±|ν|}e^{iνθ} 項，其中 ν=2πk/θ_p、0<|k|<θ_p/2π；這是式 (3.1)。因此 **θ_p≤2π 時只有對數通道**，θ_p>2π 時才有額外的冪次通道。他們用 Krein formula 比較各延拓的 ζ-determinant，並給出 S-matrix。
4. **Kokotov–Lagota。** 處理 polyhedral surfaces 上的 Green function 與 self-adjoint Laplacians（摘要層級）。

## 論文二各結果的定位

| 論文二結果（來源） | 最接近的前人結果 | 判定與建議措辭 |
| --- | --- | --- |
| 奇異座標下的 quasi-isometry（0.02 `lem:metric`） | Grieser §1，方法相同 | **前人成果**。本文只補了明確常數，作為工具引用 |
| 實際 Euclidean Whitney germ 的 arclength 座標：a−I=O(ρ^{1/2})、m−1=O(ρ)、ρ_e/ρ=1+O(ρ^{1/2})（0.03 `lem:arclength`） | Grieser 只有 qi；他的 arclength 參數化是沿 level curve、用於 qi 判準 | **候選貢獻**（技術性但實質）。它把 cross-cap 處的係數從「有界可測」提升到「C^{1/2} 意義下接近恆等」，對數係數才得以精確 |
| point trace、修正後 A 的 (2,2)／U(2)、resolvent formula（0.02） | CdV Theorem 1（光滑點，每點 deficiency 1）；Posilicano 框架；HK (3.1)（錐點） | **已知圖像在新情形下的實現**。cross-cap 上 CdV 的光滑 Sobolev 論證和 HK 的精確錐分離都不能直接套用，本文以 Hölder 正則性與 arclength 座標補上 |
| 通用係數 −(1/2π)log ρ_e、B_η 實對稱（0.03 `thm:log`） | CdV Lemma 2 的 G(r)+F+o(1)；HK 的錐點係數 | **新情形中的同型結果**。結構性結論：cross-cap 是總角為 2π 的點，只有一個對數通道，與 CdV 的光滑點同類，與 HK 中角大於 2π 的錐點不同 |
| A 的 Markov 唯一性（0.03 `cor:markov`） | 經典現象：2D point interaction 對 Lebesgue 測度不是 Markovian；容量為零時 Dirichlet form 唯一。Albeverio–Brasche–Röckner、Fukushima 等的全文**未取得** | **預期中的類比，本文給出直接證明**。不宣稱新現象 |
| 共同 reference-length 唯一性（0.03 `cor:scale`） | 2D point interaction 的尺度與耦合關係是經典內容（Albeverio–Gesztesy–Høegh-Krohn–Holden）；**未取得全文** | 以「記號／尺度規約」表述，引用經典來源；取得原文後再核對細節 |
| 反射對稱、極限 sheet parity、Krein kernel 維數 2、舊 H₀ 的無窮 deficiency 反例 | 一般 Krein 理論（Ashbaugh 等） | 模型層級的結論，以及對舊稿的更正 |

## 由比對得到的一個建議：擴大論文二的適用範圍

0.03 的 arclength lemma 是對**任意**光滑 Euclidean Whitney germ 證明的，trace、對數與邊界係數的論證也都是局部的。只有全域緊緻性與正 gap 用到了本模型的五點分析。因此論文二可以考慮這樣表述：

> 對 ℝ³ 中邊界光滑的緊緻浸入曲面，若其奇點為有限個內部 Whitney cross-cap，則 scalar Laplacian 在這些點上的 point interaction 理論與 Colin de Verdière 的光滑情形同型，每點一個對數通道，係數為以外在半徑表示的通用值 −1/2π。

S 則作為主要例子，包含兩個邊角 quarter-germ 的處理。這會讓論文二成為一個一般定理加一個實例，讀者面比單一模型更廣，也更貼近「振奮但謙虛」的方針。**這需要一項新驗證**：一般情形下的全域 form 緊緻性（局部 qi 加 Rellich）以及邊界與奇點分離的假設。這部分尚未證明，列為整合論文二的第一個研究步驟。

## 尚未完成的比對

- Albeverio–Gesztesy–Høegh-Krohn–Holden, *Solvable Models in Quantum Mechanics*（2D point interaction 的尺度與 Markov 性）；Albeverio–Brasche–Röckner 1989；Fukushima–Oshima–Takeda（容量與 Dirichlet form 唯一性）。目前只到書目或二手層級。
- Kokotov–Lagota 的全文細節，以及 Brüning–Geyler–Pankrashkin 關於流形上 point perturbation 的著作。
- 關於「cross-cap 或 Whitney umbrella 上的 Laplacian 或 point interaction」的直接文獻：本輪搜尋沒有找到相同的結果，但這不能作為原創性的證明。

## 結論

論文二的工具（qi 座標、Krein／Posilicano、Hölder 正則性、Markov 判準）都屬前人；**最接近的同型定理是 Colin de Verdière 1982 的光滑曲面 pseudo-laplacian**。本文值得強調的貢獻是：在度量奇異的 Whitney cross-cap 上證明了同一個圖像，並給出精確的對數正規化；這靠的是 Grieser 之外更細的 arclength 漸近估計。措辭建議定為「把 Colin de Verdière 的 pseudo-laplacian 圖像推廣到浸入曲面的 cross-cap」，並明確致謝上述各篇。
