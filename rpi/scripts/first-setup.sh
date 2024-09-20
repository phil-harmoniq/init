#!/usr/bin/env sh

set -e
lib=https://raw.githubusercontent.com/phil-harmoniq/init/master/lib

curl -sSL $lib/require-sudo.sh | sh
curl -sSL $lib/confirmation.sh | sh -s rpi/first-setup.sh

apt update
apt install git tldr cifs-utils -y
apt upgrade -y
