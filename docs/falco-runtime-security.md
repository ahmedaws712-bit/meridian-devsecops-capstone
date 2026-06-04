# Falco Runtime Security

## Objective

This document describes the runtime security controls implemented for the Meridian DevSecOps capstone.

## Runtime Security Tool

Falco is used to detect suspicious runtime behavior in a local Kubernetes cluster.

## Local Cluster

The runtime security lab runs locally using kind. No managed Kubernetes cluster is required.

## Custom Detection Rules

| Rule | Purpose | Severity |
|---|---|---|
| Shell spawned in Meridian container | Detect shell execution in the application namespace | WARNING |
| Sensitive file read in Meridian container | Detect reads of `/etc/passwd`, `/etc/shadow`, or `/etc/sudoers` | WARNING |
| Package manager executed in Meridian container | Detect package manager usage inside the application namespace | CRITICAL |

## Tested Scenario

A temporary Alpine pod was launched in the `meridian-devsecops` namespace to simulate suspicious runtime behavior. The pod executed a shell command that read `/etc/passwd`. Falco detected both the shell execution and the sensitive file read event.

## Evidence

Falco generated runtime alerts containing:

- namespace: `meridian-devsecops`
- pod: `falco-test-shell`
- command: `sh -c cat /etc/passwd && sleep 120`
- detection: sensitive file read and shell execution

## Free-Tier Note

All runtime security testing is performed locally using kind. No paid managed Kubernetes service is used.
