#!/usr/bin/env bash

set -eoux pipefail

gh release delete -R "${GITHUB_REPOSITORY}" -y lock
