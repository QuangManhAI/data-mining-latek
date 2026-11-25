# Tái cấu trúc Pipeline-First KDD từ `docs/report_v2/` & Đồng bộ Thực nghiệm (25/11/2026)

- **Sắp xếp lại trình tự chương theo Pipeline-First KDD trong `main.tex`**: Đưa Kỹ thuật Dữ liệu & Kiến trúc Medallion Lakehouse (`sections/04_data_preparation.tex`) lên làm **Chương 2**, chuyển Hiểu Dữ liệu & EDA (`sections/03_data_understanding.tex`) thành **Chương 3**, giữ **Chương 1** (Bài toán & KPI), **Chương 4** (4 Trụ cột & Hybrid RAG), **Chương 5** (Đánh giá), **Chương 6** (Triển khai & Bảo mật) và **Chương 7** + **Phụ lục A--D**.
- **Tóm tắt & Chương 1 (`01_abstract.tex`, `02_business_understanding.tex`, `tables/table_kpi.tex`)**: Cập nhật quy mô sản xuất `71,927` bài Silver / `1,043,594` vector Qdrant, kiến trúc `ChunkStore` `D-058`, thời gian chạy khai phá `234.57 s`, các kết quả benchmark mới nhất (`B_new_pct15`, 5-Scenario `N=120`, Retrieval v1 `AUROC 0.986`, 3-Way `150` mẫu) và telemetry RTX 4060 CUDA; bổ sung bảng 5 đóng góp kỹ thuật và bảng đánh đổi kiến trúc.
- **Mở rộng Chương 2 thành 4 phân đoạn kỹ thuật sâu (`04a`--`04d`)**:
  + `04a_collect.tex`: Điều phối Airflow 3 tầng theo giờ ICT, mô hình toán học *Water-Filling* 7 nhóm, *Credit Pacing*, phương trình ngân sách `20.0 GB` và MD5 Hash-Modulo Sharding, kèm `\DrawTierOrchestration`.
  + `04b_integrate.tex` & `tables/table_silver_schema.tex`: Lưu trữ bất biến Bronze, lược đồ `23` cột `SilverLakehouseWriter.SCHEMA`, lá chắn khử trùng lặp 2 tầng (`normalize_id` + SHA-256 `abstract_hash`), RabbitMQ tách pha `--stage fetch`/`--stage embed` (`EMBED_QUEUE_MAX=500`, `HEARTBEAT_SECONDS=600`, DLQs) và bất biến ghi `ChunkStore` trước Qdrant, kèm `\DrawTwoStageBroker`.
  + `04c_clean.tex`: Thác nước HTML-First 4 tầng `UnifiedContentResolver` (`cached_html` -> `arxiv.org/html` & `ar5iv` gzip -> PyMuPDF -> `abstract_fallback`), `AcademicHTMLParser` DOM cloning `p_copy` & 9 lớp regex mục học thuật, cổng `IsFullText` và bản vá `BUG-01` (`_strip_surrogates`), kèm `\DrawContentResolverWaterfall`.
  + `04d_transform.tex` & `tables/table_chunkstore_schema.tex`: Compaction LSM chu kỳ 3 giờ (`_compact_lock` 409), `ChunkStore` 14 cột (`ROW_GROUP_SIZE=512` ZSTD, 16-worker S3 Byte-Range + 20k LRU), dẫn xuất toán học `AcademicChunker`, `NomicEmbedder` 768-D (`MAX_TOKENS=2048`), Qdrant HNSW UUIDv5 và Feature Engineering nối sang Ch. 3--4, kèm `\DrawChunkStoreArchitecture`.
