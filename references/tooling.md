# Tool orchestration

Tools support analysis; they do not replace authorization or manual validation. Use installed versions and read local help before commands. Prefer project configuration and machine-readable output outside source control.

Run `scripts/security-tooling.sh` for availability and `scripts/repo-context.sh` for context.

| Need | Common OSS options | Notes |
| --- | --- | --- |
| Orchestrated analysis | Strix | Detect first; never assume a `useStrix` function or CLI syntax. |
| SAST | Semgrep, CodeQL | Validate source-to-sink paths. |
| Dependency/SBOM | OSV-Scanner, Trivy, Syft | Use lockfiles/SBOMs and assess reachability. |
| Secrets | Gitleaks, TruffleHog | Redact output; bound history scans. |
| Containers/IaC | Trivy, Checkov, KubeLinter, Hadolint | Align with deployed configuration. |
| Web/API DAST | OWASP ZAP | Authorized target only; start passive and throttle active checks. |
| Exposure checks | Nuclei | Pin trusted templates; avoid intrusive tags without approval. |
| Discovery | ffuf, Gobuster | Active enumeration; bound rate, recursion, and target. |
| XSS | Dalfox | Authorized inputs only; validate context manually. |
| TLS | testssl.sh, SSLyze | Authorized hosts; distinguish CDN ownership. |

Commercial tools may be used when already available and authorized; do not require them.

## Safe operation

1. Record tool, version, rules/config, scope, time, and exit status.
2. Exclude VCS metadata, caches, generated output, binaries, and vendor directories unless needed.
3. Never dump the full environment or `.env`; keep secrets out of commands and logs.
4. Do not use auto-fix, exploits, brute force, high rates, callback/OAST, metadata access, or code upload without approval.
5. Use conservative concurrency. Stop on error/latency spikes, data changes, instability, or scope drift.
6. Treat parser errors, partial scans, missing credentials, and unsupported languages as limitations.

## Strix adapter

Strix is optional. If detected, read its installed version/help and any repository wrapper/config; determine whether it operates locally or uploads data; obtain approval before external upload or live target testing; capture results; manually validate material candidates; label manual discoveries separately; and re-run relevant checks after fixes.

If unavailable, state that and continue with appropriate local OSS/manual analysis. Never fabricate results or installation/command syntax.

## Dependency findings

Record ecosystem, installed/fixed version, dependency path, production/dev scope, reachable functionality when known, exposure, mitigations, and upgrade risk. A CVE match alone does not prove application exploitability.
