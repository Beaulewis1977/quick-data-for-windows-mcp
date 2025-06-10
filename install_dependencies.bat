@echo off
echo Installing Quick Data for Windows MCP Dependencies
echo ==================================================

REM Check if Python is available
python --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Python is not installed or not in PATH
    echo Please install Python 3.9+ from https://python.org
    echo Make sure to check "Add Python to PATH" during installation
    pause
    exit /b 1
)

echo Python found. Installing dependencies...

REM Install required packages
echo Installing MCP library...
pip install "mcp[cli]>=1.9.2"
if errorlevel 1 (
    echo Trying with --user flag...
    pip install --user "mcp[cli]>=1.9.2"
)

echo Installing pandas...
pip install "pandas>=2.2.3"
if errorlevel 1 (
    pip install --user "pandas>=2.2.3"
)

echo Installing plotly...
pip install "plotly>=6.1.2"
if errorlevel 1 (
    pip install --user "plotly>=6.1.2"
)

echo Installing additional dependencies...
pip install "numpy>=1.24.0" "scikit-learn>=1.3.0" "pydantic>=2.0.0"
if errorlevel 1 (
    pip install --user "numpy>=1.24.0" "scikit-learn>=1.3.0" "pydantic>=2.0.0"
)

echo.
echo Dependencies installed successfully!
echo.
echo Next steps:
echo 1. Copy claude_desktop_config_fixed.json to %%APPDATA%%\Claude\claude_desktop_config.json
echo 2. Update the "cwd" path in the config to match your installation location
echo 3. Restart Claude Desktop
echo.
pause