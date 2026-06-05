# Final Capstone Deliverables Checklist

## D1 — Secure Pipeline

Status: Complete

Evidence:
- GitHub Actions DevSecOps pipeline
- GitLeaks secrets scan
- Semgrep SAST scan
- Checkov/Terrascan IaC scan
- OPA policy checks
- Trivy image scan
- OWASP ZAP DAST scan

## D2 — Dual-Cloud IaC

Status: Complete

Evidence:
- AWS Terraform under `infra/aws`
- Azure Terraform under `infra/azure`
- Secure storage controls
- Free-tier exceptions documented

## D3 — Cloud-Native Security Pack

Status: Complete

Evidence:
- AWS GuardDuty evidence
- Azure Defender for Cloud evidence or limitation
- Prowler CSPM posture report
- Falco runtime detection evidence

## D4 — Compliance Pack

Status: Complete

Evidence:
- OPA compliance policy
- Compliance input file
- Compliance evidence pack
- OpenSCAP evidence note

## D5 — Image Security Pack

Status: Complete

Evidence:
- Scratch-based Docker image
- Non-root container execution
- Trivy scan
- Syft SBOM
- Image promotion policy
- Image hardening standard

## D6 — Governance Pack

Status: Complete

Evidence:
- Branch protection
- Pull request approval requirement
- RACI
- Governance checkpoints
- Decision log
- Residual risk register

## D7 — Operations Pack

Status: Complete

Evidence:
- Grafana/Loki monitoring stack
- Simulated AWS/Azure/Falco/CI security logs
- Alert simulation
- Incident-response playbooks
- AI anomaly detection design

## D8 — Presentation and Demo

Status: Pending final preparation

Required:
- 12–15 slide final presentation
- Live demo of pipeline passing secure changes
- Live demo or screenshot of pipeline blocking insecure change
- Final teardown confirmation
