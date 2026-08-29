# Tool orchestration

Tools support analysis; they do not replace authorization or manual validation. Use installed versions and read local help before commands. Prefer project configuration and machine-readable output outside source control.

Run `scripts/security-tooling.sh` for availability and `scripts/repo-context.sh` for context.

| Need | Common OSS options | Notes |
| --- | --- | --- |
| Orchestrated analysis | Strix | Detect first; never assume a `useStrix` function or CLI syntax. |
| SAST | Semgrep, CodeQL | Validate source-to-sink paths. |
| Dependency/SBOM | OSV-Scanner, Trivy, Syft | Use lockfiles/SBOMs and assess reachability. |
| Secrets | Gitleaks, TruffleHog | Redact output; bound history scans. |
| Containers/IaC/Kubernetes | Trivy, Checkov, KubeLinter, Kubescape, Hadolint | Align with deployed state and accepted policy. |
| Web/API DAST | OWASP ZAP | Authorized target only; start passive and throttle active checks. |
| Exposure checks | Nuclei | Pin trusted templates; avoid intrusive tags without approval. |
| Discovery | ffuf, Gobuster | Active enumeration; bound rate, recursion, and target. |
| XSS | Dalfox | Authorized inputs only; validate context manually. |
| TLS | testssl.sh, SSLyze | Authorized hosts; distinguish CDN ownership. |
| Cloud posture | Prowler, ScoutSuite, Steampipe | Requires authorized read-only cloud roles and explicit account scope. |
| Kubernetes runtime | kube-bench, Kubescape, Falco | Separate benchmark posture from runtime detections and exploitability. |
| Mobile | MobSF, JADX, apktool, objection | Use authorized builds/devices; do not bypass production controls without scope. |
| Binary/firmware | Ghidra, radare2, binwalk, YARA | Treat acquired artifacts safely and respect licenses/authorization. |
| Data flow/privacy | Semgrep custom rules, OpenAPI/schema tools, data catalogs | Correlate static discovery with deployed flows and policy. |
| AI/LLM | garak, promptfoo, PyRIT, Giskard | Bound providers, data, cost, tool actions, and nondeterminism; validate system impact manually. |
| Supply chain | Syft, Cosign, in-toto, SLSA verifier | Verify provenance/signatures and trust roots, not merely their presence. |
| Network/OT | Nmap, Nuclei safe templates, protocol-specific analyzers | Explicit network/OT scope; passive discovery preferred for fragile environments. |

Commercial tools may be used when already available and authorized; do not require them.

## Safe operation

1. Record tool, version, rules/config, scope, time, and exit status.
2. Exclude VCS metadata, caches, generated output, binaries, and vendor directories unless needed.
3. Never dump the full environment or `.env`; keep secrets out of commands and logs.
4. Do not use auto-fix, exploits, brute force, high rates, callback/OAST, metadata access, or code upload without approval.
5. Use conservative concurrency, cost, and token limits. Stop on error/latency spikes, data changes, physical/clinical impact, model/tool side effects, instability, or scope drift.
6. Pin trusted rules/templates/models where practical and record their versions or commit IDs.
7. Treat parser errors, skipped files, partial scans, missing credentials, nondeterminism, and unsupported languages/assets as limitations.

## Strix adapter

Strix is optional. If detected, read its installed version/help and any repository wrapper/config; determine whether it operates locally or uploads data; obtain approval before external upload or live target testing; capture results; manually validate material candidates; label manual discoveries separately; and re-run relevant checks after fixes.

If unavailable, state that and continue with appropriate local OSS/manual analysis. Never fabricate results or installation/command syntax.

## Dependency findings

Record ecosystem, installed/fixed version, dependency path, production/dev scope, reachable functionality when known, exposure, mitigations, and upgrade risk. A CVE match alone does not prove application exploitability.

## Tool-output correlation

Normalize candidates by affected asset and root cause. De-duplicate scanners that report the same condition, retain source attribution, and preserve disagreements. A tool's severity is an input—not the final business severity. For cloud, identity, AI, and operational findings, validate against deployed policy/state and control ownership.
