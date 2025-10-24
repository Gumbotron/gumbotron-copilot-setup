# Reference Library

This directory contains curated documentation and references from key frameworks and projects that align with Gumbotron development patterns.

## 1. Overview

The Reference Library provides:
- **Framework documentation** for AI assistants and developers
- **Quick access** to authoritative sources
- **Project examples** following best practices
- **Setup guidance** for different project types

## 2. 📚 Agent/AI Frameworks

### Google ADK (Agent Development Kit)

**Primary Reference**: https://google.github.io/adk-docs/

**Local Documentation**:
- [`agent-frameworks/adk-llms.txt`](agent-frameworks/adk-llms.txt) - Concise ADK reference for LLMs (228 lines)
- [`agent-frameworks/adk-llms-full.txt`](agent-frameworks/adk-llms-full.txt) - Complete ADK documentation (33K lines)

**Key Resources**:
- Official Docs: https://google.github.io/adk-docs/
- GitHub Repository: https://github.com/google/adk-python
- Tutorial: https://github.com/bhancockio/agent-development-kit-crash-course

**When to Use**:
- Building AI agents with orchestration
- Multi-agent systems
- Human-in-the-loop workflows
- Agent testing and validation

**Reference Project**: [Catalyst Weave](https://github.com/Gumbotron/catalyst-weave)

## 3. 🎨 Frontend Frameworks

### React Ecosystem

**Primary References**:
- React Docs: https://react.dev/
- Vite: https://vitejs.dev/
- React Router: https://reactrouter.com/

**Best Practices**:
- Component-driven development
- State management patterns (Context, Zustand, Redux Toolkit)
- API client organization
- Testing with Vitest/React Testing Library

**When to Use**:
- Modern web applications
- Component-based UIs
- SPAs with routing

**Reference Project**: [Bridge 4 Flight Map](https://github.com/Gumbotron/bridge-4-flight-map)

### Vue Ecosystem

**Primary References**:
- Vue 3 Docs: https://vuejs.org/
- Vite: https://vitejs.dev/
- Vue Router: https://router.vuejs.org/

**When to Use**:
- Progressive web applications
- Component-based UIs with simpler learning curve

## 4. 🛠️ Development Tools

### DevContainers

**Primary Reference**: https://containers.dev/

**Key Features**:
- Consistent development environments
- VS Code integration
- Pre-configured tool chains

**When to Use**: All projects for environment consistency

### GitHub Copilot

**Primary Reference**: https://docs.github.com/copilot

**Best Practices**:
- Use `.github/copilot-instructions.md` for project-specific guidance
- Reference this meta-config repo when starting new projects
- Follow documented patterns from reference projects

## 5. 📋 Reference Projects

### Catalyst Weave (Agent/AI)
**Repository**: https://github.com/Gumbotron/catalyst-weave

**Key Patterns**:
- Google ADK multi-agent architecture
- Alfred and Johnson paradigm (orchestrator + specialists)
- Human-in-the-loop implementation
- Comprehensive testing protocols
- Structured documentation (AGENTS.md, SETUP.md, README.md)

**Key Files to Reference**:
- `AGENTS.md` - Complete agent development guide
- `SETUP.md` - Environment and workflow setup
- `cw-adk-backend/` - ADK implementation patterns
- `docs/` - Additional technical documentation

### Bridge 4 Flight Map (Frontend)
**Repository**: https://github.com/Gumbotron/bridge-4-flight-map

**Key Patterns**:
- Clean devcontainer setup
- Comprehensive deployment documentation
- Clear architecture documentation
- Structured data source management (API clients in services/)

**Key Files to Reference**:
- `docs/architecture.md` - System architecture
- `docs/deployment.md` - Deployment process
- `docs/development.md` - Development workflow
- `.devcontainer/` - DevContainer configuration

## 6. 🔍 Finding Relevant Resources

### For New Frontend Projects

1. **Review**: [PROJECT_TYPES/frontend.md](../PROJECT_TYPES/frontend.md)
2. **Reference**: Bridge 4 Flight Map repository
3. **Documentation**: React/Vue official docs
4. **Patterns**: Component structure, API client organization

### For New Agent/AI Projects

1. **Review**: [PROJECT_TYPES/agent-ai.md](../PROJECT_TYPES/agent-ai.md)
2. **Reference**: Catalyst Weave repository
3. **Documentation**: 
   - Start with `adk-llms.txt` for quick reference
   - Use `adk-llms-full.txt` for comprehensive details
4. **Patterns**: Multi-agent coordination, HITL, testing protocols

## 7. 📖 Documentation Standards

### For AI Assistants

When working on projects:
1. **Read relevant llms.txt files** for framework-specific guidance
2. **Reference project patterns** from Catalyst Weave or Bridge 4
3. **Follow COPILOT.md** for general development guidelines
4. **Apply minimal changes** - only what's necessary

### For Developers

When starting projects:
1. **Identify project type** in PROJECT_TYPES/
2. **Review reference project** for similar patterns
3. **Copy templates** from TEMPLATES/docs/
4. **Consult framework docs** via links in this library

## 8. 🆕 Adding New References

When adding new framework or project references:

1. **Create subdirectory** in appropriate category
2. **Download key documentation** (llms.txt, AGENTS.md equivalents)
3. **Update this index** with:
   - Link to official documentation
   - When to use the framework
   - Reference project (if applicable)
   - Key patterns or files
4. **Keep it minimal** - focus on essential references

## 9. 📁 Directory Structure

```
REFERENCE_LIBRARY/
├── README.md                    # This file
├── agent-frameworks/            # AI/Agent framework documentation
│   ├── adk-llms.txt            # Google ADK concise reference
│   └── adk-llms-full.txt       # Google ADK complete documentation
└── frontend-frameworks/         # Frontend framework references
    └── (future additions)
```

## 10. 🎯 Quick Lookup

| Need | Reference | Local File |
|------|-----------|------------|
| **ADK Quick Reference** | https://google.github.io/adk-docs/ | `agent-frameworks/adk-llms.txt` |
| **ADK Full Docs** | https://github.com/google/adk-python | `agent-frameworks/adk-llms-full.txt` |
| **Agent Patterns** | Catalyst Weave repo | See section 5 above |
| **Frontend Patterns** | Bridge 4 repo | See section 5 above |
| **React Docs** | https://react.dev/ | N/A |
| **Vue Docs** | https://vuejs.org/ | N/A |

---

**🎯 Usage**: Reference this library when starting new projects to find relevant documentation, patterns, and examples for your project type.