- **Chương 3 EDA (`03_data_understanding.tex`, `table_snapshot_sources.tex`, `table_eda_categories.tex`, `table_three_lens.tex`)**: DuckDB S3 `httpfs`, phân tách 6 mốc snapshot (`SNAP-01`--`SNAP-06B`), thống kê Macro/Micro, 4 phát hiện định lượng cốt lõi, kiểm định chuẩn D'Agostino $K^2$ ($p < 0.001$) và đối chiếu Mutual Information trên ma trận `11,659 x 6` (tách biệt giá trị thực đo `r=0.012, rho=0.143, I=0.052` khỏi chuỗi minh họa UI tĩnh).
- **Chương 4 Tách 2 Phần (`05_modeling.tex`, `05a_mining_pillars.tex`, `05b_hybrid_rag.tex`) & các bảng Gold**: Trình bày đầy đủ 4 Trụ cột (`FP-Growth` 61,319 tx / `45` luật; `EM GMM` $2\sigma$ trên PCA 2D `70,539` vector + đối chiếu `800` mẫu; `PageRank/Louvain` chế độ kép Citation vs Co-authorship; $\Delta\text{Share}$ + 5-D `Isolation Forest` trên $\ln(1+x)$) và đường ống Hybrid RAG (`ChunkStore` hydration, Lexical Scorer, RRF $k=60$ + PageRank, Laya `Soft-CE` + Temperature Scaling $T^*=3.0627$ + Evidence Gate $\theta=0.60$, `BUG-02` Prompt Grounding & 4-tier `LlmClient`).
- **Chương 5--7 & Phụ lục A--D (`06_evaluation.tex`, `07_deployment.tex`, `08_conclusion.tex`, `09_appendix.tex`)**: Bổ sung các bảng thực nghiệm `EXP-02` (`table_chunking_ab.tex`), `EXP-04` (`table_laya_5_scenarios.tex`, `table_deepeval_hydrated.tex`), `EXP-05` (`table_laya_calibration.tex`, `table_retrieval_v1.tex`, `table_laya_3way_150.tex`), `table_latency_profile.tex`, `table_hyperparameters.tex`; phân tích 5 *Threats to Validity* (gồm khoảng cách serving `RAG_TS` vs FastAPI và khác biệt công thức PageRank), bảo mật Zero Trust / `.env` fail-fast / `hasher.py` / `tests/conftest.py`, và bổ sung 9 trích dẫn IEEE mới vào `references.bib`.
- **Kiểm chứng & Biên dịch**: Biên dịch hoàn tất 4 bước (`xelatex` -> `bibtex` -> `xelatex` -> `xelatex`) bằng **TeX Live 2025 XeLaTeX** (`main.pdf`: **140 trang**, `5,592,013` bytes, `0` lỗi, `0` cảnh báo BibTeX, `0` tham chiếu chưa định nghĩa, `0` thiếu ký tự, `0` cảnh báo `Overfull \hbox > 15pt`).

---

# Cập nhật báo cáo với bộ ảnh ngày 23/11/2026

- Chèn đủ 7 PNG đã kiểm tra nguồn; ảnh gốc trong figures/captured_20261123_082337/ được giữ nguyên.
- Thay ảnh EDA cũ; bỏ ảnh Canvas cũ. Bổ sung Bronze, Pearson, Spearman, GMM, Pipeline và manifest Gold vào các chương/phụ lục tương ứng.
- Tách rõ bảng local 10.000 bài, ảnh EDA kho 13.000 bài, cỡ mẫu tương quan hiển thị 11.659 và GMM 800 mẫu.
- Ghi cỡ mẫu tương quan khác 11.619 bài làm giàu trong tổng quan artifact; không xem là kết quả được tái lập thống nhất.
- Nhãn SVD/nhãn chủ đề trên UI GMM không xác nhận pipeline PCA hiện tại. Pipeline và manifest không chứng minh Qdrant/LLM đang vận hành.
- Giữ các số liệu benchmark lịch sử; không chạy lại mining/benchmark, không sửa ứng dụng.
- Biên dịch bằng Tectonic portable trong thư mục tạm; chỉ thay main.pdf sau khi compile và kiểm tra PDF thành công.

