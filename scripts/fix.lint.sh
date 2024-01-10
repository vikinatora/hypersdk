#!/usr/bin/env bash
# Copyright (C) 2023, Ava Labs, Inc. All rights reserved.
# See the file LICENSE for licensing terms.

HYPERSDK_PATH=$(
    cd "$(dirname "${BASH_SOURCE[0]}")"
    cd .. && pwd
)

source $HYPERSDK_PATH/scripts/common/utils.sh

set -o errexit
set -o pipefail
set -e

check_repository_root scripts/fix.lint.sh

echo "adding license header"
go install -v github.com/palantir/go-license@latest

# alert the user if they do not have $GOPATH properly configured
check_command go-license

go-license --config=./license.yml **/*.go

echo "gofumpt files"
go install mvdan.cc/gofumpt@latest
gofumpt -l -w .
