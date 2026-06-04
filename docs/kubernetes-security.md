# Kubernetes Security Controls

## Objective

This document explains the Kubernetes security controls applied to the Meridian DevSecOps capstone manifests.

## Controls Implemented

| Control | Implementation |
|---|---|
| Namespace isolation | Application deployed to `meridian-devsecops` namespace |
| Dedicated service account | `meridian-app-sa` is used |
| No automatic API token | `automountServiceAccountToken: false` |
| Non-root execution | `runAsNonRoot: true`, `runAsUser: 65532` |
| No privilege escalation | `allowPrivilegeEscalation: false` |
| No privileged container | `privileged: false` |
| Drop Linux capabilities | `capabilities.drop: ALL` |
| Read-only root filesystem | `readOnlyRootFilesystem: true` |
| Runtime seccomp profile | `seccompProfile: RuntimeDefault` |
| Resource governance | CPU and memory requests/limits configured |
| Health checks | Liveness and readiness probes configured |
| Internal exposure only | Service type is `ClusterIP` |
| Network restriction | Kubernetes NetworkPolicy added |

## Free-Tier Note

The Kubernetes manifests are designed for local execution using kind, minikube, or Docker Desktop Kubernetes. No managed Kubernetes control plane is required.

## Local Image Policy Exception

Two Checkov Kubernetes image checks are intentionally skipped for the local capstone environment:

| Check | Reason |
|---|---|
| CKV_K8S_15 - ImagePullPolicy should be Always | The image is built locally and tested using local Kubernetes. Pulling from a remote registry is not required for this free-tier lab. |
| CKV_K8S_43 - Image should use digest | Digest pinning is documented as a production requirement. For this lab, the local image tag `meridian-static-app:local` is used. |

In a production environment, the image would be pushed to a trusted registry and referenced using an immutable digest, for example:

ghcr.io/company/meridian-static-app@sha256:<digest>
