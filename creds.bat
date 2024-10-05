@echo off

:start
cls
title Account Password Logger
chcp 65001 >nul
echo.
echo Chọn tài khoản
echo =================
echo 1. Thêm một tài khoản
echo 2. Xem tất cả các tài khoản đã lưu
echo 3. Thay đổi thông tin đăng nhập của tài khoản
set /p choice=^> 
if %choice%==1 goto add
if %choice%==2 if exist accs.txt goto view
if %choice%==2 if not exist accs.txt echo Bạn vẫn chưa lưu bất kỳ mật khẩu nào. & pause >nul
if %choice%==3 goto mod
goto start

:add
cls
call logo.bat
echo.
echo TUYÊN BỐ MIỄN TRỪ TRÁCH NHIỆM: Thông tin đăng nhập của bạn sẽ không được mã hóa, vui lòng không lưu trữ chúng ở nơi dễ thấy.
echo.
echo Vui lòng nhập loại tài khoản (Google, YouTube, GitHub etc.)
set /p type=^> 
echo Vui lòng nhập tên người dùng cho tài khoản.
set /p user=^> 
echo Vui lòng nhập mật khẩu cho "%user%" 
set /p pass=^> 
echo Có đúng như vậy không? ([Y]es/[N]o) ^| Nhập: %type%, Username: %user%, Password: %pass%
set /p confirmation=^> 
if /i %confirmation%==N cls & echo Vui lòng thử lại. & goto add
if not exist accs.txt echo Type     ^|     Username     ^|     Password>>accs.txt & echo =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=>>accs.txt
echo %type%     ^|     %user%     ^|     %pass%>>accs.txt
echo Success!
pause
goto start

:view
cls

echo Saved Accounts:
echo ================
echo.
type accs.txt
echo.
pause
goto start

:mod
cls

echo.
echo Mở notepad..
notepad accs.txt
pause
goto start