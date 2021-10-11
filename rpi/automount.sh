#!/usr/bin/env bash

set -e

if [ "$(id -u)" != 0 ]; then
    echo "This script requires sudo:"
    exit 1
fi

grep -E '^\s*/dev' /etc/fstab | awk '{ print $2 }' | xargs mkdir -p
mount -a
