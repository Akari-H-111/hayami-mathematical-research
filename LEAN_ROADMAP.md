# Lean 完成與後續研究路線

更新日期：2026-09-13

## 目前基線

`companions/lean/stokes-caustic-v5/` 使用 Lean `4.33.1`、Mathlib `v4.33.1`，現有 modules 已編譯且無 `sorry`。已涵蓋：

- exact polynomial definitions 與 identities；
- cleared-denominator Jacobian numerator reduction；
- rational branch 與 endpoint identities；
- `pB` 唯一根的固定實區間證書；
- `R7`、`B`、`Q17` 的 exact sign barriers；
- 正 `Q` chart 上的 real observation map、分母正性與 Fréchet differentiability。

完整聲明與指令在 `companions/lean/stokes-caustic-v5/LEAN_STATUS.md`。已發布的 v0.02 封包保持不可變；新增定理進入工作 source，完成後另發 v0.03 或後續版本。

## 第一優先：完成 Stokes v5 的幾何橋

| 里程碑 | 狀態 | 下一個可證命題 | 驗證／落點 |
| --- | --- | --- | --- |
| L0. Observation map 與可微性 | `LEAN-PASSED` | 已完成 | `StokesV5/ObservationMap.lean`; `LEAN_STATUS.md` |
| L1. Explicit derivative | `NEXT` | 以 continuous linear map 明寫 `D F(t,u)`，由既有可微性與 `qChart_pos` 推導 | 優先擴充 `StokesV5/ObservationMap.lean`，必要時才另建單一 module |
| L2. Jacobian factorization | `PLANNED` | 證 `det(D F) = -2 sin(t) (A(cos t)+u B(cos t))/qChart(t)^3` | 對照 `releases/current/stokes-caustic-v5/verification/verify_exact_geometry.py` |
| L3. Ordinary-branch hypotheses | `PLANNED` | 對每個主張 branch 證 rank one 與 kernel transversality | `GEOMETRIC_CLOSURE_BOUNDARY.md`; `THEOREM_MAP.md` |
| L4. Exceptional common point | `PLANNED` | 將 meeting point 與 ordinary folds 明確分離 | 同上 |
| L5. Plane-to-plane fold criterion | `RESEARCH` | 在 Mathlib 中定位足夠定理；若不存在，證精確 local normal form，不以 axiom 引入 | 新定理必須列出 smoothness、rank、transversality 與 chart 假設 |
| L6. v0.03 release | `BLOCKED BY L1–L5` | 更新 theorem map、axiom audit、重播與 release wording | 新封包；不得改寫 v0.02 ZIP 或 receipt |

最短下一步是 L1：先證 explicit derivative，不同時開展通用 singularity-theory library。

## 第二優先：下一批 Lean 候選

1. **Ruled surface v4 的修正版有限核心。** 只有在邊界 atlas／`Q>0` 範圍與 Theorem 5.3 的新增假設確定後才開始；Lean target 是修正後定理，不是把已知錯誤原文形式化。
2. **Bicomplex v12 的有限模組。** 從多項式 identity、`A3` germ、有限 Gram matrix、Poisson/eta pairing 開始；Green/Dirac/Pin/sheaf 與 operator domains 先留在 specialist audit。
3. **Paper III 的有限維 marked spectral-floor core。** 先將 marking、state、landing、source maps 全部做成顯式輸入，再形式化 stable-core closure 與 finite spectral avoidance；不得把 marking 從型別或假設中消去。
4. **Paper I 的固定有限模型。** 只挑最小、可重播的 exact-rational theorem；63 頁全文形式化不是近期里程碑。

## filtered-complex／Diophantine 橋的 Lean 邊界

這是獨立研究線。第一個 Lean artifact 應是來源類別、兩側 metric 與候選映射的精確定義，加上一個有限 toy model；在紙筆／symbolic 層證明雙 Lipschitz 主命題之前，不建立空泛的一般 theorem，也不讓它阻塞 Stokes v5 L1–L6。

## 每次 Lean 變更的通過條件

從 `companions/lean/stokes-caustic-v5/` 執行：

```bash
lake -q build StokesV5
lake -q env lean StokesV5/Status.lean
lake -q env lean StokesV5/Audit.lean
rg -n '^[[:space:]]*sorry\b' StokesV5 StokesV5.lean
```

完成一個里程碑後，同步更新：

- `companions/lean/stokes-caustic-v5/LEAN_STATUS.md`
- `companions/lean/stokes-caustic-v5/RESEARCH_STATUS.md`
- `companions/lean/stokes-caustic-v5/GEOMETRIC_CLOSURE_BOUNDARY.md`
- `releases/current/stokes-caustic-v5/THEOREM_MAP.md`（作為 v0.02 基線；準備新 release 時複製到新版本後再更新，不改寫 v0.02）
- 根目錄 `RESEARCH_BOARD.md`
