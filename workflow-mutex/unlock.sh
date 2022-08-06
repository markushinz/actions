#!/usr/bin/env bash

set -eou pipefail

gh release delete -R "${GITHUB_REPOSITORY}" -y lock
