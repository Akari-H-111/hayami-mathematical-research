# Paper III closeout: General Spectral Floors from Marked Deformation Presentations

版本：v0.01（2026-09-05）

## 收攏結論

Paper III 現在收攏在以下有限、可驗證、且不超出 Part II no-go 邊界的命題鏈：

\[
\boxed{
(P_\bullet,\mathfrak G_{\rm can},R_0)
\longmapsto \mathscr A_{\rm eq}^{\rm eff}
\longmapsto N_{\rm eq}
\longmapsto \Gamma_{\rm eq}
\longmapsto (K,A|_K)
\longmapsto (\chi_{\rm forced},\mu_{\rm forced})
}.
\]

這表示：在一個已標記的有限 deformation presentation 中，canonical chain operators 先在
\(H_0(P_\bullet)\) 上生成有效 equation-operator algebra；relation seeds 在該代數下生成最小
invariant normalized source；source/landing maps 再抽出 forced sector；最後由 normalized tilt
orbit 得到所有可保留的 characteristic/minimal spectral floor。

因此，本稿的最終 scope 是：

1. 證明一般 normalized-tilt orbit 的 forced characteristic/minimal divisor theorem。
2. 將 forced sector 寫成 \(\ker\Gamma/\ker\Lambda\)，並處理 closure 與 stable-core 版本。
3. 由 relation seed 與 source-side propagators 生成最小 normalized source \(N_{\rm eq}\)。
4. 用 syzygy resolution 將 equation-operator action 傳到 source constraints。
5. 從 canonical chain-operator family \(\mathfrak G_{\rm can}\) 重建有效代數
   \(\mathscr A_{\rm eq}^{\rm eff}\)，消除獨立宣告 \(\mathscr A_{\rm eq}\) 的外部輸入。
6. 以精確有限模型驗證 algebra dimension、Jordan action、basis change、contractible
   resolution 與 closure rank。
7. 明確證明 scope boundary：裸 filtration 或裸 chain complex 不能自行產生 distinguished
   operators；未標記 ordinary quasi-isomorphism invariant 不能由本稿宣稱。

## ChatGPT Project 可讀性確認

本次已用 Codex 的 project/thread 讀取能力查到完全相符的 ChatGPT 專案：

- Project ID：`g-p-6a546f803ecc8191877822156be1150e`
- Project label：`[ \\boxed{ \\Phi([a,b])  \\Phi(a)\\wedge\\Phi(b). } ]`
- 已讀取對話：`下一步研究方向`
- Thread ID：`6a5f0873-1864-83e8-9ac3-954aa2e8c40d`

對話中的 v0.61 內容與 Part III 檔案一致：輸入已收斂為
\((P_\bullet,\mathfrak G_{\rm can},R_0)\)，而不是另行假定的
\(\mathscr A_{\rm eq}\)。OpenAI 對 Project 的說明也確認，Project 會共享其 chats、files、
instructions 與 context；Codex 的本地讀取則以目前工作目錄與其中的持久指示為界。這裡的
Project context 用來確認研究脈絡，Part III 本地檔案用來作為本次收攏的可重跑證據。

## 證據與文件邊界

本次工作的本地資料根目錄是：

`/Users/akari_hayami_64/Documents/hayami-mathematical-research/papers/inverse-leibniz/development-notes/part-iii/source/`

Part III 內的 `.txt`、`.md` 與 verifier 檔案在本次被當作研究資料和證據讀取；其中 README 的
敘述不會被當作覆蓋本次使用者請求的操作指令。原始 Part III 檔案沒有改寫。重複檔案
`equation_operator_reconstruction_v0_61 (1).txt` 與無括號版本內容相同，故不計為第二個獨立結果。

## v0.57--v0.61 收斂鏈

