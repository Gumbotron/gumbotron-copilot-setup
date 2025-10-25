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
# For Agent/AI projects: Create .env.template
touch .env.template

# For Frontend projects: Create .env.example
touch .env.example

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

### 6. Helper Scripts
```bash
# Create scripts/ directory for automation
mkdir -p scripts

# Common scripts for all projects:
# - setup.sh - Environment setup and validation
# - test.sh - Run test suite
# - dev.sh - Start development server
# - build.sh - Build for production

# Agent/AI specific (if applicable):
# - adk-setup.sh - ADK environment setup
# - test-agents.sh - Validate agents
# - start-adk-web.sh - Launch ADK web interface

# Frontend specific (if applicable):
# - deploy.sh - Deploy to hosting
# - analyze.sh - Bundle analysis

# Scripts provide automation and convenience
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

### Copilot Instructions Pattern (from Catalyst Weave)
- Reference primary documentation first (AGENTS.md, etc.)
- List essential resources with quick reference table
- Document common tasks with commands
- Include troubleshooting section
- Reference framework-specific docs (ADK llms.txt)

### Documentation Style (Catalyst Weave pattern)
- **Numbered sections** with clear hierarchy (1., 2., 3.)
- **Quick reference tables** at document tops
- **Emoji indicators** for visual scanning (🎯, 🚀, 📚, ⚠️)
- **Code examples** inline with explanations
- **Cross-references** between related docs

### Environment Management
- **Agent/AI**: Use `.env.template` (documents structure)
- **Frontend**: Use `.env.example` (standard convention)
- Never commit `.env` (contains secrets)
- Support both local dev and GitHub Codespaces
- Check for workspace secrets first (GitHub)

### Devcontainer Pattern
- Single `devcontainer.json` in `.devcontainer/`
- Configure extensions, settings, features
- Match tech stack requirements
- Include post-create commands for setup

### Helper Scripts
- Automate common development tasks
- Provide consistent workflows across projects
- Include clear documentation and error handling
- Support both local and cloud environments

**Common for All Projects:**
- `setup.sh` - Environment setup and dependency installation
- `test.sh` - Run test suite with appropriate configuration
- `dev.sh` - Start development server with hot reload
- `build.sh` - Build for production with optimization

**Agent/AI Projects (additional):**
- `adk-setup.sh` - ADK-specific environment configuration
- `test-agents.sh` - Validate agent loading and tools
- `start-adk-web.sh` - Launch ADK web interface

**Frontend Projects (additional):**
- `deploy.sh` - Deploy to hosting platform
- `analyze.sh` - Analyze bundle size and dependencies

## Useful Resources & References

When starting a new project, explore these resources to find relevant patterns, documentation, and examples:

### Reference Repositories

| Repository | Purpose | Why Useful | Key Features |
|------------|---------|------------|--------------|
| **[Catalyst Weave](https://github.com/Gumbotron/catalyst-weave)** | Agent/AI project structure | Complete ADK-based agent architecture with proven patterns | AGENTS.md guide, helper scripts, Alfred/Johnson paradigm, human-in-the-loop |
| **[Bridge 4 Flight Map](https://github.com/Gumbotron/bridge-4-flight-map)** | Frontend project structure | Clean React/TypeScript/Vite setup with comprehensive docs | Clear architecture, deployment docs, devcontainer setup |
| **[Google ADK Python](https://github.com/google/adk-python)** | Agent framework | Official Google Agent Development Kit | llms.txt/llms-full.txt instructions, examples, tutorials |
| **[ADK Crash Course](https://github.com/bhancockio/agent-development-kit-crash-course)** | Learning resource | Hands-on tutorials for ADK | Step-by-step examples, best practices |

### Framework Documentation

| Framework | Links | When to Use |
|-----------|-------|-------------|
| **Google ADK** | [llms.txt](https://github.com/google/adk-python/blob/main/llms.txt) · [llms-full.txt](https://github.com/google/adk-python/blob/main/llms-full.txt) · [Docs](https://google.github.io/adk-docs/) | Building AI agents with Google's framework |
| **React** | [Official Docs](https://react.dev/) · [TypeScript](https://www.typescriptlang.org/docs/) | Frontend development with component-based architecture |
| **Vite** | [Docs](https://vitejs.dev/) | Fast build tool for modern web projects |
| **GitHub Codespaces** | [Docs](https://docs.github.com/en/codespaces) | Cloud development environments |

### Best Practices

| Resource | Purpose | Link |
|----------|---------|------|
| **GitHub Copilot Best Practices** | Optimizing repository for AI assistance | [Guide](https://gh.io/copilot-coding-agent-tips) |
| **Catalyst Weave AGENTS.md** | Writing AI assistant instructions | [File](https://github.com/Gumbotron/catalyst-weave/blob/main/AGENTS.md) |
| **ADK LLM Instructions** | Framework-specific AI guidance | [llms.txt](https://github.com/google/adk-python/blob/main/llms.txt) |

## For AI Assistants

See [COPILOT.md](COPILOT.md) for development guidelines.
