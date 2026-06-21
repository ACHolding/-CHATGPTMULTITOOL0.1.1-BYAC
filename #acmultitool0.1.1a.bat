@echo off
title ChatGPT + Grok Multitool by AC 0.1
color 0B
chcp 65001 >nul

:menu
cls
echo ==========================================
echo   CHATGPT + GROK MULTITOOL BY AC 0.1
echo ==========================================
echo.
echo 1. System Information
echo 2. Network Config
echo 3. Simple Port Scanner
echo 4. Nmap Style Scan (if nmap installed)
echo 5. Quick HTTP Request (Burp-like)
echo 6. Exit
echo ==========================================
set /p choice=Select (1-6): 

if "%choice%"=="1" goto sysinfo
if "%choice%"=="2" goto netconfig
if "%choice%"=="3" goto portscan
if "%choice%"=="4" goto nmapscan
if "%choice%"=="5" goto httpreq
if "%choice%"=="6" goto exit

echo Invalid!
pause
goto menu

:sysinfo
cls
echo ===== SYSTEM INFORMATION =====
systeminfo | more
pause
goto menu

:netconfig
cls
echo ===== NETWORK CONFIG =====
ipconfig /all | more
pause
goto menu

:portscan
cls
set /p target=Target IP: 
if "%target%"=="" goto menu
echo Scanning ports 1-100 on %target%...
for /L %%p in (1,1,100) do (
    <nul (set /p "=%%p ") >nul
    powershell -noprofile -command "(New-Object System.Net.Sockets.TcpClient).Connect('%target%',%%p)" 2>nul && echo [OPEN %%p]
)
pause
goto menu

:nmapscan
cls
set /p target=Target: 
if "%target%"=="" goto menu
where nmap >nul 2>&1 || echo Nmap not found. Install it first.
if %errorlevel%==0 nmap -T4 -F %target%
pause
goto menu

:httpreq
cls
set /p url=Enter URL: 
if "%url%"=="" goto menu
echo Sending GET request to %url%...
powershell -noprofile -command "Invoke-WebRequest -Uri '%url%' -UseBasicParsing | Select-Object StatusCode,Content" 
pause
goto menu

:exit
echo.
echo Goodbye, Master AC~
timeout /t 2 >nul
exit