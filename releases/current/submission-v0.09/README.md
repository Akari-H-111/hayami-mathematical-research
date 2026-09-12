# 三篇 v0.09 投稿收尾包

狀態：本機投稿準備與排版檢查完成；尚未上傳、預留 DOI 或提交。
作者：Akari Hayami (Jian-Yu Huang)

## 使用哪些檔案

- `pdf/`：本次投稿候選 PDF，Paper I 63 頁、II 14 頁、III 22 頁。
- `paper_I_v0_09_arxiv_source.zip`、`paper_II_v0_09_arxiv_source.zip`、`paper_III_v0_09_arxiv_source.zip`：各篇獨立的精簡 TeX 投稿包。主 TeX 在 ZIP 根目錄，只附正文使用的向量 PDF 圖片；文獻已內嵌。請不要將整个交付包當成一篇 arXiv 稿件上傳。
- `metadata/`：逐篇標題、作者、摘要、頁圖數與平台資料草稿。摘要中的自訂 C 巨集已展開為標準 mathbb。分類 math.RA 是依代數與變形理論內容提出的建議，未在平台選定；可依實際投稿介面評估交叉分類。
- `materials/`：三篇原有 v0.09 完整來源封存包和收據，以及正文引用的 v0.08 共用計算證據包。這些封存檔完整保留原樣。各原始封存包內的 PDF 是改書目前的核准版；本次候選 PDF 以頂層 `pdf/` 為準，精確變更見 `qa/*_editorial.diff`。
- `qa/validation.json`：新 PDF 的 SHA-256、本機解壓重建、頁數、圖片目的地與逐頁影像比對結果。

## 本次變更與驗證範圍

僅更新 Paper II 和 III 中四筆伙伴論文的書目版次，從 manuscript closeout v0.08 改為 illustrated edition v0.09。所有數學正文、舊版計算證據的引用與 31 個向量圖片檔均保留原樣；Paper I TeX 完全未改。Unpublished companion manuscript 和尚無公開識別碼的敘述仍屬實，待實際公開後更新。

三份精簡 ZIP 均在各自新建的暫存目錄解壓，用 Tectonic 編譯並通過 QPDF 檢查。頁數保持 63/14/22，作者與全部 31 個圖目標正確，無溢出版框、未定義引用或缺字警告。以 90 dpi 對比全部 99 頁：只有 II 第 14 頁、III 第 22 頁改變，兩頁另以 120 dpi 目視檢查通過；其餘 97 頁與封存核准版影像相同。

這是編輯與包裝驗證。沒有重新執行整套高 arity 數學計算；材料內原驗證紀錄按原有範圍保存，封存包完整性另行核對。本機系統 TeX 缺少 enumitem，故本輪使用已驗證的 Tectonic 工具鏈；仍須核對 arXiv 平台實際編譯出的 PDF。

## 發布順序與尚待資訊

1. Zenodo 建立研究材料草稿並預留 DOI。2026-09-08 本次入口回傳 504，未建立草稿。請使用你的帳號登入後繼續，不要提供密碼給助手。
2. 決定論文與研究材料的授權。metadata 中 license 留空；未替作者作法律授權選擇。ORCID、機構等未提供的身分欄位也不杜撰。
3. 將真正預留的材料 DOI 加入三篇證據說明；若同時取得伙伴文章識別碼，更新對應書目。重新編譯、檢查受影響頁並重封材料。不要將暫填或不存在的 DOI 寫入論文。
4. Zenodo 公開可供重現的材料；逐篇在 arXiv 上傳精簡來源包，確認標題、作者、摘要、分類、授權、帳號資格與平台生成 PDF，再正式提交。
5. 發布後核對公開記錄、檔案與 DOI 連結；在有真實公告紀錄以前不標記為已投稿或已發布。

資料來源：
- https://info.arxiv.org/help/submit_tex.html
- https://arxiv.org/category_taxonomy
- https://info.arxiv.org/help/license/index.html
- https://help.zenodo.org/docs/deposit/describe-records/reserve-doi/

## 重跑本機收尾

使用 Python 3（validate.py 需要 pypdf）、Tectonic、Poppler 與 QPDF：

    python3 prepare.py
    python3 validate.py

prepare.py 從 `releases/current/paper-01-illustrated-v0.09/`、`paper-02-illustrated-v0.09/` 與 `paper-03-illustrated-v0.09/` 的既有封存來源產生精簡包，屬於本工作區的發布準備程式。對外下載者重建單篇論文，只需解壓對應 arXiv source.zip 並在根目錄執行：

    tectonic --keep-logs paper_I_fixed_cubic_v0_09.tex

II、III 分別使用 paper_II_marked_naturality_v0_09.tex 與 paper_III_spectral_floor_v0_09.tex。修改或重建後須重新綁定視覺檢查與 SHA256SUMS，既有 PASS 不自動適用於新檔案。
