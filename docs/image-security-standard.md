# Image Security Standard

## Objective

This document defines the container image hardening standard for the Meridian DevSecOps capstone.

## Image Hardening Rules

| Rule | Implementation |
|---|---|
| Use minimal runtime image | Final image uses `scratch` |
| Avoid unnecessary OS packages | Runtime image contains only the compiled static server and static app files |
| Do not run as root | Dockerfile uses `USER 65532:65532` |
| Use non-privileged port | Application listens on port `8080` |
| Scan image before deployment | Trivy scans for HIGH and CRITICAL vulnerabilities |
| Generate SBOM | Syft generates SPDX JSON SBOM |
| Fail pipeline on critical risk | Trivy exits with non-zero code on HIGH/CRITICAL findings |

## Accepted Residual Risk

The image signing step is documented at design level. In a production implementation, images would be pushed to a trusted registry and signed using Cosign before promotion to higher environments.
