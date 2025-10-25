# COPILOT.md: AI Assistant Guide

Quick reference for AI assistants working on Gumbotron projects.

## Essential Resources

| Resource | Link |
|----------|------|
| **Google ADK Docs** | [llms.txt](https://github.com/google/adk-python/blob/main/llms.txt) \| [llms-full.txt](https://github.com/google/adk-python/blob/main/llms-full.txt) \| [Official Docs](https://google.github.io/adk-docs/) |
| **Catalyst Weave** | [AGENTS.md](https://github.com/Gumbotron/catalyst-weave/blob/main/AGENTS.md) \| [Repository](https://github.com/Gumbotron/catalyst-weave) |
| **Bridge 4 Flight Map** | [Repository](https://github.com/Gumbotron/bridge-4-flight-map) |
| **Templates** | [docs/](TEMPLATES/docs/) |

## Core Guidelines

1. **Minimal implementations** - Only what's necessary
2. **Follow reference projects** - Check Catalyst Weave or Bridge 4 patterns
3. **Document key decisions** - Explain non-obvious choices
4. **Maintain consistency** - Align with established patterns

## Project Patterns

### Frontend (Bridge 4 style)
- Structure: `src/components/`, `src/services/`, `src/utils/`
- API clients in `services/` directory
- Docs: architecture.md, deployment.md, development.md
- Devcontainer for environment consistency

### Agent/AI (Catalyst Weave style)
- Structure: `agents/`, `workflows/`, `protocols/`, `human_loop/`
- Follow Google ADK patterns ([read llms.txt](https://github.com/google/adk-python/blob/main/llms.txt))
- Docs: AGENTS.md, SETUP.md, capabilities.md, safety.md
- Comprehensive testing and HITL

## Setup Workflow

1. **Review reference project** for similar patterns
2. **Copy templates** from TEMPLATES/docs/
3. **Setup devcontainer** based on tech stack
4. **Create .env.example** documenting required variables
5. **Implement minimal structure** following patterns
6. **Document as you build** - keep docs current

## Code Quality

- Write clear, maintainable code
- Follow patterns from reference projects
- Keep implementations focused and minimal
- Update documentation with changes