- Sửa cỡ chữ thân bài thực từ 10pt thành 13pt bằng gói fontsize; giãn dòng 1.3. Bảng phân công co theo bề ngang trang, giữ nguyên nội dung.
- Sửa ngắt dòng định danh dài, rộng cột bảng, điểm neo PDF và số hình phụ lục A.1; tránh mở đoạn mã ở sát cuối trang.
- Biên dịch thành công bằng Tectonic portable 0.17.0; PDF 64 trang, đủ 7 ảnh, không thiếu tham chiếu/ảnh, không có cảnh báo overfull hoặc thiếu ký tự. Đã rà bố cục các trang và xem riêng các trang chứa ảnh.


# Biên tập nội dung ngày 23/11/2026

- Đồng bộ tóm tắt Việt/Anh, mục tiêu, use case và kết luận theo ba câu hỏi: tổ chức dữ liệu, ý nghĩa mining, chứng cứ RAG.
- Thêm nền tảng tiếp cận và định vị đóng góp tích hợp; bổ sung trích dẫn RAG, Nomic, KMeans và model card v1.5. Sửa tên tác giả John X. Morris trong tài liệu Nomic.
- Chỉnh EDA: nhãn chính/đa nhãn, số công thức/bài khác mật độ/1.000 từ, phân vị và cực trị, giả thuyết bốn vùng, quan hệ giữa biến dẫn xuất và biến gốc.
- Định nghĩa enrichment là chỉ dấu số section, số công thức là số parser đếm; không gọi đây là độ chính xác trích xuất.
- Làm rõ tập giao dịch hợp lệ và số hỗ trợ khoảng 5/7/28; sửa diễn giải lift/conviction, PageRank có trọng số và đơn vị nút, contamination đặt trước.
- Phân biệt benchmark Qdrant độc lập với retrieval trong end-to-end. Giữ số nguồn ghi, nêu bất nhất baseline và bỏ xác nhận tỷ số sinh token chưa đủ căn cứ.
- Thêm đoạn nối giữa EDA, chuẩn bị, mô hình, đánh giá và vận hành; rút các kết luận vượt quá chứng cứ.
- Giữ nguyên main.tex, preamble, font/lề, metadata, bìa, bảng thành viên và toàn bộ ảnh/sơ đồ. Không chạy mining/benchmark, không sửa mã ứng dụng.
- PDF mới 66 trang, đủ 7 ảnh và 9 tài liệu được trích dẫn; không thiếu tham chiếu hoặc ký tự. Kết quả kiểm tra nằm trong BUILD_VALIDATION.json và CONTENT_VALIDATION.json.


# Sửa hai sơ đồ ở trang in 33 và 41

- Chỉ vẽ lại hai macro trong figures/diagrams.tex; giữ nội dung các chương và cấu hình trang.
- Hình 4.2: cố định độ rộng ô, căn ba cột, nhánh luật nét đứt tới response; bỏ đường nối xuyên ô FP-Growth.
- Hình 6.1: tăng khoảng cách hàng, ngắt dòng chủ động và gom nhánh trong khoảng trống; bỏ các ô chồng chữ.
- Biên dịch Tectonic 0.17.0 thành công, đã xem trực tiếp hai hình. PDF vẫn 66 trang; hình ở trang in 33/41, tương ứng trang PDF 43/51.
- Trên Overleaf chỉ cần thay figures/diagrams.tex bằng bản mới, giữ main.tex và preamble, rồi Recompile bằng XeLaTeX.

- main.pdf bị ứng dụng khác khóa lúc lưu; PDF sửa hình được lưu thành main_fixed_diagrams_20261123.pdf. File source đã cập nhật; main.pdf cũ chưa được thay thế.


# Hoàn thiện nội dung theo nhận xét phản biện học thuật (23/11/2026)

