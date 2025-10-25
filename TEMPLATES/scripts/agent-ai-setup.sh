#!/bin/bash
# Setup script for [Project Name] - Agent/AI Project

set -e  # Exit on error

echo "🚀 Setting up [Project Name]..."

# Check if Python is installed
if ! command -v python3 &> /dev/null; then
    echo "❌ Python 3 is not installed. Please install Python 3.11+ first."
    exit 1
fi

echo "✅ Python version: $(python3 --version)"

# Create virtual environment if it doesn't exist
if [ ! -d "venv" ]; then
    echo "📦 Creating virtual environment..."
    python3 -m venv venv
fi

# Activate virtual environment
echo "🔧 Activating virtual environment..."
source venv/bin/activate

# Upgrade pip
echo "⬆️  Upgrading pip..."
pip install --upgrade pip

# Install dependencies
if [ -f "requirements.txt" ]; then
    echo "📦 Installing Python dependencies..."
    pip install -r requirements.txt
else
    echo "⚠️  No requirements.txt found. Skipping dependency installation."
fi

# Install ADK if not already installed
if ! command -v adk &> /dev/null; then
    echo "📦 Installing Google ADK..."
    pip install agent-development-kit
fi

# Copy .env.template to .env if it doesn't exist
if [ ! -f .env ]; then
    if [ -f .env.template ]; then
        echo "📝 Creating .env file from .env.template..."
        cp .env.template .env
        echo "⚠️  Please update .env with your actual API keys"
    else
        echo "⚠️  No .env.template found. Skipping .env creation."
    fi
else
    echo "✅ .env file already exists"
fi

echo ""
echo "✅ Setup complete!"
echo ""
echo "Next steps:"
echo "  1. Update .env with your GEMINI_API_KEY"
echo "  2. Run 'source venv/bin/activate' to activate the virtual environment"
echo "  3. Run './scripts/test-agents.sh' to validate agents"
echo "  4. Run './scripts/start-adk-web.sh' to start the ADK web interface"
