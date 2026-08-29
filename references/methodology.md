# Engagement methodology

Use this reference for every Aegis VAPT engagement.

## Rules of engagement

For repository-only review, record repository, branch/base, commit, included modules, excluded paths, generated/vendor code treatment, available environments, and whether remediation is allowed.

For active testing, additionally establish target hosts and APIs, environment and ownership, permitted hours and request rates, allowed accounts/roles/tenants, allowed and prohibited techniques, evidence handling, stop conditions, and incident contact.

Treat production, destructive actions, exploitation beyond minimal proof, social engineering, persistence, credential attacks, malware, denial of service, AI model extraction, unsafe physical/clinical actions, and disruptive OT testing as out of scope unless separately and explicitly authorized. Authorization for one target does not authorize vendors, identity providers, CDNs, model providers, cloud metadata, adjacent networks, or discovered assets.

Create a scope manifest containing assets, environments, identities/roles/tenants, source commit/config version, included overlays, permitted tools, rate/concurrency limits, test-data rules, evidence classification, cleanup, contacts, and stop conditions.

## Context and threat model

| Dimension | Questions |
| --- | --- |
| Assets | Which credentials, identities, PII/PHI, money, models, intellectual property, tenant, operational or safety data matter? |
| Actors | Anonymous user, customer, employee, tenant/admin, support, service/workload, device, partner, CI job, AI agent? |
| Entry points | Browser, mobile/desktop, API, message, webhook, import/upload, job, admin/control plane, federation, model/tool? |
| Trust boundaries | Client/service, service/service, tenant/tenant, identity/policy, app/provider, data/model/tool, CI/cloud/OT? |
| Controls | Authentication, authorization, isolation, validation, encryption, provenance, rate limits, detection, recovery? |
| Abuse cases | What security assumption can an attacker violate? |

For changed-code reviews, inspect the changed symbol's callers and callees and any affected security boundary. A narrow diff is not necessarily a narrow impact boundary.

## Risk-led planning

Prioritize credible paths to business-critical impact: identity and privilege compromise; tenant/domain/safety boundary failure; sensitive data or money manipulation; unsafe code/action execution; control-plane compromise; supply-chain compromise; and unrecoverable operational impact. Then cover isolated weaknesses and defense-in-depth.

Use framework mappings to demonstrate coverage, not as a substitute for architecture-specific abuse cases.

## Candidate validation

For each candidate or attack-chain step, answer:

1. What is the exact source of attacker influence?
2. What validation or transformation occurs?
3. Which identity, role, ownership, and tenant checks apply?
4. What sensitive sink or state transition is reached?
5. Are controls enforced server-side and on every route?
6. What preconditions and user interaction are required?
7. What data or capability is exposed?
8. Can a minimal, non-destructive proof reproduce it?
9. Which preventive, detective, and recovery controls apply at other layers?
10. Could environment, platform, model, or runtime behavior invalidate the conclusion?
11. What evidence would disprove the finding?
12. Does the weakness combine with another confirmed condition into a material attack path?

Use these statuses: `Confirmed`, `High confidence`, `Needs runtime validation`, `Low confidence`, `False positive`, `Not tested`.

## Remediation and retest

Fix the root cause at the correct enforcement layer. Assess consumers, schemas, integrations, operational procedures, deployment, data/model pipelines, and compatibility. Add negative tests for unauthenticated, wrong-role/owner/tenant/environment, stale/replayed state, malformed/oversized input, compromised dependency/tool output, and unsafe failure as applicable.

Retest the original proof, nearby variants, legitimate behavior, and regressions. Do not mark an issue resolved solely because a scanner no longer reports it.

## Coverage ledger

Maintain a ledger so an absence of findings is not mistaken for complete coverage:

| Profile/area | Component | Method | Result | Evidence | Limitation |
| --- | --- | --- | --- | --- | --- |
| Core / AuthN | Identity service | Code + runtime | Tested/Issue/Not tested | Reference | Constraint |

Use results: `pass observed`, `finding`, `candidate`, `not tested`, `not applicable`, or `accepted risk`. A pass applies only to the exact control, asset, role, environment, and evidence recorded.

## Evidence handling

- Timestamp evidence and tie it to commit, build, configuration, identity, environment, and tool/ruleset version.
- Store the minimum needed proof. Redact credentials, personal data, regulated data, proprietary prompts/models, and customer content.
- Preserve raw output separately from analyst conclusions. Hash/export evidence when chain-of-custody matters.
- Never place exploit payloads, secrets, live tokens, sensitive screenshots, or customer records in public tickets or reports.
- Record cleanup of test users, data, files, callbacks, webhooks, tokens, and configuration changes.