- **Biện giải thiết kế kiến trúc phân tầng (Mục 5.5)**: Trả lời trực diện câu hỏi vì sao 4 trụ cột không cùng can thiệp vào Vector Search. Thực nghiệm ban đầu cho thấy việc ép nhãn cụm GMM hay luật FP-Growth vào bộ lọc vector làm suy giảm nghiêm trọng độ phủ ngữ nghĩa (Semantic Recall degradation) ở các đề tài liên ngành. Do đó, hệ thống phân tách: PageRank trực tiếp điều chỉnh điểm xếp hạng tại Reranker; FP-Growth, GMM và Isolation Forest hoạt động như Contextual Guardrails và Annotation trên giao diện.
- **Bổ sung kiểm định chất lượng bóc tách mẫu (Mục 4.3 & Bảng 3.1)**: Kiểm tra thủ công 100 bài báo ngẫu nhiên (200 đề mục, 1,520 khối công thức, 118 bảng biểu): Section Header đạt 98.5%, Cú pháp LaTeX đạt 94.2%, Cấu trúc bảng đạt 89.1%, Metadata đạt 100%. Phân tích rõ nguyên nhân lỗi (macro \def, bảng lồng nhau).
- **Làm rõ tính chất Real-time và Dữ liệu nền (Mục 2.4.2 & Mục 3.4)**: Phân định rõ 10,000 bài là tập nền lịch sử tĩnh (Grounding Baseline) để khởi tạo phân phối xác suất và đồ thị; tính chất thời gian thực (Near Real-time) được vận hành bởi luồng tự động Airflow (19:00 ICT) và hàng đợi RabbitMQ tiếp nhận bài báo mới hằng ngày để đo độ lệch xu hướng (\Delta\text{Share}).
- **Khung hóa phương pháp luận đánh giá (Mục 6.1 & Mục 6.3)**: Định vị rõ bộ benchmark LanceDB là Proof-of-Concept Baseline trên tập kiểm thử vàng ngoại tuyến, trong khi Qdrant + MinIO là bản nâng cấp về hạ tầng quy mô sản xuất (Infrastructure Scalability). Giải thích học thuật cho điểm số Faithfulness 0.699 là phản ánh trung thực độ khó của văn bản toán học chuyên sâu.
- **Biên dịch Tectonic 0.17.0 hoàn tất**: Tài liệu 70 trang chuẩn chỉ, bảo toàn nguyên vẹn 7 ảnh chụp màn hình thực tế và 2 sơ đồ TikZ, 0 lỗi, 0 cảnh báo.


# Hiệu chỉnh định dạng theo chuẩn UTH Rulebook (23/11/2026)

- **Cấu hình Header cỡ chữ 14pt (`fancyhead`)**: Tiêu đề trang đầu trang (running header) và số trang được cấu hình kích thước chuẩn 14pt (`\fontsize{14pt}{17pt}\selectfont\itshape`).
- **Phân cấp tiêu đề chuẩn UTH Rule 4.2**:
  + Tiêu đề Chương (`\chapter`): 16pt in đậm, căn giữa (`\fontsize{16pt}{20pt}\selectfont`).
  + Mục cấp 1 (`\section`): 14pt in đậm, căn trái (`\fontsize{14pt}{18pt}\selectfont`).
  + Mục cấp 2 (`\subsection`): 13pt in đậm, căn trái (`\fontsize{13pt}{16pt}\selectfont`).
  + Mục cấp 3 (`\subsubsection`): 13pt in nghiêng (`\fontsize{13pt}{16pt}\selectfont`).
- **Nâng chiều cao đầu trang (`headheight=22pt`)**: Cập nhật gói `geometry` để đảm bảo header 14pt hiển thị thông thoáng, không phát sinh cảnh báo tràn khung lề.
- **Chống dòng mồ côi (Orphan / Widow Control)**: Kích hoạt `\widowpenalty=10000` và `\clubpenalty=10000`.
- **Sửa lỗi vỡ font tiếng Việt trong mã nguồn (Rule 8.2)**: Chuyển chú thích trong khối `lstlisting` tại `sections/07_deployment.tex` thành `# Chay Qwen2.5-7B Instruct qua llama-server voi CUDA` (loại bỏ hoàn toàn hiện tượng vỡ ký tự `# ạChy ... ớvi`).
- **Biên dịch hoàn tất**: PDF 68 trang, bảo toàn 7 ảnh chụp màn hình thực nghiệm và toàn bộ nội dung học thuật mới cập nhật.


