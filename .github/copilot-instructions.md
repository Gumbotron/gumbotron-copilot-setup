# GitHub Copilot Instructions

This repository is a **meta-configuration template** for bootstrapping new projects.

## 🎯 Primary Resources - ALWAYS REFERENCE THESE FIRST

**For ALL development questions:**
- **[README.md](../README.md)** - Complete repository setup checklist
- **[COPILOT.md](../COPILOT.md)** - Detailed AI assistant development guide
- **[TEMPLATES/](../TEMPLATES/)** - Ready-to-use template files

**For Agent/AI projects (model after Catalyst Weave):**
- **[Catalyst Weave AGENTS.md](https://github.com/Gumbotron/catalyst-weave/blob/main/AGENTS.md)** - Agent development guide
- **[ADK llms.txt](https://github.com/google/adk-python/blob/main/llms.txt)** - Google ADK documentation

**For Frontend projects (model after Bridge 4):**
- **[Bridge 4 Flight Map](https://github.com/Gumbotron/bridge-4-flight-map)** - Frontend structure reference

## 🚀 Using This Template

When helping a user create a new project based on this template:

1. **Identify project type**: Agent/AI or Frontend
2. **Guide them to copy templates**: See [TEMPLATES/README.md](../TEMPLATES/README.md)
3. **Follow setup checklist**: [README.md Repository Setup Checklist](../README.md#repository-setup-checklist)
4. **Reference appropriate example**: Catalyst Weave (AI) or Bridge 4 (Frontend)

## 📋 Key Points

- **This is a template repository** - don't modify it directly, copy templates to new projects
- **Templates are in TEMPLATES/** - environment files, devcontainer, scripts, docs
- **Different patterns for different types**:
  - Agent/AI: Use `.env.template`, create AGENTS.md/SETUP.md, use agent-ai scripts
  - Frontend: Use `.env.example`, create docs/, use frontend scripts
- **Always initialize project code first** (npm create vite, etc.) before organizing structure

## 🔑 Development Guidelines

When working on THIS template repository itself:

### Code Style
- Keep templates minimal and generic
- Use `[Project Name]` as placeholder
- Include helpful comments
- Follow patterns from reference projects

### Documentation
- Keep README.md, COPILOT.md, and .github/copilot-instructions.md in sync
- Update TEMPLATES/README.md when adding templates
- Use clear numbered sections and emoji indicators
- Reference external examples rather than duplicating

### Template Quality
- Test templates by following setup instructions
- Ensure scripts work on both local and Codespaces
- Make scripts executable (chmod +x)
- Include error handling in scripts

---

*For complete guidance on using this template, see [README.md](../README.md) and [COPILOT.md](../COPILOT.md)*
