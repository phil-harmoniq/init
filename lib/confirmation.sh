#!/usr/bin/env sh

set -e

if [ "$1" != 0 ]; then
    echo "Please run this script with sudo:"
    echo "sudo $0 $*"
    exit 1
fi
