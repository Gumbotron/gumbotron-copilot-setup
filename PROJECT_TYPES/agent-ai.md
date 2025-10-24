# Agent/AI Development Project Setup Guide

This guide walks through setting up an AI agent development project using ADK (Agent Development Kit) patterns, with emphasis on testing, validation, and human-in-the-loop capabilities.

## Overview

Agent/AI projects require:
- ADK-based agent architecture
- Development workflow scripts
- Comprehensive testing and validation protocols
- Human-in-the-loop interaction patterns
- Clear documentation of agent capabilities and limitations

## Setup Steps

### 1. Repository Initialization

```bash
# Create repository on GitHub
# Clone locally
git clone <your-repo-url>
cd <your-repo>
```

### 2. DevContainer Configuration

Copy the AI/Python devcontainer template:

```bash
cp -r <meta-config-repo>/TEMPLATES/devcontainer/.devcontainer-ai ./devcontainer
```

Key features:
- Python 3.11+ environment
- AI/ML libraries pre-installed
- Azure or OpenAI SDK
- Testing frameworks

### 3. Project Structure

Recommended structure for agent projects:

```
your-agent-project/
├── .devcontainer/          # Dev environment config
├── agents/                 # Agent implementations
│   ├── __init__.py
│   ├── base_agent.py       # Base agent class
│   └── specialized/        # Specialized agents
├── workflows/              # Agent workflows
│   ├── orchestration.py    # Workflow orchestration
│   └── pipelines/          # Processing pipelines
├── protocols/              # Testing & validation
│   ├── test_protocols.py   # Test definitions
│   └── validation.py       # Validation logic
├── human_loop/             # Human-in-the-loop
│   ├── review.py           # Review mechanisms
│   └── feedback.py         # Feedback collection
├── scripts/                # Development scripts
│   ├── run_agent.py        # Agent runner
│   ├── test_agent.py       # Testing script
│   └── validate.py         # Validation script
├── docs/                   # Documentation
│   ├── architecture.md     # Agent architecture
│   ├── capabilities.md     # Agent capabilities
│   ├── deployment.md       # Deployment guide
│   └── safety.md           # Safety considerations
├── tests/                  # Unit and integration tests
├── requirements.txt        # Python dependencies
└── README.md               # Project overview
```

### 4. Install ADK and Core Dependencies

```bash
# Install Azure AI Agent SDK (ADK)
pip install azure-ai-agent-openai

# Install core dependencies
pip install openai azure-identity python-dotenv pydantic

# Install testing frameworks
pip install pytest pytest-asyncio pytest-cov

# Install development tools
pip install black flake8 mypy
```

Create `requirements.txt`:

```txt
azure-ai-agent-openai>=1.0.0
openai>=1.0.0
azure-identity>=1.15.0
python-dotenv>=1.0.0
pydantic>=2.0.0
pytest>=7.4.0
pytest-asyncio>=0.21.0
pytest-cov>=4.1.0
black>=23.0.0
flake8>=6.0.0
mypy>=1.0.0
```

### 5. Base Agent Implementation

Create a base agent class following ADK patterns:

```python
# agents/base_agent.py
from azure.ai.agent import Agent, AgentConfig
from typing import Optional, Dict, Any

class BaseAgent:
    """Base class for all agents in this project."""
    
    def __init__(self, config: AgentConfig):
        self.config = config
        self.agent = Agent(config)
    
    async def process(self, input_data: Dict[str, Any]) -> Dict[str, Any]:
        """Process input and return results."""
        raise NotImplementedError
    
    async def validate_output(self, output: Dict[str, Any]) -> bool:
        """Validate agent output before returning."""
        raise NotImplementedError
```

### 6. Testing Protocols

Create comprehensive testing protocols:

```python
# protocols/test_protocols.py
import pytest
from typing import List, Callable

class AgentTestProtocol:
    """Protocol for testing agent behavior."""
    
    def __init__(self, agent):
        self.agent = agent
    
    async def test_basic_functionality(self):
        """Test basic agent operations."""
        pass
    
    async def test_edge_cases(self):
        """Test edge cases and error handling."""
        pass
    
    async def test_safety_constraints(self):
        """Verify safety constraints are respected."""
        pass
```

### 7. Human-in-the-Loop Setup

Implement human review mechanisms:

```python
# human_loop/review.py
from typing import Dict, Any, Optional

class HumanReview:
    """Human-in-the-loop review mechanism."""
    
    def __init__(self, threshold: float = 0.8):
        self.confidence_threshold = threshold
    
    async def requires_review(self, output: Dict[str, Any]) -> bool:
        """Determine if output requires human review."""
        confidence = output.get('confidence', 0.0)
        return confidence < self.confidence_threshold
    
    async def submit_for_review(self, output: Dict[str, Any]) -> None:
        """Submit output for human review."""
        # Implement review submission logic
        pass
    
    async def incorporate_feedback(self, feedback: Dict[str, Any]) -> None:
        """Incorporate human feedback into agent."""
        # Implement feedback incorporation
        pass
```

### 8. Development Workflow Scripts

Create helper scripts in `scripts/`:

