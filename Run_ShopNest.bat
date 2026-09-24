@echo off
title ShopNest - Starting Web Server
echo ========================================================
echo        ShopNest - Online Shopping Website
echo             Starting IIS Express...
echo ========================================================

set IIS_EXE=
if exist "%ProgramFiles%\IIS Express\iisexpress.exe" set "IIS_EXE=%ProgramFiles%\IIS Express\iisexpress.exe"
if exist "%ProgramFiles(x86)%\IIS Express\iisexpress.exe" set "IIS_EXE=%ProgramFiles(x86)%\IIS Express\iisexpress.exe"

if "%IIS_EXE%"=="" (
    echo [ERROR] IIS Express not found.
    echo Please make sure IIS Express or Visual Studio is installed.
    pause
    exit /b 1
)

echo Starting IIS Express on port 52345...
start "" "%IIS_EXE%" /path:"%~dp0" /port:52345

timeout /t 2 /nobreak >nul

echo Opening browser at http://localhost:52345/Home.aspx ...
start http://localhost:52345/Home.aspx

echo.
echo ========================================================
echo  ShopNest is running at http://localhost:52345/Home.aspx
echo  Keep the IIS Express window open while testing.
echo ========================================================
