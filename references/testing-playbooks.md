# Security testing playbooks

Load only relevant sections. Each item is an investigation prompt, not automatic proof.

## Identity, sessions, and federation

- Trace login, logout, recovery, enrollment, MFA, session creation, rotation, expiry, revocation, and concurrency.
- For OAuth/OIDC, verify state, nonce, PKCE, redirect allowlisting, issuer, audience, signature, authorized party, time claims, key rotation, and token type.
- Verify cookie `HttpOnly`, `Secure`, `SameSite`, scope, lifetime, rotation, and fixation resistance.
- Test invalid, expired, replayed, wrong-issuer, and wrong-audience cases where safe. Decoding is not validation.

## Authorization and multi-tenancy

- Trace UI to API/controller, middleware, service, repository, cache, object store, export, and jobs.
- Test object-, function-, and property-level authorization independently.
- Derive tenant and identity from trusted authenticated context, not request-controlled identifiers.
- Inspect query filters, cache keys, storage paths, search, reports, bulk operations, and async work for leakage.

## APIs

- Inventory versions, methods, schemas, deprecated/debug routes, GraphQL, webhooks, and exposed documentation.
- Check auth, ownership, validation, mass assignment, response fields, pagination, parameter pollution, content types, errors, rate limits, replay, and idempotency.
- For GraphQL, inspect resolver authorization, depth/complexity, batching, aliases, and field-level exposure.

## Injection and unsafe execution

- Trace attacker input into SQL/NoSQL/LDAP, shells, templates, interpreters, logs, headers, paths, deserializers, and expression engines.
- Confirm whether parameterization, allowlists, sandboxing, canonicalization, or contextual encoding applies at the sink.

## Browser and frontend

- Inspect stored/reflected/DOM XSS, rich text, Markdown, URL handling, postMessage, DOM clobbering, prototype pollution, and third-party scripts.
- Review CSRF, CORS, CSP, frame restrictions, HSTS, content type, referrer, and permissions policy.
- Treat public build variables/browser storage as attacker-readable; client-side permissions are not authorization.

## Mobile and desktop clients

- Review local secrets/data, platform key stores, backups, screenshots/clipboard, logs, IPC, deep links/protocol handlers, WebViews, certificate validation, update signing, code loading, and device trust assumptions.
- Treat root/jailbreak/debug/attestation signals as risk inputs, not substitutes for backend authorization.
- Test offline synchronization, conflict resolution, queued mutations, local database isolation, and account/tenant switching.

## SSRF, redirects, and outbound requests

- Trace controlled URLs through parsing, redirects, DNS, proxies, and request libraries.
- Assess scheme/host/port allowlists, private/link-local/loopback ranges, DNS rebinding, redirect revalidation, credential forwarding, and response exposure.
- Never probe metadata or internal services without explicit authorization.

## Files and content processing

- Validate extension, MIME, magic bytes, size/count, filename, path containment, permissions, storage, and download headers.
- Inspect parsers, SVG/HTML, archive traversal/bombs, executable content, malware controls, signed URLs, and lifecycle deletion.

## Business logic

- Model allowed state transitions. Test step skipping, negative/overflow values, duplicates, replay, races, stale approvals, price/status manipulation, and privilege changes.
- Focus on exports, approvals, payroll, payments, invoices, refunds, invitations, and recovery.

## Integrations and third parties

- Inventory inbound/outbound APIs, webhooks, SFTP/file exchange, email/SMS, identity, payments, analytics, AI/model providers, and marketplace extensions.
- Verify signing/authentication, replay protection, schema/content validation, credential and tenant isolation, egress restrictions, failure/retry behavior, data minimization, revocation, and vendor compromise blast radius.
- Do not trust third-party responses more than user input; validate before policy decisions or unsafe sinks.

## Dependencies and supply chain

- Use lockfiles/SBOMs for installed versions. Correlate advisories with reachability, runtime, and mitigations.
- Check typosquatting, maintainership, install scripts, pinning/integrity, dependency confusion, build plugins, CI actions, container bases, and provenance.

## Cloud, containers, IaC, and CI/CD

- Inspect least privilege, exposure, network paths, encryption, secrets, logs, backups, metadata, and environment separation.
- Check container user/capabilities/filesystem, secrets in layers/build args, base pinning, health checks, and unnecessary tools.
- Check CI untrusted input, fork protections, token permissions, artifacts, approvals, secrets, and command injection.

## Secrets, logging, privacy, errors, and cryptography

- Detect credentials without printing them; distinguish placeholder, test, revoked, unknown, and production values.
- Check logs/errors for credentials, tokens, cookies, PII, financial/health data, paths, queries, and upstream responses.
- Review audit events for actor, action, target, result, trusted time, correlation, tamper resistance, and retention.
- Check algorithms, key sizes, modes, randomness, nonce/IV reuse, key separation/rotation/storage, transport validation, and certificate verification.
- Map data collection, purpose, consent/lawful basis where supplied, access, sharing, residency, retention, deletion, backups, analytics, support, lower environments, and AI use. Flag legal questions for qualified review rather than making conclusions.
