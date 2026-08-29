# Enterprise assessment profiling

Use this reference to select the smallest set of overlays that covers the system's real risk. Record the selected profile in the report.

## 1. Core baseline

Apply to every enterprise assessment:

- asset inventory, ownership, data classification, and trust boundaries;
- human, machine, workload, integration, and administrative identities;
- authentication, authorization, policy enforcement, session and secret lifecycle;
- input validation, output handling, unsafe execution, and business invariants;
- cryptography, key management, privacy, retention, and deletion;
- dependencies, SBOM, provenance, build, deployment, and update integrity;
- configuration, environment separation, observability, incident evidence, and recovery;
- third-party services, inbound/outbound integrations, and failure behavior.

## 2. Architecture overlays

Select every material architecture, not merely the UI technology.

| Overlay | Indicators | Required focus |
| --- | --- | --- |
| Web and API | Browser clients, REST, GraphQL, gRPC, WebSocket | ASVS/API controls, browser boundary, schemas, object/function/property authorization, abuse controls |
| Mobile | iOS/Android, deep links, local data, device APIs | MASVS, platform storage, IPC, signing, transport, attestation assumptions, backend authorization |
| Desktop | Electron, native client, auto-update, local IPC | update signing, local privilege, protocol handlers, IPC, filesystem, embedded secrets |
| Microservices | service mesh, internal APIs, many deployables | workload identity, east-west policy, service authorization, contract drift, cascading failure |
| Event-driven | queues, topics, streams, schedulers, workers | producer/consumer authorization, message authenticity, replay, ordering, poison messages, dead letters |
| Cloud native | managed cloud, Kubernetes, serverless, IaC | IAM, network exposure, metadata, control plane, tenancy, admission, runtime, drift |
| Data platform | ETL/ELT, lake/warehouse, BI, notebooks | lineage, row/column policy, service identities, exports, masking, notebook and pipeline execution |
| AI/agentic | models, RAG, vector store, tools/MCP, autonomous actions | prompt/data injection, tool policy, excessive agency, retrieval isolation, output handling, model supply chain |
| IoT/edge/OT | firmware, gateways, field devices, industrial protocols | device identity, secure boot/update, physical access, fleet lifecycle, segmentation, safety and availability |
| Legacy/mainframe/on-prem | batch, COBOL, shared database, thick client, file transfer | inherited trust, RACF/ACF2-style entitlements, batch identity, flat files, terminal/admin access, unsupported components, compensating controls |
| Low-code/RPA/workflow | citizen development, bots, connectors, visual flows | connector scopes, bot identities, secret vaults, environment promotion, untrusted expressions, governance and change control |
| Distributed ledger | smart contracts, wallets, custody, validators, oracles | key custody, contract authorization, upgrade/admin control, oracle/bridge trust, replay, finality, economic invariants |
| HPC/scientific computing | schedulers, shared clusters, research code/data | job isolation, shared storage, service accounts, secrets, dataset governance, notebook/code execution, export and reproducibility |
| Identity platform | IdP, SSO, federation, SCIM, PAM | federation trust, provisioning/deprovisioning, privileged access, recovery, token and key lifecycle |
| Integration hub | webhooks, partner APIs, file exchange, ESB/iPaaS | partner trust, signing, replay, egress, schema validation, credential isolation, blast radius |

## 3. Business-domain overlays

Select from [domain-overlays.md](domain-overlays.md) based on the business processes and regulated data actually present. A platform may need multiple overlays—for example, a healthcare payroll SaaS needs SaaS, healthcare, ERP/HR, and payment overlays.

## 4. Assurance overlays

| Overlay | Trigger | Added expectations |
| --- | --- | --- |
| Internet-facing | Untrusted network access | discovery, abuse resistance, exposed inventory, edge controls, continuous monitoring |
| Multi-tenant | Shared application or infrastructure | isolation at identity, query, cache, storage, jobs, telemetry, support, export, and backup layers |
| Privileged administration | High-impact operator functions | PAM/JIT, strong authentication, separation of duties, immutable audit, constrained impersonation |
| Regulated or sensitive data | PHI, PCI, government, biometric, children, legal | control mapping, data flow, minimum necessary access, retention, evidence and breach-relevant logging |
| High-value transactions | Money, payroll, securities, entitlements | transaction authorization, dual control, integrity, replay/idempotency, reconciliation, fraud controls |
| High availability | Contractual or mission-critical uptime | capacity, dependency failure, graceful degradation, DR, restore tests, RTO/RPO evidence |
| Safety-critical | Software can cause physical/clinical harm | hazard linkage, fail-safe behavior, change control, independent verification, safety/security interaction |
| Critical infrastructure | Essential services or OT | segmentation, remote access, safety, recovery, vendor access, operational constraints |

## 5. Assessment depth

Choose depth per component; one engagement may mix depths.

- **Discovery:** inventory, architecture, threat hypotheses, control sampling, and test plan. No broad assurance conclusion.
- **Standard:** code/configuration review plus safe runtime validation of material paths and dependencies.
- **High assurance:** deeper manual verification, multiple roles/tenants, architecture and infrastructure review, attack-chain analysis, recovery evidence, and retest.
- **Regulated/critical:** high assurance plus explicit control mapping, evidence ownership, data-flow and operational validation, and documented untested requirements. This is still not certification.

## 6. Profile record

```yaml
system: <name>
business_criticality: low | moderate | high | mission-critical
assessment_depth: discovery | standard | high-assurance | regulated-critical
core_baseline: true
architecture_overlays: []
domain_overlays: []
assurance_overlays: []
data_classes: []
critical_operations: []
roles_and_identities: []
environments: []
excluded_assets: []
```

Do not infer that an omitted overlay passed. Mark it `not applicable`, `excluded`, or `not tested` with a reason.
