# AI, LLM, and agentic-system security

Use for predictive ML, generative AI, RAG, vector search, AI coding/operations, autonomous agents, plugins, tool calling, and Model Context Protocol integrations.

## System and data inventory

Identify model/provider/version, prompts and policies, training/fine-tuning data, retrieval sources, embeddings/vector stores, tools, agents, memory, output consumers, evaluation sets, human approvals, deployment environment, telemetry, and safety owner.

Separate:

- model behavior and safety quality;
- application security around the model;
- data/privacy and intellectual-property risk;
- tool/action authorization;
- model and dependency supply chain;
- operational monitoring and rollback.

## Prompt and context boundaries

- Treat user prompts, retrieved documents, webpages, emails, files, tool output, memory, and inter-agent messages as untrusted data.
- Test direct and indirect prompt injection, instruction/data confusion, context poisoning, delimiter/parser failures, hidden content, multimodal instructions, and persistence through memory.
- Do not rely on a system prompt as the sole security boundary. Enforce access and action policy outside the model.

## Retrieval and data security

- Verify authorization before retrieval and again before returning results; filter by trusted identity/tenant/consent context.
- Test cross-tenant embeddings, metadata-filter bypass, poisoning, stale permissions, deleted-source retention, chunk leakage, similarity probing, and bulk extraction.
- Review source provenance, content freshness, citation integrity, indexing pipelines, and ingestion privileges.

## Tool use and excessive agency

- Inventory each tool's operations, credentials, data access, side effects, cost, and environment.
- Enforce allowlisted structured actions, server-side authorization, minimum scopes, rate/amount limits, transaction binding, idempotency, and high-risk human confirmation.
- Separate planning from execution. Prevent the model from choosing its own authorization context, target tenant, approval, or secret.
- Test confused deputy, tool-result injection, argument smuggling, path/URL injection, cross-tool data exfiltration, recursive delegation, and runaway loops.

## Agent and MCP security

- Verify server/tool identity, trust and installation source, manifest/schema integrity, transport security, authentication, capability scoping, user consent, output encoding, and revocation.
- Treat tool descriptions and remote resources as untrusted. Prevent tools from granting new permissions through instructions.
- Review shared memory, multi-agent delegation, impersonation, provenance, message authenticity, termination limits, and privilege accumulation.

## Output handling

- Treat generated code, SQL, shell commands, templates, URLs, HTML/Markdown, configuration, and workflow actions as untrusted until validated for the execution context.
- Test insecure output execution, data leakage, overreliance, hallucinated authority, unsafe citations, and downstream parser/injection paths.

## Model and pipeline supply chain

- Verify model/artifact origin, hashes/signatures, licenses, serialization format, loading code, dependency safety, registry permissions, promotion, rollback, and environment isolation.
- Review training/fine-tuning poisoning, backdoors, untrusted checkpoints, unsafe deserialization, evaluation leakage, and model theft/extraction exposure.

## Privacy, abuse, and cost

- Test sensitive prompt/log retention, provider data-use settings, memorization/extraction, membership inference where justified, consent, deletion, geographic transfer, and access by operators.
- Assess denial-of-wallet, token/context exhaustion, expensive tools, resource quotas, automated abuse, and unsafe content workflows without performing destructive load.

## Evaluation and monitoring

- Define adversarial tests tied to system-specific abuse cases, not only generic jailbreaks.
- Record model/provider/version, prompt/policy version, corpus snapshot, tool set, parameters, date, and nondeterminism.
- Monitor denied actions, injection signals, unusual retrieval, tool usage, cost, data egress, policy overrides, and human approvals while avoiding sensitive prompt leakage.
- Require rollback/disable paths for prompts, tools, models, retrieval sources, and autonomous actions.

Use OWASP LLM Top 10 and the NIST AI RMF Generative AI Profile as lenses; neither substitutes for application authorization, privacy, or domain safety validation.
