#!/usr/bin/env bash
set -uo pipefail

tools_to_check=(
  strix semgrep codeql osv-scanner trivy syft grype gitleaks trufflehog
  checkov kubelinter kubescape kube-bench hadolint conftest cosign slsa-verifier
  zap.sh nuclei ffuf gobuster dalfox testssl.sh sslyze nmap
  prowler scoutsuite steampipe falco
  mobsfscan jadx apktool objection ghidra binwalk yara
  garak promptfoo pyrit giskard
  npm pnpm yarn bun pip-audit bandit cargo-audit govulncheck brakeman bundler-audit
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
echo "Availability is not authorization. Active, cloud, mobile, AI, network, and OT testing still requires explicit scope."
