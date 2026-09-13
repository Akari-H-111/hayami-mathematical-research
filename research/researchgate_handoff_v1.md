# ResearchGate 任務交接說明

更新日期：2026-09-14

## 任務目標

在 ResearchGate 建立 final v5 的獨立 Preprint 條目，並保留舊條目與舊 DOI 不變；完成後在舊條目加入 superseded 說明與新 DOI 連結。

## 已完成且不可改寫的資料

- 最終稿標題：`Observation Discriminant and Spherical Fold Image of the Orthogonal-Circle Ruled Surface`
- 作者：`Akari Hayami (Jian-Yu Huang)`
- 日期：July 2026
- 最終 PDF：`papers/legacy-geometry/source-registry/final_pdfs/The_Stokes_Caustic_of_the_Orthogonal_Circle_Ruled_Surface_v5.pdf`
- SHA-256：`4e48c805c1550dbaee9171a56264bf4ff5275ef5ff5b64f9cd116803283c11c0`
- Zenodo 公開記錄：[22728902](https://zenodo.org/records/22728902)
- Zenodo 版本 DOI：[10.5281/zenodo.22728902](https://doi.org/10.5281/zenodo.22728902)
- Zenodo 概念 DOI：[10.5281/zenodo.22728901](https://doi.org/10.5281/zenodo.22728901)
- Lean companion v0.03 software DOI：[10.5281/zenodo.22735974](https://doi.org/10.5281/zenodo.22735974)；concept DOI：[10.5281/zenodo.22726976](https://doi.org/10.5281/zenodo.22726976)（兩者不可當作數學論文 DOI）

## 舊 ResearchGate 條目

網址：
https://www.researchgate.net/publication/408887855_The_Stokes_Caustic_of_the_Orthogonal-Circle_Ruled_Surface_Poincare_Sphere_Geometry_and_an_Irreducible_Chirality_Quintic

保留事項：

- 舊標題、舊 PDF、舊日期與舊 DOI 全部保留。
- 舊 RG DOI：`10.13140/RG.2.2.23759.04006`
- 不要覆蓋舊 PDF，也不要把舊 DOI 改成 Zenodo DOI。

## 下一窗口操作順序

1. 先呼叫 `cua.listBrowsers()`，選取 metadata 中 `extensionInstanceId = fddc5e23-7e8e-4d33-9019-9232a6bbed9e` 的瀏覽器。
2. 取得並 claim 目前 ResearchGate 分頁；確認登入帳號為 Jian-Yu Huang。
3. ResearchGate 首頁選 `Add new` → `Preprint`。
4. 填入 final v5 標題、作者、July 2026、摘要，並上傳上述 PDF；條目應設為公開。
5. DOI／external identifier 填 Zenodo 版本 DOI：`10.5281/zenodo.22728902`。
6. 儲存後重新讀取公開頁面，確認標題、作者、PDF 與 DOI 均已顯示。
7. 回到舊條目；若有編輯權限，在描述或摘要加入：

   `Superseded by the final v5 preprint, Observation Discriminant and Spherical Fold Image of the Orthogonal-Circle Ruled Surface (July 2026), DOI: 10.5281/zenodo.22728902.`

8. 重新讀取舊條目的公開頁面，確認舊 DOI 未變且 superseded 說明可見。

## 若瀏覽器控制器失效

若本窗口看不到 `cua_repl`，不要改用其他登入自動化方式，也不要宣稱已完成。先在同一 Codex 桌面應用開新對話並重新附加 ResearchGate 分頁；檢查 Browser／Computer Use 權限與 Chrome extension instance。若新對話可用，將本文件內容交給新窗口繼續。

## 完成判準

只有在「新 RG 條目公開可見、PDF 與 Zenodo 版本一致、舊條目保留且明確指向 v5」三項都經公開頁面驗證後，才可回報 ResearchGate 任務完成。
