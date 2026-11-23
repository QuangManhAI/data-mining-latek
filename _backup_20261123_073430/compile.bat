@echo off
chcp 65001 > nul
echo ==============================================================================
echo [UTH-DATA-MINING] KỊCH BẢN BIÊN DỊCH BÁO CÁO LATEX (XeLaTeX)
echo Đề tài: Khai thác Dữ liệu Nghiên cứu Khoa học Thời gian thực và Hệ thống RAG
echo Nhóm thực hiện: Nhóm 1 - GVHD: TS. Trần Thế Vinh
echo ==============================================================================
echo.

where xelatex >nul 2>nul
if %errorlevel% neq 0 (
    echo [CẢNH BÁO] Không tìm thấy lệnh 'xelatex' trong biến môi trường PATH của hệ thống.
    echo.
    echo BẠN CÓ THỂ BIÊN DỊCH THEO 3 CÁCH RẤT DỄ DÀNG SAU ĐÂY:
    echo ------------------------------------------------------------------------------
    echo 1. SỬ DỤNG OVERLEAF (Khuyến nghị - Nhanh nhất 1-Click):
    echo    - Nén toàn bộ thư mục này thành file .zip.
    echo    - Truy cập https://www.overleaf.com -> New Project -> Upload Project.
    echo    - Mở Menu ở góc trên bên trái -> Compiler: Chọn "XeLaTeX" -> Recompile.
    echo.
    echo 2. SỬ DỤNG VS CODE:
    echo    - Cài extension "LaTeX Workshop".
    echo    - Mở file main.tex và nhấn Ctrl+Alt+B (hoặc chọn Build with XeLaTeX).
    echo.
    echo 3. CÀI ĐẶT MIKTEX / TEX LIVE TRÊN WINDOWS:
    echo    - Tải MiKTeX tại: https://miktex.org/download
    echo    - Sau khi cài đặt xong, mở lại cửa sổ CMD/PowerShell và chạy lại file compile.bat này!
    echo ------------------------------------------------------------------------------
    echo.
    pause
    exit /b 1
)

echo [BƯỚC 1/4] Chạy XeLaTeX lần 1 để nạp nhãn và mục lục...
xelatex -synctex=1 -interaction=nonstopmode main.tex

echo [BƯỚC 2/4] Chạy BibTeX để đồng bộ trích dẫn tài liệu tham khảo...
bibtex main

echo [BƯỚC 3/4] Chạy XeLaTeX lần 2 để cập nhật chỉ mục và trích dẫn...
xelatex -synctex=1 -interaction=nonstopmode main.tex

echo [BƯỚC 4/4] Chạy XeLaTeX lần 3 để hoàn thiện liên kết chéo và số trang...
xelatex -synctex=1 -interaction=nonstopmode main.tex

if exist main.pdf (
    echo.
    echo ==============================================================================
    echo [THÀNH CÔNG] File báo cáo đã được biên dịch hoàn tất: main.pdf
    echo ==============================================================================
    start main.pdf
) else (
    echo.
    echo [LỖI] Quá trình biên dịch gặp lỗi. Vui lòng kiểm tra file main.log để xem chi tiết.
)

pause
