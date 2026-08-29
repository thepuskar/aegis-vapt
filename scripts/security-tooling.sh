#!/usr/bin/env bash
set -uo pipefail

tools_to_check=(
  strix semgrep codeql osv-scanner trivy syft grype gitleaks trufflehog
  checkov kubelinter hadolint zap.sh nuclei ffuf gobuster dalfox testssl.sh
  sslyze npm pnpm yarn bun pip-audit bandit cargo-audit govulncheck
)

printf '%-18s %s\n' "TOOL" "STATUS"
printf '%-18s %s\n' "------------------" "------------------------------"

for tool_name in "${tools_to_check[@]}"; do
  if command -v "$tool_name" >/dev/null 2>&1; then
    tool_path="$(command -v "$tool_name")"
    printf '%-18s available (%s)\n' "$tool_name" "$tool_path"
  else
    printf '%-18s unavailable\n' "$tool_name"
  fi
done

echo
echo "Read each installed tool's local --help/version output before use."
