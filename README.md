# Gumbotron Copilot Setup: Meta-Configuration Repository

## 1. Overview

This repository serves as a **meta-configuration guide** for bootstrapping new projects with GitHub Copilot. It contains documented patterns, styles, and preferences from successful projects (**Bridge 4 Flight Map** and **Catalyst Weave**) to ensure consistency across all future development.

**🎯 For AI Assistants/Copilot**: See [COPILOT.md](COPILOT.md) for complete development guidance when working with this repository.

## 2. 🚀 Quick Start

### **When Starting a New Project**

1. **Create new repository** based on this template
2. **Review project type** in `PROJECT_TYPES/` directory
3. **Copy relevant templates** from `TEMPLATES/docs/`
4. **Provide Copilot** with design document and reference this repo

### **For AI Assistants**

```bash
# Read this first
cat COPILOT.md

# Then review project-specific patterns
cat PROJECT_TYPES/[your-project-type].md
```

## 3. 🏗️ Repository Structure

```
gumbotron-copilot-setup/
├── .github/
│   └── copilot-instructions.md  # General coding preferences
├── PROJECT_TYPES/               # Project-specific patterns
│   ├── frontend.md              # Frontend development patterns
│   └── agent-ai.md              # Agent/AI development patterns
├── REFERENCE_LIBRARY/           # Curated framework documentation
│   ├── README.md                # Reference library index
│   ├── agent-frameworks/        # AI/Agent framework docs
│   │   ├── adk-llms.txt        # Google ADK concise reference
│   │   └── adk-llms-full.txt   # Google ADK complete docs
│   └── frontend-frameworks/     # Frontend framework references
├── TEMPLATES/                   # Starter documentation templates
│   └── docs/                    # Documentation templates
│       ├── architecture-template.md
│       ├── deployment-template.md
│       └── development-template.md
├── README.md                    # This file
└── COPILOT.md                   # AI assistant guidelines
```

## 4. 📚 Key Development Preferences

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

## 5. 📁 Project Types

| Project Type | Use Case | Documentation |
|--------------|----------|---------------|
| **Frontend** | React/Vue/modern web apps | [PROJECT_TYPES/frontend.md](PROJECT_TYPES/frontend.md) |
| **Agent/AI** | Google ADK-based agents | [PROJECT_TYPES/agent-ai.md](PROJECT_TYPES/agent-ai.md) |

## 6. 📖 Documentation Guide

| Document | Purpose | Audience |
|----------|---------|----------|
| **[README.md](README.md)** | Repository overview | All users |
| **[COPILOT.md](COPILOT.md)** | AI assistant guidelines | Copilot, AI assistants |
| **[REFERENCE_LIBRARY/](REFERENCE_LIBRARY/)** | Framework docs and references | All users |
| **[PROJECT_TYPES/](PROJECT_TYPES/)** | Project-specific patterns | Developers starting new projects |
| **[TEMPLATES/](TEMPLATES/)** | Starter documentation | All project types |

## 7. 🎯 Philosophy

This meta-configuration approach recognizes that:

- **Consistency matters** - Similar projects should follow similar patterns
- **Patterns over specifics** - Document the approach, not every implementation detail
- **Documentation as code** - Treat these guides as living references
- **AI-assisted development** - Optimized for Copilot understanding and application

## 8. 🤝 Contributing Patterns

When adding new patterns to this repository:

1. **Keep documentation minimal** - Focus on KEY preferences only
2. **Avoid technology specifics** - Unless essential or proven in reference projects
3. **Document the "why"** - Explain reasoning behind choices
4. **Provide adaptable examples** - Not prescriptive implementations
5. **Update cross-references** - Keep documentation links current

## 9. 📋 Usage Workflow

### For New Projects

1. **Identify project type** from `PROJECT_TYPES/`
2. **Review reference library** at `REFERENCE_LIBRARY/` for relevant docs
3. **Review relevant patterns** and best practices
4. **Copy template files** from `TEMPLATES/docs/`
5. **Customize templates** with project-specific details
6. **Reference this repo** when providing design docs to Copilot

### For AI Assistants

1. **Read [COPILOT.md](COPILOT.md)** for complete development guidelines
2. **Consult [REFERENCE_LIBRARY/](REFERENCE_LIBRARY/)** for framework-specific docs
3. **Follow documented patterns** from reference projects
4. **Apply minimal changes** - Only what's necessary
5. **Maintain consistency** with established patterns

---

**🎯 Ready to start?** Choose your project type from `PROJECT_TYPES/` and reference the appropriate patterns and templates.
