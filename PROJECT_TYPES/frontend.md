# Frontend Project Patterns

Key patterns for frontend projects based on Bridge 4 Flight Map.

## Devcontainer Setup

Use a devcontainer for consistent development environment:
- Node.js environment
- VS Code with relevant extensions
- Port forwarding for dev server

## Project Structure

```
project/
├── .devcontainer/
├── src/
│   ├── components/
│   ├── services/      # API clients and data services
│   └── utils/
├── docs/
│   ├── architecture.md
│   ├── deployment.md
│   └── development.md
└── tests/
```

## Documentation Requirements

**architecture.md**: Component structure, state management, data flow
**deployment.md**: Build process, hosting, deployment steps
**development.md**: Setup instructions, dev workflow

## Data Source Management

Structure API integration clearly:
- Centralized API client in `src/services/`
- Environment variables for configuration
- Proper error handling
- Document endpoints in architecture docs

## Key Practices

- Start with devcontainer for environment consistency
- Document deployment process early
- Keep architecture docs updated
- Use structured approach for API integration
