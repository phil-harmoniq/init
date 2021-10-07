#!/usr/bin/env sh

set -e
lib=https://raw.githubusercontent.com/phil-harmoniq/init/master/lib

curl -sSL $lib/require-sudo.sh | sh
curl -sSL $lib/confirmation.sh | sh -s rpi/install-dotnet-sdk-latest.sh

temp_file=/tmp/dotnet.tar.gz
curl -SL -o $temp_file https://dotnetcli.blob.core.windows.net/dotnet/Sdk/master/dotnet-sdk-latest-linux-arm64.tar.gz
sudo mkdir -p /usr/share/dotnet
sudo tar -zxf $temp_file -C /usr/share/dotnet
sudo ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet
rm $temp_file
