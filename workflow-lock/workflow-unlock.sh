#!/usr/bin/env bash

set -eo pipefail

repo="${GITHUB_REPOSITORY}"
lock="lock"
gh release delete -R "${repo}" -y "${lock}"
