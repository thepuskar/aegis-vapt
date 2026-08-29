# Threat modeling and attack paths

Use this reference for architecture reviews, full assessments, high-risk changes, and systems with several trust boundaries.

## Model the system

Create a concise model of:

- business capabilities and unacceptable outcomes;
- critical assets, data classes, secrets, money, identities, models, devices, and control planes;
- external, human, privileged, service, workload, partner, and attacker identities;
- entry points, administrative planes, async channels, update paths, and recovery paths;
- trust boundaries and where identity, policy, encryption, validation, or tenancy changes;
- third-party and operational dependencies;
- security invariants that must always hold.

Examples of invariants:

- one tenant cannot observe or influence another tenant;
- a transaction cannot complete without server-side authorization and integrity checks;
- an AI-produced instruction cannot directly authorize a privileged action;
- a backup cannot be restored by the same compromised identity that can destroy production;
- a device update must be authenticated, authorized, rollback-safe, and recoverable.

## Select modeling methods

Use methods as lenses, not paperwork goals:

- **STRIDE:** spoofing, tampering, repudiation, information disclosure, denial of service, elevation of privilege;
- **abuse/misuse cases:** business workflows and violated assumptions;
- **attack trees/graphs:** multi-step paths to high-impact outcomes;
- **data-flow analysis:** sources, transformations, stores, policy decisions, and sinks;
- **MITRE ATT&CK:** realistic tactics and defensive visibility for enterprise/cloud/industrial attack paths;
- **privacy threat modeling:** linkability, identifiability, detectability, disclosure, consent, and lifecycle harms;
- **safety-security analysis:** attacks that alter safe operation, clinical decisions, or physical processes.

## Attacker perspectives

Consider as applicable:

- anonymous internet attacker;
- authenticated low-privilege user;
- malicious or compromised tenant administrator;
- insider/support/operator with legitimate access;
- compromised service, workload, device, dependency, or CI job;
- malicious integration, webhook sender, supplier, or marketplace extension;
- attacker controlling retrieved content, uploaded documents, prompts, model context, or tool output;
- attacker with lost/stolen device or physical access;
- attacker exploiting recovery, support, migration, import/export, or decommissioning paths.

## Attack-path record

For high-impact outcomes, document:

```text
Goal -> prerequisite -> entry point -> boundary crossings -> control decisions
     -> sensitive action/data -> detection opportunities -> recovery constraints
```

Test the earliest reliable control and the final enforcement control. Identify alternate routes, async equivalents, bulk endpoints, support/admin paths, and legacy versions.

## Security test derivation

For each material threat, derive:

- preventive control to verify;
- detective evidence expected;
- safe negative or abuse-case test;
- affected component and owner;
- success/failure oracle;
- cleanup and stop condition;
- residual risk if the test cannot be performed.

## Attack chains

Combine findings only when evidence supports every transition. Record prerequisites and uncertainty at each edge. Examples include leaked low-privilege credentials plus missing tenant checks; SSRF plus metadata access plus overprivileged workload identity; prompt injection plus broad agent tooling plus absent human approval; or dependency compromise plus unsigned artifacts plus permissive deployment.

Do not convert several speculative observations into a confirmed chain.
