#!/usr/bin/env sh

set -e

if [ "$(id -u)" != 0 ]; then
    echo "Please run this script with sudo:"
    echo "sudo $0 $*"
    exit 1
fi

apt update
apt install git -y
apt upgrade -y
