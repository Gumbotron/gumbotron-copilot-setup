#!/bin/bash
# Repository Validation Script
# Validates that a repository follows the expected structure and best practices

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Counters
PASSED=0
FAILED=0
WARNINGS=0

# Functions
print_success() {
    echo -e "${GREEN}✓${NC} $1"
    ((PASSED++))
}

print_error() {
    echo -e "${RED}✗${NC} $1"
    ((FAILED++))
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
    ((WARNINGS++))
}

print_info() {
    echo -e "${BLUE}ℹ${NC} $1"
}

check_file() {
    local file=$1
    local message=$2
    
    if [ -f "$file" ]; then
        print_success "$message exists: $file"
        return 0
    else
        print_error "$message missing: $file"
        return 1
    fi
}

check_directory() {
    local dir=$1
    local message=$2
    
    if [ -d "$dir" ]; then
        print_success "$message exists: $dir"
        return 0
    else
        print_error "$message missing: $dir"
        return 1
    fi
}

check_optional_file() {
    local file=$1
    local message=$2
    
    if [ -f "$file" ]; then
        print_success "$message exists: $file"
        return 0
    else
        print_warning "$message recommended but missing: $file"
        return 1
    fi
}

echo "========================================"
echo "Repository Validation"
echo "========================================"
echo ""

# Basic Repository Structure
print_info "Checking basic repository structure..."
echo ""

check_file "README.md" "README file"
check_file ".gitignore" "Git ignore file"
check_directory ".git" "Git repository"

echo ""

# GitHub Configuration
print_info "Checking GitHub configuration..."
echo ""

check_directory ".github" "GitHub directory"
check_optional_file ".github/copilot-instructions.md" "Copilot instructions"
check_optional_file ".github/workflows" "GitHub Actions workflows"

echo ""

# Documentation
print_info "Checking documentation..."
echo ""

check_directory "docs" "Documentation directory"
check_optional_file "docs/architecture.md" "Architecture documentation"
check_optional_file "docs/deployment.md" "Deployment documentation"
check_optional_file "docs/development.md" "Development guide"

echo ""

# DevContainer Configuration
print_info "Checking DevContainer configuration..."
echo ""

if check_directory ".devcontainer" "DevContainer directory"; then
    check_file ".devcontainer/devcontainer.json" "DevContainer config"
fi

echo ""

# Project-Specific Checks
print_info "Checking project-specific files..."
echo ""

# Check for frontend project indicators
if [ -f "package.json" ]; then
    print_success "package.json found - appears to be a Node.js project"
    
    # Check for common frontend patterns
    if [ -d "src/components" ] || [ -d "src/pages" ]; then
        print_info "  Frontend project detected"
        check_optional_file "vite.config.js" "Vite configuration"
        check_optional_file "tsconfig.json" "TypeScript configuration"
    fi
    
    # Check for common backend patterns
    if [ -d "src/routes" ] || [ -d "src/controllers" ]; then
        print_info "  Backend project detected"
    fi
fi

# Check for Python project indicators
if [ -f "requirements.txt" ] || [ -f "pyproject.toml" ]; then
    print_success "Python project detected"
    
    # Check for AI/Agent patterns
    if [ -d "agents" ] || [ -d "protocols" ]; then
        print_info "  AI/Agent project detected"
        check_optional_file ".env.example" "Environment variables template"
    fi
fi

echo ""

# Security Checks
print_info "Running security checks..."
echo ""

# Check for committed secrets
if [ -f ".env" ]; then
    print_error "Environment file (.env) should not be committed"
else
    print_success "No .env file committed"
fi

# Check .gitignore includes common sensitive files
if [ -f ".gitignore" ]; then
    if grep -q "\.env" .gitignore; then
        print_success ".gitignore includes .env"
    else
        print_warning ".gitignore should include .env"
    fi
    
    if grep -q "node_modules" .gitignore; then
        print_success ".gitignore includes node_modules"
    fi
fi

echo ""

# Code Quality Checks
print_info "Checking code quality configuration..."
echo ""

# Check for linting configuration
if [ -f ".eslintrc.js" ] || [ -f ".eslintrc.json" ] || [ -f "eslint.config.js" ]; then
    print_success "ESLint configuration found"
elif [ -f "package.json" ] && grep -q "eslint" package.json; then
    print_success "ESLint configured in package.json"
else
    check_optional_file ".eslintrc.json" "ESLint configuration"
fi

# Check for formatting configuration
check_optional_file ".prettierrc" "Prettier configuration"
check_optional_file ".prettierrc.json" "Prettier configuration"

# Check for Python linting
if [ -f "requirements.txt" ] || [ -f "pyproject.toml" ]; then
    check_optional_file ".flake8" "Flake8 configuration"
    check_optional_file "pyproject.toml" "Python project configuration"
fi

echo ""

# Testing
print_info "Checking test configuration..."
echo ""

if [ -d "tests" ] || [ -d "test" ]; then
    print_success "Test directory found"
elif [ -d "src/__tests__" ]; then
    print_success "Test directory found: src/__tests__"
else
    print_warning "No test directory found"
fi

echo ""

# CI/CD
print_info "Checking CI/CD configuration..."
echo ""

if [ -d ".github/workflows" ]; then
    workflow_count=$(find .github/workflows -name "*.yml" -o -name "*.yaml" | wc -l)
    if [ $workflow_count -gt 0 ]; then
        print_success "Found $workflow_count GitHub Actions workflow(s)"
    else
        print_warning "GitHub workflows directory exists but no workflows found"
    fi
else
    print_warning "No GitHub Actions workflows configured"
fi

echo ""

# Summary
echo "========================================"
echo "Validation Summary"
echo "========================================"
echo -e "${GREEN}Passed:${NC}   $PASSED"
echo -e "${YELLOW}Warnings:${NC} $WARNINGS"
echo -e "${RED}Failed:${NC}   $FAILED"
echo ""

if [ $FAILED -eq 0 ]; then
    if [ $WARNINGS -eq 0 ]; then
        echo -e "${GREEN}✓ Repository validation passed with no issues!${NC}"
        exit 0
    else
        echo -e "${YELLOW}⚠ Repository validation passed with warnings.${NC}"
        echo "  Consider addressing the warnings above."
        exit 0
    fi
else
    echo -e "${RED}✗ Repository validation failed.${NC}"
    echo "  Please address the errors above."
    exit 1
fi
