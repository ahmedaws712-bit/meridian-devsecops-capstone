# Compliance Evidence Pack

## Objective

This document maps the automated DevSecOps controls implemented in the Meridian capstone to ISO 27001, NIST, and CIS control areas.

## Automated Compliance Controls

| Control Area | Implementation | Evidence |
|---|---|---|
| Source control protection | GitHub branch protection and required checks | Branch protection screenshot |
| Secrets protection | GitLeaks scan in CI/CD | GitLeaks logs |
| Secure coding | Semgrep SAST scan | Semgrep logs |
| Infrastructure security | Checkov and Terrascan IaC scans | IaC scan logs |
| Policy-as-code | OPA security and compliance policies | OPA evaluation results |
| Container vulnerability management | Trivy image scan | Trivy logs |
| Software supply chain visibility | Syft SBOM generation | SBOM artifact |
| Dynamic web testing | OWASP ZAP DAST scan | ZAP report |
| Kubernetes workload hardening | Checkov Kubernetes scan and secure manifests | Kubernetes scan logs |
| Runtime threat detection | Falco custom rules and runtime alert evidence | Falco logs |
| Host compliance reporting | OpenSCAP installed and documented | OpenSCAP evidence note |

## ISO 27001 Mapping

| ISO 27001 Area | Related Capstone Control |
|---|---|
| Access control | Branch protection, service account restrictions |
| Secure development | Semgrep, GitLeaks, OPA, pull request gates |
| Configuration management | Terraform hardening, Checkov, Terrascan |
| Vulnerability management | Trivy, OpenSCAP |
| Logging and monitoring | Falco runtime detection |
| Software supply chain | SBOM generation and image promotion policy |

## NIST Mapping

| NIST Area | Related Capstone Control |
|---|---|
| Identify | SBOM, documented assets and controls |
| Protect | IaC hardening, Kubernetes security context, branch protection |
| Detect | GitLeaks, Semgrep, Trivy, Falco, ZAP |
| Respond | Incident-response playbooks |
| Recover | Evidence pack and remediation documentation |

## CIS Mapping

| CIS Area | Related Capstone Control |
|---|---|
| Inventory and control of assets | SBOM and documented resources |
| Secure configuration | Terraform and Kubernetes hardening |
| Continuous vulnerability management | Trivy and OpenSCAP evidence |
| Access control management | Branch protection and service account restrictions |
| Audit log management | Falco runtime security logs |
| Application software security | Semgrep and OWASP ZAP |
