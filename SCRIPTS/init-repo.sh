#!/bin/bash
# Repository Initialization Script
# Usage: ./init-repo.sh <project-type> <project-name>

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Configuration
META_CONFIG_REPO="https://github.com/Gumbotron/gumbotron-copilot-setup"
PROJECT_TYPE=$1
PROJECT_NAME=$2

# Functions
print_success() {
    echo -e "${GREEN}✓${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_info() {
    echo -e "${YELLOW}ℹ${NC} $1"
}

show_usage() {
    echo "Usage: $0 <project-type> <project-name>"
    echo ""
    echo "Project types:"
    echo "  frontend    - Frontend project (React, Vue, etc.)"
    echo "  agent-ai    - AI/Agent development project"
    echo "  fullstack   - Full-stack application"
    echo ""
    echo "Example:"
    echo "  $0 frontend my-new-app"
}

# Validate arguments
if [ -z "$PROJECT_TYPE" ] || [ -z "$PROJECT_NAME" ]; then
    show_usage
    exit 1
fi

# Validate project type
if [[ ! "$PROJECT_TYPE" =~ ^(frontend|agent-ai|fullstack)$ ]]; then
    print_error "Invalid project type: $PROJECT_TYPE"
    show_usage
    exit 1
fi

print_info "Initializing $PROJECT_TYPE project: $PROJECT_NAME"

# Create project directory
if [ -d "$PROJECT_NAME" ]; then
    print_error "Directory $PROJECT_NAME already exists"
    exit 1
fi

mkdir -p "$PROJECT_NAME"
cd "$PROJECT_NAME"
print_success "Created project directory"

# Initialize git repository
git init
print_success "Initialized git repository"

# Create basic README
cat > README.md << EOF
# $PROJECT_NAME

[Brief description of your project]

## Setup

See [Development Guide](./docs/development.md) for setup instructions.

## Architecture

See [Architecture Documentation](./docs/architecture.md) for system design.

## Deployment

See [Deployment Guide](./docs/deployment.md) for deployment instructions.

## License

[Your license]
EOF
print_success "Created README.md"

# Create docs directory
mkdir -p docs
print_success "Created docs directory"

# Setup based on project type
case $PROJECT_TYPE in
    frontend)
        print_info "Setting up frontend project..."
        
        # Create directory structure
        mkdir -p src/{components,services,utils} public tests
        
        # Copy devcontainer template (if available locally)
        if [ -f "../devcontainer-frontend.json" ]; then
            mkdir -p .devcontainer
            cp ../devcontainer-frontend.json .devcontainer/devcontainer.json
            print_success "Added devcontainer configuration"
        fi
        
        # Create package.json
        cat > package.json << EOF
{
  "name": "$PROJECT_NAME",
  "version": "0.1.0",
  "type": "module",
  "scripts": {
    "dev": "vite",
    "build": "vite build",
    "preview": "vite preview",
    "test": "vitest",
    "lint": "eslint .",
    "format": "prettier --write ."
  }
}
EOF
        print_success "Created package.json"
        
        # Create .gitignore
        cat > .gitignore << EOF
node_modules/
dist/
.env
.env.local
*.log
.DS_Store
coverage/
EOF
        print_success "Created .gitignore"
        
        print_info "Next steps:"
        echo "  1. cd $PROJECT_NAME"
        echo "  2. npm create vite@latest . -- --template react-ts"
        echo "  3. npm install"
        echo "  4. Open in VS Code and reopen in DevContainer"
        ;;
        
    agent-ai)
        print_info "Setting up AI/Agent project..."
        
        # Create directory structure
        mkdir -p agents/{specialized} workflows protocols human_loop scripts tests/{unit,integration,safety}
        
        # Copy devcontainer template (if available locally)
        if [ -f "../devcontainer-python-ai.json" ]; then
            mkdir -p .devcontainer
            cp ../devcontainer-python-ai.json .devcontainer/devcontainer.json
            print_success "Added devcontainer configuration"
        fi
        
        # Create requirements.txt
        cat > requirements.txt << EOF
# AI/Agent frameworks
azure-ai-agent-openai>=1.0.0
openai>=1.0.0

