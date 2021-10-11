#!/usr/bin/env bash

set -e

if [ "$(id -u)" != 0 ]; then
    echo "This script requires sudo/root."
    exit 1
fi

mountpoints="$(grep -E '//NAS' /etc/fstab | awk '{ print $2 }')"

for path in $mountpoints;
do
    echo "Creating $path"
    mkdir -p "$path"
done

mount -a
