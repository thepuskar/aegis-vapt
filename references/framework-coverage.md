# Framework coverage

Select frameworks that fit the system and engagement. Do not claim certification or full compliance from a code review or limited pentest.

## Primary application baselines

| Framework | Use |
| --- | --- |
| OWASP ASVS 5.0.0 | Current stable testable web application control baseline; include versioned requirement IDs in formal mappings. |
| OWASP Top 10 | Executive risk categorization, not a complete test plan. |
| OWASP API Security Top 10 2023 | API object/function/property authorization, resource consumption, sensitive flows, SSRF, inventory, and unsafe consumption. |
| OWASP WSTG | Web runtime test techniques for an authorized dynamic assessment. |
| OWASP MASVS/MASTG | Mobile applications and mobile runtime testing. |
| OWASP LLM Top 10 2025 | Generative-AI application risk lens; pair with system-specific attack paths. |
| CWE | Root-cause classification for individual weaknesses. |
| CVSS v4.0 | Technical severity vector when standardized scoring is needed. |

## Enterprise and engineering baselines

| Framework | Apply when |
| --- | --- |
| NIST SSDF (SP 800-218) | Assessing secure development and release practices. |
| NIST CSF 2.0 | Communicating broader governance and security outcomes. |
| CISA Secure by Design | Product defaults, ownership, secure outcomes, and manufacturer responsibility. |
| NIST SP 800-207 | Zero-trust architecture assertions and policy decision/enforcement analysis. |
| NIST AI RMF 1.0 / Generative AI Profile | AI lifecycle, trustworthiness, governance, measurement, and system-specific risk. |
| CIS Benchmarks | Reviewing supported OS, cloud, Kubernetes, Docker, or server configuration. |
| MITRE ATT&CK Enterprise/Cloud/Mobile/ICS | Relating attack paths and defensive visibility; not for vulnerability severity. |
| SLSA | Evaluating build provenance and software supply-chain integrity. |
| OWASP SAMM | Assessing application-security program maturity. |
| PCI DSS 4.0.1 | Payment-card scope only; distinguish technical observations from a formal PCI assessment. |
| HIPAA Security Rule / HITECH | US healthcare scope only; map technical evidence without making legal compliance claims. |
| SOC 2 criteria | Control-readiness context only; do not call a VAPT an audit opinion. |
| ISO/IEC 27001/27002 | Information-security management/control context when licensed requirements are supplied by the user. |
| ISO/IEC 27017/27018 | Cloud and cloud-privacy context when applicable. |
| IEC 62443 / NIST SP 800-82 | Industrial automation and OT environments. |
| ETSI EN 303 645 / NISTIR 8259 | Consumer IoT product and device lifecycle security. |
| DORA / NIS2 / regional requirements | Regulatory relevance only after jurisdiction, entity type, and effective obligations are confirmed. |

## Minimum control domains

Map applicable tests across governance and asset ownership; architecture and threat modeling; human/workload/device identity; authorization and isolation; validation and unsafe execution; cryptography, privacy and secrets; APIs and integrations; browser/mobile/desktop; SSRF and egress; file/content processing; business logic and concurrency; AI/data systems; dependencies, SBOM and provenance; cloud, container, IaC, CI/CD and OT; logging/detection; incident readiness; recovery and availability without performing denial of service.

## Authoritative references

- OWASP ASVS: <https://owasp.org/www-project-application-security-verification-standard/>
- OWASP API Security: <https://owasp.org/API-Security/editions/2023/en/0x11-t10/>
- NIST SSDF: <https://csrc.nist.gov/pubs/sp/800/218/final>
- NIST Cybersecurity Framework: <https://www.nist.gov/cyberframework>
- CISA Secure by Design: <https://www.cisa.gov/securebydesign>
- NIST AI RMF: <https://www.nist.gov/itl/ai-risk-management-framework>
- OWASP GenAI Security: <https://genai.owasp.org/>

Confirm the current version at assessment time. Record a framework version/date and never silently map evidence to an unspecified edition.

## Coverage language

- Say `Mapped against selected OWASP ASVS controls`, not `ASVS compliant`.
- Say `No issue found in tested paths`, not `secure`.
- Say `Not tested because runtime access was unavailable`, rather than omitting the area.
- Use `Potential compliance relevance—requires control owner/legal validation` for regulated requirements.
- Distinguish `technical control observed`, `control design appears adequate`, `operating effectiveness tested`, and `formal audit evidence`; they are not interchangeable.
