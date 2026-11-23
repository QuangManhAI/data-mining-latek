# Cập nhật báo cáo ngày 23/11/2026

- Mốc mã nguồn: e828310 (05/11/2026).
- Đồng bộ schema, Silver chunks/Qdrant hydrate, hai worker/hàng đợi, lịch DAG, chunking và PCA/GMM.
- Mô tả đúng lexical scoring, response rule annotations, pool reranker và giới hạn authority.
- Chỉ giữ số liệu có artifact hoặc báo cáo benchmark; ghi rõ snapshot local, LanceDB 05/10/2026 và hiệu năng 19/10/2026.
- Loại số liệu citation/landmark và kết luận bảo đảm tuyệt đối chưa có chứng cứ; ghi mâu thuẫn SVGD trong nguồn.
- Không sửa ứng dụng, không chạy migration, không đo lại dữ liệu live.
- Chưa có XeLaTeX/BibTeX khả dụng trên máy; main.pdf được giữ nguyên bản cũ cho tới khi biên dịch source mới.
- Biên dịch từ thư mục dự án: xelatex -interaction=nonstopmode -halt-on-error main.tex; bibtex main; xelatex hai lần.
- Đã kiểm tra tĩnh cấu trúc 23 file TeX, input, hình, label/ref và citation key; chưa xác nhận bố cục qua biên dịch.
- Bổ sung citation cho tài liệu thuật toán đã có trong references.bib để phần tài liệu tham khảo được tạo khi chạy BibTeX.
- compile.bat dừng ngay nếu XeLaTeX/BibTeX lỗi, tránh báo thành công dựa trên PDF cũ.
- Gói main_source_updated_20261123.zip chứa source và tài nguyên biên dịch, không kèm PDF cũ.