```python
# scripts/run_agent.py
#!/usr/bin/env python3
"""Run agent with specified input."""
import asyncio
import argparse
from agents.base_agent import BaseAgent

async def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--input', required=True)
    parser.add_argument('--validate', action='store_true')
    args = parser.parse_args()
    
    # Initialize and run agent
    agent = BaseAgent(config)
    result = await agent.process(args.input)
    
    if args.validate:
        is_valid = await agent.validate_output(result)
        print(f"Validation: {'PASS' if is_valid else 'FAIL'}")
    
    print(result)

if __name__ == '__main__':
    asyncio.run(main())
```

```python
# scripts/test_agent.py
#!/usr/bin/env python3
"""Run agent test protocols."""
import asyncio
from protocols.test_protocols import AgentTestProtocol

async def main():
    # Run all test protocols
    protocol = AgentTestProtocol(agent)
    await protocol.test_basic_functionality()
    await protocol.test_edge_cases()
    await protocol.test_safety_constraints()
    print("All protocols passed!")

if __name__ == '__main__':
    asyncio.run(main())
```

### 9. Documentation Setup

Copy and customize documentation templates:

```bash
cp -r <meta-config-repo>/TEMPLATES/docs/agent-*.md ./docs/
```

Key documents:
- **architecture.md** - Agent design, components, data flow
- **capabilities.md** - What the agent can/cannot do
- **deployment.md** - How to deploy and scale
- **safety.md** - Safety considerations, constraints, monitoring

### 10. Environment Configuration

Create `.env.example`:

```env
# Azure OpenAI Configuration
AZURE_OPENAI_ENDPOINT=https://your-resource.openai.azure.com/
AZURE_OPENAI_API_KEY=your-api-key
AZURE_OPENAI_DEPLOYMENT=gpt-4

# Agent Configuration
AGENT_MAX_ITERATIONS=10
AGENT_TIMEOUT_SECONDS=300
HUMAN_REVIEW_THRESHOLD=0.8

# Logging
LOG_LEVEL=INFO
```

### 11. CI/CD for Agents

Copy agent CI/CD workflow:

```bash
cp <meta-config-repo>/TEMPLATES/workflows/agent-ci.yml .github/workflows/
```

Include:
- Unit tests
- Integration tests
- Safety validation
- Performance benchmarks

## Checklist

Before considering setup complete:

- [ ] DevContainer builds with all dependencies
- [ ] Base agent class implemented
- [ ] Test protocols defined and passing
- [ ] Human-in-the-loop mechanisms implemented
- [ ] Development scripts functional
- [ ] Documentation completed
- [ ] Safety constraints documented
- [ ] Environment variables configured
- [ ] CI/CD pipeline set up
- [ ] Error handling implemented

## Agent Development Best Practices

### 1. Start with Clear Capabilities

Document what your agent can and cannot do before implementation:

```markdown
## Agent Capabilities
- Can: Process natural language queries, generate responses, access knowledge base
- Cannot: Make irreversible changes, access external systems without approval, operate without safety checks
```

### 2. Implement Safety Constraints

```python
class SafetyValidator:
    def validate_output(self, output: str) -> bool:
        # Check for harmful content
        # Verify constraints are met
        # Validate output format
        return True
```

### 3. Use Structured Outputs

```python
from pydantic import BaseModel

class AgentResponse(BaseModel):
    content: str
    confidence: float
    metadata: Dict[str, Any]
    requires_review: bool
```

### 4. Implement Comprehensive Logging

```python
import logging

logger = logging.getLogger(__name__)

async def process(self, input_data):
    logger.info(f"Processing input: {input_data['id']}")
    try:
        result = await self._execute(input_data)
        logger.info(f"Successfully processed: {input_data['id']}")
        return result
    except Exception as e:
        logger.error(f"Error processing {input_data['id']}: {e}")
        raise
```

### 5. Build in Observability

- Log all agent decisions
- Track confidence scores
- Monitor performance metrics
- Record human feedback

## Testing Strategy

### Unit Tests

Test individual agent components in isolation.

### Integration Tests

Test agent workflows end-to-end.

### Safety Tests

Verify safety constraints under various conditions.

### Performance Tests

Benchmark latency, throughput, and resource usage.

## Reference Projects

- Catalyst Weave - Example of ADK-based agent architecture with testing protocols

## Common Extensions

### Multi-Agent Orchestration

```python
from agents.orchestrator import AgentOrchestrator

orchestrator = AgentOrchestrator([agent1, agent2, agent3])
result = await orchestrator.execute(task)
```

### Memory and Context

```python
from agents.memory import ConversationMemory

memory = ConversationMemory()
agent = BaseAgent(config, memory=memory)
```

### Tool Integration

```python
from agents.tools import ToolRegistry

tools = ToolRegistry()
tools.register('search', search_tool)
tools.register('calculator', calculator_tool)
agent = BaseAgent(config, tools=tools)
```

## Tips

- Start with simple agents, add complexity gradually
- Test thoroughly at each stage
- Document safety constraints clearly
- Implement human review for high-stakes decisions
- Monitor agent behavior in production
- Iterate based on real-world feedback