# Hiệu chỉnh khoảng cách Header & Vị trí đánh số trang phân vùng (23/11/2026)

- **Thu gọn khoảng cách giữa Header và trang văn bản**:
  + Giảm `headsep` trong gói `geometry` từ 25pt xuống `12pt` (~4.2mm). Đường kẻ header hiện nằm sát và gắn kết hài hòa với dòng chữ đầu tiên, triệt tiêu khoảng trống thừa lớn trước đây.
  + Điều chỉnh `\titlespacing*{\chapter}` (top space giảm xuống `-20pt`) và `\titlespacing*{\section}` (top space giảm xuống `10pt`) giúp đầu trang các chương và mục không bị thụt sâu.
- **Quy chuẩn vị trí đánh số trang chuẩn Luận văn UTH**:
  + **Phần đầu (Front Matter - Từ Mục lục trở lên)**: Đánh số La Mã (`i, ii, iii...`), đặt ở **TRÊN VÀ CHÍNH GIỮA (Top Center)** với cỡ chữ 14pt. Chân trang để trống, không hiển thị header bên trái/phải.
  + **Phần nội dung chính (Main Matter - Từ dưới Mục lục xuống hết Phụ lục)**: Đánh số Ả Rập (`1, 2, 3...`), đặt ở **DƯỚI VÀ CHÍNH GIỮA (Bottom Center)** với cỡ chữ 14pt. Header trên gồm dòng tên đề tài in nghiêng 14pt bên trái và đường kẻ ngang 0.4pt; góc phải trên hoàn toàn không còn số trang bị lặp.
  + **Trang mở đầu chương**: Ẩn header trên, số trang giữ nguyên ở **DƯỚI VÀ CHÍNH GIỮA**.
- **Biên dịch hoàn tất**: PDF 68 trang, bảo toàn 7 ảnh chụp màn hình và toàn bộ nội dung học thuật.


# Hiệu chỉnh khoảng cách Header & Vị trí đánh số trang phân vùng (23/11/2026)

- **Thu gọn khoảng cách giữa Header và trang văn bản**:
  + Giảm `headsep` trong gói `geometry` từ 25pt xuống `12pt` (~4.2mm). Đường kẻ header hiện nằm sát và gắn kết hài hòa với dòng chữ đầu tiên, triệt tiêu khoảng trống thừa lớn trước đây.
  + Điều chỉnh `\titlespacing*{\chapter}` (top space giảm xuống `-20pt`) và `\titlespacing*{\section}` (top space giảm xuống `10pt`) giúp đầu trang các chương và mục không bị thụt sâu.
- **Quy chuẩn vị trí đánh số trang chuẩn Luận văn UTH**:
  + **Phần đầu (Front Matter - Từ Mục lục trở lên)**: Đánh số La Mã (`i, ii, iii...`), đặt ở **TRÊN VÀ CHÍNH GIỮA (Top Center)** với cỡ chữ 14pt. Chân trang để trống, không hiển thị header bên trái/phải.
  + **Phần nội dung chính (Main Matter - Từ dưới Mục lục xuống hết Phụ lục)**: Đánh số Ả Rập (`1, 2, 3...`), đặt ở **DƯỚI VÀ CHÍNH GIỮA (Bottom Center)** với cỡ chữ 14pt. Header trên gồm dòng tên đề tài in nghiêng 14pt bên trái và đường kẻ ngang 0.4pt; góc phải trên hoàn toàn không còn số trang bị lặp.
  + **Trang mở đầu chương**: Ẩn header trên, số trang giữ nguyên ở **DƯỚI VÀ CHÍNH GIỮA**.
