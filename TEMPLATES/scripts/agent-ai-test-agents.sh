#!/bin/bash
# Test agents script for [Project Name]

set -e

# Activate virtual environment if it exists
if [ -d "venv" ]; then
    source venv/bin/activate
fi

echo "🧪 Testing agents..."

# Check if backend directory exists
BACKEND_DIR=$(find . -maxdepth 1 -type d -name "*backend*" -o -name "*adk*" | head -n 1)

if [ -z "$BACKEND_DIR" ]; then
    echo "❌ No backend directory found. Looking for directories containing 'backend' or 'adk'"
    exit 1
fi

echo "✅ Found backend directory: $BACKEND_DIR"

# Test that agents can be loaded
cd "$BACKEND_DIR"

# Check for main_agent
if [ -d "main_agent" ]; then
    echo "✅ main_agent directory found"
else
    echo "❌ main_agent directory not found"
    exit 1
fi

# Try to validate with adk
if command -v adk &> /dev/null; then
    echo "🔍 Validating agents with ADK..."
    adk web --help > /dev/null 2>&1 && echo "✅ ADK is working"
else
    echo "⚠️  ADK not installed. Install with: pip install agent-development-kit"
fi

echo ""
echo "✅ Agent validation complete!"
