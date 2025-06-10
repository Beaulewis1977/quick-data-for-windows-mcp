# Troubleshooting Guide

> **Windows-specific troubleshooting for the [disler/quick-data-mcp](https://github.com/disler/quick-data-mcp) fork**

## Common Issue: "ModuleNotFoundError: No module named 'mcp'"

This is the most common issue when setting up the MCP server with Claude Desktop.

### 🔧 Quick Fix (Recommended)

1. **Run the dependency installer:**
   ```cmd
   install_dependencies.bat
   ```

2. **Use the fixed configuration:**
   - Copy `claude_desktop_config_fixed.json` to `%APPDATA%\Claude\claude_desktop_config.json`
   - Update the `cwd` path to match your installation location

3. **Test the server:**
   ```cmd
   test_server.bat
   ```

### 🔍 Root Cause

Claude Desktop runs in its own process and may not have access to Python packages installed in your user directory or virtual environments.

### 📋 Step-by-Step Solution

#### Step 1: Verify Python Installation
```cmd
python --version
```
Should show Python 3.9 or higher.

#### Step 2: Install Dependencies Globally
```cmd
# Try global installation first
pip install mcp[cli] pandas plotly numpy scikit-learn pydantic

# If that fails, install for current user
pip install --user mcp[cli] pandas plotly numpy scikit-learn pydantic
```

#### Step 3: Use the Batch Launcher
The `run_server.bat` file handles:
- Setting correct Python paths
- Finding your Python installation
- Setting up environment variables
- Running the server with proper configuration

#### Step 4: Configure Claude Desktop
Use this configuration in `%APPDATA%\Claude\claude_desktop_config.json`:

```json
{
  "mcpServers": {
    "quick-data-windows": {
      "command": "cmd",
      "args": [
        "/c",
        "run_server.bat"
      ],
      "cwd": "C:\\path\\to\\your\\quick-data-for-windows-mcp",
      "env": {
        "LOG_LEVEL": "INFO"
      }
    }
  }
}
```

**Important:** Update the `cwd` path to your actual installation directory.

## Other Common Issues

### Issue: Python Not Found
**Error:** `'python' is not recognized as an internal or external command`

**Solution:**
1. Reinstall Python from [python.org](https://python.org)
2. Check "Add Python to PATH" during installation
3. Restart Command Prompt

### Issue: Permission Denied
**Error:** `Permission denied` when installing packages

**Solutions:**
```cmd
# Option 1: Install for current user only
pip install --user package_name

# Option 2: Run Command Prompt as Administrator
# Right-click Command Prompt → "Run as administrator"
```

### Issue: Wrong Python Version
**Error:** Server starts but tools don't work

**Solution:**
```cmd
# Check Python version
python --version

# Should be 3.9 or higher
# If not, install newer Python version
```

### Issue: Claude Desktop Can't Find Server
**Symptoms:** Server shows as disconnected in Claude Desktop

**Checklist:**
1. ✅ Configuration file in correct location: `%APPDATA%\Claude\claude_desktop_config.json`
2. ✅ Valid JSON syntax (use JSON validator)
3. ✅ Correct file paths (no typos)
4. ✅ Claude Desktop restarted after config changes
5. ✅ Server runs manually: `test_server.bat`

### Issue: Server Starts But No Tools Available
**Symptoms:** Server connects but no tools are listed

**Solution:**
Check that all tool files are present:
```cmd
dir src\mcp_server\tools\*.py
```

Should show multiple `*_tool.py` files.

## Advanced Troubleshooting

### Check Detailed Logs
1. Open Claude Desktop
2. Look for MCP server logs in the interface
3. Check for specific error messages

### Manual Server Test
```cmd
cd C:\path\to\your\quick-data-for-windows-mcp
python main.py
```

Should show:
```
Quick Data for Windows MCP v1.0.0
Server running on stdio...
```

### Environment Debugging
```cmd
python -c "import sys; print(sys.path)"
python -c "import mcp; print('MCP OK')"
python -c "import pandas; print('Pandas OK')"
```

## Getting Help

If you're still having issues:

1. **Run diagnostics:**
   ```cmd
   python --version
   pip list | findstr mcp
   pip list | findstr pandas
   test_server.bat
   ```

2. **Check your configuration:**
   - Verify `%APPDATA%\Claude\claude_desktop_config.json` exists
   - Validate JSON syntax
   - Confirm all file paths are correct

3. **Create an issue** on GitHub with:
   - Windows version
   - Python version  
   - Error messages
   - Configuration file contents (remove personal paths)

The batch launcher (`run_server.bat`) should resolve most environment issues automatically!