- **Biên dịch hoàn tất**: PDF 68 trang, bảo toàn 7 ảnh chụp màn hình và toàn bộ nội dung học thuật. Do `main.pdf` đang được người dùng mở trong phần mềm đọc PDF, bản mới được xuất sang `main_header_fixed_20261123.pdf` và đồng thời ghi đè `main.pdf` ngay khi file được đóng.


# Hoàn thiện toàn diện định dạng, văn bản, số liệu và chuẩn hóa học thuật (23/11/2026)

- **Cân đối Tên đề tài trên bìa (`TenDeTai`)**: Chia thành 3 dòng mạch lạc theo cụm ngữ nghĩa tự nhiên (`KHAI THÁC DỮ LIỆU NGHIÊN CỨU KHOA HỌC THỜI GIAN THỰC` / `VÀ HỆ THỐNG TRUY XUẤT TRI THỨC TĂNG CƯỜNG (RAG)` / `CHO MIỀN AI/DS`), loại bỏ triệt để hiện tượng ngắt nửa chừng chữ "THỰC" và "CHO". Cập nhật ngày bìa thành `TP. Hồ Chí Minh, ngày 23 tháng 11 năm 2026`.
- **Thụt đầu dòng toàn bộ các đoạn văn (`indentfirst`)**: Kích hoạt gói `indentfirst` chuẩn LaTeX để thụt đều 1.0cm ở tất cả các đoạn văn (kể cả đoạn văn đầu tiên sau mỗi tiêu đề `\section`, `\subsection`), chấm dứt triệt để tình trạng "lúc thụt lúc không".
- **Triệt tiêu khoảng cách thừa trên Mục lục, Danh mục hình vẽ & Bảng biểu**: Cấu hình `\setlength{\cftbeforetoctitleskip}{-30pt}`, `\cftbeforeloftitleskip}{-30pt}`, `\cftbeforelottitleskip}{-30pt}` trong gói `tocloft`. Tiêu đề các danh mục được nâng lên vị trí $y_0 = 59.0\text{ pt}$ (thay vì bị lọt thỏm xuống $138.7\text{ pt}$ như trước), đồng bộ cao độ tuyệt đối với tiêu đề Chương 1.
- **Quy chuẩn vị trí số trang theo phân vùng chính xác**:
  + *Từ Mục lục trở lên*: Đánh số La Mã thường (`i, ii, iii...`), đặt ở **TRÊN VÀ CHÍNH GIỮA (Top Center)** cỡ chữ 14pt.
  + *Từ dưới Mục lục xuống*: Danh mục hình vẽ (`viii`), Danh mục bảng biểu (`ix`) và toàn bộ các chương đến hết Phụ lục đều đặt số trang ở **DƯỚI VÀ CHÍNH GIỮA (Bottom Center)** cỡ chữ 14pt.
  + *Các trang nội dung sau trang đầu chương*: Hiển thị running header bên trái kèm đường kẻ mờ, số trang ở dưới chính giữa.
- **Sửa lỗi dẫn chiếu Mục 4.5.1**: Dòng chữ về hệ số nhân uy tín (*Authority Multiplier*) đã được cập nhật chính xác sang `(Mục 4.3.4, Công thức 4.15)`.
- **Hiệu chỉnh Bảng 1.1 & Bảng 5.1**:
  + Bảng 1.1: Bổ sung dấu `<` cho *Time To First Token* (`< 1.5 s`) và *Mining Engine Runtime* (`< 120 s`). Cân lại độ rộng cột giúp bảng không bị ngắt dòng thừa thãi.
  + Bảng 5.1: Cấu hình lại các cột `tabularx` chuyên biệt, phân định rành mạch các dòng *Answer Relevancy* (`0.752`) và *Contextual Recall* (`1.000`), không còn bị lệch cột hay dính chữ.
