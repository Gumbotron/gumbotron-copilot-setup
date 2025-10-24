# Deployment Documentation Guide

Comprehensive deployment documentation is crucial for maintaining and scaling applications. This guide helps you create clear, actionable deployment documentation.

## Why Document Deployment?

- **Reproducibility**: Anyone can deploy following the steps
- **Disaster Recovery**: Quick recovery from failures
- **Onboarding**: New team members understand the system
- **Troubleshooting**: Easier to diagnose issues
- **Compliance**: Meet audit and security requirements

## Documentation Structure

Your `docs/deployment.md` should cover:

1. Prerequisites
2. Environment Setup
3. Deployment Process
4. Verification Steps
5. Rollback Procedures
6. Monitoring and Maintenance
7. Troubleshooting

## Template

```markdown
# Deployment Guide

## Overview

Brief description of the deployment architecture and strategy.

## Prerequisites

### Required Tools
- [ ] Docker (version X.X+)
- [ ] kubectl (version X.X+) or specific CLI tools
- [ ] Access credentials to production environment
- [ ] Required API keys and secrets

### Required Access
- [ ] AWS/Azure/GCP account with appropriate permissions
- [ ] GitHub repository access
- [ ] Container registry credentials
- [ ] Domain DNS management access

### Environment Variables
List all required environment variables:
- `DATABASE_URL` - PostgreSQL connection string
- `API_KEY` - Third-party API key
- `JWT_SECRET` - Authentication secret (generate securely)

## Environment Setup

### Development
Steps to run locally...

### Staging
Steps to deploy to staging...

### Production
Steps to deploy to production...

## Deployment Process

### Automated Deployment (CI/CD)

Triggered automatically on push to main branch.

1. GitHub Actions workflow runs
2. Tests pass
3. Docker images built and pushed
4. Kubernetes deployment updated
5. Health checks verify deployment

### Manual Deployment

If automated deployment fails or manual intervention needed:

\`\`\`bash
# Step 1: Build the application
npm run build

# Step 2: Build Docker image
docker build -t myapp:latest .

# Step 3: Push to registry
docker push registry.example.com/myapp:latest

# Step 4: Deploy to Kubernetes
kubectl apply -f k8s/deployment.yml
kubectl rollout status deployment/myapp

# Step 5: Verify deployment
curl https://api.example.com/health
\`\`\`

## Infrastructure

### Architecture Diagram
[Include or link to architecture diagram]

### Services
- **Frontend**: Served via CDN (CloudFront/Cloudflare)
- **Backend API**: Running on ECS/Kubernetes
- **Database**: RDS PostgreSQL
- **Cache**: Redis ElastiCache
- **Storage**: S3 bucket for uploads

### Scaling Configuration
- Auto-scaling: 2-10 instances based on CPU
- Database: Multi-AZ deployment
- CDN: Global edge locations

## Configuration Management

### Secrets Management
- Stored in AWS Secrets Manager / Azure Key Vault
- Never commit secrets to repository
- Rotate secrets every 90 days

### Environment Configuration
Different configurations per environment:
- `config/development.json`
- `config/staging.json`
- `config/production.json`

## Verification Steps

After each deployment:

1. **Health Check**
   \`\`\`bash
   curl https://api.example.com/health
   # Expected: {"status": "healthy"}
   \`\`\`

2. **Database Connectivity**
   \`\`\`bash
   kubectl exec -it pod/myapp-xxx -- npm run db:check
   \`\`\`

3. **Smoke Tests**
   \`\`\`bash
   npm run test:smoke
   \`\`\`

4. **Monitor Logs**
   \`\`\`bash
   kubectl logs -f deployment/myapp
   \`\`\`

## Rollback Procedures

### Quick Rollback (Kubernetes)
\`\`\`bash
# Rollback to previous version
kubectl rollout undo deployment/myapp

# Check rollback status
kubectl rollout status deployment/myapp
\`\`\`

### Database Rollback
\`\`\`bash
# Restore from backup
aws rds restore-db-instance-from-db-snapshot \
  --db-instance-identifier myapp-restored \
  --db-snapshot-identifier myapp-snapshot-YYYYMMDD
\`\`\`

## Monitoring

### Key Metrics
- Response time: < 200ms (p95)
- Error rate: < 0.1%
- Uptime: 99.9%
- CPU usage: < 70%
- Memory usage: < 80%

### Monitoring Tools
- **Application**: CloudWatch / DataDog
- **Logs**: CloudWatch Logs / ELK Stack
- **APM**: New Relic / Application Insights
- **Uptime**: Pingdom / UptimeRobot

### Alerts
Configured alerts for:
- High error rate (> 1%)
- High latency (> 1s)
- Low availability (< 99%)
- Failed deployments

## Maintenance

### Regular Tasks
- **Daily**: Review error logs
- **Weekly**: Check performance metrics
- **Monthly**: Update dependencies, rotate secrets
- **Quarterly**: Review and update capacity

### Database Maintenance
- Automated backups: Daily at 2 AM UTC
- Backup retention: 30 days
- Point-in-time recovery: Enabled

### SSL Certificates
- Provider: Let's Encrypt / AWS Certificate Manager
- Auto-renewal: Enabled
- Expiration monitoring: Alert 30 days before

## Troubleshooting

### Issue: Deployment Fails

**Symptoms**: CI/CD pipeline fails at deployment stage

**Diagnosis**:
\`\`\`bash
# Check deployment logs
kubectl describe deployment myapp
kubectl logs -f deployment/myapp
\`\`\`

**Solution**:
1. Verify image was pushed to registry
2. Check resource limits
3. Verify environment variables are set
4. Check for failing health checks

### Issue: Database Connection Errors

**Symptoms**: Application cannot connect to database

**Diagnosis**:
\`\`\`bash
# Test database connectivity
kubectl exec -it pod/myapp-xxx -- psql $DATABASE_URL -c "SELECT 1"
\`\`\`

**Solution**:
1. Verify DATABASE_URL is correct
2. Check security group rules
3. Verify database is running
4. Check connection pool limits

### Issue: High Memory Usage

**Symptoms**: Pods being OOMKilled

**Diagnosis**:
\`\`\`bash
# Check memory usage
kubectl top pods
\`\`\`

**Solution**:
1. Increase memory limits in deployment
2. Profile application for memory leaks
3. Enable memory heap dumps

## Disaster Recovery

### Backup Strategy
- **Database**: Automated daily backups, 30-day retention
- **Files**: S3 versioning enabled
- **Configuration**: Version controlled in Git

### Recovery Time Objective (RTO)
- Target: < 1 hour for complete system recovery

### Recovery Point Objective (RPO)
- Target: < 15 minutes of data loss

### Recovery Procedure
1. Assess damage and impact
2. Notify stakeholders
3. Restore from latest backup
4. Verify data integrity
5. Update DNS if needed
6. Monitor closely for 24 hours
7. Post-mortem analysis

## Deployment Checklist

Before deploying to production:

- [ ] Code reviewed and approved
- [ ] Tests passing (unit, integration, e2e)
- [ ] Security scan completed
- [ ] Performance testing done
- [ ] Database migrations tested
- [ ] Rollback plan prepared
- [ ] Monitoring and alerts configured
- [ ] Team notified of deployment
- [ ] Maintenance window scheduled (if needed)
- [ ] Documentation updated

## Contact Information

- **On-call Engineer**: [Contact details]
- **Infrastructure Team**: [Contact details]
- **Emergency Escalation**: [Contact details]

## Change Log

Keep a record of significant deployments:

| Date | Version | Changes | Deployed By |
|------|---------|---------|-------------|
| 2024-01-15 | v2.1.0 | Added user dashboard | @engineer1 |
| 2024-01-10 | v2.0.5 | Bug fix release | @engineer2 |
```

