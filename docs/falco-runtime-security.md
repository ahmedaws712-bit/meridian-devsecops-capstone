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
| Terminal shell in Meridian container | Detect shell execution in application namespace | WARNING |
| Sensitive file read in Meridian container | Detect reads of `/etc/passwd`, `/etc/shadow`, or `/etc/sudoers` | WARNING |
| Package manager executed in Meridian container | Detect package manager usage inside container | CRITICAL |

## Tested Scenario

A temporary Alpine pod was launched in the Meridian namespace to simulate suspicious runtime behavior. Falco logs were reviewed to confirm runtime detection.

## Free-Tier Note

All runtime security testing is performed locally. No paid managed Kubernetes service is used.
