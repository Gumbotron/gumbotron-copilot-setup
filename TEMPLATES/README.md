# Templates

This directory contains ready-to-use templates for various project configurations.

## Directory Structure

```
TEMPLATES/
├── devcontainer/          # DevContainer configurations
│   ├── devcontainer-frontend.json
│   ├── devcontainer-python-ai.json
│   ├── docker-compose-fullstack.yml
│   └── Dockerfile-fullstack
├── docs/                  # Documentation templates
│   ├── architecture-template.md
│   ├── deployment-template.md
│   └── development-template.md
└── workflows/             # GitHub Actions workflows
    ├── frontend-ci.yml
    └── agent-ci.yml
```

## DevContainer Templates

### devcontainer-frontend.json

DevContainer configuration for frontend projects (React, Vue, Next.js, etc.)

**Features:**
- Node.js 18 environment
- ESLint, Prettier, Tailwind CSS extensions
- GitHub Copilot
- Auto port forwarding for dev servers

**Usage:**
```bash
mkdir -p .devcontainer
cp TEMPLATES/devcontainer/devcontainer-frontend.json .devcontainer/devcontainer.json
```

### devcontainer-python-ai.json

DevContainer configuration for AI/Agent development projects

**Features:**
- Python 3.11 environment
- Python extensions (Pylance, Black, Flake8)
- Jupyter support
- Azure CLI
- GitHub Copilot

**Usage:**
```bash
mkdir -p .devcontainer
cp TEMPLATES/devcontainer/devcontainer-python-ai.json .devcontainer/devcontainer.json
```

### docker-compose-fullstack.yml

Docker Compose configuration for full-stack projects with database and cache

**Services:**
- App container (Node.js)
- PostgreSQL database
- Redis cache

**Usage:**
```bash
mkdir -p .devcontainer
cp TEMPLATES/devcontainer/docker-compose-fullstack.yml .devcontainer/docker-compose.yml
```

### Dockerfile-fullstack

Custom Dockerfile for full-stack development

**Includes:**
- Node.js 18
- PostgreSQL client
- Redis tools
- Global npm packages

**Usage:**
```bash
mkdir -p .devcontainer
cp TEMPLATES/devcontainer/Dockerfile-fullstack .devcontainer/Dockerfile
```

## Documentation Templates

### architecture-template.md

Template for documenting system architecture

**Sections:**
- System overview
- Architecture diagram
- Component breakdown
- Data flow
- Technology stack
- Design decisions
- Security considerations
- Scalability
- Performance
- Future considerations

**Usage:**
```bash
mkdir -p docs
cp TEMPLATES/docs/architecture-template.md docs/architecture.md
# Edit docs/architecture.md with your project details
```

### deployment-template.md

Template for deployment documentation

**Sections:**
- Prerequisites
- Environment setup
- Deployment process
- Infrastructure details
- Verification steps
- Rollback procedures
- Monitoring
- Maintenance
- Troubleshooting
- Disaster recovery

**Usage:**
```bash
mkdir -p docs
cp TEMPLATES/docs/deployment-template.md docs/deployment.md
# Edit docs/deployment.md with your deployment process
```

### development-template.md

Template for development guide

**Sections:**
- Getting started
- Project structure
- Development workflow
- Code standards
- Testing
- Building
- Environment variables
- Common tasks
- Troubleshooting

**Usage:**
```bash
mkdir -p docs
cp TEMPLATES/docs/development-template.md docs/development.md
# Edit docs/development.md with your development workflow
```

## Workflow Templates

### frontend-ci.yml

GitHub Actions workflow for frontend projects

**Jobs:**
- Test (with multiple Node.js versions)
- Build
- Deploy preview (for PRs)

**Features:**
- Runs linter
- Runs tests with coverage
- Uploads coverage to Codecov
- Creates build artifacts
- Deploys preview for pull requests

**Usage:**
```bash
mkdir -p .github/workflows
cp TEMPLATES/workflows/frontend-ci.yml .github/workflows/ci.yml
# Update with your specific deployment commands
```

### agent-ci.yml

GitHub Actions workflow for AI/Agent projects

**Jobs:**
- Test (with multiple Python versions)
- Safety validation
- Performance benchmark
- Build Docker image

**Features:**
- Runs flake8, black, mypy
- Unit and integration tests
- Safety validation tests
- Performance benchmarks
- Docker image build and push

**Usage:**
```bash
mkdir -p .github/workflows
cp TEMPLATES/workflows/agent-ci.yml .github/workflows/ci.yml
# Add required secrets to GitHub repository settings
```

## Customizing Templates

When using templates:

1. **Copy, don't link** - Templates are starting points
2. **Customize for your needs** - Adjust configurations
3. **Remove unused sections** - Keep documentation lean
4. **Update examples** - Replace placeholders with real values
5. **Version control** - Commit customized templates to your repo

## Template Variables

Templates use placeholders that should be replaced:

- `[Project Name]` - Your project name
- `[Description]` - Brief description
- `[Goal/Step/Component]` - Specific details
- `[command]` - Actual commands
- `[YYYY-MM-DD]` - Dates

## Contributing Templates

When adding new templates:

1. Keep them generic and reusable
2. Include comments explaining options
3. Provide usage examples
4. Document any required secrets or configuration
5. Test templates in real projects
