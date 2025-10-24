# Helper Scripts

This directory contains utility scripts to help with repository setup and validation.

## Available Scripts

### init-repo.sh

Initialize a new repository with the chosen project type structure.

**Usage:**
```bash
./init-repo.sh <project-type> <project-name>
```

**Project Types:**
- `frontend` - Frontend project (React, Vue, etc.)
- `agent-ai` - AI/Agent development project
- `fullstack` - Full-stack application

**Example:**
```bash
./init-repo.sh frontend my-new-app
cd my-new-app
# Follow the next steps printed by the script
```

**What it does:**
- Creates project directory structure
- Initializes git repository
- Creates basic README and documentation structure
- Sets up .gitignore
- Creates project-specific configuration files
- Adds GitHub Copilot instructions

### validate.sh

Validate that a repository follows best practices and has the expected structure.

**Usage:**
```bash
cd /path/to/your/project
/path/to/meta-config/SCRIPTS/validate.sh
```

**What it checks:**
- Basic repository structure (README, .gitignore, etc.)
- GitHub configuration (.github directory, workflows)
- Documentation (docs directory and key files)
- DevContainer configuration
- Project-specific files
- Security issues (e.g., committed .env files)
- Code quality configuration (linters, formatters)
- Test setup
- CI/CD configuration

**Exit codes:**
- `0` - Validation passed (with or without warnings)
- `1` - Validation failed with errors

## Adding New Scripts

When adding new helper scripts:

1. Make them executable: `chmod +x script-name.sh`
2. Add usage documentation in this README
3. Include help/usage output in the script
4. Use consistent output formatting (colors, symbols)
5. Handle errors gracefully with clear messages

## Script Conventions

### Output Colors
- Green (✓) - Success
- Red (✗) - Error/Failure
- Yellow (⚠) - Warning
- Blue (ℹ) - Information

### Error Handling
- Use `set -e` to exit on errors
- Validate inputs before processing
- Provide clear error messages
- Include usage instructions when arguments are missing

### Documentation
- Include a header comment explaining the script's purpose
- Add usage examples
- Document required dependencies
