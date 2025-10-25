# GitHub Copilot Instructions - [Project Name]

This is a [brief description of project].

## 🎯 Primary Resources

**Project Documentation:**
- **[README.md](../README.md)** - Project overview and quick start
- **[docs/development.md](../docs/development.md)** - Development workflow
- **[docs/architecture.md](../docs/architecture.md)** - System architecture
- **[docs/deployment.md](../docs/deployment.md)** - Deployment process

**Framework Documentation:**
- **[React Docs](https://react.dev/)** - React framework reference
- **[TypeScript Docs](https://www.typescriptlang.org/docs/)** - TypeScript reference
- **[Vite Docs](https://vitejs.dev/)** - Build tool documentation

## 🚀 Quick Start

```bash
# Setup
./scripts/setup.sh

# Development
./scripts/dev.sh
# Opens http://localhost:5173

# Testing
./scripts/test.sh

# Build
./scripts/build.sh
```

## 📋 Common Tasks

| Task | Command | Documentation |
|------|---------|---------------|
| Start dev server | `npm run dev` or `./scripts/dev.sh` | [development.md](../docs/development.md) |
| Run tests | `npm test` or `./scripts/test.sh` | [development.md](../docs/development.md) |
| Build for production | `npm run build` or `./scripts/build.sh` | [deployment.md](../docs/deployment.md) |
| Type checking | `npm run type-check` | [development.md](../docs/development.md) |
| Lint code | `npm run lint` | [development.md](../docs/development.md) |
| Format code | `npm run format` | [development.md](../docs/development.md) |

## 📁 Project Structure

```
[project-name]/
├── src/
│   ├── components/      # React components
│   ├── services/        # API clients and external services
│   ├── utils/           # Helper functions and utilities
│   ├── assets/          # Static resources (images, fonts, etc.)
│   ├── styles/          # Global styles and themes
│   ├── types/           # TypeScript type definitions
│   ├── hooks/           # Custom React hooks
│   └── App.tsx          # Main application component
├── public/              # Static files served directly
├── docs/                # Documentation
├── scripts/             # Helper scripts
└── tests/               # Test files
```

## 🔑 Development Guidelines

### Code Style
- Use TypeScript for type safety
- Follow React best practices (hooks, functional components)
- Use ESLint and Prettier for code formatting
- Write meaningful component and function names
- Keep components small and focused

### Component Structure
```tsx
// Use functional components with TypeScript
interface Props {
  title: string;
  onAction: () => void;
}

export const MyComponent: React.FC<Props> = ({ title, onAction }) => {
  // Component implementation
};
```

### State Management
- Use React hooks (useState, useEffect, etc.)
- Consider Context API for global state
- [Add your state management library if applicable]

### Testing
- Write tests for all components
- Use [testing library/framework]
- Aim for good coverage of business logic

### Environment Variables
- Define variables in `.env.example`
- Access via `import.meta.env.VITE_*` (Vite convention)
- Never commit `.env` file

## 🚨 Troubleshooting

### Port already in use
```bash
# Find and kill process on port 5173
lsof -ti:5173 | xargs kill -9
```

### Dependencies not installed
```bash
rm -rf node_modules package-lock.json
npm install
```

### Type errors
```bash
# Clear TypeScript cache
rm -rf node_modules/.cache
npm run type-check
```

### Build errors
```bash
# Clean and rebuild
rm -rf dist
npm run build
```

## Code Quality

- Write clear, maintainable code
- Follow existing patterns and conventions
- Keep implementations minimal and focused
- Update documentation with changes
- Test your changes before committing
