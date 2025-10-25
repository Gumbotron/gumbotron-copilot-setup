#!/bin/bash
# Start ADK web interface for [Project Name]

set -e

# Activate virtual environment if it exists
if [ -d "venv" ]; then
    source venv/bin/activate
fi

# Check if ADK is installed
if ! command -v adk &> /dev/null; then
    echo "❌ ADK not installed. Run ./scripts/setup.sh first."
    exit 1
fi

# Find backend directory
BACKEND_DIR=$(find . -maxdepth 1 -type d -name "*backend*" -o -name "*adk*" | head -n 1)

if [ -z "$BACKEND_DIR" ]; then
    echo "❌ No backend directory found."
    exit 1
fi

echo "🚀 Starting ADK web interface..."
echo "📁 Backend directory: $BACKEND_DIR"
echo "🌐 Opening: http://localhost:8003"
echo ""
echo "Press Ctrl+C to stop the server"
echo ""

cd "$BACKEND_DIR"
adk web . --port 8003
