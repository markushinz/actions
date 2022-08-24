#!/usr/bin/env bash

set -eou pipefail

url=${1:-"$(git remote get-url origin)"}
minimum_version=${2:-"0.0.0"}

latest_tag=$(git ls-remote --tags "${url}" "v*" | cut -d / -f 3 | sort -V | tail -1)

major=0
minor=0
patch=0
if [[ ${latest_tag:1} =~ ([0-9]+).([0-9]+).([0-9]+) ]]; then
  major="${BASH_REMATCH[1]}"
  minor="${BASH_REMATCH[2]}"
  patch="${BASH_REMATCH[3]}"
fi

version=$(echo -e "${major}.${minor}.$((patch + 1))\n${minimum_version}" | sort -V | tail -1)
echo "${version}"
