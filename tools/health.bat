@echo off
chcp 65001 >nul
echo Kiểm tra trạng thái SMART (Công nghệ tự giám sát, phân tích và báo cáo của ổ đĩa):
wmic diskdrive get model,status
echo Công cụ DISM (sửa chữa hình ảnh của Windows 10):
echo Tùy chọn CheckHealth:

DISM /Online /Cleanup-Image /CheckHealth
echo Tùy chọn ScanHealth:

DISM /Online /Cleanup-Image /ScanHealth
echo Tùy chọn RestoreHealth:

DISM /Online /Cleanup-Image /RestoreHealth
echo Quét SFC (kiểm tra tệp hệ thống)
echo Xác minh và sửa chữa hệ điều hành:

sfc /scannow