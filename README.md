# Aegis VAPT

An evidence-led enterprise VAPT skill for coding agents. Aegis VAPT combines threat modeling, manual security analysis, framework-aligned coverage, optional OSS tooling, finding validation, remediation guidance, and release-gate reporting.

It is designed for authorized assessment of source code, APIs, authentication, authorization, multi-tenant systems, dependencies, cloud infrastructure, containers, and CI/CD.

## Capabilities

- Differential, module, repository, incident, remediation, and release-gate reviews
- OWASP ASVS, Top 10, API Security Top 10, WSTG, CWE, NIST SSDF, CIS, SLSA, and related mappings
- Authentication, OIDC/OAuth, session, authorization, IDOR, and tenant-isolation analysis
- API, injection, XSS, SSRF, upload, business-logic, dependency, supply-chain, cloud, container, IaC, and CI/CD testing
- Runtime detection for Strix, Semgrep, CodeQL, Trivy, OSV-Scanner, ZAP, Nuclei, Gitleaks, and other tools
- Manual validation of scanner findings and explicit false-positive handling
- Severity, exploitability, confidence, remediation, retest, and release recommendations

## Project structure

```text
aegis-vapt/
├── SKILL.md
├── agents/
│   └── openai.yaml
├── references/
│   ├── framework-coverage.md
│   ├── methodology.md
│   ├── reporting.md
│   ├── testing-playbooks.md
│   └── tooling.md
└── scripts/
    ├── repo-context.sh
    └── security-tooling.sh
```

## Installation

### Claude Code

Clone or copy the project into your Claude skills directory:

```bash
mkdir -p .claude/skills
git clone https://github.com/thepuskar/aegis-vapt.git .claude/skills/aegis-vapt
```

For a global installation, place it in the skills directory used by your Claude Code configuration.

### Codex

Clone it into your Codex skills directory:

```bash
mkdir -p "${CODEX_HOME:-$HOME/.codex}/skills"
git clone https://github.com/thepuskar/aegis-vapt.git "${CODEX_HOME:-$HOME/.codex}/skills/aegis-vapt"
```

### Cursor and compatible agents

Copy the `aegis-vapt` folder into the agent's supported project or global skills directory. Keep `SKILL.md`, `references/`, and `scripts/` together.

## Usage

```text
Use $aegis-vapt to perform an authorized enterprise security review of this project.
Validate material findings, identify false positives, and produce a VAPT report.
Do not modify code.
```

For a release gate:

```text
Use $aegis-vapt in release-gate mode against the current branch and dev.
Focus on authentication, authorization, tenant isolation, API exposure,
dependencies, shared-code blast radius, and regression risk.
```

For remediation:

```text
Use $aegis-vapt to validate the current findings, fix only confirmed Critical
and High issues, add security regression tests, and re-scan the affected scope.
```

## Safety and authorization

Use Aegis VAPT only on systems you own or are explicitly authorized to assess. Active scanning, fuzzing, exploitation, authenticated runtime testing, and third-party target interaction require a defined scope and rules of engagement. The skill prohibits fabricated results, secret exposure, destructive testing, denial-of-service techniques, and unauthorized scope expansion.

## Tooling

Strix is optional. Aegis VAPT detects available tooling at runtime and reads the installed version's documentation before execution. It can continue with appropriate manual and OSS analysis when Strix is unavailable.

Run the local inventory helpers with:

```bash
./scripts/repo-context.sh /path/to/project
./scripts/security-tooling.sh
```

## License

No license has been assigned yet. All rights are reserved unless the repository owner adds a license.
