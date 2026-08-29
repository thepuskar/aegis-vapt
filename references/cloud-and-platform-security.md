# Cloud and platform security

Use for public/private cloud, Kubernetes, containers, serverless, microservices, service meshes, messaging, data platforms, and infrastructure as code.

## Cloud account and control plane

- Inventory organizations/accounts/subscriptions/projects, regions, environments, owners, identity federation, break-glass access, and security services.
- Verify root/owner protection, least privilege, role assumption, permission boundaries, organization policies, cross-account trust, key management, audit logs, and control-plane network restrictions.
- Review public exposure, private endpoints, DNS, load balancers, WAF/API gateways, metadata services, egress, peering/transit, and management access.
- Check drift between IaC, policy, and deployed state. Never assume an IaC scan covers manual changes or managed-service defaults.

## Kubernetes and containers

- Review cluster/API access, workload identity, RBAC, namespaces, admission controls, network policy, secrets, service accounts, pod security, capabilities, host access, volumes, and audit logs.
- Verify image source, digest pinning, signatures/provenance, base images, package inventory, build secrets, vulnerability handling, runtime policy, and update cadence.
- Check multi-tenant cluster boundaries, node trust, privileged DaemonSets, operators/controllers, CRDs, webhooks, and escape/blast-radius assumptions.
- Prefer non-root, minimal capabilities, read-only filesystems, resource limits, seccomp/AppArmor/SELinux where supported, and isolated build runners.

## Serverless and managed services

- Verify per-function/service identity, event-source authorization, concurrency/cost controls, secret access, network egress, temporary storage, logs, dead letters, retries, and idempotency.
- Treat storage triggers, queues, scheduled jobs, workflow engines, and administrative APIs as entry points.
- Assess cloud-service defaults, backup/export paths, cross-region copies, and provider-managed encryption boundaries.

## Microservices and service mesh

- Inventory north-south and east-west interfaces, schemas, owners, compatibility, and authentication/authorization responsibility.
- Verify service identity, mTLS policy, application-level authorization, retries/timeouts, circuit breaking, schema validation, and failure propagation.
- Check gateway bypass, direct service exposure, debug/metrics/admin ports, service discovery poisoning, trust-domain federation, and sidecar/mesh policy gaps.

## Messaging and event-driven systems

- Review producer/consumer authorization, topic/queue isolation, encryption, message authenticity, schema governance, sensitive payloads, replay, ordering, duplication, poison messages, and retention.
- Test idempotency and authorization again at the consumer; authenticated brokers do not make messages trustworthy.
- Review dead-letter queues, reprocessing tools, backfills, replay jobs, and operator consoles as privileged paths.

## Data platforms

- Map sources, ingestion, transformation, catalog, warehouse/lake, notebooks, BI, exports, models, and downstream sharing.
- Verify service identities, row/column/object policies, tenant partitions, masking/tokenization, lineage, retention, export controls, notebook execution, query limits, and snapshot/clone access.
- Check training/analytics replicas, lower environments, data science workspaces, support tooling, and logs for ungoverned sensitive copies.

## Infrastructure as code and delivery

- Review modules/providers, state storage, plan/apply permissions, secret handling, policy-as-code, environment approvals, drift, rollback, and destructive-change safeguards.
- Pin and verify actions, plugins, modules, images, and builders. Protect build provenance, artifact signing, registries, promotion, and deployment identities.
- Treat pull requests, issue text, branch names, commit metadata, package manifests, and generated files as untrusted CI inputs.

## Platform attack chains

Actively consider SSRF to metadata to workload role; exposed dashboard to cluster admin; poisoned dependency to CI token to artifact registry; public storage to sensitive data; compromised operator to cluster-wide secret access; and log/telemetry compromise hiding an intrusion. Confirm each transition before reporting the chain.
