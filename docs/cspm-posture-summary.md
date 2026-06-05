# CSPM Posture Summary

## Objective

This document summarizes the CSPM posture assessment performed for the Meridian DevSecOps capstone.

## Tool Used

Prowler was used as the open-source CSPM/posture assessment tool.

## Scope

The assessment was executed against the local `kind` Kubernetes cluster named `kind-meridian-security`.

## Result Summary

Prowler successfully executed Kubernetes CIS posture checks and generated a report under:

`docs/evidence/cloud-native/cspm/`

The scan produced both passed and failed controls. This is expected because the local `kind` cluster is a lightweight development cluster and is not configured as a fully hardened production Kubernetes environment.

## Interpretation

The result is useful because it demonstrates:

- CSPM tooling can evaluate Kubernetes posture.
- CIS Kubernetes benchmark checks can be automated.
- Failed controls can be reviewed as posture findings.
- Posture results can be included in the security evidence pack.

## Production Treatment

In production, CSPM would be executed against AWS, Azure, and Kubernetes environments using read-only audit credentials. Findings would be routed into the centralized monitoring and incident-response workflow.
