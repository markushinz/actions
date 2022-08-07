#!/usr/bin/env bash

set -eou pipefail

url=${1:-"$(git remote get-url origin)"}
minimum_version=${2:-"0.0.0"}

latest_tag=$(git ls-remote --tags "${url}" | cut -d / -f 3 | sort -V | tail -1)

major=0
minor=0
patch=0
if [[ ${latest_tag:1} =~ ([0-9]+).([0-9]+).([0-9]+) ]]; then
  major="${BASH_REMATCH[1]}"
  minor="${BASH_REMATCH[2]}"
  patch="${BASH_REMATCH[3]}"
fi

GITHUB_EVENT_PATH=${GITHUB_EVENT_PATH:-"$(dirname "${0}")/event.json"}
if jq -e '[.pull_request.labels[].name] | index("major")' "${GITHUB_EVENT_PATH}" &> /dev/null; then
  major="$((major + 1))"
  minor="0"
  patch="0"
elif jq -e '[.pull_request.labels[].name] | index("minor")' "${GITHUB_EVENT_PATH}" &> /dev/null; then
  minor="$((minor + 1))"
  patch="0"
elif jq -e '[.pull_request.labels[].name] | index("chore")' "${GITHUB_EVENT_PATH}" &> /dev/null; then
  echo "null"
  exit 0
else
  patch="$((patch + 1))"
fi

version=$(echo -e "${major}.${minor}.${patch}\n${minimum_version}" | sort -V | tail -1)
echo "${version}"
