# COPILOT.md: AI Assistant Guide

Quick reference for AI assistants working on Gumbotron projects. This repository is a **meta-configuration template** - use it to bootstrap new projects with consistent patterns.

## 🎯 Primary Resources - REFERENCE THESE FIRST

| Resource | Purpose | Link |
|----------|---------|------|
| **Google ADK Docs** | Agent/AI development | [llms.txt](https://github.com/google/adk-python/blob/main/llms.txt) \| [llms-full.txt](https://github.com/google/adk-python/blob/main/llms-full.txt) \| [Official Docs](https://google.github.io/adk-docs/) |
| **Catalyst Weave** | Agent/AI project structure | [AGENTS.md](https://github.com/Gumbotron/catalyst-weave/blob/main/AGENTS.md) \| [SETUP.md](https://github.com/Gumbotron/catalyst-weave/blob/main/SETUP.md) \| [Repo](https://github.com/Gumbotron/catalyst-weave) |
| **Bridge 4 Flight Map** | Frontend project structure | [Repo](https://github.com/Gumbotron/bridge-4-flight-map) |
| **Documentation Templates** | Starter templates | [TEMPLATES/docs/](TEMPLATES/docs/) |

## 🚀 Starting a New Project

**Step 1: Explore Relevant Resources**

Before starting, review repositories and documentation that match your project type:

- **Agent/AI Projects**: Review [Catalyst Weave](https://github.com/Gumbotron/catalyst-weave) structure and [Google ADK docs](https://google.github.io/adk-docs/)
- **Frontend Projects**: Review [Bridge 4 Flight Map](https://github.com/Gumbotron/bridge-4-flight-map) and framework docs
- **All Projects**: Check [GitHub Copilot Best Practices](https://gh.io/copilot-coding-agent-tips)

**Step 2: Setup Project Structure**

**For Agent/AI Projects (Catalyst Weave pattern):**

1. **ALWAYS reference Catalyst Weave structure first**
2. **Copy root documentation pattern**: README.md, AGENTS.md (for AI), SETUP.md (if complex)
3. **Download framework documentation**: Copy [ADK llms.txt](https://github.com/google/adk-python/blob/main/docs/Agent_Development_Kit_LLM_Instructions.txt) to docs/ for Agent/AI projects
4. **Use appropriate env file**: `.env.template` for Agent/AI, `.env.example` for Frontend
5. **Create helper scripts** in `scripts/` directory (setup, test, dev, build)
6. **Structure code**: Follow reference project patterns (main_agent/sub_agents for AI, src/ for Frontend)

**For Frontend Projects (Bridge 4 pattern):**

1. **Reference Bridge 4 structure** and modern frontend best practices
2. **Create standard docs/**: architecture.md, deployment.md, development.md
3. **Use `.env.example`** for environment variables (frontend convention)
4. **Create helper scripts** in `scripts/` directory (setup, test, dev, build, deploy)
5. **Structure source**: src/components/, src/services/, src/utils/
6. **Setup devcontainer** with frontend tools (Node.js, TypeScript, etc.)

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