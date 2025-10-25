# GitHub Copilot Instructions

This repository is a **meta-configuration template** for bootstrapping new projects. When working with projects based on this template:

## General Guidelines

- Follow patterns from reference projects (Catalyst Weave, Bridge 4 Flight Map)
- Write minimal, focused implementations - only what's necessary
- Maintain consistency with established patterns
- Keep code clear and maintainable

## Project-Specific Guidance

When starting a new project based on this template:

1. **Review README.md** for project list and tech stack examples
2. **Check COPILOT.md** for detailed AI assistant guidelines
3. **Follow reference projects** for similar patterns:
   - Frontend: Bridge 4 Flight Map
   - Agent/AI: Catalyst Weave
4. **Copy templates** from `TEMPLATES/docs/` and customize

## Documentation Standards

- Always create `docs/` directory with:
  - `architecture.md` - System design and components
  - `deployment.md` - Build and deployment process
  - `development.md` - Setup and workflow
- For AI projects: Add `AGENTS.md` and `SETUP.md` following Catalyst Weave style
- Keep documentation minimal and focused on KEY patterns

## Code Organization

### Frontend Projects
- Structure: `src/components/`, `src/services/`, `src/utils/`
- API clients in `services/` directory
- Use devcontainer for environment consistency

### Agent/AI Projects
- Structure: `agents/`, `workflows/`, `protocols/`, `human_loop/`
- Follow [Google ADK patterns](https://google.github.io/adk-docs/)
- Reference [ADK llms.txt](https://github.com/google/adk-python/blob/main/llms.txt) for guidance

## Code Quality

- Write clear, maintainable code
- Follow existing code style and conventions
- Include appropriate tests
- Handle errors appropriately
- Document key decisions
- Update documentation with changes

## Environment Setup

- Use devcontainers for consistency
- Create `.env.example` documenting required variables
- Never commit actual `.env` files
- Configure project-specific VS Code extensions

---

*This is a meta-configuration repository. Reference [README.md](../README.md) and [COPILOT.md](../COPILOT.md) for complete guidance.*
