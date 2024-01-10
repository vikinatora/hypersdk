#!/usr/bin/env bash
# Copyright (C) 2023, Ava Labs, Inc. All rights reserved.
# See the file LICENSE for licensing terms.

source ../../scripts/common/tests.integration.sh

# run with 3 embedded VMs
ACK_GINKGO_RC=true ginkgo \
run \
-v \
--fail-fast \
-cover \
-covermode=atomic \
-coverpkg=github.com/ava-labs/hypersdk/... \
-coverprofile=integration.coverage.out \
./tests/integration \
--vms 3

# output generate coverage html
go tool cover -html=integration.coverage.out -o=integration.coverage.html
