# Image Promotion Policy

## Promotion Flow

```text
Build image
→ Scan image with Trivy
→ Generate SBOM with Syft
→ Sign image / verify provenance
→ Promote to test
→ Run DAST
→ Approve for release
