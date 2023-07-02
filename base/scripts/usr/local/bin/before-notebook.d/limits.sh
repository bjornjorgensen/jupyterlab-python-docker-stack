#!/bin/bash
# Copyright (c) 2023 b-data GmbH.
# Distributed under the terms of the MIT License.

set -e

DIVISOR=1024
FACTOR=$(echo 1 ${SWAP_ENABLE:+${SWAP_FACTOR:-1}} |
  awk '{ printf "%.1f", $1 + $2 }')

if [ ! -z "$MEM_LIMIT" ]; then
  ulimit -Sv $(echo $MEM_LIMIT $DIVISOR $FACTOR |
    awk '{ printf "%.0f", $1 / $2 * $3 }')
fi
