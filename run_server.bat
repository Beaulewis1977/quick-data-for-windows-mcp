@echo off
REM Quick Data for Windows MCP - Server Launcher
REM This batch file ensures proper Python environment for Claude Desktop

REM Set working directory
cd /d "%~dp0"

REM Add Python user packages to path (where pip install --user installs packages)
set PYTHONPATH=%PYTHONPATH%;%APPDATA%\Python\Python313\site-packages
set PYTHONPATH=%PYTHONPATH%;%LOCALAPPDATA%\Programs\Python\Python313\Lib\site-packages
set PYTHONPATH=%PYTHONPATH%;%~dp0src

REM Try different Python executables in order of preference
where python >nul 2>&1
if %errorlevel%==0 (
    python main.py
    goto :end
)

where py >nul 2>&1
if %errorlevel%==0 (
    py main.py
    goto :end
)

REM Try common Python installation paths
if exist "C:\Python313\python.exe" (
    "C:\Python313\python.exe" main.py
    goto :end
)

if exist "%LOCALAPPDATA%\Programs\Python\Python313\python.exe" (
    "%LOCALAPPDATA%\Programs\Python\Python313\python.exe" main.py
    goto :end
)

if exist "%PROGRAMFILES%\Python313\python.exe" (
    "%PROGRAMFILES%\Python313\python.exe" main.py
    goto :end
)

echo ERROR: Python not found. Please ensure Python 3.9+ is installed and in PATH.
echo Visit: https://www.python.org/downloads/
pause
exit /b 1

:end