# Full-Stack Project Setup Guide

This guide walks through setting up a full-stack application combining frontend, backend, and deployment infrastructure.

## Overview

Full-stack projects combine:
- Frontend application (React, Vue, etc.)
- Backend API (Node.js, Python, etc.)
- Database and data management
- Deployment infrastructure
- Comprehensive documentation

## Setup Steps

### 1. Repository Initialization

```bash
# Create repository on GitHub
# Clone locally
git clone <your-repo-url>
cd <your-repo>
```

### 2. Project Structure

Recommended monorepo structure:

```
your-fullstack-project/
├── .devcontainer/          # Dev environment config
├── frontend/               # Frontend application
│   ├── src/
│   ├── public/
│   ├── package.json
│   └── README.md
├── backend/                # Backend API
│   ├── src/
│   ├── tests/
│   ├── package.json
│   └── README.md
├── shared/                 # Shared types and utilities
│   ├── types/
│   └── utils/
├── infrastructure/         # IaC and deployment configs
│   ├── terraform/
│   ├── docker/
│   └── k8s/
├── docs/                   # Documentation
│   ├── architecture.md
│   ├── deployment.md
│   ├── api.md
│   └── development.md
├── scripts/                # Development scripts
│   ├── setup.sh
│   ├── dev.sh
│   └── deploy.sh
└── README.md               # Project overview
```

### 3. DevContainer Configuration

Copy full-stack devcontainer template:

```bash
cp -r <meta-config-repo>/TEMPLATES/devcontainer/.devcontainer-fullstack ./.devcontainer
```

Includes:
- Node.js for frontend and backend
- Python for scripts/tools
- PostgreSQL or MongoDB
- Docker-in-Docker for containers

### 4. Frontend Setup

```bash
cd frontend
npm create vite@latest . -- --template react-ts
npm install
```

Key dependencies:
```bash
npm install react-router-dom @tanstack/react-query axios
npm install -D @testing-library/react vitest
```

### 5. Backend Setup

#### Node.js/Express Backend

```bash
cd backend
npm init -y
npm install express cors dotenv
npm install -D typescript @types/node @types/express ts-node nodemon
```

Basic structure:
```typescript
// backend/src/index.ts
import express from 'express';
import cors from 'cors';
import dotenv from 'dotenv';

dotenv.config();

const app = express();
app.use(cors());
app.use(express.json());

app.get('/health', (req, res) => {
  res.json({ status: 'healthy' });
});

const PORT = process.env.PORT || 3001;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
```

#### Python/FastAPI Backend (Alternative)

```bash
cd backend
python -m venv venv
source venv/bin/activate  # or `venv\Scripts\activate` on Windows
pip install fastapi uvicorn sqlalchemy pydantic
```

Basic structure:
```python
# backend/main.py
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/health")
def health_check():
    return {"status": "healthy"}
```

### 6. Database Setup

#### PostgreSQL

```bash
# Install PostgreSQL client
npm install pg
npm install -D @types/pg

# Or for Python
pip install psycopg2-binary
```

Create migration scripts:
```sql
-- backend/migrations/001_initial.sql
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  email VARCHAR(255) UNIQUE NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

#### MongoDB (Alternative)

```bash
# For Node.js
npm install mongodb

# For Python
pip install pymongo motor  # motor for async
```

### 7. Shared Types

Create shared types for type safety across frontend/backend:

```typescript
// shared/types/user.ts
export interface User {
  id: string;
  email: string;
  createdAt: string;
}

export interface ApiResponse<T> {
  data: T;
  error?: string;
}
```

### 8. API Client

Create typed API client in frontend:

```typescript
// frontend/src/services/api.ts
import axios from 'axios';
import type { User, ApiResponse } from '../../../shared/types/user';

const API_BASE = import.meta.env.VITE_API_URL || 'http://localhost:3001';

export const api = {
  users: {
    list: () => axios.get<ApiResponse<User[]>>(`${API_BASE}/users`),
    get: (id: string) => axios.get<ApiResponse<User>>(`${API_BASE}/users/${id}`),
    create: (data: Omit<User, 'id'>) => 
      axios.post<ApiResponse<User>>(`${API_BASE}/users`, data),
  },
};
```

### 9. Development Scripts

Create helper scripts:

```bash
# scripts/dev.sh
#!/bin/bash
# Start both frontend and backend in development mode

# Start backend
cd backend && npm run dev &
BACKEND_PID=$!

# Start frontend
cd frontend && npm run dev &
FRONTEND_PID=$!

# Trap to kill both on exit
trap "kill $BACKEND_PID $FRONTEND_PID" EXIT

wait
```

```bash
# scripts/setup.sh
#!/bin/bash
# Initialize project dependencies

echo "Installing frontend dependencies..."
cd frontend && npm install

echo "Installing backend dependencies..."
cd ../backend && npm install

echo "Setting up database..."
# Add database setup commands

echo "Setup complete!"
```

### 10. Docker Configuration

Create Docker setup for production:

```dockerfile
# frontend/Dockerfile
FROM node:18-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

