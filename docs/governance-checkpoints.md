# Governance Checkpoints

## Objective

This document defines where governance, human review, and approval checkpoints are applied in the Meridian DevSecOps pipeline.

## Pipeline Governance Flow

| Stage | Automated Control | Human / Governance Checkpoint |
|---|---|---|
| Code commit | GitLeaks, Semgrep | Developer self-review before push |
| Pull request | GitHub branch protection | Mandatory PR review before merge |
| Infrastructure change | Checkov, Terrascan, OPA | Reviewer validates IaC risk and free-tier impact |
| Container image build | Trivy, Syft SBOM | Reviewer checks vulnerability and SBOM evidence |
| Test deployment | Local Docker / kind deployment | Reviewer confirms no paid managed services are used |
| DAST | OWASP ZAP | Security review if medium/high findings appear |
| Runtime security | Falco rules | Security owner reviews runtime detections |
| Compliance | OPA compliance policy, OpenSCAP note | Evidence pack reviewed before final submission |
| Release approval | All checks must pass | Approval required before merging to main |

## Merge Rules

1. Direct push to `main` is blocked.
2. Pull requests are required.
3. Required status checks must pass.
4. At least one approving review is required.
5. Admin bypass is only acceptable in this solo capstone repository after evidence is captured.

## Free-Tier Governance

Before any live AWS or Azure deployment:

1. Billing alerts must be configured.
2. Only smallest free-tier resources may be used.
3. Any deployed resource must be destroyed after testing.
4. Paid managed Kubernetes is not allowed.
5. GuardDuty, Defender, or Security Hub must only be used during free trial windows and disabled afterward.
