# Frontend Project Patterns

Key patterns for frontend projects based on **Bridge 4 Flight Map**.

## 1. Overview

Frontend projects following Bridge 4 patterns emphasize:
- **Clean devcontainer setup** for environment consistency
- **Comprehensive documentation** (architecture, deployment, development)
- **Structured data sources** with organized API clients
- **Maintainable code** with clear organization

## 2. 🏗️ Project Structure

```
project/
├── .devcontainer/           # Development environment
├── src/
│   ├── components/          # UI components
│   ├── services/            # API clients and data services
│   ├── utils/               # Utility functions
│   └── App.jsx              # Main application
├── docs/                    # Required documentation
│   ├── architecture.md      # System architecture
│   ├── deployment.md        # Deployment process
│   └── development.md       # Development workflow
├── tests/                   # Test files
└── README.md                # Project overview
```

## 3. 📚 Required Documentation

### architecture.md
**Purpose**: Document component structure, state management, and data flow

**Key sections**:
- Component breakdown and responsibilities
- State management approach
- Data flow through the application
- Technology choices and rationale

### deployment.md  
**Purpose**: Document build process and deployment steps

**Key sections**:
- Prerequisites and environment setup
- Build commands and process
- Deployment steps for each environment
- Verification and rollback procedures

### development.md
**Purpose**: Document setup and development workflow

**Key sections**:
- Getting started (prerequisites, setup)
- Project structure explanation
- Development workflow
- Common tasks and commands

## 4. 🔧 Devcontainer Setup

Use devcontainer for consistent development environment across team:

**Key features**:
- Node.js environment (LTS version)
- VS Code extensions for development
- Port forwarding for dev server
- Git configuration

**Example structure**:
```json
{
  "name": "Frontend Development",
  "image": "mcr.microsoft.com/devcontainers/typescript-node:18",
  "customizations": {
    "vscode": {
      "extensions": [
        "dbaeumer.vscode-eslint",
        "esbenp.prettier-vscode"
      ]
    }
  },
  "forwardPorts": [3000, 5173]
}
```

## 5. 🔌 Data Source Management

Structure API integration clearly and consistently:

### Centralized API Client

```javascript
// src/services/api.js
const API_BASE = import.meta.env.VITE_API_BASE_URL;

export const apiClient = {
  async get(endpoint) {
    const response = await fetch(`${API_BASE}${endpoint}`);
    if (!response.ok) throw new Error(`API error: ${response.status}`);
    return response.json();
  },
  
  async post(endpoint, data) {
    const response = await fetch(`${API_BASE}${endpoint}`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify(data)
    });
    if (!response.ok) throw new Error(`API error: ${response.status}`);
    return response.json();
  }
};
```

### Service Organization

- **Single API client** in `src/services/api.js`
- **Environment variables** for configuration
- **Error handling** with clear messages
- **Endpoint documentation** in architecture.md

## 6. 🎯 Key Practices

### Development Workflow
1. **Start with devcontainer** - Ensures environment consistency
2. **Document early** - Create docs/architecture.md at project start
3. **Structure data access** - Keep API calls organized in services/
4. **Update docs** - Keep architecture documentation current

### Code Organization
- **Components**: Reusable UI elements in `src/components/`
- **Services**: Data fetching and API clients in `src/services/`
- **Utils**: Helper functions in `src/utils/`
- **Tests**: Mirror source structure in `tests/`

### Documentation Maintenance
- Update `docs/architecture.md` when adding major components
- Update `docs/deployment.md` when deployment process changes  
- Keep `docs/development.md` accurate for new team members

## 7. 📋 Checklist

When setting up a new frontend project:

- [ ] Devcontainer configured and tested
- [ ] Project structure matches pattern
- [ ] API client created in `src/services/`
- [ ] `docs/architecture.md` created and populated
- [ ] `docs/deployment.md` created with deployment steps
- [ ] `docs/development.md` created with setup instructions
- [ ] Environment variables documented
- [ ] Data source management structured

## 9. 🔗 Reference

- **Bridge 4 Flight Map**: Reference implementation of these patterns
- **REFERENCE_LIBRARY**: See `REFERENCE_LIBRARY/README.md` for React/Vue docs and resources
- **Templates**: Use files from `TEMPLATES/docs/` as starting point