FROM nginx:alpine
COPY --from=builder /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
```

```dockerfile
# backend/Dockerfile
FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci --production
COPY . .
EXPOSE 3001
CMD ["node", "dist/index.js"]
```

```yaml
# docker-compose.yml
version: '3.8'
services:
  frontend:
    build: ./frontend
    ports:
      - "3000:80"
    depends_on:
      - backend
  
  backend:
    build: ./backend
    ports:
      - "3001:3001"
    environment:
      - DATABASE_URL=postgresql://postgres:password@db:5432/myapp
    depends_on:
      - db
  
  db:
    image: postgres:15-alpine
    environment:
      - POSTGRES_PASSWORD=password
      - POSTGRES_DB=myapp
    volumes:
      - pgdata:/var/lib/postgresql/data

volumes:
  pgdata:
```

### 11. Documentation Setup

Copy and customize documentation templates:

```bash
cp -r <meta-config-repo>/TEMPLATES/docs/fullstack-*.md ./docs/
```

Key documents:
- **architecture.md** - System architecture, data flow, component interactions
- **deployment.md** - Deployment process, infrastructure, monitoring
- **api.md** - API documentation, endpoints, authentication
- **development.md** - Setup, workflow, coding standards

### 12. Testing Strategy

#### Frontend Tests

```typescript
// frontend/tests/components/UserList.test.tsx
import { render, screen } from '@testing-library/react';
import { UserList } from '../src/components/UserList';

test('renders user list', () => {
  render(<UserList users={[]} />);
  expect(screen.getByText(/users/i)).toBeInTheDocument();
});
```

#### Backend Tests

```typescript
// backend/tests/api.test.ts
import request from 'supertest';
import app from '../src/app';

describe('API Endpoints', () => {
  test('GET /health returns 200', async () => {
    const response = await request(app).get('/health');
    expect(response.status).toBe(200);
    expect(response.body.status).toBe('healthy');
  });
});
```

### 13. CI/CD Configuration

Copy full-stack CI/CD workflow:

```bash
cp <meta-config-repo>/TEMPLATES/workflows/fullstack-ci.yml .github/workflows/
```

Includes:
- Frontend build and tests
- Backend build and tests
- Integration tests
- Docker image builds
- Deployment automation

## Checklist

Before considering setup complete:

- [ ] DevContainer builds with all services
- [ ] Frontend runs and connects to backend
- [ ] Backend API responds to requests
- [ ] Database connection works
- [ ] Shared types are used across frontend/backend
- [ ] Development scripts work
- [ ] Docker setup builds successfully
- [ ] Documentation is complete
- [ ] Tests pass for frontend and backend
- [ ] CI/CD pipeline configured
- [ ] Environment variables documented

## Architecture Decisions

Document key decisions in `docs/architecture.md`:

### Communication Pattern
- REST API or GraphQL?
- WebSocket for real-time features?

### Authentication
- JWT tokens?
- Session-based?
- OAuth providers?

### State Management
- Frontend: Redux, Zustand, Context?
- Backend: In-memory, Redis cache?

### Data Persistence
- SQL (PostgreSQL, MySQL)?
- NoSQL (MongoDB, DynamoDB)?
- File storage (S3, local)?

## Deployment Options

### Vercel (Frontend) + Railway (Backend)
Simple deployment with automatic previews

### AWS (Full Stack)
- Frontend: S3 + CloudFront
- Backend: ECS or Lambda
- Database: RDS

### Self-Hosted
- Docker Compose
- Kubernetes
- Traditional VPS

## Reference Projects

- Bridge 4 Flight Map - Frontend architecture patterns
- Catalyst Weave - Backend service patterns

## Common Extensions

### Authentication System

```typescript
// backend/src/middleware/auth.ts
import jwt from 'jsonwebtoken';

export function authenticate(req, res, next) {
  const token = req.headers.authorization?.split(' ')[1];
  if (!token) return res.status(401).json({ error: 'Unauthorized' });
  
  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    req.user = decoded;
    next();
  } catch (e) {
    res.status(401).json({ error: 'Invalid token' });
  }
}
```

### API Rate Limiting

```typescript
import rateLimit from 'express-rate-limit';

const limiter = rateLimit({
  windowMs: 15 * 60 * 1000, // 15 minutes
  max: 100 // limit each IP to 100 requests per windowMs
});

app.use('/api/', limiter);
```

### Error Handling

```typescript
// backend/src/middleware/errorHandler.ts
export function errorHandler(err, req, res, next) {
  console.error(err.stack);
  res.status(err.status || 500).json({
    error: err.message || 'Internal server error'
  });
}
```

## Tips

- Start with monorepo structure - easier to manage initially
- Use shared types to ensure frontend/backend compatibility
- Document API endpoints early and keep updated
- Set up Docker early - ensures deployment consistency
- Use environment variables for all configuration
- Implement health checks for monitoring
- Set up logging and error tracking from the start
