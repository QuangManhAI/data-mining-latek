# Ảnh chụp tự động cho báo cáo — 23/11/2026

Bảy PNG được chụp từ giao diện React đang chạy với dữ liệu đọc thật từ kho lưu trữ, chế độ sáng, viewport 1920×900, độ phân giải 2×. Ảnh chỉ lấy vùng nội dung; hai ảnh tương quan chỉ lấy panel ma trận. Không dùng mock, không kích hoạt mining/thu thập và chưa chèn vào LaTeX.

## Danh sách ảnh

### 01_pipeline_ui.png
[Giao diện sơ đồ luồng hai hàng đợi](01_pipeline_ui.png)

Ảnh giao diện kiến trúc hiện tại. Airflow/RabbitMQ không hoạt động trong phiên chụp; Qdrant trả 502. Nhãn hiệu năng cố định trên canvas không phải kết quả benchmark. Không dùng ảnh để khẳng định toàn hệ thống đang vận hành.

Nguồn: /api/ingestion/status, /api/ingestion/stream
Chụp lúc (UTC): 2026-11-23T01:20:56.090599+00:00

### 03_eda_silver_overview.png
[EDA Silver: phân bố chuyên ngành và thời gian](03_eda_silver_overview.png)

Dữ liệu artifact EDA lưu ngày 17/10/2026: 13.000 bài, 2.825.871 công thức. Đây là ảnh chụp mới của kết quả đã lưu; không phải lần chạy lại EDA hôm nay.

Nguồn: /api/mining/eda, gold/mining/eda_summary.json
Chụp lúc (UTC): 2026-11-23T01:20:59.260355+00:00

### 04_pearson_correlation.png
[Ma trận tương quan Pearson r](04_pearson_correlation.png)

Ma trận và p-value lấy từ artifact EDA đã lưu ngày 17/10/2026. Chỉ chụp panel ma trận; loại panel ANOVA bên cạnh vì các số ANOVA đang được viết cố định trong frontend. Các lời diễn giải vẫn cần đối chiếu hệ số.

Nguồn: /api/mining/eda, gold/mining/eda_summary.json:correlations.pearson
Chụp lúc (UTC): 2026-11-23T01:21:00.836841+00:00

### 05_spearman_correlation.png
[Ma trận tương quan Spearman ρ](05_spearman_correlation.png)

Ma trận và p-value lấy từ artifact EDA đã lưu ngày 17/10/2026. Chỉ chụp panel ma trận; loại panel ANOVA bên cạnh vì các số ANOVA đang được viết cố định trong frontend. Các lời diễn giải vẫn cần đối chiếu hệ số.

Nguồn: /api/mining/eda, gold/mining/eda_summary.json:correlations.spearman
Chụp lúc (UTC): 2026-11-23T01:21:02.315003+00:00

### 06_gmm_clusters.png
[GMM: không gian cụm từ artifact đã lưu](06_gmm_clusters.png)

Artifact GMM lưu ngày 20/10/2026, 800 mẫu, K=6. UI vẫn ghi SVD và có các nhãn chủ đề cố định; ảnh không xác minh pipeline PCA hiện tại hoặc tính đúng của tên chủ đề.

Nguồn: /api/mining/pillars/clusters, gold/mining/clusters.json
Chụp lúc (UTC): 2026-11-23T01:21:04.983425+00:00

### 02_bronze_raw_metadata.png
[Ví dụ bản ghi metadata thô Bronze](02_bronze_raw_metadata.png)

Ví dụ một bản ghi thực đọc từ kho; đây là minh chứng cấu trúc raw metadata, không phải thống kê EDA Bronze. Không suy ra số bài từ số object trong Explorer.

Nguồn: /api/explorer/tree, /api/explorer/preview, bronze/tier1/openalex_W2001598892.json
Chụp lúc (UTC): 2026-11-23T01:21:12.927284+00:00

### 07_gold_mining_manifest.png
[Manifest sản phẩm khai phá Gold](07_gold_mining_manifest.png)

Manifest lịch sử trên kho Gold. Trường lancedb_source phản ánh kiến trúc tại lần chạy cũ; không phải xác nhận trạng thái Qdrant hiện tại.

Nguồn: /api/explorer/preview, gold/mining/mining_manifest.json
Chụp lúc (UTC): 2026-11-23T01:21:17.747030+00:00

## Lưu ý trước khi đưa vào báo cáo

- EDA trên kho có 13.000 bài; khác snapshot local 10.000 bài trong báo cáo. Cần ghi rõ lần đo nếu sử dụng ảnh mới.
- Tổng quan EDA ghi 13.000 full-text nhưng enrichment 89,38%; nhãn UI FULL-TEXT & RAG EMBEDDED không chứng minh 13.000 bài đã có vector.
- Ảnh GMM lấy artifact 800 mẫu ngày 20/10/2026; UI ghi SVD, khác mô tả PCA trong code mới. Không gán metric này cho lần chạy PCA hiện tại.
- Các nhãn ANOVA có số cố định đã được loại khỏi ảnh tương quan. Các annotation/nhãn chủ đề khác vẫn cần được xem như lời diễn giải giao diện.
- Qdrant HTTP 502 và LLM không hoạt động: không có ảnh vector audit live hoặc câu trả lời RAG.

## Chưa chụp được

- Gold vector audit / Qdrant live: Collection endpoint trả HTTP 502. Artifact EDA hiện chứa IVF-PQ cũ, total_vectors=9 và tổng chunk theo section không khớp; không dùng màn audit làm bằng chứng Qdrant hiện tại.
- Câu trả lời RAG có dẫn nguồn: Dịch vụ LLM localhost:9001 không hoạt động; embedding thiếu dependency einops và Qdrant trả HTTP 502. Không tạo câu trả lời giả.

## Bằng chứng và sử dụng

- manifest.json lưu nguồn, thời điểm chụp và SHA-256 từng ảnh. evidence/ lưu response EDA, GMM và preview Bronze dùng kiểm tra nguồn.
- Chọn ảnh cần dùng và dùng chú thích tương ứng ở trên; không tự thay số liệu Chương 2/4 bằng số mới nếu chưa thống nhất snapshot.
- 03_eda_silver_overview.png và 04/05_correlation phù hợp minh họa EDA snapshot 17/10/2026. 02 là ví dụ raw metadata; 07 là ví dụ artifact Gold, không thay thế EDA Gold vector.
- 01 minh họa giao diện kiến trúc khi một số dịch vụ không truy cập được. 06 minh họa kết quả GMM đã lưu, không chứng minh số cụm tối ưu cho code hiện tại.
- captures.tex chứa các figure mẫu với chú thích nguồn; chưa được input vào main.tex.
