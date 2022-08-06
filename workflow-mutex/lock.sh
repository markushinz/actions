#!/usr/bin/env bash

set -eoux pipefail

i=0
while gh release view -R "${GITHUB_REPOSITORY}" --json name --jq ".name" lock | cat; do
    i=$((i + 1))
    if [[ "${i}" == "600" ]]; then
        exit 1
    fi
    sleep 1
done

gh release create -R "${GITHUB_REPOSITORY}" --draft --generate-notes lock
