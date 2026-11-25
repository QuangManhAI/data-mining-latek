# Hoàn thiện báo cáo ngày 23/11/2026

- Mốc mã nguồn: e828310 (05/11/2026); giữ các snapshot/benchmark lịch sử đã xác minh.
- PDF đầu vào đã được người dùng biên dịch ngày 23/11/2026, gồm 41 trang. Bản PDF này được sao lưu và giữ nguyên cho tới khi source sửa format được biên dịch thành công.
- Sửa nguồn gây tràn lề: caption ngắn, đường dẫn cho phép ngắt dòng, ghi nguồn bên dưới bảng; giữ Times New Roman 13pt, giãn dòng 1.3 và lề cũ.
- Chuyển bảng tham số sang longtable có lặp tiêu đề; bổ sung kiểm soát vị trí float và khoảng trống trước tiêu đề.
- Đồng bộ tên TÀI LIỆU THAM KHẢO, Đoạn mã và số code trong phụ lục B.1, B.2...
- Thêm phương pháp Pearson/Spearman và p-value đã có trong EDA; không thêm hệ số thực nghiệm chưa được kiểm chứng.
- Giữ hai ảnh tư liệu lưu ngày 28/10/2026, ghi thời điểm và giới hạn; không thêm ảnh slide ghi SVD/metric khác snapshot.
- Làm rõ hai hàng đợi/hai worker và Silver hydrate trong sơ đồ; thêm hai trích đoạn source có provenance trong listings/.
- Không sửa ứng dụng, không khởi chạy dịch vụ và không chạy lại mining/benchmark.
- Môi trường hiện chưa có XeLaTeX/BibTeX khả dụng: bố cục sau sửa cần được kiểm tra trên PDF sau biên dịch. Kiểm tra tĩnh không thay thế kiểm tra PDF.
- Gói main_source_formatted_20261123.zip chỉ chứa source/tài nguyên để biên dịch, không chứa PDF đầu vào.
- Biên dịch bằng compile.bat hoặc XeLaTeX -> BibTeX -> XeLaTeX hai lần; cần package needspace và placeins (thường có trong TeX Live/Overleaf).
- Đã kiểm tra 24 file TeX: cấu trúc ngoặc/môi trường, input, ảnh, citation và label/ref; kiểm tra cú pháp hai đoạn Python và đối chiếu dòng source, chiều rộng bảng cố định, tính toàn vẹn ZIP. Chưa xác nhận layout PDF sau biên dịch.
