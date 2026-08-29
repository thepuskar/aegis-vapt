#!/usr/bin/env bash
set -uo pipefail

repo_path="${1:-.}"
if [[ ! -d "$repo_path" ]]; then
  echo "Repository path does not exist: $repo_path" >&2
  exit 2
fi

cd "$repo_path" || exit 2
echo "Repository context"
pwd

if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  echo "Git branch"
  git branch --show-current
  echo "Git status"
  git status --short
  echo "Recent commits"
  git log -5 --oneline
  echo "Remote names (URLs redacted)"
  git remote 2>/dev/null || true
else
  echo "Not a Git worktree"
fi

echo "Detected project files"
find . -maxdepth 4 -type f \
  \( -name 'package.json' -o -name 'pnpm-lock.yaml' -o -name 'yarn.lock' \
  -o -name 'package-lock.json' -o -name 'bun.lock' -o -name 'pyproject.toml' \
  -o -name 'requirements.txt' -o -name 'go.mod' -o -name 'Cargo.toml' \
  -o -name 'Gemfile' -o -name 'composer.json' -o -name 'pom.xml' \
  -o -name 'build.gradle' -o -name 'build.gradle.kts' -o -name 'Dockerfile' \
  -o -name 'docker-compose.yml' -o -name 'compose.yaml' -o -name 'Jenkinsfile' \
  -o -name '*.tf' -o -name '*.tfvars' -o -name '*.bicep' -o -name '*.csproj' \
  -o -name '*.sln' -o -name 'Chart.yaml' -o -name 'values.yaml' \
  -o -name 'serverless.yml' -o -name 'serverless.yaml' -o -name 'template.yaml' \
  -o -name 'openapi.yaml' -o -name 'openapi.yml' -o -name 'swagger.json' \
  -o -name 'buf.yaml' -o -name '*.proto' -o -name 'schema.graphql' \
  -o -name 'pubspec.yaml' -o -name 'Podfile' -o -name 'Package.swift' \
  -o -name 'AndroidManifest.xml' -o -name 'Info.plist' -o -name 'Cargo.lock' \) \
  -not -path './.git/*' -not -path './node_modules/*' -not -path './vendor/*' \
  -not -path './dist/*' -not -path './build/*' -not -path './target/*' \
  -not -path './.next/*' -not -path './coverage/*' | sort | head -n 500

echo "Security and delivery configuration"
find . -maxdepth 4 -type f \
  \( -path '*/.github/workflows/*' -o -path '*/.azure-pipelines/*' \
  -o -name 'azure-pipelines.yml' -o -name '.gitlab-ci.yml' -o -name 'Jenkinsfile' \
  -o -name 'CODEOWNERS' -o -name 'SECURITY.md' -o -name 'renovate.json' \
  -o -name 'dependabot.yml' -o -name '.semgrep.yml' -o -name 'semgrep.yml' \
  -o -name '.trivyignore' -o -name 'cosign.pub' -o -name 'policy.rego' \) \
  -not -path './.git/*' -not -path './node_modules/*' -not -path './vendor/*' \
  | sort | head -n 300
