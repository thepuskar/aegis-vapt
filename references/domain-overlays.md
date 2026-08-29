# Enterprise domain overlays

Apply only overlays matching actual business capabilities and data. Domain checks extend the core baseline; they never replace it.

## SaaS and multi-tenant platforms

- tenant derivation, provisioning, domain claim, SSO configuration, delegated administration, feature/plan entitlements;
- isolation in queries, caches, object storage, search, analytics, jobs, logs, backups, exports, support, AI retrieval, and billing;
- tenant lifecycle, merge/split/migration, custom integrations, marketplace apps, and deletion;
- platform operator access, impersonation, regional placement, noisy-neighbor/resource abuse, and tenant-specific encryption requirements.

## ERP, HR, payroll, and enterprise operations

- legal entity/company/project/department boundaries, delegated roles, segregation of duties, and approval limits;
- payroll, timesheet, invoice, procurement, expense, vendor, bank, tax, employee and document confidentiality;
- workflow/state-transition bypass, retroactive edits, duplicate processing, effective dating, period close/reopen, bulk import/export, and reconciliation;
- privileged configuration, master data, report builders, integrations, background jobs, and audit history;
- fraud paths involving vendor/bank changes, approval self-service, ghost employees, duplicate invoices, or export manipulation.

## Finance, banking, insurance, and payments

- customer/account/portfolio/policy isolation, transaction authorization, dual control, limits, holds, reversals, settlement, reconciliation, and non-repudiation;
- payment token/card data scope, beneficiary/payee changes, account recovery, fraud/AML workflow integrity, statement/report confidentiality;
- race, replay, rounding, precision, negative values, currency/time boundary, duplicate submission, idempotency, and ledger immutability;
- open-banking/partner APIs, webhook authenticity, signing, key lifecycle, regulatory evidence, and high-risk step-up authentication.

## Healthcare and life sciences

- PHI/ePHI classification, minimum-necessary access, patient/practitioner/organization compartments, consent, proxy access, break-glass, sensitive-record segmentation, and immutable audit;
- FHIR/SMART scopes and launch context, search and bulk export, `_include`/`_revinclude`, history, subscriptions, terminology servers, backend services, and client registration;
- clinical document/upload security, interoperability, portal messaging, de-identification/re-identification, research datasets, and secondary use;
- clinical workflow integrity, medication/order/result changes, attribution, provenance, safety impact, downtime and recovery;
- medical devices, DICOM/imaging, laboratory interfaces, and regulated product controls only when present.

## Government, defense, and public-sector systems

- citizen/case/agency isolation, identity proofing, delegated authority, records classification, retention, legal holds, accessibility, and public-record boundaries;
- privileged operators, contractor/vendor access, cross-agency federation, data sovereignty, audit, cryptographic modules, and supply-chain requirements;
- emergency operations, offline/degraded modes, bulk data access, insider threat, and critical-service continuity;
- map required government standards precisely by jurisdiction and contract; do not infer authorization to assess classified systems.

## Retail, marketplace, and e-commerce

- account takeover, checkout, pricing, inventory, promotion/coupon/gift-card, returns/refunds, loyalty, seller/admin and review abuse;
- payment redirection, address/beneficiary changes, bot/resource abuse, scraping, scalping, duplicate orders, race conditions, and fraud controls;
- marketplace seller/buyer isolation, catalog/content uploads, fulfillment integrations, webhooks, and PCI boundary.

## Education and research

- student/guardian/instructor/researcher roles, minors' data, records privacy, assessment integrity, accommodations, admissions and financial-aid workflows;
- grade/exam tampering, proctoring/privacy, content access, plagiarism/AI workflows, research participant consent, dataset sharing, and institutional federation;
- learning-tool integrations, LTI/OAuth, cross-institution isolation, bulk rosters, and account lifecycle.

## Telecom, communications, and collaboration

- subscriber/tenant isolation, provisioning, number/account takeover, SIM/eSIM workflows, routing/configuration, lawful-access boundaries, metadata, and billing;
- messaging/call/file privacy, federation, abuse/spam, identity spoofing, retention, encryption/key management, recording, and administrative access;
- availability, signaling/API abuse, quota/cost, partner interconnects, and operational control planes.

## Industrial, manufacturing, IoT, and critical infrastructure

- safety, availability, deterministic operation, zones/conduits, remote/vendor access, asset inventory, legacy protocols, and compensating controls;
- device identity, manufacturing/provisioning, secure boot, firmware signing, rollback, recovery, fleet updates, key rotation, decommissioning, and physical access;
- gateway/cloud/mobile boundaries, command authorization, telemetry integrity, offline behavior, fail-safe states, and maintenance tools;
- never run disruptive scans or exploit tests against production OT without explicit specialist-approved rules of engagement.

## Legal, professional services, and document platforms

- client/matter/workspace ethical walls, privileged/confidential documents, retention/legal hold, sharing, watermarking, export, and search isolation;
- e-signature identity and intent, document integrity, version history, template/merge injection, metadata leakage, external collaboration, and AI summarization/retrieval;
- support/admin access, audit defensibility, regional placement, and secure disposal.

## Media, gaming, and digital platforms

- entitlement/licensing, virtual economies, payments, account recovery, anti-cheat/fraud, user-generated content, moderation, minors, privacy, and abuse;
- real-time protocol, matchmaking/session authorization, inventory duplication, marketplace manipulation, streaming/content protection, and service availability.

## Travel, logistics, and supply-chain platforms

- booking/shipment/order ownership, pricing/rates, capacity/inventory, route/status transitions, refunds/claims, partner/carrier access, and customer/vendor isolation;
- location and identity privacy, customs/trade documents, fleet/warehouse devices, offline operations, EDI/file exchange, webhooks, and reconciliation;
- duplicate/replayed events, stale status, race conditions, fraudulent rerouting, account/beneficiary change, and operational continuity.

## Energy, utilities, and environmental platforms

- customer/meter/site/asset isolation, billing/tariff integrity, remote command authorization, operational telemetry, forecasting, market interfaces, and regulatory reports;
- IT/OT boundaries, vendor/field access, smart meters and gateways, safety, fail-safe behavior, outage operations, restoration, and critical-service continuity;
- apply industrial/critical-infrastructure controls when software can influence physical operation.

## Domain discovery questions

When no predefined overlay fits, identify: high-value state changes; regulated or contractual data; role and organization boundaries; fraud/abuse incentives; time/sequence/concurrency rules; life/safety consequences; external ecosystems; audit and dispute requirements; and required recovery behavior. Build a custom overlay from those answers.