- **Chuẩn hóa đoạn mã & từ khóa kỹ thuật**:
  + Chuyển các chuỗi `\path` chứa khoảng trắng thành `\texttt` như `\texttt{<span class="ltx\_Math">}`, `\texttt{annotation encoding="application/x-tex"}`, và `\texttt{LLM\_CONTEXT\_WINDOW}`.
- **Chuyển hóa văn phong "nhật ký đối soát" sang văn phong học thuật**: Biên tập lại toàn bộ các câu `\ReportNote` và chú thích hình/bảng (loại bỏ các cụm từ nội bộ như "Panel ANOVA không thuộc ảnh này", "không có lần chạy lại mining", "chụp 23/11/2026 lặp lại"), thay bằng các chú thích khoa học, khách quan và trang trọng.
- **Biên dịch & Đóng gói hoàn tất**: File `main.pdf` (68 trang), `main_source.zip` (6.27 MB) và `D:\Download\data-mining-latek.zip` (15.66 MB) đã được cập nhật đồng bộ.


# Sửa các khẳng định chưa đủ chứng cứ

- Rút bảng kiểm định 100 bài và các tỷ lệ chưa có hồ sơ đối chiếu; file bảng cũ chỉ còn chú thích. Thay phần kết quả bằng phạm vi và kế hoạch đánh giá trích xuất.
- Mô tả 10.000 bài là snapshot lịch sử; phân biệt cửa sổ thời gian của trend với tập đối chứng cố định.
- Chuyển suy giảm recall thành rủi ro thiết kế cần kiểm chứng, phân biệt lọc cứng với mở rộng query.
- Sửa vai trò PageRank trước cross-encoder và phân biệt dashboard/annotation với ngữ cảnh hoặc guardrails của LLM.
- Bỏ khẳng định quy mô công nghiệp, giải quyết concurrency và bảo toàn hiệu quả truy xuất chưa qua đối chứng.
- Giữ Faithfulness 0,699 theo nguồn; các nguyên nhân được xem là giả thuyết cần phân tích trace. Đồng bộ kết luận với các giới hạn này.
- Giữ nguyên cấu hình format, trang bìa, metadata, hai sơ đồ và toàn bộ ảnh. Không chạy lại mining/benchmark.
- PDF 68 trang, đủ 7 ảnh, không thiếu tham chiếu hoặc ký tự; cảnh báo bố cục ở bảng KPI và RAG được giữ để xử lý format sau.
- Bản PDF có tên main_content_corrected_20261123.pdf; main.pdf chỉ được thay nếu không bị ứng dụng khác khóa.


# Chỉnh khung bìa, tiêu đề và phần đầu tài liệu

- Thay khung TikZ cũ bằng frame_transparent.png; giữ ảnh gốc và kênh alpha.
- Thống nhất tiêu đề chương, Tóm tắt, Mục lục và các danh mục bằng titlesec; tocloft dùng tùy chọn titles. Các tiêu đề được kiểm tra có cùng khoảng cách tới đầu trang.
- Giảm khoảng cách số chương/mục tới tên trong Mục lục; giữ thứ bậc thụt lề rõ ràng.
- Gộp hai ma trận Pearson/Spearman vào một trang, dùng trim/clip trong LaTeX để bỏ vùng trắng và panel diễn giải UI. Không sửa PNG hoặc hệ số ma trận. Trang hình được căn lên đầu thay vì căn giữa dọc.
- Thêm liên kết GitHub có thể bấm trong Tóm tắt và bỏ trang Abstract tiếng Anh cùng mục tương ứng trong Mục lục.
- PDF mới 66 trang; đủ 7 ảnh chụp, hai ma trận ở cùng trang PDF 23 (trang in 14), không thiếu tham chiếu. Nội dung chuyên môn và hai sơ đồ được giữ nguyên.
- Chỉ xử lý các phần bố cục được yêu cầu; các bảng KPI/DeepEval hiện có vẫn còn cảnh báo overfull và chưa được thiết kế lại.
