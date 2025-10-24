# Frontend Project Setup Guide

This guide walks through setting up a new frontend project with clean devcontainer configuration and comprehensive documentation.

## Overview

Frontend projects benefit from:
- Containerized development environment for consistency
- Clear deployment documentation
- Architecture documentation for component structure
- Structured data source management (API integration patterns)

## Setup Steps

### 1. Repository Initialization

```bash
# Create repository on GitHub
# Clone locally
git clone <your-repo-url>
cd <your-repo>
```

### 2. DevContainer Configuration

Copy the devcontainer template:

```bash
cp -r <meta-config-repo>/TEMPLATES/devcontainer/.devcontainer ./
```

Key features:
- Node.js environment with latest LTS
- VS Code extensions for frontend development
- Port forwarding for dev server
- Git configuration

See `CONFIGURATION_GUIDES/devcontainer.md` for customization options.

### 3. Project Structure

Recommended structure:

```
your-frontend-project/
├── .devcontainer/          # Dev environment config
├── src/                    # Source code
│   ├── components/         # React/Vue components
│   ├── services/           # API clients and data services
│   ├── utils/              # Utility functions
│   └── App.jsx             # Main application
├── public/                 # Static assets
├── docs/                   # Documentation
│   ├── architecture.md     # Architecture overview
│   ├── deployment.md       # Deployment guide
│   └── development.md      # Development guide
├── tests/                  # Test files
├── package.json            # Dependencies
└── README.md               # Project overview
```

### 4. Documentation Setup

Copy documentation templates:

```bash
cp -r <meta-config-repo>/TEMPLATES/docs/ ./docs/
```

Update each document with project-specific information:
- **architecture.md** - Component structure, state management, routing
- **deployment.md** - Build process, hosting, CI/CD
- **development.md** - Setup instructions, dev workflow

### 5. Initialize Frontend Framework

Choose your framework:

#### React with Vite

```bash
npm create vite@latest . -- --template react
npm install
```

#### Next.js

```bash
npx create-next-app@latest .
```

#### Vue 3

```bash
npm create vue@latest .
```

### 6. Development Workflow

Set up common scripts in `package.json`:

```json
{
  "scripts": {
    "dev": "vite",
    "build": "vite build",
    "preview": "vite preview",
    "test": "vitest",
    "lint": "eslint . --ext js,jsx",
    "format": "prettier --write ."
  }
}
```

### 7. Data Source Management

For API integration:

1. Create a `src/services/` directory
2. Implement API client with proper error handling
3. Document endpoints in `docs/architecture.md`
4. Use environment variables for API URLs

Example structure:

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

### 8. Testing Setup

Install testing dependencies:

```bash
npm install -D vitest @testing-library/react @testing-library/jest-dom
```

Create `tests/` directory with test files mirroring `src/` structure.

### 9. CI/CD Configuration

Copy workflow template:

```bash
cp <meta-config-repo>/TEMPLATES/workflows/frontend-ci.yml .github/workflows/
```

## Checklist

Before considering setup complete:

- [ ] DevContainer builds and runs successfully
- [ ] Project initializes and dev server starts
- [ ] Documentation is filled out with project specifics
- [ ] Architecture diagram created (if complex)
- [ ] Deployment process documented step-by-step
- [ ] Development workflow documented
- [ ] API integration patterns established
- [ ] Tests can be run
- [ ] CI/CD pipeline configured

## Next Steps

After initial setup:

1. Implement core components
2. Set up state management if needed (Redux, Zustand, etc.)
3. Configure routing
4. Implement error boundaries
5. Add accessibility features
6. Set up monitoring/analytics

## Common Customizations

### Styling

- **Tailwind CSS**: `npm install -D tailwindcss postcss autoprefixer`
- **Material-UI**: `npm install @mui/material @emotion/react @emotion/styled`
- **Styled Components**: `npm install styled-components`

### State Management

- **Redux Toolkit**: `npm install @reduxjs/toolkit react-redux`
- **Zustand**: `npm install zustand`
- **Jotai**: `npm install jotai`

### Routing

- **React Router**: `npm install react-router-dom`
- **TanStack Router**: `npm install @tanstack/react-router`

## Reference Projects

- Bridge 4 Flight Map - Example of clean frontend architecture with deployment docs

## Tips

- Start with the devcontainer - ensures everyone has the same environment
- Document deployment early - easier to maintain than to write later
- Keep architecture docs updated as project evolves
- Use TypeScript for larger projects - add type safety early
