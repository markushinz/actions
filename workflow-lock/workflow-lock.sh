#!/usr/bin/env bash

set -eo pipefail

repo="${GITHUB_REPO}"

lock="lock"
timeout=10

i=0
while gh release view -R "${repo}" --json createdAt --jq ".createdAt" "${lock}" | cat; do
    ((i++))
    if [[ "${i}" == "${timeout}" ]]; then
        exit 1
    fi
    sleep 1
done

gh release create -R "${repo}" --draft "${lock}" --generate-notes
# gh release delete -R "${repo}" -y "${lock}"
