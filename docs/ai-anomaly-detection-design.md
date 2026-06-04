# AI-Assisted Anomaly Detection Design

## Objective

This document describes a design-level AI-assisted anomaly detection capability for the Meridian DevSecOps monitoring stack.

## Scope

The anomaly detection layer would analyze centralized security logs from CI/CD, AWS, Azure, Kubernetes, and runtime security tools.

## Candidate Signals

| Signal | Example |
|---|---|
| Authentication anomalies | Unusual login time, source country, or user agent |
| Cloud API anomalies | Sudden increase in privileged API calls |
| CI/CD anomalies | Repeated failed security gates or unusual deployment frequency |
| Runtime anomalies | Unexpected shell execution, sensitive file reads, package manager execution |
| Compliance anomalies | Repeated failures of the same control |

## Approach

1. Collect normalized security events in Loki or a SIEM.
2. Extract features such as source, severity, frequency, identity, cloud, and time window.
3. Build a baseline of normal event frequency.
4. Flag deviations above a defined threshold.
5. Use an LLM-assisted summarizer to produce human-readable incident context.
6. Route high-confidence anomalies to the incident-response process.

## Capstone Status

This is included as a design-level control. The implemented evidence uses simulated high-severity log events and alert simulation.
