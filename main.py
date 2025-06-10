#!/usr/bin/env python3
"""Entry point for the Quick Data for Windows MCP Server.

Windows-optimized fork of https://github.com/disler/quick-data-mcp
Original author: @disler | Fork maintainer: @Beaulewis1977
"""

import sys
import os

# Add src to Python path so we can import our server
sys.path.insert(0, os.path.join(os.path.dirname(__file__), 'src'))

from mcp_server.server import mcp


def main():
    """Run the MCP server."""
    mcp.run()


if __name__ == "__main__":
    main()