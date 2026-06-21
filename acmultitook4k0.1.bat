@echo off
title ChatGPT Multitool 0.3 - SIMPLE
color 0B
chcp 65001 >nul

:menu
cls
echo ==========================================
echo   CHATGPT MULTITOOL 0.3
echo ==========================================
echo.
echo 1. System Information
echo 2. Network Config
echo 3. Ping Test
echo 4. DNS Lookup
echo 5. Exit
echo ==========================================
set /p choice=Choose (1-5): 

if "%choice%"=="1" systeminfo | more & pause & goto menu
if "%choice%"=="2" ipconfig /all | more & pause & goto menu
if "%choice%"=="3" set /p host=Host: & ping -n 6 %host% & pause & goto menu
if "%choice%"=="4" set /p domain=Domain: & nslookup %domain% & pause & goto menu
if "%choice%"=="5" echo Goodbye! & timeout /t 2 >nul & exit

echo Invalid! 
pause
goto menu