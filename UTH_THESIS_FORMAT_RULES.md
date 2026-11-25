# QUY ĐỊNH CHUẨN TRÌNH BÀY LUẬN VĂN / KHÓA LUẬN / ĐỒ ÁN
## TRƯỜNG ĐẠI HỌC GIAO THÔNG VẬN TẢI TP. HỒ CHÍ MINH (UTH)
### VIỆN CÔNG NGHỆ THÔNG TIN VÀ ĐIỆN, ĐIỆN TỬ

> **Tài liệu quy chuẩn kỹ thuật (Rulebook)** áp dụng cho toàn bộ báo cáo bài tập lớn, đồ án môn học, khóa luận tốt nghiệp và tài liệu học thuật viết bằng LaTeX / Markdown tại UTH. Mọi sinh viên, nhóm nghiên cứu và hệ thống tự động (AI agents) bắt buộc phải tuân thủ nghiêm ngặt các quy tắc trong tài liệu này.

---

## MỤC LỤC
1. [Khổ Giấy và Căn Lề Trang (Page Setup & Geometry)](#1-khổ-giấy-và-căn-lề-trang-page-setup--geometry)
2. [Phông Chữ và Định Dạng Đoạn Văn (Typography & Paragraph)](#2-phông-chữ-và-định-dạng-đoạn-văn-typography--paragraph)
3. [Bố Cục Toàn Cảnh Quyển Báo Cáo (Document Structure)](#3-bố-cục-toàn-cảnh-quyển-báo-cáo-document-structure)
4. [Quy Tắc Đánh Số Trang và Phân Cấp Đề Mục (Pagination & Headings)](#4-quy-tắc-đánh-số-trang-và-phân-cấp-đề-mục-pagination--headings)
5. [Quy Chuẩn Bảng Biểu (Tables)](#5-quy-chuẩn-bảng-biểu-tables)
6. [Quy Chuẩn Hình Ảnh, Biểu Đồ và Sơ Đồ (Figures & Charts)](#6-quy-chuẩn-hình-ảnh-biểu-đồ-và-sơ-đồ-figures--charts)
7. [Quy Chuẩn Công Thức Toán Học (Math Equations)](#7-quy-chuẩn-công-thức-toán-học-math-equations)
8. [Quy Chuẩn Trích Đoạn Mã Nguồn (Code Listings)](#8-quy-chuẩn-trích-đoạn-mã-nguồn-code-listings)
9. [Tài Liệu Tham Khảo và Trích Dẫn (Citations & Bibliography)](#9-tài-liệu-tham-khảo-và-trích-dẫn-citations--bibliography)
10. [Liêm Chính Học Thuật và Kiểm Soát Trùng Lặp (Academic Integrity)](#10-liêm-chính-học-thuật-và-kiểm-soát-trùng-lặp-academic-integrity)
11. [Bộ Đoạn Mã Mẫu LaTeX Chuẩn (Ready-to-Use LaTeX Snippets)](#11-bộ-đoạn-mã-mẫu-latex-chuẩn-ready-to-use-latex-snippets)

---

## 1. Khổ Giấy và Căn Lề Trang (Page Setup & Geometry)

Báo cáo in một mặt trên giấy trắng tiêu chuẩn:
- **Khổ giấy**: A4 ($210 \times 297 \text{ mm}$).
- **Căn lề trang in (Margins)**:
  - **Lề trái (Left / Inside)**: **$3.0 \text{ cm}$ ($30 \text{ mm}$)** *(Bắt buộc $3.0 \text{ cm}$ để trừ hao đóng gáy lò xo hoặc đóng bìa cứng mạ vàng không bị che khuất chữ)*.
  - **Lề phải (Right / Outside)**: **$2.0 \text{ cm}$ ($20 \text{ mm}$)**.
  - **Lề trên (Top)**: **$2.5 \text{ cm}$ ($25 \text{ mm}$)**.
  - **Lề dưới (Bottom)**: **$2.5 \text{ cm}$ ($25 \text{ mm}$)**.
  - **Header Height**: `16pt`.
  - **Footer Skip**: `12mm`.

### Cấu hình LaTeX tham chiếu (`config/preamble.tex`):
```latex
\usepackage[
  a4paper,
  top=25mm,
  bottom=25mm,
  left=30mm,
  right=20mm,
  headheight=16pt,
  footskip=12mm
]{geometry}
```

---

## 2. Phông Chữ và Định Dạng Đoạn Văn (Typography & Paragraph)

- **Phông chữ chuẩn**: **Times New Roman** (chuẩn mã ký tự Unicode). Không sử dụng Arial, Calibri hay phông chữ không chân (sans-serif) cho phần thân bài.
- **Cỡ chữ thân bài (Body Font Size)**: **$13\text{pt}$** *(Quy định bắt buộc của UTH; không được dùng 10pt hay 12pt)*.
- **Giãn dòng (Line Spacing)**: **$1.3 \text{ lines}$** (`\setstretch{1.3}`).
- **Thụt đầu dòng (First Line Indent)**: **$1.0 \text{ cm}$** (`\setlength{\parindent}{1.0cm}`).
- **Căn lề đoạn văn**: Căn đều hai bên (**Justified**).
- **Khoảng cách giữa các đoạn văn (Paragraph Spacing)**: `4pt plus 2pt minus 1pt` (`\setlength{\parskip}{4pt plus 2pt minus 1pt}`).
- Tuyệt đối không để dòng mồ côi (orphan line / widow line): cấu hình `\widowpenalty=10000`, `\clubpenalty=10000`.

---

## 3. Bố Cục Toàn Cảnh Quyển Báo Cáo (Document Structure)

Một quyển báo cáo hoặc khóa luận tốt nghiệp UTH phải tuân thủ nghiêm ngặt trình tự sắp xếp các phần sau:

```
├── PHẦN ĐẦU (FRONT MATTER - Đánh số La Mã thường: i, ii, iii...)
│   ├── Trang Bìa Chính (Khung viền đôi hoa văn góc TikZ, Logo UTH, Tên đề tài màu đỏ)
│   ├── Trang Bìa Phụ (In trên giấy trắng)
│   ├── Bảng Phân Công Nhiệm Vụ Thành Viên (MSSV, Họ tên, Chuyên ngành, Tỷ lệ %, Nhiệm vụ)
│   ├── Nhận Xét của Giảng Viên Hướng Dẫn (Đối với KLTN / Luận văn)
│   ├── Lời Cam Đoan & Lời Cảm Ơn
│   ├── Tóm Tắt (Tiếng Việt) & Abstract (Tiếng Anh) kèm Từ Khóa
│   ├── Mục Lục (Table of Contents)
│   ├── Danh Mục Hình Vẽ (List of Figures)
│   └── Danh Mục Bảng Biểu (List of Tables)
│
├── PHẦN NỘI DUNG CHÍNH (MAIN MATTER - Đánh số Ả Rập: 1, 2, 3...)
│   ├── CHƯƠNG 1: HIỂU BÀI TOÁN & BỐI CẢNH (Business Understanding / Introduction)
│   ├── CHƯƠNG 2: HIỂU DỮ LIỆU & EDA (Data Understanding & Exploratory Analysis)
│   ├── CHƯƠNG 3: CHUẨN BỊ DỮ LIỆU & KIẾN TRÚC HỒ DỮ LIỆU (Data Preparation & Lakehouse)
│   ├── CHƯƠNG 4: MÔ HÌNH HÓA & CÁC THUẬT TOÁN KHAI PHÁ (Modeling & Algorithms)
│   ├── CHƯƠNG 5: ĐÁNH GIÁ THỰC NGHIỆM HỆ THỐNG (Experimental Evaluation & Benchmarks)
│   ├── CHƯƠNG 6: TRIỂN KHAI & VẬN HÀNH HỆ THỐNG (System Deployment, Security & SOP)
│   └── CHƯƠNG 7: KẾT LUẬN & HƯỚNG PHÁT TRIỂN (Conclusion & Future Work)
│
└── PHẦN CUỐI (BACK MATTER - Tiếp tục số trang Ả Rập)
    ├── TÀI LIỆU THAM KHẢO (References - Chuẩn IEEE [1], [2]...)
    └── PHỤ LỤC (Appendices)
        ├── Phụ lục A: Ma trận Đối chiếu Nguồn gốc (Traceability Overview)
        ├── Phụ lục B: Trích đoạn Mã Nguồn Tiêu biểu (Key Code Listings)
        └── Phụ lục C: Hướng dẫn Cài đặt & Khởi chạy Nhanh (Deployment Guide)
```

---

## 4. Quy Tắc Đánh Số Trang và Phân Cấp Đề Mục (Pagination & Headings)

### 4.1. Đánh số trang (Pagination)
- **Trang bìa chính & bìa phụ**: Tuyệt đối **không hiển thị số trang** (`\thispagestyle{empty}`).
- **Phần đầu (Front Matter)**: Đánh số La Mã chữ thường (`i, ii, iii...`), bắt đầu từ trang Bảng phân công nhiệm vụ / Lời cam đoan (`\pagenumbering{roman}`). Số trang đặt căn giữa đầu trang hoặc chân trang.
- **Phần nội dung chính (Main Matter) và Phụ lục**: Đánh số Ả Rập (`1, 2, 3...`), bắt đầu lại từ **Trang 1** tại đầu Chương 1 (`\pagenumbering{arabic}`).

### 4.2. Phân cấp tiêu đề (Heading Hierarchy)
- **Tiêu đề Chương (Chapter)**:
  - Cấu trúc 2 dòng: Dòng 1 `CHƯƠNG X`, Dòng 2 `TÊN CHƯƠNG IN HOA`.
  - Cỡ chữ: **Large (16pt)**, **In đậm**, **Căn giữa**, màu đen.
  - Phía trên chương cách lề trên $10\text{pt}$, phía dưới cách $20\text{pt}$.
  - Mỗi chương bắt buộc bắt đầu ở một trang mới (`\clearpage`).
- **Mục cấp 1 (Section - X.Y)**:
  - Cỡ chữ: **14pt**, **In đậm**, **Căn trái**.
  - Ví dụ: `1.1 Bối cảnh Khai thác Dữ liệu Nghiên cứu Khoa học trong AI/DS`.
- **Mục cấp 2 (Subsection - X.Y.Z)**:
  - Cỡ chữ: **13pt**, **In đậm**, **Căn trái**.
  - Ví dụ: `1.3.1 Mục tiêu tổng thể`.
- **Mục cấp 3 (Subsubsection - X.Y.Z.T)**:
  - Cỡ chữ: **13pt**, **In nghiêng** hoặc thường đậm.
  - Hạn chế phân cấp quá 4 cấp số (không dùng 1.1.1.1.1).
- **Quy tắc chống tiêu đề mồ côi (No Orphan Headings)**: Luôn đảm bảo tiêu đề mục có ít nhất 2–3 dòng văn bản đi kèm bên dưới, nếu tiêu đề nằm ở cuối trang thì phải đẩy sang trang mới (`\needspace{6\baselineskip}`).

---

## 5. Quy Chuẩn Bảng Biểu (Tables)

1. **Vị trí tiêu đề bảng**: Bắt buộc nằm ở **PHÍA TRÊN** bảng.
   - Định dạng: `Bảng X.Y: Tên bảng mô tả nội dung` (trong đó `X` là số chương, `Y` là số thứ tự bảng trong chương). Số bảng **in đậm**, tên bảng viết hoa chữ cái đầu.
2. **Nguồn dữ liệu**: Bắt buộc ghi nguồn ở **DƯỚI** bảng (ví dụ: `Nguồn: data/gold/mining/eda_summary.json`).
3. **Độ rộng bảng (Table Width)**:
   - Chiều rộng bảng phải căn vừa vặn trong khung văn bản (`width=\textwidth` hoặc sử dụng môi trường `tabularx` với các cột tự co giãn `X`, `Y`, `L`).
   - Tuyệt đối **không để bảng tràn lề phải** (`overfull \hbox`).
4. **Bảng dài qua nhiều trang**:
   - Bắt buộc dùng môi trường `longtable`.
   - Phải lặp lại tiêu đề cột ở mỗi trang mới (`\endhead`).
   - Cuối trang phải có ghi chú `(Còn tiếp ở trang sau)` (`\endfoot`).

---

## 6. Quy Chuẩn Hình Ảnh, Biểu Đồ và Sơ Đồ (Figures & Charts)

1. **Vị trí tiêu đề hình**: Bắt buộc nằm ở **PHÍA DƯỚI** hình.
   - Định dạng: `Hình X.Y: Tên hình mô tả` (trong đó `X` là số chương, `Y` là số thứ tự hình trong chương). Số hình **in đậm**.
2. **Căn lề & Kích thước**:
   - Mọi hình ảnh phải căn giữa trang (`\centering`).
   - Tỷ lệ co giãn hợp lý: `width=0.85\textwidth` đến `0.95\textwidth`, không kéo dãn sai tỷ lệ khung hình (aspect ratio).
3. **Độ sắc nét & Định dạng file**:
   - Sử dụng định dạng vector (PDF, SVG) hoặc ảnh bitmap chất lượng cao (PNG tối thiểu 300 DPI). Tránh dùng ảnh JPEG mờ hoặc vỡ pixel.
4. **Chú thích nguồn gốc / Điều kiện đo (`ReportNote`)**:
   - Đặt ngay bên dưới caption hình bằng lệnh `\ReportNote{...}`:
     ```latex
     \ReportNote{Nguồn: gold/mining/eda_summary.json; chụp ngày 23/11/2026. Ảnh minh họa dữ liệu thực nghiệm đã lưu...}
     ```

---

## 7. Quy Chuẩn Công Thức Toán Học (Math Equations)

1. **Trình bày công thức khối**:
   - Đặt trong môi trường `equation` hoặc `align`.
   - Công thức căn giữa trang; số thứ tự đặt trong ngoặc đơn `(X.Y)` căn sát mép lề phải.
   - Phông chữ toán chuẩn LaTeX (`amsmath`, `amssymb`, `mathtools`).
2. **Quy định giải thích biến số**:
   - Ngay sau công thức toán học, bắt buộc phải có câu giải thích tường minh từng đại lượng:
     ```latex
     \begin{equation}
       s(i) = \frac{b(i) - a(i)}{\max(a(i), b(i))}
     \end{equation}
     Trong đó: $a(i)$ là khoảng cách trung bình từ mẫu $i$ đến các mẫu khác trong cùng cụm, $b(i)$ là khoảng cách từ $i$ đến cụm láng giềng gần nhất.
     ```
3. **Ký hiệu ma trận & vector**: In đậm dạng toán (`\mathbf{x}`, `\mathbf{W}` hoặc `\bm{v}`).

---

## 8. Quy Chuẩn Trích Đoạn Mã Nguồn (Code Listings)

1. **Giao diện khối mã**:
   - Nền màu xám sáng thanh lịch (`CodeBg = #F1F5F9`), khung viền xám nhạt (`BorderGray = #CBD5E1`), bo góc nhẹ hoặc phẳng.
   - Số dòng hiển thị bên trái bằng cỡ chữ nhỏ (`\tiny\color{gray}`).
   - Phông chữ: Monospace (`\ttfamily`).
2. **QUY TẮC BẤT BIẾN CHỐNG LỖI VỠ FONT TIẾNG VIỆT**:
   > [!CRITICAL]
   > Trong LaTeX, gói `listings` xử lý chuỗi UTF-8 tiếng Việt trong chú thích (comment `#`) rất kém, dẫn đến lỗi vỡ ký tự nghiêm trọng (ví dụ: `# Chạy ... với` bị biến thành `# ạChy ... ớvi`).
   > **BẮT BUỘC**: Tất cả comment trong môi trường `lstlisting` PHẢI viết bằng **ASCII tiếng Việt không dấu**!
   > - Đúng: `# Worker 1: Fetch -> Bronze + Silver papers -> embed queue`
   > - Đúng: `# Chay Qwen2.5-7B Instruct qua llama-server voi CUDA`
   > - Sai: `# Chạy Qwen2.5-7B Instruct qua llama-server với CUDA`

---

## 9. Tài Liệu Tham Khảo và Trích Dẫn (Citations & Bibliography)

1. **Chuẩn trích dẫn**: Chuẩn **IEEE** (`ieeetr` hoặc `ieee`).
2. **Định dạng trong bài**: Đặt trong ngoặc vuông số học `[1]`, `[2, 3]`, `[4--6]`.
3. **Sắp xếp danh mục**: Sắp xếp theo thứ tự xuất hiện trích dẫn trong văn bản.
4. **Đầy đủ trường thông tin**:
   - Với bài báo hội nghị/tạp chí: Tên tác giả đầy đủ, `"Tên bài báo"`, *Tên tạp chí / Kỷ yếu hội nghị*, tập, số, trang, năm xuất bản, DOI/URL.
   - Với sách/giáo trình: Tên tác giả, *Tên sách*, Nhà xuất bản, Nơi xuất bản, năm xuất bản.

---

## 10. Liêm Chính Học Thuật và Kiểm Soát Trùng Lặp (Academic Integrity)

1. **Kiểm tra trùng lặp (Turnitin)**: Tỷ lệ tương đồng tổng thể phải dưới **$20\% - 30\%$** theo quy định của Viện/Khoa.
2. **Minh bạch thực nghiệm**:
   - Tuyệt đối không "ngụy tạo" số liệu chưa đo đạc.
   - Phân biệt rõ ràng giữa:
     - Dữ liệu đo đạc thực tế trên hệ thống live.
     - Dữ liệu thuộc snapshot lịch sử (kèm mốc commit và ngày lưu).
     - Dữ liệu giả lập hoặc kết quả kế thừa từ phiên bản cũ.

---

## 11. Bộ Đoạn Mã Mẫu LaTeX Chuẩn (Ready-to-Use LaTeX Snippets)

### 11.1. Mẫu chèn Hình ảnh chuẩn UTH:
```latex
\begin{figure}[htbp]
  \centering
  \includegraphics[width=0.92\textwidth]{figures/ten_file_anh.png}
  \caption[Tên hình ngắn trong mục lục]{Tên hình đầy đủ hiển thị dưới trang}
  \ReportNote{Nguồn: Nêu rõ nguồn gốc dữ liệu, API hoặc thời điểm chụp thực nghiệm.}
  \label{fig:nhan_dinh_danh}
\end{figure}
```

### 11.2. Mẫu chèn Bảng biểu chuẩn UTH:
```latex
\begin{table}[htbp]
  \centering
  \caption{Tên bảng mô tả rõ ràng nội dung nghiên cứu}
  \label{tab:nhan_bang}
  \renewcommand{\arraystretch}{1.2}
  \begin{tabularx}{\textwidth}{|>{\centering\arraybackslash}p{2.5cm}|X|>{\centering\arraybackslash}p{3.0cm}|}
    \hline
    \textbf{Mã tiêu chí} & \textbf{Mô tả chi tiết} & \textbf{Kết quả thực nghiệm} \\
    \hline
    TC-01 & Tỷ lệ làm giàu văn bản HTML5 & 90.15\% \\
    TC-02 & Bảo toàn công thức toán LaTeX & 2,220,938 công thức \\
    \hline
  \end{tabularx}
  \ReportNote{Nguồn: Báo cáo thực nghiệm từ DuckDB OLAP trên tầng Silver.}
\end{table}
```

### 11.3. Mẫu chèn Công thức Toán học chuẩn UTH:
```latex
\begin{equation}
  \text{Score}_{\text{final}}(d) = \min\!\left(0.9999,\,\text{Score}_{\text{RRF}}(d)\left[1+\beta\min(1, \frac{PR_{\mathrm{match}}}{PR_{\max}})\right]\right)
  \label{eq:pagerank_boost}
\end{equation}
Trong đó: $\text{Score}_{\text{RRF}}(d)$ là điểm xếp hạng Reciprocal Rank Fusion, $\beta = 0.25$ là hệ số uy tín tối đa, và $PR_{\mathrm{match}}$ là điểm PageRank của tác giả đoạn trích.
```

### 11.4. Mẫu chèn Khối mã Code chuẩn UTH:
```latex
\begin{lstlisting}[language=bash, caption={Khoi chay backend va worker theo chuan SOP}, label={lst:sop_run}]
# 1. Khoi chay backend FastAPI
python -m uvicorn backend.app.main:app --host 0.0.0.0 --port 8000 --reload

# 2. Khoi chay worker embed voi Qdrant
python -m src.ingestion.queue_consumer --stage embed
\end{lstlisting}
```

---
*Tài liệu được ban hành và cập nhật phục vụ Đồ án môn học Khai phá Dữ liệu — Trường Đại học Giao thông Vận tải TP.HCM (UTH).*
