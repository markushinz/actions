#!/usr/bin/env bash

set -eo pipefail

gh_version=$(curl -fSsL https://api.github.com/repos/cli/cli/releases/latest | jq -r ".tag_name | .[1:]")
echo "${gh_version}"
curl -fSsL "https://github.com/cli/cli/releases/download/v${gh_version}/gh_${gh_version}_linux_amd64.tar.gz" | \
    tar -xzv -C /usr/local/bin -f - --strip-components 2 "gh_${gh_version}_linux_amd64/bin/gh"
which gh
