# COPILOT.md: AI Assistant Guide

Quick reference for AI assistants working on Gumbotron projects. This repository is a **meta-configuration template** - use it to bootstrap new projects with consistent patterns.

## 🎯 Primary Resources - REFERENCE THESE FIRST

| Resource | Purpose | Link |
|----------|---------|------|
| **README.md** | Repository setup checklist | [README.md](README.md) |
| **TEMPLATES/** | Template files to copy | [TEMPLATES/README.md](TEMPLATES/README.md) |
| **Google ADK Docs** | Agent/AI development | [llms.txt](https://github.com/google/adk-python/blob/main/llms.txt) \| [llms-full.txt](https://github.com/google/adk-python/blob/main/llms-full.txt) \| [Official Docs](https://google.github.io/adk-docs/) |
| **Catalyst Weave** | Agent/AI project structure | [AGENTS.md](https://github.com/Gumbotron/catalyst-weave/blob/main/AGENTS.md) \| [SETUP.md](https://github.com/Gumbotron/catalyst-weave/blob/main/SETUP.md) \| [Repo](https://github.com/Gumbotron/catalyst-weave) |
| **Bridge 4 Flight Map** | Frontend project structure | [Repo](https://github.com/Gumbotron/bridge-4-flight-map) |

## 🚀 Starting a New Project

**Step 1: Review Templates**

This repository provides ready-to-use templates in the [TEMPLATES/](TEMPLATES/) directory:
- Configuration files (`.env`, `.gitignore`, `devcontainer.json`)
- Documentation templates (`architecture.md`, `deployment.md`, etc.)
- Helper scripts (`setup.sh`, `test.sh`, `dev.sh`, etc.)
- Copilot instructions templates

See [TEMPLATES/README.md](TEMPLATES/README.md) for detailed copy instructions.

**Step 2: Choose Reference Project**

Before starting, review repositories and documentation that match your project type:

- **Agent/AI Projects**: Review [Catalyst Weave](https://github.com/Gumbotron/catalyst-weave) structure and [Google ADK docs](https://google.github.io/adk-docs/)
- **Frontend Projects**: Review [Bridge 4 Flight Map](https://github.com/Gumbotron/bridge-4-flight-map) and framework docs
- **All Projects**: Check [GitHub Copilot Best Practices](https://gh.io/copilot-coding-agent-tips)

**Step 3: Follow Setup Checklist**

Follow the [Repository Setup Checklist](README.md#repository-setup-checklist) in README.md:

1. Copy base templates from TEMPLATES/
2. Create root documentation (README.md, etc.)
3. Configure environment (.env.example or .env.template)
4. Setup devcontainer
5. Create helper scripts
6. Create GitHub configuration (.github/copilot-instructions.md)
7. Setup documentation directory (docs/)
8. Initialize project code (npm create vite, etc.)

**Key Differences:**

**For Agent/AI Projects (Catalyst Weave pattern):**

1. **Use `.env.template`** for environment variables (not .env.example)
2. **Create AGENTS.md and SETUP.md** for documentation
3. **Copy ADK llms.txt** to docs/ directory
4. **Use Agent/AI scripts**: setup.sh, test-agents.sh, start-adk-web.sh
5. **Follow Alfred/Johnson paradigm**: main_agent/ + sub_agents/

**For Frontend Projects (Bridge 4 pattern):**

1. **Use `.env.example`** for environment variables (standard convention)
2. **README.md only** for root docs (no AGENTS.md or SETUP.md)
3. **Use docs templates**: architecture.md, deployment.md, development.md
4. **Use frontend scripts**: setup.sh, test.sh, dev.sh, build.sh
5. **Initialize with scaffolding tool**: npm create vite, create-react-app, etc.

## 📁 Required File Structure

### Agent/AI Projects
```
project-name/
├── README.md                    # Project overview, quick start
├── AGENTS.md                    # Agent development guide for AI assistants
├── SETUP.md                     # Detailed setup instructions
├── .env.template                # Environment variable documentation
├── .gitignore                   # Exclude .env, __pycache__, etc.
├── .devcontainer/
│   └── devcontainer.json        # Dev environment config
├── .github/
│   └── copilot-instructions.md  # AI assistant guidance
├── docs/
│   ├── Agent_Development_Kit_LLM_Instructions.txt  # Copy from ADK
│   ├── AGENT_WORKFLOWS.md       # Workflow documentation
│   └── README.md                # Docs index
├── scripts/
│   ├── adk-setup.sh            # Environment setup
│   ├── test-agents.sh          # Validation
│   └── start-adk-web.sh        # Launch web interface
└── backend-name/
    ├── main_agent/             # Orchestrator
    ├── sub_agents/            # Specialists
    ├── agent_workflows/       # Complex workflows
    ├── tools/                 # Custom tools
    └── requirements.txt
```

### Frontend Projects
```
project-name/
├── README.md
├── .env.example
├── .gitignore
├── .devcontainer/
│   └── devcontainer.json
├── .github/
│   └── copilot-instructions.md
├── docs/
│   ├── architecture.md
│   ├── deployment.md
│   └── development.md
├── scripts/
│   ├── setup.sh
│   ├── test.sh
│   ├── dev.sh
│   └── build.sh
├── src/
│   ├── components/
│   ├── services/
│   └── utils/
└── package.json
```

## 🔑 Core Development Guidelines

### Documentation Style (Catalyst Weave pattern)
- **Numbered sections** with clear hierarchy (1., 2., 3.)
- **Quick reference tables** at document tops
- **Emoji indicators** for visual scanning (🎯, 🚀, 📚, ⚠️, ✅)
- **Code examples** inline with explanations
- **Cross-references** between related docs
- **Minimal and focused** - KEY patterns only

### Environment Management
- **Agent/AI**: Use `.env.template` (documents all required variables)
- **Frontend**: Use `.env.example` (documents all required variables)
- **Never commit `.env`** files with secrets
- **Support GitHub Codespaces**: Check for workspace secrets first
- **Document each variable**: Purpose, where to get it, default values

### Copilot Instructions Pattern
**Model after [Catalyst Weave .github/copilot-instructions.md](https://github.com/Gumbotron/catalyst-weave/blob/main/.github/copilot-instructions.md):**

1. **Primary Resources section** - List AGENTS.md, framework docs first
2. **Quick Start commands** - Setup, test, run commands
3. **Common Tasks table** - Map tasks to commands and documentation
4. **Project Structure diagram** - Show directory layout
5. **Troubleshooting section** - Common issues and solutions
6. **Essential Workflow** - Step-by-step development process

### Helper Scripts
Create in `scripts/` directory for all project types:

**Common Scripts (All Projects):**
- `setup.sh` - Environment setup and dependency installation
- `test.sh` - Run test suite with appropriate configuration
- `dev.sh` - Start development server with hot reload
- `build.sh` - Build for production

**Agent/AI Projects (Additional):**
- `adk-setup.sh` - ADK-specific environment configuration
- `test-agents.sh` - Validate agent loading and tools
- `start-adk-web.sh` - Launch ADK web interface

**Frontend Projects (Additional):**
- `deploy.sh` - Deploy to hosting platform
- `analyze.sh` - Analyze bundle size

**Each script should:**
- Include clear comments explaining what it does
- Handle errors gracefully
- Provide informative output
- Work from repository root
- Support both local and cloud environments

## 🎯 Agent/AI Specific Guidance

### Always Reference ADK Documentation First
- **Primary**: [docs/Agent_Development_Kit_LLM_Instructions.txt](https://github.com/Gumbotron/catalyst-weave/blob/main/docs/Agent_Development_Kit_LLM_Instructions.txt)
- **Online**: https://google.github.io/adk-docs/
- **Examples**: https://github.com/bhancockio/agent-development-kit-crash-course

### Follow Catalyst Weave Patterns
- **Alfred and Johnson paradigm**: Orchestrator + Specialists
- **Agent structure**: main_agent/, sub_agents/, agent_workflows/, tools/
- **Tool integration**: AgentTool pattern for specialists needing external tools
- **Testing**: Both web interface and terminal validation
- **Documentation**: AGENTS.md for AI assistants, SETUP.md for developers

### ADK Best Practices
- Agent names must match folder names exactly
- Sub-agents cannot have built-in tools (use AgentTool pattern)
- Use simple Python types for tool signatures
- Prefer built-in ADK tools when available
- Test with both web interface (`adk web`) and terminal (`adk run`)

## 📋 Setup Workflow

When starting a new project:

1. **Review [README.md](README.md)** for complete setup checklist
2. **Check reference project** (Catalyst Weave or Bridge 4) for similar patterns
3. **Copy appropriate structure** from reference project
4. **Create root documentation** (README, AGENTS.md for AI, SETUP for complex projects)
5. **Setup devcontainer** matching tech stack
6. **Create .env.template** or .env.example with all required variables
7. **Create .github/copilot-instructions.md** referencing project docs
8. **Create helper scripts** (for Agent/AI projects)
9. **Document as you build** - keep docs synchronized with code

## Code Quality

- Write clear, maintainable code
- Follow patterns from reference projects (Catalyst Weave or Bridge 4)
- Keep implementations minimal and focused
- Document key decisions and non-obvious choices
- Update documentation with every significant change
- Test incrementally as you develop