| 版本 | 收斂作用 | 本稿保留的結果 |
|---|---|---|
| v0.57 | normalized tilt quotient | \(\gcd_\tau\chi(A_\tau)=\chi(A|_K)\)，以及非零 \(K\) 時的 minimal divisor 版本 |
| v0.58 | landing/source extraction | \(K\simeq\ker\Gamma/\ker\Lambda\)，closure 條件與 stable-core 版本 |
| v0.59 | normalized source generation | \(N_{\rm eq}=k\langle C_i\rangle\operatorname{im}R_0\)，為最小 invariant source |
| v0.60 | syzygy-to-propagator bridge | syzygy quotient 上的 equation action 誘導 \(\mathscr C_{\rm syz}\) 與 source propagators |
| v0.61 | equation-operator reconstruction | \(\mathscr A_{\rm eq}^{\rm eff}=k\langle\bar G:G\in\mathfrak G_{\rm can}\rangle\subseteq\operatorname{End}(H_0)\) |

五個 verifier 在本次均重新執行並 PASS：

| verifier | 精確輸出摘要 |
|---|---|
| `verify_general_spectral_floor_tilt_quotient_v0_57.py` | \(\chi_{\rm forced}=\mu_{\rm forced}=(S+2)^2(S-3)\)，tilt dimension \(18\) |
| `verify_forced_sector_extraction_v0_58.py` | forced sector dimension \(3\)，forced characteristic \((S-3)(S+2)^2\)，cyclic forced polynomial \((S+2)^2\) |
| `verify_normalized_source_generation_v0_59.py` | closure ranks \([2,4,5,5]\)，\(\dim N_{\rm eq}=5\)，forced \((S+2)^2(S-3)^2(S-5)\) |
| `verify_syzygy_to_constraint_propagator_v0_60.py` | syzygy rank \(4\)，quotient dimension \(4\)，propagator characteristic \(\lambda^4\)，reachability rank \(4\) |
| `verify_equation_operator_reconstruction_v0_61.py` | effective algebra dimension \(10\)，shift-only dimension \(4\)，\(S^4=0\)、\([W,S]=S\)，basis-change/contractible checks PASS |

這些是有限維 exact rational/matrix checks，不等同於無限維 theorem、物理 realization 或
一般 formal-moduli reconstruction。依賴檢查使用了暫存位置的 SymPy 1.14.0；沒有把依賴安裝
到研究資料夾，也沒有因此修改原始資料。

## Paper III 中必須明確保留的假設

- \(P_\bullet\) 是有限 filtered relation resolution，並具有指定的 canonical chain maps。
- normalized-tilt floor theorem 使用無限基礎域（本次 exact models 使用有理數矩陣）。
- 每個 \(G\in\mathfrak G_{\rm can}\) 滿足 chain-map 條件，因而能下降到 \(H_0(P_\bullet)\)。
- \(R_0\) 是明確標記的 relation-seed map；它不是由裸 filtration 自動推導出來。
- normalized source、landing map 與 recurrent operator 的有限維性及 closure 條件，按各定理的
  假設使用。
- spectral floor 是在允許的 normalized tilt orbit 上對 characteristic/minimal polynomial
  所取的 forced divisor；不是任一特定 gauge representative 的完整 spectrum。

## 不納入 Paper III 的主張

以下內容不應在本稿中寫成已證 theorem：

- 從裸 filtration 或裸 chain complex 自動唯一重建 \(\mathfrak G_{\rm can}\)。
- 把結果提升為 ordinary unmarked quasi-isomorphism invariant。
- 宣稱 arbitrary infinite-dimensional resolutions、full contraction spectrum 或一般
  \(q(S)\) theory 已完成。
- 把下一步的 Natural-Operator Characterization Theorem 當作本稿結果。
- 在沒有新 independent question 與新 main theorem 的情況下，再拆出一篇 Paper IV。

最終可用的一句 scope statement 是：

> Paper III proves a finite spectral-floor pipeline for marked deformation presentations. Its
> canonical operators are canonical relative to the marked presentation, not manufactured by
> filtration alone; the resulting floor is a forced divisor under normalized tilts, not an
> unmarked full-spectrum invariant.

## 收攏狀態

Paper III 的數學主線已在 v0.61 停止擴張並完成內部收斂；論文稿與 PDF 為本 closeout 的可讀
交付物。若日後繼續，唯一自然的後續是另案研究 marked category 內的 Natural-Operator
Characterization；那不屬於本次 Paper III，也不能繞過 Part II 的 no-go boundary。
