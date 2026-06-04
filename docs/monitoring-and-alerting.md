# Monitoring and Alerting Design

## Objective

This document describes the centralized monitoring and alerting approach for the Meridian DevSecOps capstone.

## Local Monitoring Stack

| Component | Purpose |
|---|---|
| Grafana | Visualization and dashboarding |
| Loki | Centralized log storage |
| Python log push script | Simulates security events from AWS, Azure, CI/CD, and local runtime tools |
| Alert simulation script | Detects HIGH/CRITICAL events and simulates notification |

## Unified Security View

The dashboard combines security events from:

- AWS GuardDuty simulated findings
- Azure Defender simulated findings
- Falco runtime alerts
- GitHub Actions security gates
- OPA compliance policy checks

## Alerting Policy

| Severity | Action |
|---|---|
| Critical | Immediate notification to security owner |
| High | Notification and investigation within same business day |
| Medium | Review during daily security triage |
| Low | Track as backlog item |

## Production Treatment

In production, AWS CloudWatch, Azure Monitor, GuardDuty, Defender, CI/CD logs, and runtime security logs would be forwarded into the centralized logging platform. PagerDuty or email notification would be connected to high-severity alert rules.
