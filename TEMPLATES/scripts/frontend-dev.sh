#!/bin/bash
# Development server script for [Project Name]

set -e

echo "🚀 Starting development server..."

# Check if node_modules exists
if [ ! -d "node_modules" ]; then
    echo "❌ Dependencies not installed. Running setup..."
    ./scripts/setup.sh
fi

# Start the development server
npm run dev
