# Incident Response Playbooks

## Objective

This document defines incident-response playbooks for the Meridian DevSecOps capstone.

---

## Playbook 1 — Exposed Secret Detected

### Trigger

GitLeaks detects a secret in a commit or pull request.

### Severity

Critical

### Detection Source

GitHub Actions / GitLeaks

### Response Steps

1. Block the pull request automatically.
2. Do not merge the affected branch.
3. Remove the exposed secret from the codebase.
4. Rotate the exposed credential if it was real.
5. Review Git history and invalidate leaked tokens.
6. Re-run GitLeaks to confirm remediation.
7. Document the incident and root cause.

### Evidence

- Failed GitHub Actions run
- GitLeaks output
- Remediation commit

---

## Playbook 2 — Anomalous Cloud API Activity

### Trigger

AWS GuardDuty or Azure Defender reports unusual API activity.

### Severity

High

### Detection Source

AWS GuardDuty / Azure Defender / centralized Loki dashboard

### Response Steps

1. Confirm affected cloud account/subscription.
2. Identify IAM principal or service identity involved.
3. Disable or restrict the suspicious identity.
4. Review CloudTrail or Azure activity logs.
5. Check for unauthorized infrastructure changes.
6. Rotate credentials if compromise is suspected.
7. Record residual risk and remediation.

### Evidence

- GuardDuty/Defender finding
- Loki/Grafana security log
- IAM remediation notes

---

## Playbook 3 — Failed Compliance Gate

### Trigger

OPA compliance policy returns one or more violations.

### Severity

High

### Detection Source

GitHub Actions / OPA

### Response Steps

1. Block the merge automatically.
2. Identify the failed compliance rule.
3. Assign the finding to the responsible owner.
4. Fix the non-compliant configuration.
5. Re-run OPA policy evaluation.
6. Update the evidence pack if the control changed.
7. Approve only after the compliance gate passes.

### Evidence

- OPA failure output
- Pull request discussion
- Remediation commit
