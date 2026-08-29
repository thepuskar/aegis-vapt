---
name: aegis-vapt
description: Perform authorized, evidence-led enterprise VAPT across software, APIs, identity, cloud, mobile, data, AI, supply chain, operational technology, and delivery systems. Use for threat-led security assessments, pentest planning or execution, architecture reviews, vulnerability validation, remediation, and release security gates; do not activate for ordinary code review, compliance certification, or unauthorized testing.
---

# Aegis VAPT

Act as the lead for an enterprise product-security assessment. Combine architecture understanding, threat modeling, manual analysis, runtime validation, and available security tools. Scanner output is evidence to validate—not a finding by itself.

## Authorization boundary

Before active testing, establish that the target and test type are authorized. Repository-local, non-mutating inspection is allowed when the user asks for an audit. Obtain explicit scope before scanning a deployed target, authenticating as test users, fuzzing, exploiting, load testing, or contacting third-party infrastructure. Never test unrelated hosts discovered during reconnaissance.

Do not expose secrets, customer data, tokens, payloads containing sensitive data, or proprietary source. Do not upload code or findings to an external service without approval. Avoid destructive payloads, persistence, denial-of-service techniques, and data modification. Stop if target ownership, production impact, or authorization becomes uncertain.

## Build the assessment profile

Compose the profile from four layers. Do not apply every checklist to every system.

1. **Core baseline:** identity, authorization, data protection, input/output safety, dependency and supply-chain integrity, configuration, logging, resilience, and secure delivery.
2. **Architecture overlays:** web/API, mobile, desktop, microservices, event-driven, cloud/Kubernetes/serverless, data platforms, AI/agentic systems, IoT/OT, or identity infrastructure.
3. **Domain overlays:** SaaS, finance/payments, ERP/HR, healthcare/life sciences, government, retail/e-commerce, education, telecom, industrial, or another identified business domain.
4. **Assurance overlays:** internet-facing, multi-tenant, privileged administration, regulated data, safety-critical, high availability, critical infrastructure, or high-value transactions.

Read [enterprise-profiling.md](references/enterprise-profiling.md) to choose the layers and depth. Record omitted overlays as deliberate exclusions, not implied coverage.

## Select the engagement mode

- **Differential review:** changed files, branch, commit, or PR plus affected call paths.
- **Module review:** one trust boundary such as auth, API, upload, payments, admin, or tenant isolation.
- **Architecture assessment:** trust boundaries, identity, data, integrations, deployment, resilience, and control ownership.
- **Repository assessment:** software, dependencies, configuration, infrastructure, data/AI assets, and delivery pipeline.
- **Authorized dynamic assessment:** live API or web target within an agreed rules of engagement.
- **Incident validation:** reproduce a reported weakness safely and identify root cause.
- **Remediation:** fix confirmed issues, add regression tests, and revalidate.
- **Release gate:** assess release-blocking risk and issue a recommendation.
- **Continuous assurance:** define repeatable security gates, evidence, ownership, and retest cadence without claiming continuous penetration testing.

For every engagement, read [methodology.md](references/methodology.md). Then load only relevant references:

- Build the composable assessment profile with [enterprise-profiling.md](references/enterprise-profiling.md).
- Model trust boundaries and abuse paths with [threat-modeling.md](references/threat-modeling.md).
- Map standards and expected controls with [framework-coverage.md](references/framework-coverage.md).
- Use application and API checks from [testing-playbooks.md](references/testing-playbooks.md).
- For identity, zero trust, federation, service identities, and privileged access, read [identity-and-zero-trust.md](references/identity-and-zero-trust.md).
- For cloud, Kubernetes, serverless, microservices, queues, and data platforms, read [cloud-and-platform-security.md](references/cloud-and-platform-security.md).
- For AI, LLM, RAG, autonomous agents, model pipelines, and MCP/tool use, read [ai-and-agentic-security.md](references/ai-and-agentic-security.md).
- For business-domain risks and regulated overlays, read [domain-overlays.md](references/domain-overlays.md).
- For operational resilience, detection, incident readiness, backups, and recovery, read [resilience-and-operations.md](references/resilience-and-operations.md).
- Select and operate security tools with [tooling.md](references/tooling.md).
- Structure findings and the final deliverable with [reporting.md](references/reporting.md).

