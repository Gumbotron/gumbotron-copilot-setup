# Project Templates

This directory contains templates for bootstrapping new projects.

## 📁 Directory Structure

```
TEMPLATES/
├── frontend/              # Frontend project templates
│   ├── .env.example
│   ├── .gitignore
│   ├── devcontainer.json
│   └── copilot-instructions.md
├── agent-ai/             # Agent/AI project templates
│   ├── .env.template
│   ├── .gitignore
│   ├── devcontainer.json
│   └── copilot-instructions.md
├── docs/                 # Documentation templates (for all projects)
│   ├── architecture-template.md
│   ├── deployment-template.md
│   └── development-template.md
└── scripts/              # Helper script templates
    ├── frontend-*.sh     # Scripts for frontend projects
    └── agent-ai-*.sh     # Scripts for agent/AI projects
```

## 🚀 Using Templates

### For Frontend Projects (React, Vue, etc.)

1. **Copy frontend templates:**
   ```bash
   # From your new project root
   cp path/to/this-repo/TEMPLATES/frontend/.env.example .
   cp path/to/this-repo/TEMPLATES/frontend/.gitignore .
   mkdir -p .devcontainer
   cp path/to/this-repo/TEMPLATES/frontend/devcontainer.json .devcontainer/
   mkdir -p .github
   cp path/to/this-repo/TEMPLATES/frontend/copilot-instructions.md .github/
   ```

2. **Copy documentation templates:**
   ```bash
   mkdir -p docs
   cp path/to/this-repo/TEMPLATES/docs/*.md docs/
   # Rename templates
   mv docs/architecture-template.md docs/architecture.md
   mv docs/deployment-template.md docs/deployment.md
   mv docs/development-template.md docs/development.md
   ```

3. **Copy scripts:**
   ```bash
   mkdir -p scripts
   cp path/to/this-repo/TEMPLATES/scripts/frontend-*.sh scripts/
   # Rename scripts (remove 'frontend-' prefix)
   cd scripts
   for f in frontend-*.sh; do mv "$f" "${f#frontend-}"; done
   chmod +x *.sh
   ```

4. **Customize templates:**
   - Replace `[Project Name]` with your actual project name
   - Update `.env.example` with your environment variables
   - Fill in documentation templates
   - Modify scripts for your specific setup

### For Agent/AI Projects (ADK, etc.)

1. **Copy agent/AI templates:**
   ```bash
   # From your new project root
   cp path/to/this-repo/TEMPLATES/agent-ai/.env.template .
   cp path/to/this-repo/TEMPLATES/agent-ai/.gitignore .
   mkdir -p .devcontainer
   cp path/to/this-repo/TEMPLATES/agent-ai/devcontainer.json .devcontainer/
   mkdir -p .github
   cp path/to/this-repo/TEMPLATES/agent-ai/copilot-instructions.md .github/
   ```

2. **Copy documentation templates:**
   ```bash
   mkdir -p docs
   # For agent projects, you'll create AGENTS.md, SETUP.md, etc.
   # Reference: https://github.com/Gumbotron/catalyst-weave
   ```

3. **Copy scripts:**
   ```bash
   mkdir -p scripts
   cp path/to/this-repo/TEMPLATES/scripts/agent-ai-*.sh scripts/
   # Rename scripts (remove 'agent-ai-' prefix)
   cd scripts
   for f in agent-ai-*.sh; do mv "$f" "${f#agent-ai-}"; done
   chmod +x *.sh
   ```

4. **Customize templates:**
   - Replace `[Project Name]` with your actual project name
   - Update `.env.template` with your API keys
   - Create AGENTS.md and SETUP.md (see Catalyst Weave for examples)
   - Modify scripts for your backend directory name

## 📝 Template Customization

### Environment Files

**Frontend (.env.example):**
- Add your API endpoints
- Add feature flags
- Add third-party service keys

**Agent/AI (.env.template):**
- Set GEMINI_API_KEY
- Configure model parameters
- Set logging preferences

### DevContainer

**Frontend (devcontainer.json):**
- Based on Node.js 20
- Includes TypeScript, ESLint, Prettier
- Forwards ports 5173 (Vite) and 3000

**Agent/AI (devcontainer.json):**
- Based on Python 3.11
- Includes Python extensions
- Forwards port 8003 (ADK web interface)

### Scripts

All scripts include:
- Error handling (`set -e`)
- Informative output
- Dependency checks
- Status messages

Customize for your specific:
- Build tools
- Test frameworks
- Deployment targets

### Documentation

Fill in template sections with:
- Your project's architecture
- Your deployment process
- Your development workflow
- Your testing strategy

## 💡 Tips

1. **Start with templates:** Don't create files from scratch
2. **Customize incrementally:** Update templates as you build
3. **Keep placeholders:** Search for `[Project Name]` and replace all
4. **Reference examples:** Check Catalyst Weave (Agent/AI) or Bridge 4 (Frontend)
5. **Update docs:** Keep documentation in sync with code

## 🔗 References

- **Frontend Example:** [Bridge 4 Flight Map](https://github.com/Gumbotron/bridge-4-flight-map)
- **Agent/AI Example:** [Catalyst Weave](https://github.com/Gumbotron/catalyst-weave)
- **Setup Guide:** [README.md](../README.md)
- **AI Assistant Guide:** [COPILOT.md](../COPILOT.md)
