# Residual Risk Register

## Objective

This register documents accepted risks, why they were accepted, and how they would be handled in production.

| ID | Risk | Reason Accepted | Mitigation / Production Treatment | Owner |
|---|---|---|---|---|
| R1 | AWS S3 cross-region replication omitted | Avoid unnecessary free-tier cost | Enable replication for production critical buckets | Cloud Engineer |
| R2 | AWS S3 access logging omitted | Static demo has no production traffic | Enable S3 access logs and central log archive in production | Cloud Engineer |
| R3 | Azure private endpoint omitted | No live production deployment required | Use private endpoints and private DNS in production | Cloud Engineer |
| R4 | Azure customer-managed key omitted | Key Vault adds extra complexity for capstone | Use CMK with Key Vault in production | Security Engineer |
| R5 | Local Kubernetes image uses tag instead of digest | Image is loaded locally into kind/minikube | Use immutable registry digest in production | DevSecOps Engineer |
| R6 | Image signing documented at design level | No production registry is used in capstone | Use Cosign signing and verification in CI/CD | DevSecOps Engineer |
| R7 | OpenSCAP benchmark content unavailable in WSL | SCAP content packages unavailable in local repo | Run OpenSCAP in supported Linux environment with CIS profile | Security Engineer |
| R8 | Admin bypass may be used for PR merge | Solo capstone repo has no separate reviewer | In real projects, bypass must require security approval | Repository Owner |
