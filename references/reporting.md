# Reporting model

Produce a concise developer report by default. Add an executive summary, framework mapping, and release decision for formal or release-gate requests.

## Ratings

Keep severity, exploitability, and confidence separate.

- **Critical:** system-wide compromise, unauthenticated RCE, broad auth bypass, unrestricted tenant compromise, production-secret compromise, or destructive injection.
- **High:** account takeover, privilege escalation, sensitive IDOR, serious tenant breach, impactful SSRF, unsafe token validation, or privileged stored XSS.
- **Medium:** constrained exposure/injection, meaningful CSRF, missing abuse control on a sensitive operation, or material misconfiguration.
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

### Remediation
Architecture-aware fix and optional short-term control.

### Regression risk and verification
Affected consumers, legitimate behavior, negative tests, and retest steps.
```

Retain false positives with the evidence and mitigating control. For unvalidated candidates, state the missing access or test.

## Formal report

Include: executive summary; scope and rules of engagement; architecture and threat model; methodology/tools/framework mapping; coverage and limitations; risk table; confirmed findings; candidates; false positives; positive controls; prioritized remediation; retest results; and residual risk.

## Release recommendation

- `APPROVED`: no known blocker in tested scope; limitations still apply.
- `APPROVED WITH LOW-RISK FINDINGS`: accepted low-risk issues remain.
- `CONDITIONAL APPROVAL`: material issues need mitigation, owner, and deadline.
- `BLOCK RELEASE`: confirmed risk makes release unsafe.

Normally block for a confirmed critical issue, auth bypass, sensitive authorization/tenant bypass, account takeover, RCE, serious injection, active production-secret exposure, or unrestricted sensitive-data leakage. High severity may block based on exposure, exploitability, and impact.

Never call an application “secure” or “compliant.” State what was tested, found, and remains unknown.
