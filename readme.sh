#!/usr/bin/env bash

set -eou pipefail

cat << EOF > README.md
# $(basename "$(pwd)")

\`\`\`
$(tree)
\`\`\`
EOF
