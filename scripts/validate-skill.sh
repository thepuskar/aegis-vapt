#!/usr/bin/env bash
set -euo pipefail

skill_path="${1:-.}"
cd "$skill_path"

required_files=(
  SKILL.md
  agents/openai.yaml
  references/methodology.md
  references/enterprise-profiling.md
  references/threat-modeling.md
  references/framework-coverage.md
  references/testing-playbooks.md
  references/identity-and-zero-trust.md
  references/cloud-and-platform-security.md
  references/ai-and-agentic-security.md
  references/domain-overlays.md
  references/resilience-and-operations.md
  references/tooling.md
  references/reporting.md
  scripts/repo-context.sh
  scripts/security-tooling.sh
)

failure_count=0
for required_file in "${required_files[@]}"; do
  if [[ ! -f "$required_file" ]]; then
    echo "Missing required file: $required_file" >&2
    failure_count=$((failure_count + 1))
  fi
done

if ! head -n 5 SKILL.md | grep -q '^name: aegis-vapt$'; then
  echo "SKILL.md frontmatter name is missing or invalid" >&2
  failure_count=$((failure_count + 1))
fi

for shell_script in scripts/*.sh; do
  if ! bash -n "$shell_script"; then
    failure_count=$((failure_count + 1))
  fi
done

while IFS= read -r reference_path; do
  if [[ ! -f "$reference_path" ]]; then
    echo "SKILL.md references missing file: $reference_path" >&2
    failure_count=$((failure_count + 1))
  fi
done < <(grep -oE 'references/[a-z0-9-]+\.md' SKILL.md | sort -u)

if (( failure_count > 0 )); then
  echo "Aegis VAPT validation failed with $failure_count issue(s)." >&2
  exit 1
fi

echo "Aegis VAPT structure and shell scripts are valid."
