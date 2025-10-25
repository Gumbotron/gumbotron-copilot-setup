#!/bin/bash
# Build script for [Project Name]

set -e

echo "🏗️  Building for production..."

# Clean previous build
rm -rf dist

# Build the project
npm run build

echo "✅ Build complete! Output in ./dist"
