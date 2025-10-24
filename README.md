# Gumbotron Copilot Setup

This repository contains my preferred development patterns, styles, and preferences for use as a reference when starting new projects with GitHub Copilot.

## Purpose

This is a **meta-configuration repository** - a template of templates. When starting a new project, I'll create a repository based on this one and provide Copilot with a design document to get started.

## Key Development Preferences

### From Bridge 4 Flight Map (Frontend/Core Development)
- Clean devcontainer setup
- Comprehensive deployment documentation
- Clear architecture documentation
- Structured data source management

### From Catalyst Weave (Agent/AI Development)
- [Google ADK](https://google.github.io/adk-docs/)-based agent architecture
- Development workflow organization
- Testing and validation protocols
- Human-in-the-loop capabilities

## Repository Structure

```
gumbotron-copilot-setup/
├── .github/
│   └── copilot-instructions.md  # Instructions for GitHub Copilot
├── PROJECT_TYPES/               # Guides for different project types
├── TEMPLATES/                   # Starter files and structures
└── README.md                    # This file
```

## For GitHub Copilot

When working on new projects, reference:
- `.github/copilot-instructions.md` for general coding preferences
- `PROJECT_TYPES/` for project-specific patterns
- `TEMPLATES/` for starter file structures

## Contributing Patterns

When adding new patterns:
1. Keep documentation minimal and focused on KEY preferences
2. Avoid overly specific technology choices unless they're essential
3. Document the "why" behind choices
4. Provide examples that can be adapted

## Philosophy

- **Consistency over completeness** - Document what matters
- **Patterns over specifics** - Show the approach, not every detail
- **Documentation as reference** - Living guide for preferences
- **AI-assisted development** - Optimized for Copilot understanding
