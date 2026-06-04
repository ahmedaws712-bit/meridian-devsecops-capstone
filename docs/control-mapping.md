# Control Mapping

| Pipeline Gate | Tool | Purpose | ISO 27001 Mapping | NIST Mapping | CIS Mapping |
|---|---|---|---|---|---|
| Secrets Detection | GitLeaks | Prevent credentials from entering source control | A.8.12 Data Leakage Prevention | PR.DS, PR.AC | CIS 16 |
| SAST | Semgrep | Detect insecure application code patterns | A.8.28 Secure Coding | PR.IP, PR.DS | CIS 16 |
| IaC Scanning | Checkov / Terrascan | Detect insecure cloud infrastructure configuration | A.8.9 Configuration Management | PR.IP | CIS 4 |
| Policy-as-Code | OPA | Enforce organization-specific security rules | A.5.1 Security Policies | GV.PO | CIS 4 |
| Container Build | Docker | Package application consistently | A.8.8 Management of Technical Vulnerabilities | PR.IP | CIS 2 |
