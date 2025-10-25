# Gumbotron Copilot Setup

Meta-configuration repository for bootstrapping new projects with consistent patterns.

## Quick Start

1. **Create new repo** based on this template
2. **Review [Current Projects](#current-projects)** for tech stack examples  
3. **Follow [Repository Setup](#repository-setup-checklist)** checklist below
4. **Reference [Catalyst Weave](https://github.com/Gumbotron/catalyst-weave)** or [Bridge 4](https://github.com/Gumbotron/bridge-4-flight-map)** for patterns
5. **Provide design doc** to Copilot referencing this repo

## Current Projects

| Project | Type | Tech Stack | Root Files | Key Directories |
|---------|------|------------|------------|-----------------|
| **[Catalyst Weave](https://github.com/Gumbotron/catalyst-weave)** | Agent/AI | Python, Google ADK, Gemini | README.md, AGENTS.md, SETUP.md | `cw-adk-backend/`, `docs/`, `scripts/`, `.devcontainer/` |
| **[Bridge 4 Flight Map](https://github.com/Gumbotron/bridge-4-flight-map)** | Frontend | React, TypeScript, Vite | README.md | `src/`, `docs/`, `.devcontainer/` |

## Repository Setup Checklist

Follow this sequence when starting a new project:

### 1. Root-Level Documentation
```
✓ README.md - Project overview, quick start, architecture summary
✓ SETUP.md - Detailed setup instructions (for Agent/AI projects)
✓ AGENTS.md - Agent development guide (for Agent/AI projects only)
✓ .gitignore - Exclude .env, node_modules, __pycache__, etc.
```

### 2. Environment Configuration
```bash
# Create .env.template (NOT .env.example)
touch .env.template

# Template should document:
# - All required API keys
# - Configuration options
# - Setup instructions for local & Codespaces
# - Never commit actual .env file
```

### 3. Development Container
```bash
# Create devcontainer configuration
mkdir -p .devcontainer
touch .devcontainer/devcontainer.json

# Reference examples:
# - Catalyst Weave: Python 3.11+, ADK tools, Google API
# - Bridge 4: Node.js, TypeScript, frontend tools
```

### 4. GitHub Configuration
```bash
# Create Copilot instructions
mkdir -p .github
touch .github/copilot-instructions.md

# Content should reference:
# - Primary documentation (AGENTS.md, SETUP.md)
# - Framework-specific docs (ADK llms.txt, React docs)
# - Development workflow and helper scripts
```

### 5. Documentation Directory
```bash
# Create docs directory
mkdir -p docs

# For Agent/AI projects:
# - Agent_Development_Kit_LLM_Instructions.txt (copy from ADK)
# - AGENT_WORKFLOWS.md
# - README.md (docs index)

# For Frontend projects:
# - architecture.md
# - deployment.md  
# - development.md
```

### 6. Helper Scripts (Optional)
```bash
# For Agent/AI projects, create scripts/:
# - adk-setup.sh - Complete environment setup
# - test-agents.sh - Validate agents work
# - start-adk-web.sh - Launch web interface
# - demo.sh - Interactive demos

# Scripts provide convenience but aren't required
```

### 7. Code Structure

**Agent/AI Projects (Catalyst Weave pattern):**
```
backend-name/
├── main_agent/           # Orchestrator
├── sub_agents/          # Specialists
├── agent_workflows/     # Complex workflows
├── tools/              # Custom tools
└── requirements.txt
```

**Frontend Projects (Bridge 4 pattern):**
```
src/
├── components/         # React components
├── services/          # API clients
├── utils/            # Helper functions
└── assets/           # Static resources
```

## Key Development Practices

### Documentation Style (Catalyst Weave pattern)
- **Numbered sections** with clear hierarchy (1., 2., 3.)
- **Quick reference tables** at document tops
- **Emoji indicators** for visual scanning (🎯, 🚀, 📚, ⚠️)
- **Code examples** inline with explanations
- **Cross-references** between related docs

### Environment Management
- Use `.env.template` (documents structure)
- Never commit `.env` (contains secrets)
- Support both local dev and GitHub Codespaces
- Check for workspace secrets first (GitHub)

### Devcontainer Pattern
- Single `devcontainer.json` in `.devcontainer/`
- Configure extensions, settings, features
- Match tech stack requirements
- Include post-create commands for setup

### Copilot Instructions Pattern (from Catalyst Weave)
- Reference primary documentation first (AGENTS.md, etc.)
- List essential resources with quick reference table
- Document common tasks with commands
- Include troubleshooting section
- Reference framework-specific docs (ADK llms.txt)

## For AI Assistants

See [COPILOT.md](COPILOT.md) for development guidelines.

**Essential Resources:**
- **Google ADK**: [llms.txt](https://github.com/google/adk-python/blob/main/llms.txt) | [llms-full.txt](https://github.com/google/adk-python/blob/main/llms-full.txt) | [Docs](https://google.github.io/adk-docs/)
- **Catalyst Weave**: [AGENTS.md](https://github.com/Gumbotron/catalyst-weave/blob/main/AGENTS.md) | [SETUP.md](https://github.com/Gumbotron/catalyst-weave/blob/main/SETUP.md) | [Repo](https://github.com/Gumbotron/catalyst-weave)
- **Bridge 4 Flight Map**: [Repo](https://github.com/Gumbotron/bridge-4-flight-map)
