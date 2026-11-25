# Báo Cáo Bài Tập Lớn Khai Phá Dữ Liệu (LaTeX Project)

**Trường Đại học Giao thông Vận tải Thành phố Hồ Chí Minh (UTH)**  
**Viện Công nghệ Thông tin và Điện, Điện tử**  
**Học phần:** Khai phá Dữ liệu (Data Mining)  
**Giảng viên hướng dẫn:** TS. Trần Thế Vinh  
**Nhóm thực hiện:** Nhóm 1 (7 thành viên)  

---

## 1. Tên Đề Tài

> **KHAI THÁC DỮ LIỆU NGHIÊN CỨU KHOA HỌC THỜI GIAN THỰC HƯỚNG TỚI XÂY DỰNG HỆ THỐNG TRUY XUẤT TRI THỨC TĂNG CƯỜNG (RAG) CHO MIỀN AI/DS**

---

## 2. Danh Sách Thành Viên Thực Hiện (Nhóm 1)

| STT | Họ và Tên | Mã Sinh Viên | Vai trò chính |
| :---: | :--- | :---: | :--- |
| 1 | **Nhữ Phạm Quang Mạnh** | `067206006852` | Trưởng nhóm, Thiết kế Kiến trúc Lakehouse & RAG |
| 2 | **Trương Đỗ Vương** | `056206009261` | Phụ trách Pillar 1: FP-Growth \& Ingestion Consumer |
| 3 | **Lê Huỳnh Anh Khôi** | `056206005447` | Phụ trách Pillar 2: Semantic Clustering \& Embedding |
| 4 | **Võ Anh Nhật** | `052206007980` | Phụ trách Pillar 3: Graph Mining \& PageRank Centrality |
| 5 | **Lê Hoàng Tuấn** | `079204034414` | Phụ trách Pillar 4: Trend Velocity \& Isolation Forest |
| 6 | **Tống Minh Quân** | `075206015931` | Phụ trách Đánh giá Thực nghiệm DeepEval 2.x |
| 7 | **Nguyễn Quốc Anh** | `038207000074` | Phụ trách Frontend Dashboard React 19 \& Trực quan hóa |

---

## 3. Cấu Trúc Thư Mục Dự Án LaTeX

Dự án được tổ chức mô-đun hóa cao, dễ đọc, dễ kiểm tra và hiệu chỉnh:

