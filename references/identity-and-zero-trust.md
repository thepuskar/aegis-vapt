# Identity, privilege, and zero-trust verification

Use for SSO, workforce/customer identity, service identities, federation, SCIM, PAM, administrative planes, multi-cloud, and high-value systems.

## Identity inventory

Inventory humans, customers, administrators, support users, service accounts, workloads, devices, API clients, CI jobs, bots/agents, third parties, and break-glass identities. For each, record issuer/source of truth, authentication method, credential type, lifecycle owner, authorization model, scope, environment, and audit trail.

## Authentication and federation

- Verify enrollment, authentication, MFA, step-up, recovery, reset, lockout, session, logout, revocation, and reauthentication.
- For OIDC/OAuth, verify state, nonce, PKCE, redirect URI, issuer, audience, signature, authorized party, time claims, key rotation, token type, scope, refresh rotation, and sender constraints when applicable.
- For SAML, verify signatures on the correct elements, issuer/audience/destination, time conditions, replay, assertion binding, encryption requirements, metadata/key rollover, and identity mapping.
- For passkeys/WebAuthn, verify relying-party/origin binding, challenge lifecycle, credential registration/recovery, discoverable credential policy, and downgrade resistance.
- Do not treat MFA as protection when recovery, legacy protocols, app passwords, service accounts, or support processes bypass it.

## Provisioning and lifecycle

- Verify joiner/mover/leaver flows, SCIM authorization, group/role mapping, deprovisioning latency, orphaned accounts, entitlement review, and environment separation.
- Prevent email/domain/username normalization collisions and unsafe account linking.
- Revoke sessions, keys, application grants, device trust, and downstream entitlements when identity state changes.

## Authorization and policy

- Model RBAC, ABAC, ReBAC, ownership, tenant, purpose, consent, geography, device, time, and transaction context.
- Verify policy at the final trusted enforcement point and across alternate protocols, bulk actions, exports, jobs, caches, search, support, and admin paths.
- Test default deny, conflict resolution, stale policy/cache behavior, policy versioning, and failure mode when the policy service is unavailable.
- Treat hidden UI and unpredictable IDs as usability controls, not authorization.

## Privileged access

- Verify separate administrative identities, phishing-resistant authentication where required, just-in-time/just-enough access, approval, duration, command/action scope, session recording where appropriate, and immutable audit.
- Review support impersonation, emergency access, delegated administration, tenant administration, and service-provider access.
- Enforce separation of duties for security policy, money movement, production changes, key management, audit deletion, and backup destruction/restoration.

## Workload and machine identity

- Prefer short-lived workload identity over static secrets; verify audience, namespace/service binding, environment, rotation, and least privilege.
- Review mTLS/service-mesh assumptions, certificate issuance and revocation, cloud role assumption, managed identity, API keys, webhook secrets, and device credentials.
- Prevent confused deputy and token exchange errors. Bind downstream authorization to the original actor and delegation context where required.

## Zero-trust assertions

Do not accept a “zero trust” label as evidence. Verify resource-centric policy, continuous signals where justified, explicit trust decisions, device/workload identity, least privilege, segmentation, telemetry, and safe failure behavior. Network location alone must not grant sensitive access.

## Test cases

Include wrong issuer/audience/tenant, expired/replayed token, removed user, stale group, privilege downgrade, cross-environment credential, alternate protocol, compromised service identity, policy-service outage, emergency access, and audit completeness as applicable.
