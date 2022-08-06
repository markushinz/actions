#!/usr/bin/env bash

set -eoux pipefail

i=0
while gh release view -R "${GITHUB_REPOSITORY}" --json createdAt --jq ".createdAt" lock | cat; do
    ((i++))
    if [[ "${i}" == "600" ]]; then
        exit 1
    fi
    sleep 1
done

gh release create -R "${GITHUB_REPOSITORY}" --draft lock --generate-notes