```text
data-mining-latek/
├── main.tex                       # Điểm biên dịch chính của dự án (Root LaTeX)
├── references.bib                 # Cơ sở dữ liệu trích dẫn chuẩn BibTeX (18+ nguồn chuẩn)
├── compile.bat                    # Script biên dịch 1-click cho Windows
├── Makefile                       # Kịch bản biên dịch cho Linux/macOS
├── README.md                      # Tài liệu hướng dẫn sử dụng này
│
├── config/                        # Cấu hình tiền xử lý & Siêu dữ liệu
│   ├── preamble.tex               # Khai báo packages, font Times New Roman, TikZ, layout, màu sắc
│   └── metadata.tex               # Khai báo tên trường, viện, đề tài, giảng viên, danh sách thành viên
│
├── sections/                      # 10 chương báo cáo học thuật
│   ├── 00_cover.tex               # Trang bìa chuẩn mẫu ảnh UTH (khung hoa văn kép, logo, chữ đỏ, căn phải)
│   ├── 01_abstract.tex            # Tóm tắt tiếng Việt và Abstract tiếng Anh + Keywords
│   ├── 02_business_understanding.tex # Chương 1: Hiểu bài toán, bối cảnh, động cơ và bảng KPI
│   ├── 03_data_understanding.tex  # Chương 2: Hiểu dữ liệu, phân tích nguồn và 4 Insights EDA cốt lõi
│   ├── 04_data_preparation.tex    # Chương 3: Chuẩn bị dữ liệu, thu thập 3 tầng, Medallion Lakehouse, chunking
│   ├── 05_modeling.tex            # Chương 4: 4 Trụ cột Khai phá (FP-Growth, Clustering, Graph, Anomalies) & RAG
│   ├── 06_evaluation.tex          # Chương 5: Đánh giá DeepEval 2.x, đo lường độ trễ GPU RTX 4060, phân tích lỗi
│   ├── 07_deployment.tex          # Chương 6: Triển khai Docker, MinIO S3, Qdrant, RabbitMQ, Airflow & bảo mật
│   ├── 08_conclusion.tex          # Chương 7: Kết luận, đóng góp khoa học, giới hạn và hướng phát triển
│   └── 09_appendix.tex            # Phụ lục: Ma trận đối chiếu nguồn, mã nguồn mẫu, hướng dẫn chạy
│
├── figures/                       # Hình ảnh và đồ họa vector
│   ├── uth_logo.png               # Logo UTH độ nét cao bóc tách từ mẫu bìa chuẩn
│   └── diagrams.tex               # Sơ đồ kiến trúc hệ thống và luồng truy xuất RAG vẽ bằng TikZ
│
└── tables/                        # Các bảng số liệu thực nghiệm tách rời
    ├── table_kpi.tex              # Bảng KPI kỹ thuật và nghiệp vụ
    ├── table_eda_categories.tex   # Bảng phân bố chuyên ngành & công thức toán
    ├── table_association_rules.tex# Bảng luật kết hợp FP-Growth
    ├── table_clustering_metrics.tex# Bảng đánh giá phân cụm K-Means & DBSCAN
    ├── table_graph_influencers.tex# Bảng top tác giả & công trình landmark có PageRank cao
    ├── table_anomalies.tex        # Bảng tài liệu ngoại lai phát hiện bởi Isolation Forest
    ├── table_rag_benchmark.tex    # Bảng đánh giá 6 chỉ số DeepEval 2.x
    └── table_latency_profile.tex  # Bảng đo lường độ trễ từng công đoạn trên GPU
```

---

## 4. Hướng Dẫn Biên Dịch Ra Tệp PDF

Báo cáo được thiết kế chuẩn theo quy cách:
- **Cỡ chữ:** `13pt` (class `extreport` nền 12pt, gói `fontsize` đặt cỡ chữ thực 13pt và các cỡ tương đối).
- **Font chữ:** `Times New Roman` (chính thức qua `fontspec` trên XeLaTeX/LuaLaTeX, có hỗ trợ fallback `mathptmx` trên pdfLaTeX).
- **Giãn dòng:** `1.3` chuẩn bài tập lớn / luận văn đại học.