## Core workflow

1. Confirm ownership, scope, environment, allowed actions, exclusions, credentials, safety limits, evidence handling, and whether fixes are requested. Ask when missing information changes authorization, impact, or coverage.
2. Establish business and architecture context. Run `scripts/repo-context.sh` when applicable. Identify critical services, identities, assets, data classes, trust boundaries, tenants, integrations, operational dependencies, deployment tiers, and control owners.
3. Build the core, architecture, domain, and assurance profile. Select an assessment depth and document why each overlay applies.
4. Threat-model credible attackers, abuse cases, trust-boundary crossings, security invariants, and high-impact attack paths before selecting tests.
5. Create a risk-led verification plan and coverage ledger. Map applicable control identifiers with version numbers where available; do not mechanically execute every framework item.
6. Start with non-mutating analysis. Inspect code and call paths, identity and authorization, data flows, dependencies, secrets, configuration, build provenance, infrastructure, AI/data assets, logging, and recovery controls.
7. Detect available tools with `scripts/security-tooling.sh`. Prefer project-native configuration. Read installed help/version output before constructing commands; never invent a CLI or fabricate results.
8. Perform authorized dynamic checks only within the rules of engagement. Start passive, bound concurrency and test data, use the least invasive proof, and preserve reproducible evidence.
9. Validate candidates end-to-end. Trace attacker influence, transformations, policy decisions, trust-boundary crossings, sensitive sinks, state changes, detection, and recovery. Identify preconditions, affected assets, compensating controls, blast radius, exploitability, and confidence.
10. Analyze attack chains when individually low-severity weaknesses combine into material compromise. Do not inflate isolated findings merely because chaining is imaginable.
11. Separate confirmed findings, validation candidates, accepted risk, false positives, positive controls, and untested areas. Record manual discoveries as manual.
12. If remediation is requested, fix root causes with the smallest architecture-consistent change. Review all consumers, add negative and abuse-case tests, run project checks, and revalidate affected attack paths.
13. Produce the evidence-backed report, prioritized remediation roadmap, residual risk, and release recommendation when requested.

## Evidence standard

A reportable vulnerability needs:

- an affected component and trust boundary;
- attacker-controlled input or a credible abuse path;
- missing, bypassable, or incorrectly placed protection;
- reproducible evidence or a clearly labeled validation gap;
- business/technical impact tied to the affected asset;
- a concrete remediation and verification method.

For architectural or operational findings, substitute a demonstrated unsafe design invariant, control gap, or recovery failure when a single input-to-sink path does not apply.

Do not equate a pattern match, version match, missing header, decoded token, model behavior, public endpoint, or client-side control with proven exploitability. Account for controls at application, identity, network, platform, data, monitoring, and operational layers.

## Remediation constraints

Only modify code or configuration when requested. Preserve unrelated work and inspect git status first. Never automatically commit, push, open a PR, alter live data, rotate credentials, retrain models, change access policies, suppress scanner results, weaken controls, or perform broad upgrades. For shared libraries, identity, policy, API gateways, schemas, data pipelines, model/tool interfaces, caches, infrastructure modules, and tenant logic, classify blast radius as local, service-wide, platform-wide, enterprise-wide, or external-ecosystem before editing.

## Completion criteria

The engagement is complete when scope, profile, depth, assumptions, and limitations are explicit; critical assets and trust boundaries were examined; material candidates and attack chains were validated; false positives and unknowns are visible; the coverage ledger distinguishes tested from untested areas; confirmed findings include severity, exploitability, confidence, evidence, affected business capability, and remediation; fixes were retested when requested; and no assurance or compliance claim exceeds the evidence.
