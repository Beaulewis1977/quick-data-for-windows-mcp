@echo off
echo Testing Quick Data for Windows MCP Server
echo ==========================================

REM Set environment
set PYTHONPATH=%PYTHONPATH%;%~dp0src
cd /d "%~dp0"

echo Testing Python import...
python -c "import sys; print(f'Python: {sys.executable}'); import mcp; print('MCP library: OK'); import pandas; print('Pandas: OK'); import plotly; print('Plotly: OK')"

if errorlevel 1 (
    echo.
    echo ERROR: Dependencies not properly installed
    echo Please run install_dependencies.bat first
    pause
    exit /b 1
)

echo.
echo Starting MCP server test (will run for 5 seconds)...
timeout /t 5 /nobreak >nul & taskkill /f /im python.exe >nul 2>&1 &
python main.py

echo.
echo If you saw server startup messages above, the server is working correctly!
echo You can now configure Claude Desktop with the fixed configuration.
pause