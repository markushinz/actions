#!/usr/bin/env bash

set -eo pipefail

repo="${GITHUB_REPO}"
lock="lock"
gh release delete -R "${repo}" -y "${lock}"
