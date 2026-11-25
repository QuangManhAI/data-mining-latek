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
