@echo off
title Terminal
chcp 65001 >nul

:: Enable delayed expansion
setlocal enabledelayedexpansion
:hello
:: Clear the screen
cls

:: Display custom header similar to Kali Linux
echo.
echo [34m                               ┌─┐┌─┐┌┬┐┌┬┐┌─┐┌┐┌┌┬┐  ┌─┐┬─┐┌─┐┌┬┐┌─┐┌┬┐[0m
echo [94m                               │  │ │││││││├─┤│││ ││  ├─┘├┬┘│ ││││├─┘ │ [0m
echo [96m                               └─┘└─┘┴ ┴┴ ┴┴ ┴┘└┘─┴┘  ┴  ┴└─└─┘┴ ┴┴   ┴ [0m
echo.

:: Set colors
set "SPRINGGREEN1=[32m"
set "RED=[31m"
set "BRIGHTWHITE=[94m"
set "BRIGHTRED=[91m"
set "DEFAULT=[39m"

:: Input loop
:input
if "%user%"=="" set user=%username%
if "%promptchar%"=="" set promptchar=$
if "%color%"=="" set color=%SPRINGGREEN1%

:: Color and format the prompt line
if "%user%"=="root" (
    set "promptColor=%BRIGHTRED%"
) else (
    set "promptColor=%color%"
)

echo %promptColor%┌──(%BRIGHTWHITE%%user%㉿%computername%%promptColor%)-[%DEFAULT%~%promptColor%][0m-[32m[[0m%cd%[32m][0m
set /p cmd="[32m└─[0m[94m%promptchar% %promptColor%[0m"

:: Check for Linux-like commands and translate them
if /i "%cmd%"=="clear" (
    cls
    goto input
) else if /i "%cmd%"=="shutdown" (
    shutdown /s /f /t 0
) else if /i "%cmd%"=="ls" (
    dir
    goto input
) else if /i "%cmd%"=="design" (
    goto gradient
) else if /i "%cmd%"=="pwd" (
    cd
    goto input
) else if /i "%cmd%"=="exit" (
    exit
) else if /i "%cmd%"=="cp" (
    set /p src="Source file: "
    set /p dest="Destination: "
    copy "%src%" "%dest%"
    goto input
) else if /i "%cmd%"=="mv" (
    set /p src="Source file: "
    set /p dest="Destination: "
    move "%src%" "%dest%"
    goto input
) else if /i "%cmd%"=="rm" (
    set /p file="File to delete: "
    del "%file%"
    goto input
) else if /i "%cmd%"=="mkdir" (
    set /p dir="Directory name: "
    mkdir "%dir%"
    goto input
) else if /i "%cmd%"=="rmdir" (
    set /p dir="Directory name: "
    rmdir /s /q "%dir%"
    goto input
) else if /i "%cmd%"=="cat" (
    set /p file="File to display: "
    type "%file%"
    goto input
) else if /i "%cmd%"=="echo" (
    set /p text="Text to echo: "
    echo %text%
    goto input
) else if /i "%cmd%"=="touch" (
    set /p file="File to create: "
    type nul > "%file%"
    goto input
) else if /i "%cmd%"=="nmap" (
    set counter=0
    for /L %%i in (1,1,254) do (
        ping -n 1 -w 100 192.168.1.%%i > nul
        if not errorlevel 1 (
            echo [!] 192.168.1.%%i :[92monline[0m 
            set /a counter+=1
        )
    )
    echo.
    echo [*] Nmap done: !counter! hosts up 
    pause
    goto input
) else if /i "%cmd%"=="su -" (
    set /p password="Password: "
    set "password=!password:~0,7!"
    if "!password!"=="kalicmd" (
        cls
        goto rootprompt
    ) else (
        echo Invalid password
        pause
        goto input
    )
)

:: Extended commands
if /i "%cmd%"=="nettool" (
    goto nettool
)

:: Execute entered command
%cmd%
goto input
@echo off
title Terminal
chcp 65001 >nul

:: Enable delayed expansion
setlocal enabledelayedexpansion
goto nettool
:nettool
cls
color 0D
echo.
echo                                             "  (       ,.     .      )        .    "  (   .             │ 
echo                                              ("     )  )'     ,'        )  . (     '                    │ Versions :  2.1
echo                                           ; )  ' (( (" )    ;(,     ((  (  ;)  "  )"   "  )"            ├───────────────────
echo                                        ; ) "., ,._'_.,)_(..,( . )_  _' )_') (. _..( '..    ;(,          │  Running on :
echo                                        ███╗   ██╗███████╗████████╗████████╗ ██████╗  ██████╗ ██╗        │   %username%'s PC
echo                                        ████╗  ██║██╔════╝╚══██╔══╝╚══██╔══╝██╔═══██╗██╔═══██╗██║        │ 
echo                                        ██╔██╗ ██║█████╗     ██║      ██║   ██║   ██║██║   ██║██║        ├──────────────────── 
echo                                        ██║╚██╗██║██╔══╝     ██║      ██║   ██║   ██║██║   ██║██║        │Made by : Amsosc@re
echo                                        ██║ ╚████║███████╗   ██║      ██║   ╚██████╔╝╚██████╔╝███████╗   │
echo                                        ╚═╝  ╚═══╝╚══════╝   ╚═╝      ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝   │
echo.
echo [?] Nhập "list" để hiện thị danh sách các lệnh.                                                      -Công cụ hỗ trợ mạng-
echo.
:nettoolmenu
cls
color 0D
echo.
echo                                             "  (       ,.     .      )        .    "  (   .             │ 
echo                                              ("     )  )'     ,'        )  . (     '                    │ Versions :  2.1
echo                                           ; )  ' (( (" )    ;(,     ((  (  ;)  "  )"   "  )"            ├───────────────────
echo                                        ; ) "., ,._'_.,)_(..,( . )_  _' )_') (. _..( '..    ;(,          │  Running on :
echo                                        ███╗   ██╗███████╗████████╗████████╗ ██████╗  ██████╗ ██╗        │   %username%'s PC
echo                                        ████╗  ██║██╔════╝╚══██╔══╝╚══██╔══╝██╔═══██╗██╔═══██╗██║        │ 
echo                                        ██╔██╗ ██║█████╗     ██║      ██║   ██║   ██║██║   ██║██║        ├──────────────────── 
echo                                        ██║╚██╗██║██╔══╝     ██║      ██║   ██║   ██║██║   ██║██║        │Made by : Amsosc@re
echo                                        ██║ ╚████║███████╗   ██║      ██║   ╚██████╔╝╚██████╔╝███████╗   │
echo                                        ╚═╝  ╚═══╝╚══════╝   ╚═╝      ╚═╝    ╚═════╝  ╚═════╝ ╚══════╝   │
echo.
echo [?] Nhập "list" để hiện thị danh sách các lệnh.                                                     -Công cụ hỗ trợ mạng-
echo [95m[*] Chạy dưới quyền [0m[91mADMIN [0m 
echo.
set /p "command=[97m[Nettool]# [0m "

:execute
if /i "%command%"=="list" (
echo [95m  ╔═══                                                              ═══╗  ╔═══                                                     ═══╗   [0m 
echo [95m  ║   listen    : Tìm các mạng và bssid, thông tin của chúng           ║  ║    battery   : Kiểm tra phần trăm pin hiện tại            ║   [0m
echo [95m      dos       : Ping ip chỉ định                                             time      : Hiển thị ngày và giờ hiện tại                  [0m
echo [95m      pass      : Hiển thị liên quan đến các wifi đã đăng nhập                 netsh     : Quản lý cấu hình mạng                          [0m   
echo [95m      scan      : Quét mạng của bạn để tìm các địa chỉ IP                      nslookup  : Kiểm tra và giải quyết hostname thành IP       [0m
echo [95m      ports     : Quét các cổng                                                getmac    : Hiển thị địa chỉ MAC của máy tính              [0m
echo [95m      locate    : Tìm vị trí của một địa chỉ IP                                pathping  : Kiểm tra đường đi và tình trạng mạng           [0m
echo [95m      ip        : Hiển thị địa chỉ IP công khai và riêng tư của bạn            tracert   : Truy vết lộ trình tới địa chỉ IP               [0m
echo [95m      clear     : Xóa màn hình                                                 ipch4*    : Đổi địa chỉ IPV4                               [0m
echo [95m      exit      : Thoát khỏi chương trình                                      block     : Block hoặc unblock website                     [0m
echo [95m      hwid      : Kiểm tra và hiển thị thông tin phần cứng                     deauth    : Tấn công deauth, ngắt kết nối thiết bị         [0m
echo [95m  ║   sysinfo   : Kiểm tra thông tin hệ thống                          ║  ║    check     : Hiển thị thống kê mạng                     ║   [0m
echo [95m  ╚═══                                                              ═══╝  ╚═══                                                     ═══╝   [0m
set /p "command=[97m[Nettool]#  [0m"
)

if /i "%command%"=="listen" goto listen
if /i "%command%"=="locate" goto locate
if /i "%command%"=="trace" goto trace
if /i "%command%"=="scan" goto scan
if /i "%command%"=="ports" goto ports
if /i "%command%"=="ip" goto ip
if /i "%command%"=="clear" cls & goto nettoolmenu
if /i "%command%"=="exit" goto spe
if /i "%command%"=="battery" goto battery
if /i "%command%"=="time" goto time
if /i "%command%"=="netsh" goto netsh
if /i "%command%"=="nslookup" goto nslookup
if /i "%command%"=="getmac" goto getmac
if /i "%command%"=="pathping" goto pathping
if /i "%command%"=="tracert" goto tracert
if /i "%command%"=="ipch4" goto ipch4
if /i "%command%"=="sysinfo" goto sysinfo
if /i "%command%"=="monitor" goto monitor
if /i "%command%"=="block" goto block
if /i "%command%"=="dos" goto dos
if /i "%command%"=="pass" goto pass
if /i "%command%"=="hwid" goto hwid
if /i "%command%"=="deauth" goto deauth
if /i "%command%"=="sysinfo" goto sysinfo
if /i "%command%"=="check" goto check
goto nettoolmenu
:check 
start cmd.exe /k " color A & echo [+]═════════[ Thống kê mạng ]═════════[+] & netstat -s "

goto nettoolmenu
:sysinfo
cls
color 0D
echo ┌══════════════════════════════════════════════════════════════┐
echo █                                                              █
echo █                         sysinfo                              █
echo █                                                              █
echo █            Kiểm tra thông tin hệ thống của máy               █
echo └══════════════════════════════════════════════════════════════┘
echo Vui lòng chờ... Đang thu thập thông tin hệ thống.
echo ============================================
echo Thông tin HỆ ĐIỀU HÀNH
echo --------------------------------------------
systeminfo | findstr /c:"OS Name"
systeminfo | findstr /c:"OS Version"
echo ============================================
echo Thông tin BIOS
echo --------------------------------------------
systeminfo | findstr /c:"System Type"
echo ============================================
echo Thông tin BỘ NHỚ
echo --------------------------------------------
systeminfo | findstr /c:"Total Physical Memory"
echo ============================================
echo Thông tin CPU
echo --------------------------------------------
wmic cpu get name
echo ============================================
echo Thông tin ĐỊA CHỈ MẠNG L3
echo --------------------------------------------
ipconfig | findstr IPv4
ipconfig | findstr IPv6

echo [7;95m Bấm bất cứ phím nào để tiếp tục [0m && pause >nul
goto nettoolmenu
:pass
cls
@echo off
echo Bạn muốn làm gì : 
ping localhost -n 1 >nul
echo [90;1m#═╦═══════»[0m  [92m[List các wifi đã đăng nhập][0m [95m[1][0m
ping localhost -n 1 >nul
echo   [90;1m╚═════╦═══════»[0m  [92m[Hiển thị mật khẩu wifi đã đăng nhập theo chỉ định][0m  [95m[2][0m
ping localhost -n 1 >nul
echo|set /p=".        [90;1m╚══>[0m"

set /p input=" "

if "%input%"=="1" (
 goto log
)
if "%input%"=="2" (
 goto login
)
goto pass


:log
netsh wlan show profile 
echo [7;95m Bấm bất cứ phím nào để tiếp tục [0m && pause >nul
goto nettoolmenu

:login
rem Nhập tên mạng Wi-Fi
set /p ssid="[95mNhập tên mạng Wi-Fi: [0m"

rem Lấy thông tin của mạng Wi-Fi
netsh wlan show profile name="%ssid%" key=clear | findstr /C:"Key Content"

rem Kiểm tra nếu không tìm thấy mật khẩu
if %errorlevel% neq 0 (
    echo  [1;91m Không thấy mật khẩu cho mạng "%ssid%" [0m
)

echo [7;95m Bấm bất cứ phím nào để tiếp tục [0m && pause >nul
goto nettoolmenu

:spe 
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.MessageBox]::Show('Tắt hệ thống .... Bye.', 'Nettool system', 'OK', [System.Windows.Forms.MessageBoxIcon]::Information);}"
echo Tắt hệ thống .... Bye. (-_-)
echo [7;95m Bấm bất cứ phím nào để tiếp tục [0m && pause >nul
goto hello
:dos
set /p target="Nhập địa chỉ IP cần ping: "
set /p number="Nhập số gói tin sẽ được gửi đến: "
set "hosts= %target% "

rem Số lần ping mỗi địa chỉ
set "ping_count= %number%"
Color C
rem Vòng lặp qua danh sách các hosts
for %%h in (%hosts%) do (
    echo Pinging %%h %ping_count% times...
    for /L %%i in (1,1,%ping_count%) do (
        ping -n 1 %%h >nul
        echo Ping %%h - Attempt %%i/%ping_count%
    )
    echo Finished pinging %%h
)
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing; $notify = New-Object System.Windows.Forms.NotifyIcon; $notify.Icon = [System.Drawing.SystemIcons]::Information; $notify.Visible = $true; $notify.ShowBalloonTip(0, 'Nettool', 'Đã ping xong đối tượng', [System.Windows.Forms.ToolTipIcon]::Info)}"
echo Đã ping xong 
echo [7;95m Bấm bất cứ phím nào để tiếp tục [0m && pause >nul
goto nettoolmenu
:listen
cls 
echo [+]═════════[ Hiển thị các mạng tìm được trong khu vực ]═════════[+]
netsh wlan show networks mode=bssid
echo [7;95m Bấm bất cứ phím nào để tiếp tục [0m && pause >nul
goto nettoolmenu

:locate
cls
set /p "locateip=Nhập địa chỉ IP để tìm vị trí: "
echo Tìm vị trí của %locateip%...
curl ipinfo.io/%ip%
:: Add your code for locating IP address here
echo [7;95m Bấm bất cứ phím nào để tiếp tục [0m && pause >nul
goto nettoolmenu

:hostip
cls
set /p "hostname=Nhập hostname để chuyển đổi thành IP: "
echo Đang chuyển đổi hostname %hostname% thành IP...
nslookup %hostname%
echo [7;95m Bấm bất cứ phím nào để tiếp tục [0m && pause >nul
goto nettoolmenu

:trace
cls
set /p "traceip=Nhập địa chỉ IP để truy vết: "
tracert %traceip%
echo [7;95m Bấm bất cứ phím nào để tiếp tục [0m && pause >nul
goto nettoolmenu

:scan
@echo off
setlocal enabledelayedexpansion

:menu1
cls
color 0D
echo [+]═════════[ Scan options ]═════════[+]
echo  Bạn muốn làm gì :
ping localhost -n 1 >nul
echo [90;1m#═╦═══════»[0m  [92m[Tìm các thiết bị online trên mạng][0m [95m[1][0m
ping localhost -n 1 >nul
echo   [90;1m╚═════╦═══════»[0m  [92m[Kiểm tra trạng thái kết nối của một IP][0m  [95m[2][0m
ping localhost -n 1 >nul
echo   [90;1m      ╚═════╦═══════»[0m  [92m[exit][0m  [95m[0][0m
ping localhost -n 1 >nul
echo|set /p=".              [90;1m╚══>[0m"

set /p input=" "
echo 1. Tìm các thiết bị online trên mạng
echo 2. Kiểm tra trạng thái kết nối của một IP
echo 0. Thoát
if "%input%"=="1" goto scan_network
if "%input%"=="2" goto check_ip_status
if "%input%"=="0" goto nettoolmenu

:scan_network
@echo off
chcp 65001 >nul
cls

echo [+]═════════[ Các thiết bị online tìm được trên mạng của bạn ]═════════[+]
echo.

REM Đặt biến đếm để đếm số thiết bị
set counter=0

REM Ping tất cả các địa chỉ IP trong dải mạng
for /L %%i in (1,1,254) do (
    ping -n 1 -w 100 192.168.1.%%i > nul
)

echo.
REM In tiêu đề bảng với ASCII giống hình
echo   ╔══════════════════╦══════════════════════╗
echo   ║   IP Address     ║     Mac Address      ║
echo   ╠══════════════════╬══════════════════════╣

REM Lặp qua các địa chỉ ARP và hiển thị kết quả
for /f "tokens=1,2 delims= " %%a in ('arp -a ^| find "dynamic"') do (
    set "ip=%%a"
    set "mac=%%b"
    call :PrintAligned !ip! !mac!
    set /a counter+=1
)

REM In dòng kết thúc bảng
echo   ╚══════════════════╩══════════════════════╝

echo.
echo Number of hosts up: %counter%

REM Hiển thị thông báo qua Windows
powershell -Command "& {Add-Type -AssemblyName System.Windows.Forms; Add-Type -AssemblyName System.Drawing; $notify = New-Object System.Windows.Forms.NotifyIcon; $notify.Icon = [System.Drawing.SystemIcons]::Information; $notify.Visible = $true; $notify.ShowBalloonTip(0, 'Nettool', 'Đã quét mạng xong', [System.Windows.Forms.ToolTipIcon]::Info)}"

echo [7;95m Bấm bất cứ phím nào để tiếp tục [0m && pause >nul
goto menu1

REM Hàm để căn chỉnh và in địa chỉ IP và MAC
:PrintAligned
    setlocal enabledelayedexpansion
    set "ipAddress=%1"
    set "macAddress=%2"

    REM Căn chỉnh IP Address với độ dài 15 ký tự
    set "ipAddress=!ipAddress:~0,15!"
    for /L %%i in (1,1,15) do if "!ipAddress:~%%i,1!"=="" set "ipAddress=!ipAddress! "

    REM Căn chỉnh Mac Address với độ dài 19 ký tự
    set "macAddress=!macAddress:~0,19!"
    for /L %%i in (1,1,19) do if "!macAddress:~%%i,1!"=="" set "macAddress=!macAddress! "

    REM In ra dòng đã căn chỉnh với đường viền
    echo   ║ !ipAddress! ║ !macAddress! ║

    endlocal  
exit /b
goto menu1

:check_ip_status
cls
color 0D
echo [+]═════════[ Kiểm tra trạng thái kết nối của một IP ]═════════[+]
:: Nhập địa chỉ IP từ người dùng
color 0D
echo  
set /p ip="Nhập địa chỉ IP cần kiểm tra: "

:: Đặt số lần thử và thời gian chờ (timeout) giữa các lần ping
set attempts=3
set timeout=1000

:: Khởi tạo biến
set timeout_count=0
set unreachable=false
set reachable=false

:: Thực hiện lệnh ping và kiểm tra kết quả
for /L %%i in (1,1,%attempts%) do (
    ping -n 1 -w %timeout% %ip% | findstr /i "Destination host unreachable" >nul
    if not errorlevel 1 (
        set unreachable=true
        goto :check_status
    )
    
    ping -n 1 -w %timeout% %ip% | findstr /i "Request Timed Out" >nul
    if not errorlevel 1 (
        set /a timeout_count+=1
    )
    
    ping -n 1 -w %timeout% %ip% | findstr /i "Reply from" >nul
    if not errorlevel 1 (
        set reachable=true
    )
)

:check_status
if "%unreachable%" == "true" (
    echo %ip% is unknown
) else if "%timeout_count%" == "%attempts%" (
    echo Host [95m%ip% :[0m [1;91moffline[0m
) else if "%reachable%" == "true" (
    echo Host [95m%ip% :[0m [1;92monline[0m
) else (
    echo Host [95m%ip% :[0m  [96munreachable[0m
)

:: Dừng chương trình để người dùng xem kết quả
echo [7;95m Bấm bất cứ phím nào để tiếp tục [0m && pause >nul
goto menu1



:ports
cls
set /p "targetip=Nhập địa chỉ IP để quét các cổng: "
echo Quét các cổng của %targetip%...
netstat 
: Add your code for scanning ports here
echo [7;95m Bấm bất cứ phím nào để tiếp tục [0m && pause >nul
goto nettoolmenu

:ip
cls
echo Địa chỉ IP công khai và riêng tư của bạn:
curl ifconfig.me
ipconfig
:: Add your code for displaying IP addresses here
echo [7;95m Bấm bất cứ phím nào để tiếp tục [0m && pause >nul
goto nettoolmenu

:battery
cls
echo Kiểm tra phần trăm pin hiện tại:
for /f "tokens=2 delims==" %%i in ('wmic path win32_battery get estimatedchargeremaining /format:list') do set "battery=%%i"
echo Phần trăm pin hiện tại: %battery%%
battery-report.html
:: Add your code for checking battery percentage here
echo [7;95m Bấm bất cứ phím nào để tiếp tục [0m && pause >nul
goto nettoolmenu

:time
cls
:: Lấy ngày và giờ hiện tại
for /f "delims=" %%a in ('wmic os get localdatetime ^| find "."') do (
    set "dt=%%a"
)

:: Tách ngày và giờ từ chuỗi nhận được
set "year=!dt:~0,4!"
set "month=!dt:~4,2!"
set "day=!dt:~6,2!"
set "hour=!dt:~8,2!"
set "minute=!dt:~10,2!"
set "second=!dt:~12,2!"

:: Hiển thị ngày và giờ
echo Ngày giờ hiện tại: !year!-!month!-!day! !hour!:!minute!:!second!
echo [7;95m Bấm bất cứ phím nào để tiếp tục [0m && pause >nul
goto nettoolmenu

:netsh
cls
echo Quản lý cấu hình mạng:
netsh
echo [7;95m Bấm bất cứ phím nào để tiếp tục [0m && pause >nul
goto nettoolmenu

:nslookup
cls
set /p "lookuphost=Nhập hostname để kiểm tra: "
nslookup %lookuphost%
echo [7;95m Bấm bất cứ phím nào để tiếp tục [0m && pause >nul
goto nettoolmenu

:getmac
cls
echo Địa chỉ MAC của máy tính:
getmac
echo [7;95m Bấm bất cứ phím nào để tiếp tục [0m && pause >nul
goto nettoolmenu

:pathping
cls
set /p "pingip=Nhập địa chỉ IP để kiểm tra đường đi: "
pathping %pingip%
echo [7;95m Bấm bất cứ phím nào để tiếp tục [0m && pause >nul
goto nettoolmenu

:tracert
cls
set /p "tracertip=Nhập địa chỉ IP để truy vết lộ trình: "
tracert %tracertip%
echo [7;95m Bấm bất cứ phím nào để tiếp tục [0m && pause >nul
goto nettoolmenu

:netstatus
cls
echo Kiểm tra trạng thái kết nối Internet:
ping google.com
echo [7;95m Bấm bất cứ phím nào để tiếp tục [0m && pause >nul
goto nettoolmenu

:sysinfo
cls
echo Thông tin hệ thống:
systeminfo
echo [7;95m Bấm bất cứ phím nào để tiếp tục [0m && pause >nul
goto nettoolmenu

:monitor
cls
echo Giám sát sử dụng CPU và RAM:
wmic cpu get loadpercentage
wmic OS get FreePhysicalMemory,TotalVisibleMemorySize /Value
:: Add your code for monitoring CPU and RAM usage here
echo [7;95m Bấm bất cứ phím nào để tiếp tục [0m && pause >nul
goto nettoolmenu

:locate
cls
set /p "locateip=Nhập địa chỉ IP để tìm vị trí: "
echo Tìm vị trí của %locateip%...
:: Add your code for locating IP address here
echo [7;95m Bấm bất cứ phím nào để tiếp tục [0m && pause >nul
goto nettoolmenu

:hostip
cls
set /p "hostname=Nhập hostname để chuyển đổi thành IP: "
echo Đang chuyển đổi hostname %hostname% thành IP...
nslookup %hostname%
echo [7;95m Bấm bất cứ phím nào để tiếp tục [0m && pause >nul
goto nettoolmenu

:trace
cls
set /p "traceip=Nhập địa chỉ IP để truy vết: "
tracert %traceip%
echo [7;95m Bấm bất cứ phím nào để tiếp tục [0m && pause >nul
goto nettoolmenu
:ports
cls
set /p "targetip=Nhập địa chỉ IP để quét các cổng: "
echo Quét các cổng của %targetip%...
netstat -an
:: Add your code for scanning ports here
echo [7;95m Bấm bất cứ phím nào để tiếp tục [0m && pause >nul
goto nettoolmenu

:ip
cls
echo Địa chỉ IP công khai và riêng tư của bạn:
ipconfig
:: Add your code for displaying IP addresses here
echo [7;95m Bấm bất cứ phím nào để tiếp tục [0m && pause >nul
goto nettoolmenu

:battery
cls
echo Kiểm tra phần trăm pin hiện tại:
for /f "tokens=2 delims==" %%i in ('wmic path win32_battery get estimatedchargeremaining /format:list') do set "battery=%%i"
echo Phần trăm pin hiện tại: %battery%%
battery-report.html
:: Add your code for checking battery percentage here
echo [7;95m Bấm bất cứ phím nào để tiếp tục [0m && pause >nul
goto nettoolmenu

:time
cls
echo Ngày và giờ hiện tại:
:: Lấy ngày và giờ hiện tại
for /f "delims=" %%a in ('wmic os get localdatetime ^| find "."') do (
    set "dt=%%a"
)

:: Tách ngày và giờ từ chuỗi nhận được
set "year=!dt:~0,4!"
set "month=!dt:~4,2!"
set "day=!dt:~6,2!"
set "hour=!dt:~8,2!"
set "minute=!dt:~10,2!"
set "second=!dt:~12,2!"

:: Hiển thị ngày và giờ
echo Ngày giờ hiện tại: !year!-!month!-!day! !hour!:!minute!:!second!
echo [7;95m Bấm bất cứ phím nào để tiếp tục [0m && pause >nul
goto nettoolmenu

:netsh
cls
echo Quản lý cấu hình mạng:
netsh
echo [7;95m Bấm bất cứ phím nào để tiếp tục [0m && pause >nul
goto nettoolmenu

:nslookup
cls
set /p "lookuphost=Nhập hostname để kiểm tra: "
nslookup %lookuphost%
echo [7;95m Bấm bất cứ phím nào để tiếp tục [0m && pause >nul
goto nettoolmenu

:getmac
cls
echo Địa chỉ MAC của máy tính:
getmac
echo [7;95m Bấm bất cứ phím nào để tiếp tục [0m && pause >nul
goto nettoolmenu

:pathping
cls
set /p "pingip=Nhập địa chỉ IP để kiểm tra đường đi: "
pathping %pingip%
echo [7;95m Bấm bất cứ phím nào để tiếp tục [0m && pause >nul
goto nettoolmenu

:tracert
cls
set /p "tracertip=Nhập địa chỉ IP để truy vết lộ trình: "
tracert %tracertip%
echo [7;95m Bấm bất cứ phím nào để tiếp tục [0m && pause >nul
goto nettoolmenu

:netstatus
cls
echo Kiểm tra trạng thái kết nối Internet:
ping google.com
echo [7;95m Bấm bất cứ phím nào để tiếp tục [0m && pause >nul
goto nettoolmenu

:netspeed
cls
echo Kiểm tra tốc độ mạng:
:: Add your code for network speed test here
echo [7;95m Bấm bất cứ phím nào để tiếp tục [0m && pause >nul
goto nettoolmenu

:sysinfo
cls
echo Thông tin hệ thống:
systeminfo
echo [7;95m Bấm bất cứ phím nào để tiếp tục [0m && pause >nul
goto nettoolmenu

:monitor
cls
echo Giám sát sử dụng CPU và RAM:
wmic cpu get loadpercentage
wmic OS get FreePhysicalMemory,TotalVisibleMemorySize /Value
:: Add your code for monitoring CPU and RAM usage here
echo [7;95m Bấm bất cứ phím nào để tiếp tục [0m && pause >nul
goto nettoolmenu

:block
cls
@echo off
setlocal enabledelayedexpansion
color 0D
:checkPrivileges
NET FILE 1>NUL 2>NUL
if '%errorlevel%' == '0' (goto gotPrivileges) else (goto getPrivileges)
:getPrivileges
echo [+]═════════[ Hãy chọn các lựa chọn ]═════════[+]
:gotPrivileges
setlocal & pushd .

set hostsFile=%SystemRoot%\System32\drivers\etc\hosts

:chooseAction
echo 1. Chặn một website
echo 2. Gỡ chặn một websites (Mở file hosts trên notepad)
set /p action=Chọn lựa chọn của bạn (1 hoặc 2):

if '%action%'=='1' goto blockWebsite
if '%action%'=='2' goto unblockWebsites
echo Invalid choice.
goto block 

:blockWebsite
echo Điền website muốn chặn (e.g., example.com):
set /p website=

rem Ensure the website doesn't already exist in the hosts file
findstr /i /c:"%website%" "%hostsFile%" >nul
if not errorlevel 1 (
  echo Website %website% is already blocked.
  echo [7;95m Bấm bất cứ phím nào để tiếp tục [0m && pause >nul
 goto nettoolmenu
)

echo 127.0.0.1    %website%>>%hostsFile%
echo 127.0.0.1    www.%website%>>%hostsFile%
echo Website %website% đã bị chặn.

rem Flush DNS cache
ipconfig /flushdns
echo [7;95m Bấm bất cứ phím nào để tiếp tục [0m && pause >nul
goto nettoolmenu

:unblockWebsites
notepad %SystemRoot%\System32\drivers\etc\hosts
echo [7;95m Bấm bất cứ phím nào để tiếp tục [0m && pause >nul
goto nettoolmenu
:ipch4
@echo off
:: Kiểm tra xem có chạy với quyền admin không
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Yêu cầu quyền admin...
   echo [7;95m Bấm bất cứ phím nào để tiếp tục [0m && pause >nul
 goto nettool menu
)

:: Phần còn lại của script
set /p newIP="Nhập địa chỉ IP mới: "
netsh interface ip set address name="Wi-Fi 3" static %newIP% 255.255.255.0 192.168.1.1
echo Địa chỉ IPv4 mới đã được thiết lập thành: %newIP%
ipconfig | findstr /i "ipv4"
echo [7;95m Bấm bất cứ phím nào để tiếp tục [0m && pause >nul
goto nettoolmenu
:hwid 
cls 
color 0D
echo [+]═════════[ Kiểm tra và hiển thị thông tin phần cứng ]═════════[+]
:: Lấy thông tin bo mạch chủ
set Brand=
set Model=
set SerialNumber=
set UUID=
for /f "tokens=2 delims==" %%A in ('wmic baseboard get Manufacturer^,Product^,SerialNumber^,UUID /value 2^>nul ^| findstr /r /c:"^Manufacturer="') do set Brand=%%A
for /f "tokens=2 delims==" %%A in ('wmic baseboard get Product /value 2^>nul ^| findstr /r /c:"^Product="') do set Model=%%A
for /f "tokens=2 delims==" %%A in ('wmic baseboard get SerialNumber /value 2^>nul ^| findstr /r /c:"^SerialNumber="') do set SerialNumber=%%A
for /f "tokens=2 delims==" %%A in ('wmic baseboard get UUID /value 2^>nul ^| findstr /r /c:"^UUID="') do set UUID=%%A

:: Lấy thông tin CPU
for /f "tokens=2 delims==" %%A in ('wmic cpu get Name /value 2^>nul ^| findstr /r /c:"^Name="') do set CPUName=%%A
for /f "tokens=2 delims==" %%A in ('wmic cpu get ProcessorId /value 2^>nul ^| findstr /r /c:"^ProcessorId="') do set CPUSerial=%%A

echo Ổ đĩa 
:: Hiển thị thông tin model
echo Mẫu:
wmic diskdrive get Model | findstr /v "Model"

:: Hiển thị thông tin serial number
echo Số seri:
wmic diskdrive get SerialNumber | findstr /v "SerialNumber"

:: Hiển thị thông tin đã lấy
echo.
echo Bo mạch chủ
if defined Brand echo Thương hiệu:        %Brand%
if defined Model echo Mẫu:        %Model%
if defined SerialNumber echo Số seri: %SerialNumber%
echo UUID :
wmic path Win32_ComputerSystemProduct get UUID | findstr /v " UUID "
echo.
echo RAM:
for /L %%i in (1,1,%DIMCount%) do (
    if defined DIM%%i echo DIM%%i:       !DIM%%i!
    if defined DIM%%iCapacity echo DIM%%i Dung lượng: !DIM%%iCapacity!
)

echo Vị trí thiết bị: 
wmic memorychip get DeviceLocator | findstr /v " DeviceLocator "
echo Dung lượng: 
wmic memorychip get Capacity | findstr /v "Capacity"echo.
echo CPU:
if defined CPUName echo Tên:      %CPUName%
if defined CPUSerial echo Số seri:    %CPUSerial%
echo.

echo [7;95m Bấm bất cứ phím nào để tiếp tục [0m && pause >nul
endlocal
goto nettoolmenu
:deauth
python C:\Users\ADMIN\Desktop\deauth\dead.py
echo [7;95m Bấm bất cứ phím nào để tiếp tục [0m && pause >nul 
goto nettoolmenu
:rootprompt
:: Root prompt loop
:rootinput
echo %BRIGHTWHITE%┌──(%BRIGHTRED%root㉿%computername%%BRIGHTWHITE%)-[%DEFAULT%~%BRIGHTWHITE%][0m
set /p rootcmd="%BRIGHTWHITE%└─[0m[1;91m# %BRIGHTRED%[0m"

:: Check for Linux-like commands and translate them
if /i "%rootcmd%"=="clear" (
    cls
    goto rootinput
) else if /i "%rootcmd%"=="ls" (
    dir
    goto rootinput
) else if /i "%rootcmd%"=="pwd" (
    cd
    goto rootinput
) else if /i "%rootcmd%"=="exit" (
    set user=hellokali
    set promptchar=$
    set color=%SPRINGGREEN1%
    cls
    goto input
) else if /i "%rootcmd%"=="cp" (
    set /p src="Source file: "
    set /p dest="Destination: "
    copy "%src%" "%dest%"
    goto rootinput
) else if /i "%rootcmd%"=="mv" (
    set /p src="Source file: "
    set /p dest="Destination: "
    move "%src%" "%dest%"
    goto rootinput
) else if /i "%rootcmd%"=="nettool" (
    goto nettool
) else if /i "%rootcmd%"=="rm" (
    set /p file="File to delete: "
    del "%file%"
    goto rootinput
) else if /i "%rootcmd%"=="mkdir" (
    set /p dir="Directory name: "
    mkdir "%dir%"
    goto rootinput
) else if /i "%rootcmd%"=="rmdir" (
    set /p dir="Directory name: "
    rmdir /s /q "%dir%"
    goto rootinput
) else if /i "%rootcmd%"=="cat" (
    set /p file="File to display: "
    type "%file%"
    goto rootinput
) else if /i "%rootcmd%"=="echo" (
    set /p text="Text to echo: "
    echo %text%
    goto rootinput
) else if /i "%rootcmd%"=="touch" (
    set /p file="File to create: "
    type nul > "%file%"
    goto rootinput
) else if /i "%rootcmd%"=="su" (
    goto hello
) else if /i "%rootcmd%"=="nmap" (
    set counter=0
    for /L %%i in (1,1,254) do (
        ping -n 1 -w 100 192.168.1.%%i > nul
        if not errorlevel 1 (
            echo 192.168.1.%%i is up
            set /a counter+=1
        )
    )
    echo.
    echo Number of hosts up: !counter!
    pause
    goto rootinput
)

:: Execute entered command
%rootcmd%
goto rootinput
:gradient
@echo off
chcp 65001>nul
if not exist "%TEMP%\inputs.bat" (
	echo echo.>>%TEMP%\inputs.bat
	echo echo Please paste the first line of your ASCII art: >>%TEMP%\inputs.bat
	echo set /p l1=>>%TEMP%\inputs.bat
	echo echo Please paste the second line of your ASCII art: >>%TEMP%\inputs.bat
	echo set /p l2=>>%TEMP%\inputs.bat
	echo echo Please paste the third line of your ASCII art: >>%TEMP%\inputs.bat
	echo set /p l3=>>%TEMP%\inputs.bat
	echo echo Please paste the fourth line of your ASCII art: >>%TEMP%\inputs.bat
	echo set /p l4=>>%TEMP%\inputs.bat
	echo echo Please paste the fifth line of your ASCII art: >>%TEMP%\inputs.bat
	echo set /p l5=>>%TEMP%\inputs.bat
	echo echo Please paste the sixth line of your ASCII art: >>%TEMP%\inputs.bat
	echo set /p l6=>>%TEMP%\inputs.bat
)
cls
title Gradient Maker ^| v1.2
call :logo
echo.
echo Gradient Maker v1.2
echo ====================
echo Bạn muốn [38;5;214mg[38;5;215mr[38;5;215ma[38;5;216md[38;5;217mi[38;5;218me[38;5;218mn[38;5;219mt[38;5;219ms[97m hay dùng [94mmàu tĩnh[97m? {G/S}
set /p type=^> 
if /i "%type%"=="g" goto gradients
if /i "%type%"=="s" goto static

:static
cls
title Gradient Maker ^| v1.2
call :logo
echo.
echo Gradient Maker v1.2
echo ====================
echo ONLY 6 LINE ASCII ART IS SUPPORTED!
echo TO GENERATE 6 LINE ASCII ART: https://bit.ly/6linetallascii
echo Which color would you like it to be?
echo [97m[1] [31mRed[97m, [2] [32mGreen[97m, [3] [33mYellow[97m, [4] [34mBlue[97m, [5] [35mMagenta[97m
echo [6] [36mCyan[97m, [7] [90mGray[97m, [8] [91mBright Red[97m, [9] [92mBright Green[97m, [10] [93mBright Yellow[97m
echo [11] [94mBright Blue[97m, [12] [95mBright Magenta[97m, [13] [96mBright Cyan[97m, [14] White
set /p choice=^> 
goto %choice%
goto static

:1
call "%TEMP%\inputs.bat"
set "l1=echo ^<escape^>[31m%l1%"
set "l2=echo ^<escape^>[31m%l2%"
set "l3=echo ^<escape^>[31m%l3%"
set "l4=echo ^<escape^>[31m%l4%"
set "l5=echo ^<escape^>[31m%l5%"
set "l6=echo ^<escape^>[31m%l6%^<escape^>[0m"
call :scagss

:2
call "%TEMP%\inputs.bat"
set "l1=echo ^<escape^>[32m%l1%"
set "l2=echo ^<escape^>[32m%l2%"
set "l3=echo ^<escape^>[32m%l3%"
set "l4=echo ^<escape^>[32m%l4%"
set "l5=echo ^<escape^>[32m%l5%"
set "l6=echo ^<escape^>[32m%l6%^<escape^>[0m"
call :scagss

:3
call "%TEMP%\inputs.bat"
set "l1=echo ^<escape^>[33m%l1%"
set "l2=echo ^<escape^>[33m%l2%"
set "l3=echo ^<escape^>[33m%l3%"
set "l4=echo ^<escape^>[33m%l4%"
set "l5=echo ^<escape^>[33m%l5%"
set "l6=echo ^<escape^>[33m%l6%^<escape^>[0m"
call :scagss

:4
call "%TEMP%\inputs.bat"
set "l1=echo ^<escape^>[34m%l1%"
set "l2=echo ^<escape^>[34m%l2%"
set "l3=echo ^<escape^>[34m%l3%"
set "l4=echo ^<escape^>[34m%l4%"
set "l5=echo ^<escape^>[34m%l5%"
set "l6=echo ^<escape^>[34m%l6%^<escape^>[0m"
call :scagss

:5
call "%TEMP%\inputs.bat"
set "l1=echo ^<escape^>[35m%l1%"
set "l2=echo ^<escape^>[35m%l2%"
set "l3=echo ^<escape^>[35m%l3%"
set "l4=echo ^<escape^>[35m%l4%"
set "l5=echo ^<escape^>[35m%l5%"
set "l6=echo ^<escape^>[35m%l6%^<escape^>[0m"
call :scagss

:6
call "%TEMP%\inputs.bat"
set "l1=echo ^<escape^>[36m%l1%"
set "l2=echo ^<escape^>[36m%l2%"
set "l3=echo ^<escape^>[36m%l3%"
set "l4=echo ^<escape^>[36m%l4%"
set "l5=echo ^<escape^>[36m%l5%"
set "l6=echo ^<escape^>[36m%l6%^<escape^>[0m"
call :scagss

:7
call "%TEMP%\inputs.bat"
set "l1=echo ^<escape^>[90m%l1%"
set "l2=echo ^<escape^>[90m%l2%"
set "l3=echo ^<escape^>[90m%l3%"
set "l4=echo ^<escape^>[90m%l4%"
set "l5=echo ^<escape^>[90m%l5%"
set "l6=echo ^<escape^>[90m%l6%^<escape^>[0m"
call :scagss

:8
call "%TEMP%\inputs.bat"
set "l1=echo ^<escape^>[91m%l1%"
set "l2=echo ^<escape^>[91m%l2%"
set "l3=echo ^<escape^>[91m%l3%"
set "l4=echo ^<escape^>[91m%l4%"
set "l5=echo ^<escape^>[91m%l5%"
set "l6=echo ^<escape^>[91m%l6%^<escape^>[0m"
call :scagss

:9
call "%TEMP%\inputs.bat"
set "l1=echo ^<escape^>[92m%l1%"
set "l2=echo ^<escape^>[92m%l2%"
set "l3=echo ^<escape^>[92m%l3%"
set "l4=echo ^<escape^>[92m%l4%"
set "l5=echo ^<escape^>[92m%l5%"
set "l6=echo ^<escape^>[92m%l6%^<escape^>[0m"
call :scagss

:10
call "%TEMP%\inputs.bat"
set "l1=echo ^<escape^>[93m%l1%"
set "l2=echo ^<escape^>[93m%l2%"
set "l3=echo ^<escape^>[93m%l3%"
set "l4=echo ^<escape^>[93m%l4%"
set "l5=echo ^<escape^>[93m%l5%"
set "l6=echo ^<escape^>[93m%l6%^<escape^>[0m"
call :scagss

:11
call "%TEMP%\inputs.bat"
set "l1=echo ^<escape^>[94m%l1%"
set "l2=echo ^<escape^>[94m%l2%"
set "l3=echo ^<escape^>[94m%l3%"
set "l4=echo ^<escape^>[94m%l4%"
set "l5=echo ^<escape^>[94m%l5%"
set "l6=echo ^<escape^>[94m%l6%^<escape^>[0m"
call :scagss

:12
call "%TEMP%\inputs.bat"
set "l1=echo ^<escape^>[95m%l1%"
set "l2=echo ^<escape^>[95m%l2%"
set "l3=echo ^<escape^>[95m%l3%"
set "l4=echo ^<escape^>[95m%l4%"
set "l5=echo ^<escape^>[95m%l5%"
set "l6=echo ^<escape^>[95m%l6%^<escape^>[0m"
call :scagss

:13
call "%TEMP%\inputs.bat"
set "l1=echo ^<escape^>[96m%l1%"
set "l2=echo ^<escape^>[96m%l2%"
set "l3=echo ^<escape^>[96m%l3%"
set "l4=echo ^<escape^>[96m%l4%"
set "l5=echo ^<escape^>[96m%l5%"
set "l6=echo ^<escape^>[96m%l6%^<escape^>[0m"
call :scagss

:14
call "%TEMP%\inputs.bat"
set "l1=echo ^<escape^>[97m%l1%"
set "l2=echo ^<escape^>[97m%l2%"
set "l3=echo ^<escape^>[97m%l3%"
set "l4=echo ^<escape^>[97m%l4%"
set "l5=echo ^<escape^>[97m%l5%"
set "l6=echo ^<escape^>[97m%l6%^<escape^>[0m"
call :scagss

:gradients
cls
title Gradient Maker ^| v1.0
call :logo
echo.
echo Gradient Maker v1.0
echo ====================
echo CHỈ HỖ TRỢ 6 DÒNG ASCII ART!
echo TRANG WEB ĐỂ TẠO RA 6 DÒNG ASCII ART : https://bit.ly/6linetallascii
echo Bạn muốn nó có màu gì?
echo [1] [38;5;214mOrange[97m --^> [38;5;219mPink[97m, [2] [38;5;40mGreen[97m --^> [38;5;45mBright Blue[97m, [3] [38;5;33mBlue[97m --^> [38;5;213mPink[97m [4] [38;5;196mRed[97m --^> [38;5;201mPink[97m [5] [38;5;46mGreen[97m --^> [38;5;226mYellow[97m
echo [6] [38;5;51mBlue[97m -^> [38;5;226mYellow[97m, [7] [38;2;135;206;250mLight Blue[97m -^> [38;2;35;106;200mBlue[97m
set /p choice=^> 
if %choice%==1 goto otp
if %choice%==2 goto gtbb
if %choice%==3 goto dbtp
if %choice%==4 goto rtp
if %choice%==5 goto gty
if %choice%==6 goto bty
if %choice%==7 goto bbtb
goto gradients


:otp
call "%TEMP%\inputs.bat"
set "l1=echo ^<escape^>[38;5;214m%l1%"
set "l2=echo ^<escape^>[38;5;215m%l2%"
set "l3=echo ^<escape^>[38;5;216m%l3%"
set "l4=echo ^<escape^>[38;5;217m%l4%"
set "l5=echo ^<escape^>[38;5;218m%l5%"
set "l6=echo ^<escape^>[38;5;219m%l6%^<escape^>[0m"
call :scags

:gtbb
call "%TEMP%\inputs.bat"
set "l1=echo ^<escape^>[38;5;46m%l1%"
set "l2=echo ^<escape^>[38;5;47m%l2%"
set "l3=echo ^<escape^>[38;5;48m%l3%"
set "l4=echo ^<escape^>[38;5;49m%l4%"
set "l5=echo ^<escape^>[38;5;50m%l5%"
set "l6=echo ^<escape^>[38;5;51m%l6%^<escape^>[0m"
call :scags

:dbtp
call "%TEMP%\inputs.bat"
set "l1=echo ^<escape^>[38;5;33m%l1%"
set "l2=echo ^<escape^>[38;5;69m%l2%"
set "l3=echo ^<escape^>[38;5;105m%l3%"
set "l4=echo ^<escape^>[38;5;141m%l4%"
set "l5=echo ^<escape^>[38;5;177m%l5%"
set "l6=echo ^<escape^>[38;5;213m%l6%^<escape^>[0m"
call :scags

:rtp
call "%TEMP%\inputs.bat"
set "l1=echo ^<escape^>[38;5;196m%l1%"
set "l2=echo ^<escape^>[38;5;197m%l2%"
set "l3=echo ^<escape^>[38;5;198m%l3%"
set "l4=echo ^<escape^>[38;5;199m%l4%"
set "l5=echo ^<escape^>[38;5;200m%l5%"
set "l6=echo ^<escape^>[38;5;201m%l6%^<escape^>[0m"
call :scags

:gty
call :input
set "l1=echo ^<escape^>[38;5;46m%l1%"
set "l2=echo ^<escape^>[38;5;82m%l2%"
set "l3=echo ^<escape^>[38;5;118m%l3%"
set "l4=echo ^<escape^>[38;5;154m%l4%"
set "l5=echo ^<escape^>[38;5;190m%l5%"
set "l6=echo ^<escape^>[38;5;226m%l6%^<escape^>[0m"
call :scags

:bty
call "%TEMP%\inputs.bat"
set "l1=echo ^<escape^>[38;5;51m%l1%"
set "l2=echo ^<escape^>[38;5;86m%l2%"
set "l3=echo ^<escape^>[38;5;121m%l3%"
set "l4=echo ^<escape^>[38;5;156m%l4%"
set "l5=echo ^<escape^>[38;5;191m%l5%"
set "l6=echo ^<escape^>[38;5;226m%l6%^<escape^>[0m"
call :scags

:bbtb
call "%TEMP%\inputs.bat"
set "l1=echo ^<escape^>[38;2;135;206;250m%l1%"
set "l2=echo ^<escape^>[38;2;115;186;240m%l2%"
set "l3=echo ^<escape^>[38;2;95;166;230m%l3%"
set "l4=echo ^<escape^>[38;2;75;146;220m%l4%"
set "l5=echo ^<escape^>[38;2;55;126;210m%l5%"
set "l6=echo ^<escape^>[38;2;35;106;200m%l6%^<escape^>[0m"
call :scags

:scags
echo.
echo Các lệnh cho gradient
echo (Thay thế ^<escape^> trong mỗi dòng bằng ký tự thoát, ký tự này sẽ được cung cấp cho bạn sau trong tập lệnh)
echo ------------------------------------------------------------------------------------------------------
echo @echo off
echo chcp 65001 ^>nul
echo %l1%
echo %l2%
echo %l3%
echo %l4%
echo %l5%
echo %l6%
echo chcp 437 ^>nul
echo ------------------------------------------------------------------------------------------------------
echo.
echo Bạn có muốn sao chép ký tự thoát không? [y]/[N]
set /p copyesc=^> 
if /i "%copyesc%"=="y" @Set /P "="<NUL|Clip
goto gradients 

:scagss
echo.
echo Các lệnh cho nghệ thuật ASCII có màu
echo (Thay thế ^<escape^> trong mỗi dòng bằng ký tự thoát, ký tự này sẽ được cung cấp cho bạn sau trong tập lệnh)
echo ------------------------------------------------------------------------------------------------------
echo @echo off
echo chcp 65001 ^>nul
echo %l1%
echo %l2%
echo %l3%
echo %l4%
echo %l5%
echo %l6%
echo chcp 437 ^>nul
echo ------------------------------------------------------------------------------------------------------
echo.
echo Bạn có muốn sao chép ký tự thoát không? [y]/[N]
set /p copyesc=^> 
if /i "%copyesc%"=="y" @Set /P "="<NUL|Clip
goto static

:logo
for /f "tokens=2,*delims=:" %%i in ('chcp') do set /a oldcp =%%i
chcp 65001 >nul
echo/[38;5;214m░██████╗░██████╗░░█████╗░██████╗░██╗███████╗███╗░░██╗████████╗░██████╗
echo/[38;5;214m██╔════╝░██╔══██╗██╔══██╗██╔══██╗██║██╔════╝████╗░██║╚══██╔══╝██╔════╝
echo/[38;5;215m██║░░██╗░██████╔╝███████║██║░░██║██║█████╗░░██╔██╗██║░░░██║░░░╚█████╗░
echo/[38;5;215m██║░░╚██╗██╔══██╗██╔══██║██║░░██║██║██╔══╝░░██║╚████║░░░██║░░░░╚═══██╗
echo/[38;5;216m╚██████╔╝██║░░██║██║░░██║██████╔╝██║███████╗██║░╚███║░░░██║░░░██████╔╝
echo/[38;5;216m░╚═════╝░╚═╝░░╚═╝╚═╝░░╚═╝╚═════╝░╚═╝╚══════╝╚═╝░░╚══╝░░░╚═╝░░░╚═════╝░
echo/[38;5;217m░██████╗░███████╗███╗░░██╗███████╗██████╗░░█████╗░████████╗░█████╗░██████╗░
echo/[38;5;217m██╔════╝░██╔════╝████╗░██║██╔════╝██╔══██╗██╔══██╗╚══██╔══╝██╔══██╗██╔══██╗
echo/[38;5;218m██║░░██╗░█████╗░░██╔██╗██║█████╗░░██████╔╝███████║░░░██║░░░██║░░██║██████╔╝
echo/[38;5;218m██║░░╚██╗██╔══╝░░██║╚████║██╔══╝░░██╔══██╗██╔══██║░░░██║░░░██║░░██║██╔══██╗
echo/[38;5;219m╚██████╔╝███████╗██║░╚███║███████╗██║░░██║██║░░██║░░░██║░░░╚█████╔╝██║░░██║
echo/[38;5;219m░╚═════╝░╚══════╝╚═╝░░╚══╝╚══════╝╚═╝░░╚═╝╚═╝░░╚═╝░░░╚═╝░░░░╚════╝░╚═╝░░╚═╝[97m (by Amsos@re)
chcp %oldcp% >nul

