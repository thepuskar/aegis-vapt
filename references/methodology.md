# Engagement methodology

Use this reference for every Aegis VAPT engagement.

## Rules of engagement

For repository-only review, record repository, branch/base, commit, included modules, excluded paths, and whether remediation is allowed.

For active testing, additionally establish target hosts and APIs, environment and ownership, permitted hours and request rates, allowed accounts/roles/tenants, allowed and prohibited techniques, evidence handling, stop conditions, and incident contact.

Treat production, destructive actions, exploitation beyond minimal proof, social engineering, persistence, credential attacks, malware, and denial of service as out of scope unless separately and explicitly authorized. Authorization for one target does not authorize vendors, identity providers, CDNs, cloud metadata, adjacent networks, or discovered subdomains.

## Context and threat model

| Dimension | Questions |
| --- | --- |
| Assets | Which credentials, PII, financial, health, payroll, tenant, or operational data matter? |
| Actors | Anonymous user, employee, tenant admin, system admin, integration, support, CI worker? |
| Entry points | Browser, mobile client, API, webhook, import, upload, job, admin portal, OAuth callback? |
| Trust boundaries | Client/server, service/service, tenant/tenant, role/role, app/provider, CI/cloud? |
| Controls | Authentication, authorization, validation, isolation, encryption, rate limits, audit logs? |
| Abuse cases | What security assumption can an attacker violate? |

For changed-code reviews, inspect the changed symbol's callers and callees and any affected security boundary. A narrow diff is not necessarily a narrow impact boundary.

## Risk-led planning

Prioritize authentication, authorization, tenant isolation, secrets, and remote-code paths; then sensitive APIs, uploads, SSRF, injection, deserialization, and business workflows; then dependencies, cloud/container/CI configuration, data leakage, logging, caching, and hardening.

Use framework mappings to demonstrate coverage, not as a substitute for architecture-specific abuse cases.

## Candidate validation

For each candidate, answer:

1. What is the exact source of attacker influence?
2. What validation or transformation occurs?
3. Which identity, role, ownership, and tenant checks apply?
4. What sensitive sink or state transition is reached?
5. Are controls enforced server-side and on every route?
6. What preconditions and user interaction are required?
7. What data or capability is exposed?
8. Can a minimal, non-destructive proof reproduce it?
9. Could infrastructure or runtime controls invalidate the code-level conclusion?
10. What evidence would disprove the finding?

Use these statuses: `Confirmed`, `High confidence`, `Needs runtime validation`, `Low confidence`, `False positive`, `Not tested`.

## Remediation and retest

Fix the root cause at the correct enforcement layer. Assess all consumers and compatibility. Add negative tests for unauthenticated, wrong-role, wrong-owner, wrong-tenant, malformed, oversized, replayed, and unexpected-state requests as applicable.

Retest the original proof, nearby variants, legitimate behavior, and regressions. Do not mark an issue resolved solely because a scanner no longer reports it.

## Coverage ledger

Maintain a ledger so an absence of findings is not mistaken for complete coverage:

| Area | Method | Result | Evidence | Limitation |
| --- | --- | --- | --- | --- |
| AuthN | Code + runtime | Tested/Issue/Not tested | Reference | Constraint |
