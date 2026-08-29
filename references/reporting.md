# Reporting model

Produce a concise developer report by default. Add an executive summary, assessment profile, architecture/attack paths, framework mapping, operational impact, and release decision for formal or release-gate requests.

## Ratings

Keep severity, exploitability, and confidence separate.

- **Critical:** system/enterprise-wide compromise, unauthenticated RCE, broad identity or tenant bypass, production trust-root compromise, destructive transaction/data manipulation, unsafe critical action, or recovery defeat.
- **High:** account/workload takeover, privilege escalation, sensitive isolation failure, impactful SSRF/control-plane access, supply-chain compromise path, excessive AI-agent authority, or material operational disruption.
- **Medium:** constrained exposure/injection, meaningful CSRF, missing abuse control, weak separation of duties, recoverable configuration weakness, or limited AI/data/tool boundary failure.
- **Low:** limited leakage or hardening weakness with low direct impact.
- **Informational:** defense-in-depth without demonstrated security impact.

Exploitability: `Trivial`, `Easy`, `Moderate`, `Difficult`, `Theoretical`, `Not exploitable`, `Unknown`.

Confidence: `Confirmed`, `High`, `Medium`, `Low`. Reserve `Confirmed` for reproducible behavior or a complete, unambiguous code/config path.

Use CVSS only when requested or expected, including its vector and assumptions.

## Finding template

```markdown
## [HIGH] Cross-tenant invoice access

**Status:** Confirmed  
**Source:** Manual analysis / Tool name  
**Exploitability:** Easy  
**Confidence:** Confirmed  
**Framework mapping:** OWASP API1; CWE-639
**Assessment profile:** Core + SaaS + multi-tenant
**Affected business capability:** Invoice confidentiality

### Affected component
`path/to/file.ts:line` or authorized endpoint

### Description and evidence
Observed behavior and minimum redacted evidence.

### Attack preconditions
Required access, role, tenant, interaction, or knowledge.

### Impact
Affected assets, users, tenants, and business process.

### Root cause
Missing or misplaced control.

### Attack path and blast radius
Entry point, boundary crossings, affected identities/tenants/services, and credible chaining.

### Remediation
Architecture-aware fix and optional short-term control.

### Regression risk and verification
Affected consumers, legitimate behavior, negative tests, and retest steps.
```

Retain false positives with the evidence and mitigating control. For unvalidated candidates, state the missing access or test.

## Formal report

Include: executive summary; scope and rules of engagement; assessment profile/depth; business capabilities and data classes; architecture and threat model; attack paths; methodology/tools/framework versions; coverage ledger and limitations; risk table; confirmed findings; candidates; accepted risk; false positives; positive controls; prioritized remediation by now/next/strategic; operational and recovery observations; retest results; and residual risk.

For each recommendation, identify the control owner class (`product`, `identity`, `platform`, `data`, `security operations`, `vendor`, or `governance`) and whether the fix is preventive, detective, recovery, or compensating.

## Release recommendation

- `APPROVED`: no known blocker in tested scope; limitations still apply.
- `APPROVED WITH LOW-RISK FINDINGS`: accepted low-risk issues remain.
- `CONDITIONAL APPROVAL`: material issues need mitigation, owner, and deadline.
- `BLOCK RELEASE`: confirmed risk makes release unsafe.

Normally block for a confirmed critical issue, identity/authorization/tenant bypass, account or control-plane takeover, RCE, serious injection, active production trust-secret exposure, unsafe critical action, unrestricted sensitive-data leakage, compromised build/deployment trust, or absence of credible recovery from a release-introduced destructive risk. High severity may block based on exposure, exploitability, blast radius, detectability, safety, and business impact.

Never call an application “secure” or “compliant.” State what was tested, found, and remains unknown.
