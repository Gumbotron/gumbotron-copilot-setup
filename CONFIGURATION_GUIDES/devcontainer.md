# DevContainer Setup Guide

DevContainers provide consistent development environments across machines using Docker. This guide covers setting up devcontainers for different project types.

## What is a DevContainer?

A devcontainer is a Docker container configured specifically for development. It includes:
- Runtime environment (Node.js, Python, etc.)
- Development tools (linters, formatters, debuggers)
- VS Code extensions
- System dependencies
- Environment configuration

## Benefits

- **Consistency**: Everyone uses the same environment
- **Isolation**: Dependencies don't conflict with your system
- **Reproducibility**: New team members get productive immediately
- **Portability**: Works on Windows, Mac, and Linux

## Basic Structure

```
.devcontainer/
├── devcontainer.json    # Main configuration
├── Dockerfile          # Custom image (optional)
└── docker-compose.yml  # Multiple services (optional)
```

## Frontend DevContainer

For React, Vue, Next.js, etc. projects:

```json
{
  "name": "Frontend Development",
  "image": "mcr.microsoft.com/devcontainers/typescript-node:18",
  
  "features": {
    "ghcr.io/devcontainers/features/git:1": {},
    "ghcr.io/devcontainers/features/github-cli:1": {}
  },
  
  "customizations": {
    "vscode": {
      "extensions": [
        "dbaeumer.vscode-eslint",
        "esbenp.prettier-vscode",
        "bradlc.vscode-tailwindcss",
        "dsznajder.es7-react-js-snippets",
        "ms-vscode.vscode-typescript-next"
      ],
      "settings": {
        "editor.formatOnSave": true,
        "editor.defaultFormatter": "esbenp.prettier-vscode",
        "editor.codeActionsOnSave": {
          "source.fixAll.eslint": true
        }
      }
    }
  },
  
  "forwardPorts": [3000, 5173],
  "postCreateCommand": "npm install",
  
  "remoteUser": "node"
}
```

## Backend DevContainer (Node.js)

For Express, NestJS, etc. projects:

```json
{
  "name": "Backend API Development",
  "image": "mcr.microsoft.com/devcontainers/typescript-node:18",
  
  "features": {
    "ghcr.io/devcontainers/features/git:1": {},
    "ghcr.io/devcontainers/features/docker-in-docker:2": {}
  },
  
  "customizations": {
    "vscode": {
      "extensions": [
        "dbaeumer.vscode-eslint",
        "esbenp.prettier-vscode",
        "ms-vscode.vscode-typescript-next",
        "christian-kohler.path-intellisense",
        "usernamehw.errorlens"
      ],
      "settings": {
        "editor.formatOnSave": true,
        "editor.defaultFormatter": "esbenp.prettier-vscode"
      }
    }
  },
  
  "forwardPorts": [3000, 3001],
  "postCreateCommand": "npm install",
  
  "remoteUser": "node"
}
```

## Python/AI DevContainer

For AI agents, data science, FastAPI projects:

```json
{
  "name": "Python AI Development",
  "image": "mcr.microsoft.com/devcontainers/python:3.11",
  
  "features": {
    "ghcr.io/devcontainers/features/git:1": {},
    "ghcr.io/devcontainers/features/azure-cli:1": {}
  },
  
  "customizations": {
    "vscode": {
      "extensions": [
        "ms-python.python",
        "ms-python.vscode-pylance",
        "ms-python.black-formatter",
        "ms-python.flake8",
        "ms-toolsai.jupyter",
        "github.copilot"
      ],
      "settings": {
        "python.defaultInterpreterPath": "/usr/local/bin/python",
        "python.formatting.provider": "black",
        "editor.formatOnSave": true,
        "python.linting.enabled": true,
        "python.linting.flake8Enabled": true
      }
    }
  },
  
  "forwardPorts": [8000],
  "postCreateCommand": "pip install -r requirements.txt",
  
  "remoteUser": "vscode"
}
```

## Full-Stack DevContainer with Docker Compose

For projects with multiple services:

```json
{
  "name": "Full-Stack Development",
  "dockerComposeFile": "docker-compose.yml",
  "service": "app",
  "workspaceFolder": "/workspace",
  
  "customizations": {
    "vscode": {
      "extensions": [
        "dbaeumer.vscode-eslint",
        "esbenp.prettier-vscode",
        "ms-python.python",
        "ms-azuretools.vscode-docker"
      ]
    }
  },
  
  "forwardPorts": [3000, 3001, 5432],
  "postCreateCommand": "npm install && cd backend && npm install",
  
  "remoteUser": "node"
}
```

```yaml
# .devcontainer/docker-compose.yml
version: '3.8'

services:
  app:
    build:
      context: ..
      dockerfile: .devcontainer/Dockerfile
    volumes:
      - ..:/workspace:cached
    command: sleep infinity
    network_mode: service:db
    
  db:
    image: postgres:15-alpine
    restart: unless-stopped
    volumes:
      - postgres-data:/var/lib/postgresql/data
    environment:
      POSTGRES_USER: postgres
      POSTGRES_DB: devdb
      POSTGRES_PASSWORD: postgres

volumes:
  postgres-data:
```

