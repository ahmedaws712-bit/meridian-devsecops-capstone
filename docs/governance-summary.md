# Governance Summary

## Overview

The Meridian DevSecOps capstone applies governance through automated controls, protected source control, documented ownership, and residual risk tracking.

## Governance Controls Implemented

| Governance Area | Implementation |
|---|---|
| Source control governance | Branch protection enabled on `main` |
| Change approval | Pull requests required before merge |
| Automated gates | GitHub Actions security pipeline |
| Infrastructure governance | Checkov, Terrascan, OPA |
| Application security governance | GitLeaks, Semgrep, OWASP ZAP |
| Container governance | Trivy, Syft SBOM, image promotion policy |
| Kubernetes governance | Secure manifests and Checkov scan |
| Runtime governance | Falco runtime detection rules |
| Compliance governance | OPA compliance policy and evidence pack |
| Risk governance | Residual risk register |
| Ownership | RACI matrix |

## Evidence

Governance evidence includes:

- Branch protection screenshot
- PR blocked until checks pass and review is provided
- Successful GitHub Actions pipeline
- RACI document
- Decision log
- Residual risk register
- Compliance evidence pack
