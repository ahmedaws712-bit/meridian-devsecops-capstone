package capstone.compliance

deny contains msg if {
  input.pipeline.branch_protection_enabled == false
  msg := "Branch protection must be enabled."
}

deny contains msg if {
  input.pipeline.secrets_scan_enabled == false
  msg := "Secrets scanning must be enabled."
}

deny contains msg if {
  input.pipeline.sast_enabled == false
  msg := "SAST scanning must be enabled."
}

deny contains msg if {
  input.pipeline.iac_scan_enabled == false
  msg := "IaC scanning must be enabled."
}

deny contains msg if {
  input.pipeline.container_scan_enabled == false
  msg := "Container image scanning must be enabled."
}

deny contains msg if {
  input.pipeline.dast_enabled == false
  msg := "DAST scanning must be enabled."
}

deny contains msg if {
  input.pipeline.sbom_enabled == false
  msg := "SBOM generation must be enabled."
}

deny contains msg if {
  input.infrastructure.aws.encryption_enabled == false
  msg := "AWS storage encryption must be enabled."
}

deny contains msg if {
  input.infrastructure.aws.public_access_blocked == false
  msg := "AWS public access must be blocked."
}

deny contains msg if {
  input.infrastructure.azure.tls_minimum_version != "TLS1_2"
  msg := "Azure Storage must enforce TLS 1.2 or higher."
}

deny contains msg if {
  input.infrastructure.azure.public_access_disabled == false
  msg := "Azure public access must be disabled."
}

deny contains msg if {
  input.container.runs_as_non_root == false
  msg := "Container must run as non-root."
}

deny contains msg if {
  input.container.uses_minimal_runtime == false
  msg := "Container must use a minimal runtime image."
}

deny contains msg if {
  input.container.high_or_critical_vulnerabilities_allowed == true
  msg := "HIGH or CRITICAL vulnerabilities must not be allowed."
}

deny contains msg if {
  input.kubernetes.non_root_enabled == false
  msg := "Kubernetes workload must run as non-root."
}

deny contains msg if {
  input.kubernetes.privilege_escalation_disabled == false
  msg := "Kubernetes privilege escalation must be disabled."
}

deny contains msg if {
  input.kubernetes.network_policy_enabled == false
  msg := "Kubernetes NetworkPolicy must be enabled."
}

deny contains msg if {
  input.runtime_security.falco_enabled == false
  msg := "Falco runtime detection must be enabled."
}
