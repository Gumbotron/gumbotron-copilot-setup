# GitHub Copilot Instructions - [Project Name]

This is an Agent/AI project built with Google's Agent Development Kit (ADK).

## 🎯 Primary Resources

**Project Documentation:**
- **[README.md](../README.md)** - Project overview and quick start
- **[AGENTS.md](../AGENTS.md)** - Agent development guide for AI assistants
- **[SETUP.md](../SETUP.md)** - Detailed setup instructions
- **[docs/AGENT_WORKFLOWS.md](../docs/AGENT_WORKFLOWS.md)** - Agent workflow documentation

**Framework Documentation:**
- **[ADK llms.txt](../docs/Agent_Development_Kit_LLM_Instructions.txt)** - Complete ADK reference
- **[ADK Official Docs](https://google.github.io/adk-docs/)** - Online documentation
- **[ADK Python Repo](https://github.com/google/adk-python)** - Source code and examples

## 🚀 Quick Start

```bash
# Setup environment
./scripts/setup.sh

# Activate virtual environment
source venv/bin/activate

# Test agents
./scripts/test-agents.sh

# Start ADK web interface
./scripts/start-adk-web.sh
# Opens http://localhost:8003
```

## 📋 Common Tasks

| Task | Command | Documentation |
|------|---------|---------------|
| Setup environment | `./scripts/setup.sh` | [SETUP.md](../SETUP.md) |
| Activate venv | `source venv/bin/activate` | [SETUP.md](../SETUP.md) |
| Test agents | `./scripts/test-agents.sh` | [AGENTS.md](../AGENTS.md) |
| Start ADK web | `./scripts/start-adk-web.sh` | [SETUP.md](../SETUP.md) |
| Run main agent | `cd backend && adk run main_agent` | [ADK docs](https://google.github.io/adk-docs/) |
| View logs | `tail -f /tmp/agents_log/agent.latest.log` | [AGENTS.md](../AGENTS.md) |

## 📁 Project Structure

```
[project-name]/
├── [backend-name]/
│   ├── main_agent/           # Orchestrator agent (Alfred)
│   │   ├── __init__.py
│   │   └── agent.py          # Main agent definition
│   ├── sub_agents/          # Specialist agents (Johnsons)
│   │   ├── researcher/
│   │   ├── writer/
│   │   └── critic/
│   ├── agent_workflows/     # Complex multi-step workflows
│   ├── tools/              # Custom tool implementations
│   └── requirements.txt    # Python dependencies
├── docs/
│   ├── Agent_Development_Kit_LLM_Instructions.txt
│   ├── AGENT_WORKFLOWS.md
│   └── README.md
├── scripts/
│   ├── setup.sh
│   ├── test-agents.sh
│   └── start-adk-web.sh
└── .env.template           # Environment variable template
```

## 🔑 Development Guidelines

### Alfred and Johnson Paradigm
- **Alfred (Main Agent)**: Pure coordinator, delegates to specialists
- **Johnson (Sub-agents)**: Focused specialists for specific tasks
- Main agent should NOT do the work, only orchestrate
- Sub-agents should be focused on one task type

### Agent Best Practices
- Agent names must match folder names exactly
- Sub-agents cannot have built-in tools (use AgentTool pattern)
- Use simple Python types: str, int, float, bool, list, dict
- Avoid Pydantic models and complex types in tool signatures
- Prefer built-in ADK tools when available

### Tool Development
```python
# Simple tool signature (GOOD)
def search_web(query: str, max_results: int = 5) -> list[dict]:
    """Search the web for information."""
    pass

# Complex types (AVOID)
def search_web(query: SearchQuery) -> SearchResults:  # Don't do this
    pass
```

### Testing Strategy
```bash
# Test with web interface (interactive testing)
./scripts/start-adk-web.sh

# Test with terminal (quick validation)
cd backend-name
adk run main_agent
```

### Environment Variables
- Use `.env.template` (not .env.example)
- Required: `GEMINI_API_KEY`
- Check workspace secrets first: `echo ${GEMINI_API_KEY:+SET}`
- Never commit `.env` file

## 🚨 Troubleshooting

### "Cannot find agent"
- Check `__init__.py` and `agent.py` exist
- Verify `root_agent` is defined in agent.py
- Ensure agent name matches folder name exactly

### "API Key not found"
```bash
# Check if set
echo ${GEMINI_API_KEY:+SET}

# Set in .env
echo "GEMINI_API_KEY=your_key_here" > .env
```

### "Tool schema error"
- Use only simple Python types
- Avoid Pydantic models, dataclasses in tool signatures
- Check type hints are correct

### "Import errors"
```bash
# Reinstall dependencies
source venv/bin/activate
pip install -r requirements.txt
```

### View agent logs
```bash
tail -f /tmp/agents_log/agent.latest.log

# Or with verbose output
ADK_LOG_LEVEL=DEBUG adk run main_agent
```

## Code Quality

- Write clear, maintainable code
- Follow Alfred/Johnson patterns
- Keep implementations minimal and focused
- Document agent responsibilities in AGENTS.md
- Update documentation with changes
- Test agents before committing
