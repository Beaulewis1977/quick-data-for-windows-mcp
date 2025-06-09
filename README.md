# Quick Data for Windows MCP

> **Windows-optimized MCP server for Claude Desktop providing universal data analytics capabilities for JSON/CSV files**

[![Python 3.9+](https://img.shields.io/badge/python-3.9+-blue.svg)](https://www.python.org/downloads/)
[![Windows](https://img.shields.io/badge/platform-Windows-blue.svg)](https://www.microsoft.com/windows)
[![Claude Desktop](https://img.shields.io/badge/Claude-Desktop-purple.svg)](https://claude.ai/desktop)

## 🚀 What This Does

This MCP server transforms any CSV or JSON dataset into intelligent, AI-guided analytics workflows specifically optimized for Windows and Claude Desktop. It automatically adapts to ANY data structure without requiring manual configuration.

### ✨ Key Features

- **Universal Data Support** - Works with any CSV/JSON file structure
- **Windows Path Optimization** - Handles Windows file paths correctly
- **Claude Desktop Integration** - Pre-configured for seamless setup
- **Automatic Schema Discovery** - Analyzes your data and suggests analyses
- **32+ Analytics Tools** - From basic stats to advanced ML features
- **Interactive Visualizations** - Create charts with Plotly
- **Memory Management** - Optimized for large datasets

## 🏁 Quick Start for Windows

### Prerequisites

- **Windows 10/11**
- **Python 3.9+** ([Download here](https://www.python.org/downloads/))
- **Claude Desktop** ([Download here](https://claude.ai/desktop))

### Installation

1. **Download or clone this repository:**
   ```bash
   git clone https://github.com/Beaulewis1977/quick-data-for-windows-mcp.git
   cd quick-data-for-windows-mcp
   ```

2. **Run the Windows setup script:**
   ```bash
   windows-setup.bat
   ```

3. **Configure Claude Desktop:**
   
   Copy `claude_desktop_config.json.sample` to your Claude Desktop config directory:
   ```bash
   copy claude_desktop_config.json.sample "%APPDATA%\Claude\claude_desktop_config.json"
   ```
   
   **IMPORTANT:** Edit the copied config file and update these paths to your actual installation:
   - Replace `C:\Users\YourUsername\` with your actual username
   - Replace `quick-data-for-windows-mcp` with the full path to this project

4. **Restart Claude Desktop**

## 💻 Usage in Claude Desktop

Once configured, start with this slash command in Claude Desktop:

```
/quick-data-windows
```

### Loading Your Data

```
Load my sales data: C:\Users\YourName\Documents\sales_data.csv as "sales"
```

### Basic Analysis

```
Show me correlations in the sales dataset
Create a bar chart of sales by region
Analyze the distribution of revenue column
```

### Advanced Analytics

```
Validate data quality for sales dataset
Compare sales dataset with marketing dataset
Generate dashboard with revenue trends and regional breakdown
```
## 🔧 Available Tools

### Dataset Management
- `load_dataset` - Load CSV/JSON files with automatic schema discovery
- `list_loaded_datasets` - View all datasets in memory
- `get_dataset_info` - Get detailed dataset information
- `clear_dataset` / `clear_all_datasets` - Memory management

### Core Analytics
- `segment_by_column` - Analyze categorical data segments
- `find_correlations` - Discover relationships between variables
- `analyze_distributions` - Statistical distribution analysis
- `detect_outliers` - Identify data anomalies
- `suggest_analysis` - AI-powered analysis recommendations

### Visualization
- `create_chart` - Generate interactive charts (bar, scatter, line, histogram)
- `generate_dashboard` - Multi-chart dashboards

### Advanced Analytics
- `validate_data_quality` - Comprehensive data quality scoring
- `compare_datasets` - Multi-dataset comparison analysis
- `merge_datasets` - Join datasets with flexible strategies
- `calculate_feature_importance` - ML feature importance analysis
- `export_insights` - Export results in multiple formats

## 📂 Supported File Formats

### CSV Files
- Standard CSV with headers
- Custom delimiters automatically detected
- UTF-8 encoding support
- Large file handling with sampling options

### JSON Files
- Flat JSON structures
- Nested JSON (automatically flattened)
- JSON Lines format
- Array of objects format

## 🛠️ Configuration

### Manual Configuration

If the automatic setup doesn't work, manually edit your Claude Desktop config:

**Location:** `%APPDATA%\Claude\claude_desktop_config.json`

```json
{
  "mcpServers": {
    "quick-data-windows": {
      "command": "python",
      "args": [
        "C:\\path\\to\\your\\quick-data-for-windows-mcp\\main.py"
      ],
      "cwd": "C:\\path\\to\\your\\quick-data-for-windows-mcp",
      "env": {
        "LOG_LEVEL": "INFO",
        "PYTHONPATH": "C:\\path\\to\\your\\quick-data-for-windows-mcp\\src"
      }
    }
  }
}
```

### Alternative: Using UV Package Manager

If you prefer UV (recommended for Python dependency management):

```json
{
  "mcpServers": {
    "quick-data-windows": {
      "command": "uv",
      "args": [
        "--directory",
        "C:\\path\\to\\your\\quick-data-for-windows-mcp",
        "run",
        "python",
        "main.py"
      ]
    }
  }
}
```

## 🧪 Testing the Server

Test the server standalone (before Claude Desktop integration):

```bash
python main.py
```

Expected output:
```
Quick Data for Windows MCP v1.0.0
Server running on stdio...
```

## 📊 Example Workflows

### Sales Data Analysis
```
1. Load sales_data.csv as "sales"
2. Show correlations in sales dataset
3. Create bar chart of sales by product_category 
4. Detect outliers in revenue column
5. Generate dashboard with top products and regional trends
```

### Data Quality Assessment
```
1. Load customer_data.csv as "customers"
2. Validate data quality for customers dataset
3. Analyze distributions for age column
4. Segment by customer_type column
```

## 🔍 Troubleshooting

### Common Issues

**"Module not found" errors:**
- Ensure Python is in your PATH
- Run `pip install -r requirements.txt` manually
- Check that PYTHONPATH is set correctly in config

**"File not found" errors:**
- Use full Windows paths: `C:\Users\...`
- Avoid relative paths like `.\data\file.csv`
- Check file permissions

**Claude Desktop not finding server:**
- Restart Claude Desktop after config changes
- Check config file syntax with JSON validator
- Verify file paths are correct (no typos)

### Getting Help

1. Check that Python 3.9+ is installed: `python --version`
2. Verify dependencies: `pip list | findstr pandas`
3. Test server manually: `python main.py`
4. Check Claude Desktop logs for errors

## 🤝 Contributing

This is a community-driven Windows adaptation of the original quick-data-mcp project. Contributions welcome!

### Development Setup
```bash
# Clone and setup
git clone https://github.com/Beaulewis1977/quick-data-for-windows-mcp.git
cd quick-data-for-windows-mcp

# Install development dependencies
pip install -r requirements.txt
pip install pytest black ruff

# Run tests (when implemented)
pytest tests/
```

## 📝 License

MIT License - see LICENSE file for details.

## 🙏 Acknowledgments

- Original project by [disler/quick-data-mcp](https://github.com/disler/quick-data-mcp)
- Model Context Protocol by Anthropic
- Built for the Claude Desktop community

## 🔗 Links

- [Claude Desktop](https://claude.ai/desktop)
- [Model Context Protocol](https://modelcontextprotocol.io/)
- [Original Quick Data MCP](https://github.com/disler/quick-data-mcp)
- [Python for Windows](https://www.python.org/downloads/windows/)

---

**Ready to analyze your data with AI? Load a CSV and start exploring! 🚀**
