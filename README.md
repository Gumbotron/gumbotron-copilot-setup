# Gumbotron Meta-Configuration Repository

This repository serves as a **meta-configuration guide** for setting up new projects according to established development patterns and preferences. It provides documentation, templates, and instructions that help you (and GitHub Copilot) quickly bootstrap new repositories with consistent structure and best practices.

## Purpose

Rather than starting from scratch with each new project, this repository provides:

1. **Documentation** - Step-by-step guides for setting up different types of projects
2. **Templates** - Starter files and folder structures ready to copy
3. **Configuration Guides** - Standard tooling setup for common development needs
4. **Scripts** - Helper utilities to automate repository initialization
5. **Copilot Instructions** - Guidance for AI-assisted development

## Core Development Principles

This meta-configuration draws from proven patterns:

### From Bridge 4 Flight Map (Core Development)
- Clean devcontainer setup with frontend focus
- Comprehensive deployment documentation
- Clear architecture documentation  
- Structured data source management

### From Catalyst Weave (Agent/AI Development)
- ADK-based agent architecture
- Development workflow scripts
- Testing and validation protocols
- Human-in-the-loop capabilities

## Repository Structure

```
gumbotron-copilot-setup/
├── PROJECT_TYPES/          # Setup guides for different project types
│   ├── frontend.md         # Frontend project setup
│   ├── agent-ai.md         # Agent/AI development setup
│   └── fullstack.md        # Full-stack project setup
├── CONFIGURATION_GUIDES/   # Standard tooling configuration
│   ├── devcontainer.md     # DevContainer setup guide
│   ├── deployment.md       # Deployment documentation guide
│   └── architecture.md     # Architecture documentation guide
├── TEMPLATES/              # Starter files and structures
│   ├── devcontainer/       # DevContainer templates
│   ├── docs/               # Documentation templates
│   └── workflows/          # GitHub Actions workflows
├── SCRIPTS/                # Helper utilities
│   ├── init-repo.sh        # Initialize new repository
│   └── validate.sh         # Validate repository structure
└── README.md               # This file
```

## Quick Start

### For New Projects

1. **Choose your project type** from `PROJECT_TYPES/`
2. **Follow the setup guide** for your chosen type
3. **Copy relevant templates** from `TEMPLATES/`
4. **Configure tooling** using guides in `CONFIGURATION_GUIDES/`
5. **Run initialization scripts** from `SCRIPTS/` if needed

### For GitHub Copilot

This repository includes special instructions in `.github/copilot-instructions.md` to help Copilot understand your preferences when working on new projects. Copilot can reference:

- Project type patterns from `PROJECT_TYPES/`
- Configuration standards from `CONFIGURATION_GUIDES/`
- Template structures from `TEMPLATES/`

## Usage Examples

### Setting Up a New Frontend Project

```bash
# 1. Create your new repository
# 2. Reference PROJECT_TYPES/frontend.md for setup steps
# 3. Copy templates:
cp -r TEMPLATES/devcontainer/.devcontainer ./
cp -r TEMPLATES/docs/ ./docs/
# 4. Follow configuration guides as needed
```

### Setting Up an Agent/AI Project

```bash
# 1. Create your new repository
# 2. Reference PROJECT_TYPES/agent-ai.md for setup steps
# 3. Copy ADK-based templates and configure workflows
# 4. Set up testing protocols and human-in-the-loop patterns
```

## Contributing

When adding new patterns or templates to this repository:

1. Document the pattern clearly in the appropriate directory
2. Provide practical examples that can be copied/adapted
3. Explain the "why" behind configuration choices
4. Keep templates minimal but complete
5. Update this README if adding new top-level directories

## Philosophy

This meta-configuration approach recognizes that:

- **Consistency matters** - Similar projects should have similar structures
- **Patterns evolve** - Capture learnings from each project
- **Documentation is code** - Treat setup guides as living artifacts
- **Automation helps** - Scripts reduce manual setup errors
- **AI assists** - Copilot can follow documented patterns

## License

This is a personal configuration repository. Adapt freely for your own use.
