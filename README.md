# Aegis VAPT

An adaptive, evidence-led enterprise VAPT skill for coding agents. Aegis VAPT combines composable assessment profiles, threat and attack-path modeling, manual security analysis, framework-aligned coverage, optional OSS tooling, finding validation, remediation, resilience analysis, and release-gate reporting.

It is designed for authorized assessment of enterprise software and platforms across web/API, mobile, desktop, cloud-native, microservice, event-driven, data, AI/agentic, identity, IoT/OT, supply-chain, and operational environments.

## Capabilities

- Differential, module, repository, incident, remediation, and release-gate reviews
- Composable core, architecture, domain, and assurance overlays
- OWASP ASVS 5.0.0, API Security 2023, WSTG, MASVS, LLM Top 10 2025, NIST SSDF/CSF/AI RMF, CISA Secure by Design, CIS, SLSA, and related mappings
- Workforce/customer/workload identity, OIDC/OAuth/SAML/SCIM, PAM, zero-trust, authorization, IDOR, and tenant-isolation analysis
- Web/API, mobile/desktop, cloud/Kubernetes/serverless, microservice/event, data, AI/agentic, IoT/OT, supply-chain, resilience, and security-operations coverage
- Domain overlays for SaaS, ERP/HR, finance/payments, healthcare/life sciences, government, retail, education, telecom, industrial, legal, media, travel/logistics, energy/utilities, and custom domains
- Runtime detection for Strix, Semgrep, CodeQL, Trivy, OSV-Scanner, ZAP, Nuclei, Gitleaks, and other tools
- Manual validation, attack-chain correlation, explicit false-positive handling, and coverage ledgers
- Severity, exploitability, confidence, blast radius, remediation ownership, retest, residual risk, and release recommendations

## Project structure

```text
aegis-vapt/
├── SKILL.md
├── agents/
│   └── openai.yaml
├── references/
│   ├── framework-coverage.md
│   ├── enterprise-profiling.md
│   ├── threat-modeling.md
│   ├── methodology.md
│   ├── reporting.md
│   ├── testing-playbooks.md
│   ├── identity-and-zero-trust.md
│   ├── cloud-and-platform-security.md
│   ├── ai-and-agentic-security.md
│   ├── domain-overlays.md
│   ├── resilience-and-operations.md
│   └── tooling.md
└── scripts/
    ├── repo-context.sh
    ├── security-tooling.sh
    └── validate-skill.sh
```

## Installation

### Install with the Agent Skills CLI

Install Aegis VAPT directly from GitHub:

```bash
npx skills add thepuskar/aegis-vapt
```

The installer detects supported coding agents and lets you choose the installation scope and targets.

Install for Claude Code, Codex, and Cursor explicitly:

```bash
npx skills add thepuskar/aegis-vapt \
  -a claude-code \
  -a codex \
  -a cursor
```

Install globally so the skill is available across projects:

```bash
npx skills add thepuskar/aegis-vapt \
  -g \
  -a claude-code \
  -a codex \
  -a cursor
```

Install non-interactively for every detected agent:

```bash
npx skills add thepuskar/aegis-vapt --all
```

Manage the installation with:

```bash
# List installed skills
npx skills list

# Update Aegis VAPT
npx skills update aegis-vapt

# Remove Aegis VAPT
npx skills remove aegis-vapt
```

### Manual installation

#### Claude Code

Clone or copy the project into your Claude skills directory:

```bash
mkdir -p .claude/skills
git clone https://github.com/thepuskar/aegis-vapt.git .claude/skills/aegis-vapt
```

For a global installation, place it in the skills directory used by your Claude Code configuration.

#### Codex

Clone it into your Codex skills directory:

```bash
mkdir -p "${CODEX_HOME:-$HOME/.codex}/skills"
git clone https://github.com/thepuskar/aegis-vapt.git "${CODEX_HOME:-$HOME/.codex}/skills/aegis-vapt"
```

#### Cursor and compatible agents

Copy the `aegis-vapt` folder into the agent's supported project or global skills directory. Keep `SKILL.md`, `references/`, and `scripts/` together.

## Usage

```text
Use $aegis-vapt to profile this enterprise system, select the applicable
architecture, domain, and assurance overlays, validate material attack paths,
identify false positives and untested areas, and produce a VAPT report.
Do not modify code.
```

For a release gate:

```text
Use $aegis-vapt in high-assurance release-gate mode against the current branch
and dev. Build the assessment profile from the actual architecture and business
domain, analyze attack chains and operational recovery, and give a release decision.
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
./scripts/validate-skill.sh
```

## License

No license has been assigned yet. All rights are reserved unless the repository owner adds a license.
