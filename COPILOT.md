# COPILOT.md: Development Guide for AI Assistants

This document provides guidelines for AI assistants and code copilots working with repositories based on Gumbotron development patterns.

## Quick Reference

| Task | Resource |
|------|----------|
| **Project Overview** | [README.md](README.md) |
| **Frontend Patterns** | [PROJECT_TYPES/frontend.md](PROJECT_TYPES/frontend.md) |
| **Agent/AI Patterns** | [PROJECT_TYPES/agent-ai.md](PROJECT_TYPES/agent-ai.md) |
| **Documentation Templates** | [TEMPLATES/docs/](TEMPLATES/docs/) |
| **General Coding Preferences** | [.github/copilot-instructions.md](.github/copilot-instructions.md) |

## 🎯 Core Mission

Your primary objective is to assist developers in building projects following established Gumbotron patterns from **Bridge 4 Flight Map** (frontend) and **Catalyst Weave** (agent/AI). This involves:

- Following documented patterns and best practices
- Creating minimal, focused implementations
- Maintaining consistency with reference projects
- Providing clear, maintainable code
- Ensuring proper documentation

## 📚 Essential Resources

### 1. General Coding Preferences
**File**: [.github/copilot-instructions.md](.github/copilot-instructions.md)
- **Contains**: General coding standards, code quality expectations
- **When to use**: For all code generation and review tasks

### 2. Project-Specific Patterns
- **Frontend**: [PROJECT_TYPES/frontend.md](PROJECT_TYPES/frontend.md)
  - Devcontainer setup
  - Project structure
  - Documentation requirements
  - Data source management
  
- **Agent/AI**: [PROJECT_TYPES/agent-ai.md](PROJECT_TYPES/agent-ai.md)
  - Google ADK architecture
  - Testing protocols
  - Human-in-the-loop patterns
  - Documentation requirements

### 3. Documentation Templates
**Directory**: [TEMPLATES/docs/](TEMPLATES/docs/)
- **architecture-template.md**: System architecture documentation
- **deployment-template.md**: Deployment process documentation
- **development-template.md**: Development workflow documentation

## 🏗️ Development Patterns

### Frontend Projects (Bridge 4 Style)

**Key Principles:**
- Use devcontainer for consistent environments
- Document architecture, deployment, and development processes
- Structure API clients in dedicated services directory
- Focus on clean, maintainable code

**Required Documentation:**
- `docs/architecture.md` - Component structure and data flow
- `docs/deployment.md` - Build and deployment process
- `docs/development.md` - Setup and dev workflow

**Project Structure:**
```
project/
├── .devcontainer/
├── src/
│   ├── components/
│   ├── services/      # API clients and data services
│   └── utils/
├── docs/              # Required documentation
└── tests/
```

### Agent/AI Projects (Catalyst Weave Style)