## Custom Dockerfile

When you need additional system dependencies:

```dockerfile
# .devcontainer/Dockerfile
FROM mcr.microsoft.com/devcontainers/typescript-node:18

# Install additional system packages
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    postgresql-client \
    redis-tools \
    && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Install global npm packages
RUN npm install -g typescript ts-node nodemon

# Set up git configuration
RUN git config --global core.autocrlf input
```

## Common Features

### Git and GitHub CLI

```json
"features": {
  "ghcr.io/devcontainers/features/git:1": {},
  "ghcr.io/devcontainers/features/github-cli:1": {}
}
```

### Docker in Docker

For building containers inside devcontainer:

```json
"features": {
  "ghcr.io/devcontainers/features/docker-in-docker:2": {}
}
```

### AWS CLI

```json
"features": {
  "ghcr.io/devcontainers/features/aws-cli:1": {}
}
```

### Azure CLI

```json
"features": {
  "ghcr.io/devcontainers/features/azure-cli:1": {}
}
```

## Lifecycle Scripts

### postCreateCommand

Runs once when container is first created:

```json
"postCreateCommand": "npm install && npm run setup"
```

### postStartCommand

Runs each time container starts:

```json
"postStartCommand": "npm run dev"
```

### postAttachCommand

Runs when you attach to the container:

```json
"postAttachCommand": "echo 'Welcome to the devcontainer!'"
```

## Port Forwarding

Automatically forward ports to your local machine:

```json
"forwardPorts": [3000, 3001, 5432, 6379],
"portsAttributes": {
  "3000": {
    "label": "Frontend",
    "onAutoForward": "notify"
  },
  "3001": {
    "label": "Backend API",
    "onAutoForward": "openBrowser"
  }
}
```

## Environment Variables

### In devcontainer.json

```json
"remoteEnv": {
  "NODE_ENV": "development",
  "API_URL": "http://localhost:3001"
}
```

### From .env file

```json
"runArgs": ["--env-file", ".devcontainer/.env"]
```

## Mounts and Volumes

### Bind mounts

```json
"mounts": [
  "source=${localEnv:HOME}/.ssh,target=/home/node/.ssh,readonly,type=bind"
]
```

### Named volumes

```json
"mounts": [
  "source=node_modules,target=${containerWorkspaceFolder}/node_modules,type=volume"
]
```

## Multi-Root Workspaces

For monorepo projects:

```json
{
  "name": "Monorepo",
  "image": "mcr.microsoft.com/devcontainers/typescript-node:18",
  "workspaceFolder": "/workspace",
  "workspaceMount": "source=${localWorkspaceFolder},target=/workspace,type=bind,consistency=cached"
}
```

## Testing Your DevContainer

1. Open project in VS Code
2. Command Palette: "Dev Containers: Reopen in Container"
3. Wait for container to build and initialize
4. Verify:
   - Extensions are installed
   - Ports are forwarded
   - postCreateCommand completed successfully
   - You can run project commands

## Troubleshooting

### Container won't build

```bash
# Rebuild without cache
# Command Palette: "Dev Containers: Rebuild Container"
```

### Extensions not installing

```json
// Try explicit extension IDs
"customizations": {
  "vscode": {
    "extensions": [
      "esbenp.prettier-vscode@9.10.3"
    ]
  }
}
```

### Permission issues

```json
// Ensure remoteUser matches file ownership
"remoteUser": "node",  // or "vscode" for Python
"updateRemoteUserUID": true
```

### Port conflicts

```json
// Change forwarded ports
"forwardPorts": [3002, 3003]  // Use different ports
```

## Performance Optimization

### Use volumes for node_modules

Improves performance on Windows/Mac:

```json
"mounts": [
  "source=projectname-node_modules,target=${containerWorkspaceFolder}/node_modules,type=volume"
]
```

### Clone repository in container volume

For better I/O performance:

```bash
# Command Palette: "Dev Containers: Clone Repository in Container Volume"
```

## Best Practices

1. **Keep images small** - Use minimal base images
2. **Cache dependencies** - Use layers effectively in Dockerfile
3. **Document requirements** - Add comments in devcontainer.json
4. **Version features** - Pin feature versions for consistency
5. **Test regularly** - Rebuild periodically to catch issues
6. **Share configuration** - Commit .devcontainer to repository
7. **Use features over manual install** - Leverage devcontainer features catalog

## Templates to Copy

Find ready-to-use templates in:
```
<meta-config-repo>/TEMPLATES/devcontainer/
├── .devcontainer-frontend/
├── .devcontainer-backend/
├── .devcontainer-python/
├── .devcontainer-fullstack/
└── .devcontainer-ai/
```

## Resources

- [DevContainers Specification](https://containers.dev/)
- [VS Code DevContainers Documentation](https://code.visualstudio.com/docs/devcontainers/containers)
- [DevContainer Features](https://containers.dev/features)
- [DevContainer Templates](https://containers.dev/templates)
