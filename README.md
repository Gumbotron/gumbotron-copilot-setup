# Gumbotron Copilot Setup

Meta-configuration repository for bootstrapping new projects with consistent patterns.

## Quick Start

1. **Create new repo** based on this template
2. **Review project list** to see tech stack examples
3. **Copy documentation templates** from `TEMPLATES/`
4. **Setup devcontainer** appropriate for tech stack
5. **Provide design doc** to Copilot referencing this repo

## Current Projects

| Project | Type | Tech Stack | Key Patterns |
|---------|------|------------|--------------|
| **[Catalyst Weave](https://github.com/Gumbotron/catalyst-weave)** | Agent/AI | Python, Google ADK, Gemini | Multi-agent, HITL, AGENTS.md, SETUP.md |
| **[Bridge 4 Flight Map](https://github.com/Gumbotron/bridge-4-flight-map)** | Frontend | React, TypeScript, Vite | Devcontainer, docs/, services/ pattern |

## Key Preferences

### Documentation
- Structured docs (SETUP.md, AGENTS.md or similar for AI projects)
- Architecture, deployment, and development docs in `docs/`
- Minimal, focused documentation - KEY patterns only

### Project Organization
- **Frontend**: `src/components/`, `src/services/` (API clients), `src/utils/`
- **Agent/AI**: `agents/`, `workflows/`, `protocols/`, `human_loop/`
- **Docs**: Always include `docs/architecture.md`, `docs/deployment.md`, `docs/development.md`

### Development Environment
- Use devcontainers for consistency
- Environment variables in `.env` (never commit)
- Project-specific VS Code extensions

### Agent/AI Specific
- Follow [Google ADK](https://google.github.io/adk-docs/) patterns
- Document agent capabilities and limitations
- Implement testing protocols and HITL

## Repository Setup Steps

1. **Create documentation structure**:
   ```bash
   mkdir -p docs
   cp TEMPLATES/docs/* docs/
   ```

2. **Setup devcontainer**:
   - Copy `.devcontainer/` from reference project
   - Adjust for specific tech stack
   - Configure VS Code extensions

3. **Create .env.example**:
   - List all required environment variables
   - Document what each variable does
   - Never commit actual `.env`

4. **Setup project structure**:
   - Follow patterns from reference projects above
   - Keep organization consistent with project type

5. **Create Copilot instructions**:
   - Add `.github/copilot-instructions.md`
   - Reference this repo and project preferences
   - Link to framework-specific docs as needed

6. **Setup CI/CD** (if applicable):
   - Add linting configuration
   - Setup test automation
   - Configure branch protections
   - Enable required reviews on PRs

## For AI Assistants

See [COPILOT.md](COPILOT.md) for development guidelines.

**Key Resources**:
- Google ADK: [llms.txt](https://github.com/google/adk-python/blob/main/llms.txt) | [llms-full.txt](https://github.com/google/adk-python/blob/main/llms-full.txt)
- Catalyst Weave patterns: [AGENTS.md](https://github.com/Gumbotron/catalyst-weave/blob/main/AGENTS.md)
- Reference this repo when starting projects
