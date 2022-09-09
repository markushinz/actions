#!/usr/bin/env bash

set -eou pipefail

url="$(gh repo view --json url --jq .url)"

cat << EOF > README.md
# actions

[![CI](${url}/actions/workflows/ci.yaml/badge.svg)](${url}/actions/workflows/ci.yaml)

A collection of reusable GitHub Actions.

\`\`\`
$(tree -d)
\`\`\`
EOF
