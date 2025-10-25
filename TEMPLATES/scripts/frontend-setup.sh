#!/bin/bash
# Setup script for [Project Name]
# This script sets up the development environment

set -e  # Exit on error

echo "🚀 Setting up [Project Name]..."

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "❌ Node.js is not installed. Please install Node.js 18+ first."
    exit 1
fi

echo "✅ Node.js version: $(node --version)"
echo "✅ npm version: $(npm --version)"

# Install dependencies
echo "📦 Installing dependencies..."
npm install

# Copy .env.example to .env if it doesn't exist
if [ ! -f .env ]; then
    if [ -f .env.example ]; then
        echo "📝 Creating .env file from .env.example..."
        cp .env.example .env
        echo "⚠️  Please update .env with your actual configuration values"
    else
        echo "⚠️  No .env.example found. Skipping .env creation."
    fi
else
    echo "✅ .env file already exists"
fi

echo ""
echo "✅ Setup complete!"
echo ""
echo "Next steps:"
echo "  1. Update .env with your configuration"
echo "  2. Run 'npm run dev' or './scripts/dev.sh' to start development server"
echo "  3. Run 'npm test' or './scripts/test.sh' to run tests"
