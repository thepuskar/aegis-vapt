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
find . -maxdepth 3 -type f \
  \( -name 'package.json' -o -name 'pnpm-lock.yaml' -o -name 'yarn.lock' \
  -o -name 'package-lock.json' -o -name 'bun.lock' -o -name 'pyproject.toml' \
  -o -name 'requirements.txt' -o -name 'go.mod' -o -name 'Cargo.toml' \
  -o -name 'pom.xml' -o -name 'build.gradle' -o -name 'Dockerfile' \
  -o -name 'docker-compose.yml' -o -name 'compose.yaml' -o -name 'Jenkinsfile' \
  -o -name '*.tf' -o -name '*.csproj' -o -name '*.sln' \) \
  -not -path './.git/*' -not -path './node_modules/*' -not -path './vendor/*' \
  -not -path './dist/*' -not -path './build/*' | sort | head -n 300