**Key Principles:**
- Use [Google ADK](https://google.github.io/adk-docs/) for agent framework
- Implement comprehensive testing protocols
- Build in human-in-the-loop capabilities
- Document agent capabilities and limitations

**Required Documentation:**
- `docs/architecture.md` - Agent design and components
- `docs/capabilities.md` - What agents can/cannot do
- `docs/safety.md` - Safety constraints and monitoring

**Project Structure:**
```
project/
├── .devcontainer/
├── agents/
│   └── specialized/
├── workflows/
├── protocols/         # Testing & validation
├── human_loop/
└── docs/
```

## 📋 Work Protocol

Before beginning any task:

### 1. Identify Context
- Understand project type (frontend, agent/AI, or other)
- Identify specific patterns to follow
- Check reference documentation

### 2. Reference Documentation
- For frontend: Check [PROJECT_TYPES/frontend.md](PROJECT_TYPES/frontend.md)
- For agents: Check [PROJECT_TYPES/agent-ai.md](PROJECT_TYPES/agent-ai.md)
- For code standards: Check [.github/copilot-instructions.md](.github/copilot-instructions.md)

### 3. Follow Patterns
- Apply minimal necessary changes
- Follow established structure from reference projects
- Document key decisions
- Keep implementations focused

### 4. Maintain Quality
- Write clear, maintainable code
- Include appropriate tests
- Update documentation when needed
- Follow code standards from general preferences

## 🛠️ Common Tasks

### Starting a New Frontend Project

1. **Setup devcontainer** based on patterns
2. **Create project structure** following frontend.md
3. **Initialize documentation** from templates:
   ```bash
   cp TEMPLATES/docs/architecture-template.md docs/architecture.md
   cp TEMPLATES/docs/deployment-template.md docs/deployment.md
   cp TEMPLATES/docs/development-template.md docs/development.md
   ```
4. **Customize templates** with project-specific information
5. **Implement data services** in `src/services/`

### Starting a New Agent/AI Project

1. **Setup ADK environment** following patterns
2. **Create agent structure** following agent-ai.md
3. **Initialize documentation** from templates
4. **Implement test protocols** for validation
5. **Build HITL capabilities** as needed

### Adding Documentation

1. **Copy appropriate template** from `TEMPLATES/docs/`
2. **Fill in project-specific details**
3. **Keep it minimal** - focus on key information
4. **Cross-reference** other docs where appropriate

## 🚨 Development Guidelines

### Code Quality
- **Minimal changes** - Only what's necessary
- **Clear intent** - Obvious purpose for each component
- **Maintainable** - Easy for others to understand and modify
- **Tested** - Appropriate test coverage

### Documentation Quality
- **Focused** - KEY information only
- **Accurate** - Reflects actual implementation
- **Updated** - Changes with code
- **Referenced** - Links to related docs

### Pattern Adherence
- **Consistent** - Follows established patterns
- **Justified** - Deviations have clear reasoning
- **Documented** - Decisions are explained
- **Minimal** - Don't over-engineer

## 🔍 Common Patterns

### API Client Structure (Frontend)
```javascript
// src/services/api.js
const API_BASE = import.meta.env.VITE_API_BASE_URL;

export const apiClient = {
  async get(endpoint) {
    const response = await fetch(`${API_BASE}${endpoint}`);
    if (!response.ok) throw new Error(`API error: ${response.status}`);
    return response.json();
  },
  // ... other methods
};
```

### Agent Definition (ADK)
```python
from google.adk.agents import LlmAgent

root_agent = LlmAgent(
    name="agent_name",
    model="gemini-2.0-flash",
    description="Brief description",
    instruction="""
    Clear instructions for agent behavior.
    
    Your responsibilities:
    1. Primary task
    2. Secondary tasks
    """,
    tools=[],  # Tools as needed
)
```

### Documentation Structure
```markdown
# [Project Name] [Document Type]

## Overview
[Brief description]

## [Main Section]
[Content organized logically]

## [Additional Sections]
[As needed for the document type]
```

## 📈 Quality Standards

### Acceptable
✅ Minimal, focused implementations  
✅ Clear documentation of key decisions  
✅ Following established patterns  
✅ Appropriate test coverage  
✅ Maintainable code structure

### Not Acceptable
❌ Over-engineered solutions  
❌ Undocumented deviations from patterns  
❌ Technology choices without justification  
❌ Missing required documentation  
❌ Inconsistent with reference projects

## 🎯 Success Criteria

A task is complete when:

1. **✅ Follows documented patterns** from reference projects
2. **✅ Minimal implementation** - No unnecessary complexity
3. **✅ Properly documented** - Required docs are present and accurate
4. **✅ Code quality** - Meets standards in .github/copilot-instructions.md
5. **✅ Tested appropriately** - Has reasonable test coverage
6. **✅ Maintainable** - Others can understand and modify

## 📞 Key Principles

When working on any project:

1. **Reference first** - Check patterns before implementing
2. **Minimal changes** - Only what's necessary
3. **Document decisions** - Explain non-obvious choices
4. **Stay consistent** - Follow established patterns
5. **Focus on clarity** - Make code obvious and maintainable

---

**Remember**: This meta-configuration repository documents **patterns** and **preferences**, not specific implementations. Apply these guidelines appropriately to each unique project while maintaining consistency with the established approach.