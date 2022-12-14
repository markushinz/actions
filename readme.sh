#!/usr/bin/env bash

set -eou pipefail

cat << EOF > README.md
# actions

[![CI](https://github.com/markushinz/actions/actions/workflows/ci.yaml/badge.svg)](https://github.com/markushinz/actions/actions/workflows/ci.yaml)

A collection of reusable GitHub Actions.

\`\`\`
$(tree -d)
\`\`\`
EOF
