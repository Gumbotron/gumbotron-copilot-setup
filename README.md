# Gumbotron Copilot Setup

Meta-configuration repository for bootstrapping new projects with consistent patterns.

## Quick Start

1. **Create new repo** from GitHub or clone locally
2. **Choose project type**: Agent/AI or Frontend
3. **Copy templates** from [TEMPLATES/](TEMPLATES/) directory (see [TEMPLATES/README.md](TEMPLATES/README.md))
4. **Follow [Repository Setup](#repository-setup-checklist)** checklist below
5. **Reference examples**: [Catalyst Weave](https://github.com/Gumbotron/catalyst-weave) (Agent/AI) or [Bridge 4](https://github.com/Gumbotron/bridge-4-flight-map) (Frontend)
6. **Customize templates** for your project (replace `[Project Name]`, add configs)

See [TEMPLATES/README.md](TEMPLATES/README.md) for detailed instructions on using templates.

## Current Projects

| Project | Type | Tech Stack | Root Files | Key Directories |
|---------|------|------------|------------|-----------------|
| **[Catalyst Weave](https://github.com/Gumbotron/catalyst-weave)** | Agent/AI | Python, Google ADK, Gemini | README.md, AGENTS.md, SETUP.md | `cw-adk-backend/`, `docs/`, `scripts/`, `.devcontainer/` |
| **[Bridge 4 Flight Map](https://github.com/Gumbotron/bridge-4-flight-map)** | Frontend | React, TypeScript, Vite | README.md | `src/`, `docs/`, `.devcontainer/` |

## Repository Setup Checklist

Follow this sequence when starting a new project. **Use templates from [TEMPLATES/](TEMPLATES/) directory** as starting points.

### 0. Copy Base Templates
```bash
# Choose your project type and copy appropriate templates
# See TEMPLATES/README.md for detailed copy commands

# For Frontend: Copy from TEMPLATES/frontend/
# For Agent/AI: Copy from TEMPLATES/agent-ai/
```

### 1. Root-Level Documentation
```
- [ ] README.md - Project overview, quick start, architecture summary
- [ ] SETUP.md - Detailed setup instructions (for Agent/AI projects only)
- [ ] AGENTS.md - Agent development guide (for Agent/AI projects only)
- [ ] .gitignore - Exclude .env, node_modules, __pycache__, etc.
      → Copy from TEMPLATES/frontend/.gitignore or TEMPLATES/agent-ai/.gitignore
```

### 2. Environment Configuration
```bash
# For Agent/AI projects: Use .env.template
cp TEMPLATES/agent-ai/.env.template .env.template
# Then create .env from template
cp .env.template .env

# For Frontend projects: Use .env.example  
cp TEMPLATES/frontend/.env.example .env.example
# Then create .env from example
cp .env.example .env

# Customize for your project:
# - Add all required API keys
# - Document configuration options
# - Include setup instructions for local & Codespaces
# - Never commit actual .env file (it's in .gitignore)
```

### 3. Development Container
```bash
# Copy appropriate devcontainer.json template
mkdir -p .devcontainer

# For Frontend projects:
cp TEMPLATES/frontend/devcontainer.json .devcontainer/

# For Agent/AI projects:
cp TEMPLATES/agent-ai/devcontainer.json .devcontainer/

# Customize for your project:
# - Adjust Node.js/Python version if needed
# - Add project-specific extensions
# - Configure ports and post-create commands
# - Update project name in devcontainer.json

# Reference examples:
# - Catalyst Weave (Agent/AI): https://github.com/Gumbotron/catalyst-weave/blob/main/.devcontainer/devcontainer.json
# - Bridge 4 (Frontend): https://github.com/Gumbotron/bridge-4-flight-map/blob/main/.devcontainer/devcontainer.json
```

### 4. Helper Scripts (Create Before GitHub Config)
```bash
# Create scripts/ directory for automation
mkdir -p scripts

# Copy appropriate script templates
# For Frontend projects:
cp TEMPLATES/scripts/frontend-*.sh scripts/
cd scripts && for f in frontend-*.sh; do mv "$f" "${f#frontend-}"; done && cd ..

# For Agent/AI projects:
cp TEMPLATES/scripts/agent-ai-*.sh scripts/
cd scripts && for f in agent-ai-*.sh; do mv "$f" "${f#agent-ai-}"; done && cd ..

# Make scripts executable
chmod +x scripts/*.sh

# Customize scripts:
# - Update project name
# - Adjust backend directory name (for Agent/AI)
# - Customize build/test commands
# - Add project-specific validation

# Common scripts for all projects:
# - setup.sh - Environment setup and validation
# - test.sh - Run test suite
# - dev.sh - Start development server
# - build.sh - Build for production

# Agent/AI specific:
# - test-agents.sh - Validate agents
# - start-adk-web.sh - Launch ADK web interface

# Frontend specific:
# - deploy.sh - Deploy to hosting
# - analyze.sh - Bundle analysis
```

### 5. GitHub Configuration
```bash
# Create Copilot instructions (now that scripts exist)
mkdir -p .github

# Copy appropriate template
# For Frontend projects:
cp TEMPLATES/frontend/copilot-instructions.md .github/

# For Agent/AI projects:
cp TEMPLATES/agent-ai/copilot-instructions.md .github/

# Customize:
# - Replace [Project Name]
# - Update documentation links
# - Reference your actual scripts and files
# - Add project-specific troubleshooting

# Content should reference:
# - Primary documentation (README.md, AGENTS.md, SETUP.md)
# - Framework-specific docs (ADK llms.txt, React docs)
# - Development workflow and helper scripts (now created in step 4)
```
### 6. Documentation Directory
```bash
# Create docs directory
mkdir -p docs

# Copy documentation templates
cp TEMPLATES/docs/*-template.md docs/

# Rename templates
mv docs/architecture-template.md docs/architecture.md
mv docs/deployment-template.md docs/deployment.md
mv docs/development-template.md docs/development.md

# For Agent/AI projects (additional docs):
# - Copy Agent_Development_Kit_LLM_Instructions.txt from:
#   https://github.com/google/adk-python/blob/main/docs/Agent_Development_Kit_LLM_Instructions.txt
# - Create AGENT_WORKFLOWS.md
# - Create README.md (docs index)

# For Frontend projects:
# Fill in the three core docs:
# - architecture.md - System design and components
# - deployment.md - Build and deploy process
# - development.md - Setup and workflow
```

### 7. Initialize Project Code

**IMPORTANT:** Initialize your actual project before creating directory structures.

**For Frontend Projects:**
```bash
# Initialize with Vite (React + TypeScript example)
npm create vite@latest . -- --template react-ts

# Or use other scaffolding tools:
# - Create React App: npx create-react-app . --template typescript
# - Next.js: npx create-next-app@latest .
# - Vue: npm create vue@latest .

# Install dependencies
npm install

# The tool will create:
# - package.json, package-lock.json
# - tsconfig.json, vite.config.ts (or similar)
# - src/ directory with initial components
# - public/ directory

# Then organize within src/:
# - src/components/ for React components
# - src/services/ for API clients
# - src/utils/ for helper functions
# - src/assets/ for static resources
```

**For Agent/AI Projects:**
```bash
# Create backend directory
mkdir -p [project-name]-backend
cd [project-name]-backend

# Create agent structure (following Catalyst Weave pattern)
mkdir -p main_agent sub_agents agent_workflows tools

# Create requirements.txt
cat > requirements.txt << EOF
agent-development-kit>=0.1.0
python-dotenv>=1.0.0
# Add other dependencies as needed
EOF

# Create Python package files
touch main_agent/__init__.py main_agent/agent.py
touch sub_agents/__init__.py
touch tools/__init__.py

# Follow Alfred and Johnson paradigm:
# - main_agent/ contains orchestrator
# - sub_agents/ contains specialists (researcher, writer, critic, etc.)
# - agent_workflows/ for complex multi-step workflows  
# - tools/ for custom tool implementations

# See https://github.com/Gumbotron/catalyst-weave for complete example
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