## Best Practices

### 1. Keep It Updated

Deployment docs become stale quickly. Update them:
- When deployment process changes
- After resolving production issues
- When infrastructure changes
- During post-mortem reviews

### 2. Include Commands

Provide exact commands, not just descriptions:

**Bad**: "Deploy the application to production"

**Good**: 
```bash
./scripts/deploy.sh production v2.1.0
```

### 3. Document Assumptions

Be explicit about:
- Required permissions
- Network connectivity
- Pre-existing infrastructure
- Tool versions

### 4. Add Verification Steps

After each major step, include verification:
```bash
# Deploy
kubectl apply -f deployment.yml

# Verify
kubectl get pods | grep myapp
# Expected: 3/3 pods running
```

### 5. Include Rollback

Every deployment section should have a rollback procedure.

### 6. Use Screenshots

For UI-based deployments, include annotated screenshots.

### 7. Link to Related Docs

- Architecture documentation
- Runbooks for common issues
- Infrastructure as Code repository
- Monitoring dashboards

## Deployment Documentation Checklist

Use this checklist to ensure your deployment documentation is complete:

- [ ] Overview of deployment architecture
- [ ] Prerequisites clearly listed
- [ ] Step-by-step deployment instructions
- [ ] Environment-specific configurations
- [ ] Secrets management explained
- [ ] Verification steps for each environment
- [ ] Rollback procedures documented
- [ ] Monitoring and alerting covered
- [ ] Troubleshooting guide included
- [ ] Disaster recovery plan documented
- [ ] Contact information provided
- [ ] Commands are copy-paste ready
- [ ] Architecture diagrams included
- [ ] Change log maintained

## Examples for Different Platforms

### Vercel Deployment

```markdown
## Deployment to Vercel

1. Install Vercel CLI: `npm i -g vercel`
2. Login: `vercel login`
3. Deploy: `vercel --prod`
4. Verify: Visit https://yourapp.vercel.app
```

### AWS ECS Deployment

```markdown
## Deployment to AWS ECS

1. Build image: `docker build -t myapp:latest .`
2. Tag: `docker tag myapp:latest 123456789.dkr.ecr.us-east-1.amazonaws.com/myapp:latest`
3. Push: `docker push 123456789.dkr.ecr.us-east-1.amazonaws.com/myapp:latest`
4. Update service: `aws ecs update-service --cluster prod --service myapp --force-new-deployment`
5. Verify: `aws ecs wait services-stable --cluster prod --services myapp`
```

### Kubernetes Deployment

```markdown
## Deployment to Kubernetes

1. Apply configuration: `kubectl apply -f k8s/`
2. Wait for rollout: `kubectl rollout status deployment/myapp`
3. Verify pods: `kubectl get pods -l app=myapp`
4. Test endpoint: `kubectl port-forward svc/myapp 8080:80`
```

## Tools for Documentation

- **Diagrams**: Draw.io, Lucidchart, Mermaid
- **Screenshots**: Annotated with arrows and labels
- **Code blocks**: With syntax highlighting
- **Tables**: For configuration matrices
- **Checklists**: For deployment steps

## Keeping Documentation Accessible

1. Store in repository with code
2. Include in README with link
3. Add to team wiki/knowledge base
4. Create quick reference card
5. Include in onboarding materials

## Review and Testing

Periodically:
1. Have someone follow the docs to deploy
2. Update based on their feedback
3. Test rollback procedures in staging
4. Verify all links and commands work
5. Update version numbers and dates
