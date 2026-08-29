# Resilience, detection, and security operations

Use for production readiness, mission-critical systems, incident validation, platform assessments, and release gates.

## Availability and abuse resistance

- Identify capacity bottlenecks, expensive endpoints, queue growth, storage amplification, fan-out, unbounded queries, external paid actions, and concurrency hot spots.
- Verify quotas, per-identity/tenant/IP controls, backpressure, timeouts, circuit breakers, bounded retries, cancellation, pagination, payload limits, and graceful degradation.
- Assess denial-of-wallet and dependency exhaustion without performing destructive load unless explicitly authorized and engineered.

## Backups and recovery

- Verify backup scope, encryption, access separation, immutability, retention, regional/account isolation, monitoring, and deletion protection.
- Compare RTO/RPO claims with tested restore evidence. Include configuration, identity, keys, object storage, queues, search, models/vector indexes, and audit data—not only the primary database.
- Ensure a compromised production identity cannot silently destroy both production and recovery copies.
- Review restore authorization, clean-room recovery, integrity verification, dependency order, and post-restore security state.

## Logging and detection

- Define security events for identity, privilege, tenant policy, secrets, data export, high-value transactions, configuration, deployment, AI tools, recovery, and audit administration.
- Verify actor, effective identity/delegation, tenant, target, action, result, trusted time, source, correlation/trace, policy decision, and reason where appropriate.
- Prevent credentials, tokens, sensitive payloads, PHI/PII, model prompts, and encryption material from entering logs.
- Assess tamper resistance, access, retention, clock synchronization, alert routing, and whether high-impact attack paths produce usable evidence.

## Incident readiness

- Identify kill switches, token/session revocation, key rotation, tenant isolation, integration disablement, feature flags, model/tool disablement, deployment rollback, and evidence preservation.
- Review ownership, escalation, forensic data, dependency contacts, customer/regulator notification inputs, and recovery decision authority.
- Confirm playbooks for credential compromise, tenant breach, supply-chain compromise, destructive admin, ransomware, data exfiltration, AI-agent misuse, and cloud control-plane compromise as applicable.

## Safe failure

- Test policy-service, identity-provider, key-management, database, queue, cache, third-party, model provider, and observability failure modes.
- Sensitive operations should fail closed unless a documented safety/availability requirement demands a constrained alternative.
- Prevent degraded mode from disabling tenant isolation, authorization, audit, transaction integrity, or safety controls.

## Operational security

- Review patch/vulnerability ownership, exposure-based prioritization, emergency change, maintenance access, secrets rotation, certificate expiry, capacity, end-of-life components, and exception expiry.
- Validate environment separation, production access, support tooling, debug paths, data copies, feature flags, and configuration drift.
- Record residual risk owner, treatment, deadline, compensating controls, validation evidence, and expiry for accepted findings.
