# Security Architecture Decision Log

## Decision 001 — Use one parameterized DevSecOps pipeline

Decision:
Use a single GitHub Actions pipeline to scan application code, AWS Terraform, Azure Terraform, secrets, policies, containers, Kubernetes manifests, SBOM, DAST, and compliance controls.

Reason:
The capstone requires consistent controls across AWS and Azure instead of two separate pipelines.

Risk:
Pipeline complexity increases as more tools are added.

Mitigation:
Keep stages modular and ordered clearly.

---

## Decision 002 — Use local Docker for runtime testing

Decision:
Run the static application locally in Docker for container and DAST testing.

Reason:
Avoid paid cloud compute and stay within free-tier requirements.

Risk:
Local runtime may not fully represent cloud runtime.

Mitigation:
Document this as a capstone free-tier constraint.

---

## Decision 003 — Use kind for Kubernetes runtime security

Decision:
Use kind as the local Kubernetes cluster for secure manifest validation and Falco runtime detection.

Reason:
The capstone requires Kubernetes runtime security, but paid managed Kubernetes must be avoided.

Risk:
kind does not fully represent managed cloud Kubernetes behavior.

Mitigation:
Use it for security-control demonstration and document production differences.

---

## Decision 004 — Use scratch-based container image

Decision:
Replace the original Nginx Alpine image with a scratch-based minimal runtime image.

Reason:
Trivy detected HIGH and CRITICAL CVEs in the original base image.

Risk:
Scratch images are harder to debug because they contain no shell or package manager.

Mitigation:
Use local test pods for Falco simulation and keep the runtime image minimal.

---

## Decision 005 — Use OPA as executable compliance gate

Decision:
Use OPA compliance policies as the executable compliance-as-code gate.

Reason:
OpenSCAP engine installed successfully, but benchmark content was unavailable in the WSL package repositories.

Risk:
OpenSCAP report generation is documented rather than fully executed in this local environment.

Mitigation:
Document OpenSCAP limitation and use OPA as the active CI/CD compliance gate.

---

## Decision 006 — Document free-tier exceptions

Decision:
Some enterprise controls are documented as residual risks instead of fully implemented.

Examples:
- AWS cross-region replication
- Azure private endpoint
- Azure customer-managed key
- Registry image digest pinning for local kind image

Reason:
The capstone requires strict free-tier discipline.

Risk:
The demo environment is not production-equivalent.

Mitigation:
Residual risks are tracked and production treatment is documented.
