# Framework coverage

Select frameworks that fit the system and engagement. Do not claim certification or full compliance from a code review or limited pentest.

## Primary application baselines

| Framework | Use |
| --- | --- |
| OWASP ASVS | Testable web application control baseline; select a target verification level with the user. |
| OWASP Top 10 | Executive risk categorization, not a complete test plan. |
| OWASP API Security Top 10 | API object/function/property authorization, resource consumption, flows, SSRF, inventory, and unsafe consumption. |
| OWASP WSTG | Web runtime test techniques for an authorized dynamic assessment. |
| OWASP MASVS/MASTG | Mobile applications and mobile runtime testing. |
| CWE | Root-cause classification for individual weaknesses. |
| CVSS v4.0 | Technical severity vector when standardized scoring is needed. |

## Enterprise and engineering baselines

| Framework | Apply when |
| --- | --- |
| NIST SSDF (SP 800-218) | Assessing secure development and release practices. |
| NIST CSF 2.0 | Communicating broader governance and security outcomes. |
| CIS Benchmarks | Reviewing supported OS, cloud, Kubernetes, Docker, or server configuration. |
| MITRE ATT&CK | Relating realistic attack paths and defensive visibility; not for vulnerability severity. |
| SLSA | Evaluating build provenance and software supply-chain integrity. |
| OWASP SAMM | Assessing application-security program maturity. |
| PCI DSS | Payment-card scope only; distinguish observations from formal assessment. |
| HIPAA/security guidance | Healthcare systems only; do not make legal compliance claims. |
| SOC 2 criteria | Control-readiness context only; do not call a VAPT an audit opinion. |

## Minimum control domains

Map applicable tests across architecture and threat modeling; identity and sessions; authorization and tenant isolation; validation and injection; cryptography and secrets; API security; browser security; SSRF and outbound calls; file handling; business logic and concurrency; dependencies and provenance; cloud, containers, IaC and CI/CD; logging and error handling; and availability controls without performing denial of service.

## Coverage language

- Say `Mapped against selected OWASP ASVS controls`, not `ASVS compliant`.
- Say `No issue found in tested paths`, not `secure`.
- Say `Not tested because runtime access was unavailable`, rather than omitting the area.
- Use `Potential compliance relevance—requires control owner/legal validation` for regulated requirements.