# Azure SDK
azure-identity>=1.15.0

# Configuration
python-dotenv>=1.0.0
pydantic>=2.0.0

# Testing
pytest>=7.4.0
pytest-asyncio>=0.21.0
pytest-cov>=4.1.0

# Development tools
black>=23.0.0
flake8>=6.0.0
mypy>=1.0.0
EOF
        print_success "Created requirements.txt"
        
        # Create .env.example
        cat > .env.example << EOF
# Azure OpenAI Configuration
AZURE_OPENAI_ENDPOINT=https://your-resource.openai.azure.com/
AZURE_OPENAI_API_KEY=your-api-key
AZURE_OPENAI_DEPLOYMENT=gpt-4

# Agent Configuration
AGENT_MAX_ITERATIONS=10
AGENT_TIMEOUT_SECONDS=300
HUMAN_REVIEW_THRESHOLD=0.8

# Logging
LOG_LEVEL=INFO
EOF
        print_success "Created .env.example"
        
        # Create .gitignore
        cat > .gitignore << EOF
__pycache__/
*.py[cod]
*$py.class
*.so
.Python
venv/
.env
.env.local
*.log
.DS_Store
.coverage
htmlcov/
.pytest_cache/
.mypy_cache/
EOF
        print_success "Created .gitignore"
        
        print_info "Next steps:"
        echo "  1. cd $PROJECT_NAME"
        echo "  2. cp .env.example .env"
        echo "  3. Edit .env with your Azure OpenAI credentials"
        echo "  4. Open in VS Code and reopen in DevContainer"
        echo "  5. pip install -r requirements.txt"
        ;;
        
    fullstack)
        print_info "Setting up full-stack project..."
        
        # Create directory structure
        mkdir -p frontend/{src,public,tests} backend/{src,tests} shared/{types,utils} infrastructure docs scripts
        
        # Copy devcontainer template (if available locally)
        if [ -f "../docker-compose-fullstack.yml" ]; then
            mkdir -p .devcontainer
            cp ../docker-compose-fullstack.yml .devcontainer/docker-compose.yml
            print_success "Added devcontainer configuration"
        fi
        
        # Create root package.json
        cat > package.json << EOF
{
  "name": "$PROJECT_NAME",
  "version": "0.1.0",
  "private": true,
  "workspaces": [
    "frontend",
    "backend",
    "shared"
  ],
  "scripts": {
    "dev": "./scripts/dev.sh",
    "build": "npm run build --workspaces",
    "test": "npm run test --workspaces"
  }
}
EOF
        print_success "Created root package.json"
        
        # Create .gitignore
        cat > .gitignore << EOF
node_modules/
dist/
build/
.env
.env.local
*.log
.DS_Store
coverage/
__pycache__/
*.py[cod]
EOF
        print_success "Created .gitignore"
        
        print_info "Next steps:"
        echo "  1. cd $PROJECT_NAME"
        echo "  2. Set up frontend: cd frontend && npm create vite@latest . -- --template react-ts"
        echo "  3. Set up backend: cd ../backend && npm init -y"
        echo "  4. Open in VS Code and reopen in DevContainer"
        ;;
esac

# Create GitHub directory
mkdir -p .github/workflows

# Copy copilot instructions
cat > .github/copilot-instructions.md << EOF
# GitHub Copilot Instructions

This project follows patterns from the Gumbotron meta-configuration repository.

## Project Type: $PROJECT_TYPE

Please refer to the setup guide and best practices for $PROJECT_TYPE projects.

## General Guidelines

- Follow existing code style and conventions
- Write clear and maintainable code
- Include appropriate tests for new features
- Update documentation when making significant changes

## Code Quality

- Ensure code is well-tested
- Handle errors appropriately
- Follow security best practices
- Write efficient and performant code
EOF
print_success "Created .github/copilot-instructions.md"

# Final message
echo ""
print_success "Project initialized successfully!"
echo ""
print_info "Project structure created for: $PROJECT_TYPE"
print_info "Location: $(pwd)"
echo ""
print_info "Refer to the meta-configuration repository for templates and guides:"
echo "  $META_CONFIG_REPO"
echo ""
