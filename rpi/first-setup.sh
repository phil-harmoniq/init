#!/usr/bin/env sh

set -e
lib=https://raw.githubusercontent.com/phil-harmoniq/init/master/lib

curl -L $lib/require-sudo.sh | sh

apt update
apt install git -y
apt upgrade -y