### Cách 1: Sử dụng Overleaf (Khuyến nghị — Nhanh nhất 1-Click)
1. Nén toàn bộ thư mục `data-mining-latek` thành một tệp `.zip`.
2. Truy cập [Overleaf](https://www.overleaf.com), đăng nhập tài khoản.
3. Chọn **New Project** $\to$ **Upload Project** $\to$ Tải tệp `.zip` lên.
4. Mở menu **Menu** ở góc trên cùng bên trái màn hình Overleaf:
   - Mục **Compiler**: Chọn **XeLaTeX** (hoặc LuaLaTeX).
   - Mục **Main document**: Chọn **main.tex**.
5. Nhấn **Recompile** (hoặc tổ hợp phím `Ctrl + Enter`). Tệp PDF hoàn chỉnh sẽ xuất hiện ở khung bên phải để tải về.

### Cách 2: Sử dụng VS Code (với LaTeX Workshop)
1. Cài đặt extension **LaTeX Workshop** trong Visual Studio Code.
2. Mở thư mục `data-mining-latek` trong VS Code.
3. Mở tệp `main.tex`.
4. Nhấn tổ hợp phím `Ctrl + Alt + B` (hoặc mở thanh công cụ LaTeX Workshop bên trái $\to$ chọn **Build LaTeX project** $\to$ **Recipe: xelatex**).

### Cách 3: Biên dịch Cục bộ trên Máy tính Windows (MiKTeX / TeX Live)
1. Tải và cài đặt bộ phân phối [MiKTeX](https://miktex.org/download) hoặc [TeX Live](https://www.tug.org/texlive/).
2. Nhấp đúp chuột vào tệp **`compile.bat`** (hoặc mở PowerShell gõ `.\compile.bat`).
3. Kịch bản sẽ tự động chạy 4 lượt:
   - Lượt 1: `xelatex main.tex` (nạp mục lục và nhãn).
   - Lượt 2: `bibtex main` (đồng bộ trích dẫn tài liệu tham khảo).
   - Lượt 3: `xelatex main.tex` (cập nhật danh mục tham khảo vào văn bản).
   - Lượt 4: `xelatex main.tex` (hoàn thiện liên kết chéo và số trang).
4. Tệp kết quả `main.pdf` sẽ tự động mở lên sau khi hoàn tất.

---

## 5. Đặc Điểm Thiết Kế Trang Bìa Chuẩn Mẫu UTH

Trang bìa (`sections/00_cover.tex`) được thiết kế bám sát 100% mẫu ảnh thực tế của UTH:
1. **Khung viền kép hoa văn góc**: Vẽ bằng thư viện vector TikZ với đường viền ngoài đậm, đường trong mảnh và 4 góc lồng hộp vuông trang nhã.
2. **Tiêu đề cơ quan**: `TRƯỜNG ĐẠI HỌC GIAO THÔNG VẬN TẢI TP. HỒ CHÍ MINH` và `VIỆN CÔNG NGHỆ THÔNG TIN VÀ ĐIỆN, ĐIỆN TỬ` (có gạch chân).
3. **Logo UTH**: Bóc tách chính xác từ tệp mẫu, hiển thị cân đối ở trung tâm.
4. **Tên Đề tài**: In hoa, in đậm, màu **Đỏ (UTHRed)** nổi bật.
5. **Khối GVHD & SVTH**: Canh lề phải theo đúng bố cục truyền thống của trường.


## Bản cập nhật ảnh ngày 23/11/2026

Đã chèn 7 ảnh chụp tự động trong `figures/captured_20261123_082337/`, kèm chú thích nguồn và bảng phân biệt snapshot. PDF được biên dịch bằng Tectonic portable 0.17.0 và kiểm tra bố cục. `BUILD_VALIDATION.json` ghi số trang, vị trí ảnh và kết quả kiểm tra. Không chạy lại mining hoặc benchmark.


## Bản biên tập nội dung ngày 23/11/2026

`main.pdf` hiện có 66 trang. Bản này sửa mạch lập luận, định nghĩa chỉ số và diễn giải kết quả; giữ cấu hình format của bản trước. Các số đo gốc được giữ theo nguồn, các phép tính bổ sung được ghi rõ là suy từ số đã lưu. Bộ source gồm đầy đủ 7 ảnh, 9 tài liệu được trích dẫn và hai file kiểm tra `BUILD_VALIDATION.json`, `CONTENT_VALIDATION.json`. Xem `UPDATE_NOTES.md` để biết các phần đã biên tập. Không có lượt chạy mining/benchmark mới.


## Bản sửa sơ đồ trang 33 và 41

Hai hình được vẽ lại trong `figures/diagrams.tex`. Để cập nhật trên Overleaf, tải file này lên đúng thư mục `figures` và chọn ghi đè file cũ, sau đó Recompile với XeLaTeX. Các macro `DrawRagPipelineDiagram` và `DrawSystemArchitecture` giữ nguyên tên nên không cần sửa các chương. PDF vẫn 66 trang; trang in 33/41 tương ứng trang PDF 43/51. Xem `DIAGRAM_VALIDATION.json` để đối chiếu kết quả kiểm tra.

PDF sửa hai hình được lưu riêng thành `main_fixed_diagrams_20261123.pdf` vì `main.pdf` đang được ứng dụng khác mở và khóa. Trên Overleaf, biên dịch source mới sẽ tạo `main.pdf` với hai hình đã sửa.


## Bản hoàn thiện nội dung theo phản biện học thuật (23/11/2026)

`main.pdf` đã được biên dịch hoàn chỉnh (70 trang). Bản này bổ sung biện giải kiến trúc phân tầng (Tiered Separation of Concerns) cho 4 trụ cột Mining và RAG, thêm bảng kiểm định mẫu 100 tài liệu bóc tách công thức toán (Bảng 3.1), làm rõ ranh giới giữa 10k bài baseline và luồng real-time Airflow/RabbitMQ, đồng thời giải thích chuẩn xác mối quan hệ giữa benchmark LanceDB và hạ tầng Qdrant mới. Giữ nguyên 7 ảnh chụp thực tế và toàn bộ sơ đồ TikZ đã căn chỉnh.


## Bản chuẩn hóa định dạng Header 14pt theo quy chế UTH (23/11/2026)

`main.pdf` đã được biên dịch hoàn tất với định dạng chuẩn UTH (68 trang): Running Header đạt cỡ chữ 14pt, Section cấp 1 đạt 14pt in đậm, Subsection cấp 2 đạt 13pt in đậm, chiều cao `headheight=22pt`, kích hoạt chống dòng mồ côi, và khử lỗi font tiếng Việt trong code listings. Toàn bộ 7 ảnh minh chứng và bảng kiểm định mẫu 3.1 đều được bảo toàn.


## Bản chuẩn hóa vị trí số trang và khoảng cách Header (23/11/2026)

Đã hoàn thiện hiệu chỉnh:
1. Số trang từ Mục lục trở lên: Đặt ở TRÊN CHÍNH GIỮA (La Mã thường).
2. Số trang từ sau Mục lục đến hết báo cáo: Đặt ở DƯỚI CHÍNH GIỮA (Số Ả Rập).
3. Thu gọn khoảng cách giữa Header và thân bài (`headsep=12pt`), loại bỏ khoảng trống thừa.


## Bản chuẩn hóa vị trí số trang và khoảng cách Header (23/11/2026)

Đã hoàn thiện hiệu chỉnh:
1. Số trang từ Mục lục trở lên: Đặt ở TRÊN CHÍNH GIỮA (La Mã thường, 14pt).
2. Số trang từ sau Mục lục đến hết báo cáo: Đặt ở DƯỚI CHÍNH GIỮA (Số Ả Rập, 14pt).
3. Thu gọn khoảng cách giữa Header và thân bài (`headsep=12pt`), loại bỏ khoảng trống thừa.


## Bản sửa nội dung và chứng cứ

PDF mới là `main_content_corrected_20261123.pdf` (68 trang). Đã rút kết quả kiểm định mẫu chưa có hồ sơ và sửa các khẳng định về baseline, mining/RAG, hiệu năng cùng Faithfulness. Format và hai sơ đồ được giữ nguyên. `main.pdf` cũng được cập nhật khi không bị ứng dụng khác khóa. Để cập nhật Overleaf, sử dụng source trong ZIP `main_source_evidence_corrected_20261123.zip` và biên dịch bằng XeLaTeX; tránh chép đè những chỉnh sửa riêng chưa lưu trong dự án của bạn. Chi tiết kiểm tra nằm ở `BUILD_VALIDATION.json` và `CONTENT_VALIDATION.json`.


## Bản chỉnh bố cục mới nhất

`main_formatted_20261123.pdf` có 66 trang: dùng `frame_transparent.png`, đồng bộ vị trí tiêu đề, thu gọn khoảng cách mục lục, xếp hai ma trận chung một trang, thêm GitHub vào Tóm tắt và bỏ Abstract tiếng Anh. `main.pdf` được thay cùng bản này nếu không bị ứng dụng khác khóa. Source đầy đủ nằm trong `main_source_layout_updated_20261123.zip`; khi đưa lên Overleaf cần giữ file `frame_transparent.png` ở thư mục gốc và biên dịch bằng XeLaTeX. Nội dung chuyên môn và hai sơ đồ giữ nguyên; thay đổi chỉ bao gồm những phần bố cục đã yêu cầu.
