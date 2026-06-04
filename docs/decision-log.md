# Security Architecture Decision Log

## Decision 001 — Use one parameterized DevSecOps pipeline

Decision:
Use a single GitHub Actions pipeline to scan application code, AWS Terraform, Azure Terraform, secrets, and OPA policies.

Reason:
The capstone requires consistent controls across AWS and Azure instead of two separate pipelines.

Risk:
Pipeline complexity may increase as more tools are added.

Mitigation:
Keep stages modular and ordered clearly.

---

## Decision 002 — Use local Docker for application runtime testing

Decision:
Run the static application locally in Docker for container and DAST testing.

Reason:
Avoid paid cloud compute and stay within free-tier requirements.

Risk:
Local runtime may not fully represent cloud runtime.

Mitigation:
Document this as a capstone free-tier constraint.
