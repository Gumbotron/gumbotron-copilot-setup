# GitHub Copilot Instructions

This repository is a **meta-configuration template** for bootstrapping new projects. When working with projects based on this template:

## 🎯 Primary Resources - ALWAYS REFERENCE THESE FIRST

**For ALL development questions:**
- **[README.md](../README.md)** - Complete repository setup checklist and patterns
- **[COPILOT.md](../COPILOT.md)** - Detailed AI assistant development guide

**For Agent/AI projects (model after Catalyst Weave):**
- **[Catalyst Weave AGENTS.md](https://github.com/Gumbotron/catalyst-weave/blob/main/AGENTS.md)** - Agent development guide
- **[Catalyst Weave SETUP.md](https://github.com/Gumbotron/catalyst-weave/blob/main/SETUP.md)** - Setup instructions
- **[ADK llms.txt](https://github.com/google/adk-python/blob/main/llms.txt)** - Google ADK documentation
- **[ADK Official Docs](https://google.github.io/adk-docs/)** - Complete ADK reference

**For Frontend projects (model after Bridge 4):**
- **[Bridge 4 Flight Map](https://github.com/Gumbotron/bridge-4-flight-map)** - Frontend structure reference

## 🚀 Quick Start for Copilot

When starting work on a new project based on this template:

**1. Understand Project Type:**
```bash
# Check if this is Agent/AI or Frontend project
# Review Current Projects table in README.md
```

**2. Reference Appropriate Structure:**
- **Agent/AI**: Model after [Catalyst Weave](https://github.com/Gumbotron/catalyst-weave)
- **Frontend**: Model after [Bridge 4 Flight Map](https://github.com/Gumbotron/bridge-4-flight-map)

**3. Follow Setup Checklist:**
- See [README.md Repository Setup Checklist](../README.md#repository-setup-checklist)
- Complete items 1-7 in sequence

**4. Reference Framework Documentation:**
- **Agent/AI**: Copy [ADK llms.txt](https://github.com/google/adk-python/blob/main/docs/Agent_Development_Kit_LLM_Instructions.txt) to docs/
- **Frontend**: Reference React/Vue/framework docs as needed

## 📁 Required File Structure

### Agent/AI Projects (Catalyst Weave Pattern)
```
Root Level:
├── README.md                    # ✅ Project overview, quick start, architecture
├── AGENTS.md                    # ✅ Agent development guide for AI assistants
├── SETUP.md                     # ✅ Detailed setup instructions
├── .env.template                # ✅ Environment variable documentation
├── .gitignore                   # ✅ Exclude .env, __pycache__, etc.
├── .devcontainer/
│   └── devcontainer.json        # ✅ Python 3.11+, extensions, post-create
├── .github/
│   └── copilot-instructions.md  # ✅ Reference AGENTS.md, SETUP.md, ADK docs
├── docs/
│   ├── Agent_Development_Kit_LLM_Instructions.txt  # ✅ Copy from ADK repo
│   ├── AGENT_WORKFLOWS.md       # ✅ Workflow documentation
│   └── README.md                # ✅ Documentation index
├── scripts/
│   ├── adk-setup.sh            # ✅ Complete environment setup
│   ├── test-agents.sh          # ✅ Validation tests
│   ├── start-adk-web.sh        # ✅ Launch web interface
│   ├── setup.sh                # ✅ General setup
│   ├── test.sh                 # ✅ Run tests
│   └── dev.sh                  # ✅ Development server
└── backend-name/
    ├── main_agent/             # Orchestrator (Alfred)
    ├── sub_agents/            # Specialists (Johnsons)
    ├── agent_workflows/       # Complex multi-step workflows
    ├── tools/                 # Custom tool implementations
    └── requirements.txt       # Python dependencies
```

### Frontend Projects (Bridge 4 Pattern)
```
Root Level:
├── README.md                    # ✅ Project overview
├── .env.example                 # ✅ Environment variables (NOT .env.template)
├── .gitignore                   # ✅ Exclude .env, node_modules, dist
├── .devcontainer/
│   └── devcontainer.json        # ✅ Node.js, extensions
├── .github/
│   └── copilot-instructions.md  # ✅ Reference project structure
├── docs/
│   ├── architecture.md          # ✅ System design
│   ├── deployment.md            # ✅ Build and deploy
│   └── development.md           # ✅ Setup and workflow
├── scripts/
│   ├── setup.sh                # ✅ Environment setup
│   ├── test.sh                 # ✅ Run tests
│   ├── dev.sh                  # ✅ Development server
│   ├── build.sh                # ✅ Production build
│   └── deploy.sh               # ✅ Deploy to hosting
└── src/
    ├── components/              # React/Vue components
    ├── services/                # API clients
    ├── utils/                   # Helper functions
    └── assets/                  # Static resources
```

## 🔑 Development Guidelines

### Documentation Style (Catalyst Weave Pattern)

**Format:**
- **Numbered sections** with clear hierarchy (1., 2., 3.)
- **Quick reference tables** at document tops
- **Emoji indicators** for visual scanning (🎯, 🚀, 📚, ⚠️, ✅)
- **Code examples** inline with explanations
- **Cross-references** between related documents
- **Minimal and focused** - KEY patterns only, not exhaustive

**Example Structure:**
```markdown
# Document Title

Quick reference table here

## 1. Section One
Content with emoji 🎯

## 2. Section Two  
Content with code examples

## 3. Section Three
Cross-reference to [Related Doc](link)
```

### Environment Management

**Agent/AI Projects:**
- Use `.env.template` (NOT .env.example)
- Document all required API keys and configuration
- Include setup instructions for local and GitHub Codespaces
- Check for workspace secrets first: `echo ${GEMINI_API_KEY:+SET}`

**Frontend Projects:**
- Use `.env.example` (standard frontend convention)
- Document all required environment variables
- Never commit actual `.env` files

**Priority for secrets:**
1. Environment variables (GitHub Codespaces auto-configured)
2. `.env` file in project directory
3. Request from user as last resort

### Helper Scripts

Create in `scripts/` directory for automation and consistency:

**Common Scripts (All Projects):**
```bash
scripts/
├── setup.sh       # Environment setup and dependency installation
├── test.sh        # Run test suite
├── dev.sh         # Start development server
└── build.sh       # Build for production
```

**Agent/AI Projects (Additional):**
```bash
├── adk-setup.sh       # ADK-specific setup
├── test-agents.sh     # Validate agents
└── start-adk-web.sh   # Launch ADK web interface
```

**Frontend Projects (Additional):**
```bash
├── deploy.sh      # Deploy to hosting
└── analyze.sh     # Bundle analysis
```

**Script Guidelines:**
- Include clear comments explaining what script does
- Handle errors gracefully with informative messages
- Provide status updates during execution
- Work when run from repository root
- Support both local and Codespaces environments

### Copilot Instructions Pattern

**Model after [Catalyst Weave .github/copilot-instructions.md](https://github.com/Gumbotron/catalyst-weave/blob/main/.github/copilot-instructions.md):**

Required sections:
1. **Primary Resources** - List AGENTS.md, framework docs, with links
2. **Quick Start** - Setup commands, test commands, launch commands
3. **Common Tasks Table** - Map tasks to commands and documentation
4. **Project Structure** - ASCII tree showing directory layout
5. **Development Guidelines** - Essential workflow steps
6. **Troubleshooting** - Common issues and debug commands

## 🎯 Agent/AI Specific Guidance

### Always Reference ADK Documentation First
- **Primary**: Copy [Agent_Development_Kit_LLM_Instructions.txt](https://github.com/Gumbotron/catalyst-weave/blob/main/docs/Agent_Development_Kit_LLM_Instructions.txt) to docs/
- **Online**: https://google.github.io/adk-docs/
- **Source**: https://github.com/google/adk-python
- **Tutorials**: https://github.com/bhancockio/agent-development-kit-crash-course

### Follow Catalyst Weave Architecture
- **Alfred and Johnson paradigm**: One orchestrator + multiple specialists
- **Main agent** (Alfred): Pure coordinator, handles delegation
- **Sub-agents** (Johnsons): Focused specialists (researcher, writer, critic)
- **AgentTool pattern**: For specialists needing external tools
- **Sub-agent pattern**: For pure content generation

### ADK Best Practices
- Agent names must match folder names exactly
- Sub-agents cannot have built-in tools (use AgentTool pattern instead)
- Use simple Python types for tool signatures (str, int, float, bool, list, dict)
- Prefer built-in ADK tools when available
- Test with both web interface (`adk web`) and terminal (`adk run`)

### Testing Strategy
```bash
# Test all agents load correctly
./scripts/test-agents.sh

# Test with web interface (recommended for interactive testing)
./scripts/start-adk-web.sh
# Visit: http://localhost:8003

# Test with terminal (for quick validation)
cd backend-name
adk run main_agent
```

## 📋 Setup Workflow

When creating a new project based on this template:

1. **Determine project type** (Agent/AI or Frontend)
2. **Review reference project** (Catalyst Weave or Bridge 4)
3. **Create root documentation**:
   - Agent/AI: README.md, AGENTS.md, SETUP.md
   - Frontend: README.md only
4. **Setup devcontainer** matching tech stack
5. **Create environment template**:
   - Agent/AI: `.env.template`
   - Frontend: `.env.example`
6. **Create `.github/copilot-instructions.md`** referencing primary docs
7. **Create docs/ directory**:
   - Agent/AI: Copy [ADK llms.txt](https://github.com/google/adk-python/blob/main/docs/Agent_Development_Kit_LLM_Instructions.txt), create AGENT_WORKFLOWS.md
   - Frontend: Create architecture.md, deployment.md, development.md
8. **Create helper scripts** in `scripts/` (setup, test, dev, build + project-specific)
9. **Setup code structure** following reference project patterns
10. **Document as you build** - keep all docs synchronized

## 🚨 Troubleshooting

### Common Issues

**"Cannot find agent"**
- Check directory structure has `__init__.py` and `agent.py` with `root_agent` defined
- Verify agent name matches folder name exactly

**"API Key not found"**
- Check environment variables: `echo ${GEMINI_API_KEY:+SET}`
- Verify `.env` file exists in correct directory
- Ensure billing is enabled for Google Gemini API

**"Tool schema error"**
- Use only simple Python types: str, int, float, bool, list, dict
- Avoid complex types, Pydantic models, or custom classes

**"Import errors"**
- Check Python path configuration
- Verify all dependencies in requirements.txt are installed
- Ensure virtual environment is activated

### Debug Commands

```bash
# View agent logs
tail -f /tmp/agents_log/agent.latest.log

# Test with verbose output
ADK_LOG_LEVEL=DEBUG adk run main_agent

# Web interface debugging
adk web . --port 8003
```

## Code Quality

- Write clear, maintainable code
- Follow existing code style and conventions
- Follow patterns from reference projects (Catalyst Weave or Bridge 4)
- Include appropriate tests
- Handle errors appropriately
- Document key decisions
- Update documentation with changes
- Keep implementations minimal and focused

---

*This is a meta-configuration repository. Reference [README.md](../README.md) and [COPILOT.md](../COPILOT.md) for complete guidance.*
