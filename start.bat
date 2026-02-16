@echo off
:: SpamLens Launcher for Windows
:: Double-click this file to start SpamLens

set PORT=8080
echo Starting SpamLens on http://localhost:%PORT%
echo Press Ctrl+C to stop.
echo.

cd /d "%~dp0"

:: Open browser after delay
start "" timeout /t 1 >nul & start "" "http://localhost:%PORT%/index.html"

:: Start Python server
python -m http.server %PORT%
pause
