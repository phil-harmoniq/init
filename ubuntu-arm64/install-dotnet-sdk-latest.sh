#!/usr/bin/env sh

set -e

if [ "$(id -u)" != 0 ]; then
    echo "This script requires sudo:"
    exit 1
fi

temp_file=/tmp/dotnet.tar.gz
curl -SL -o $temp_file https://dotnetcli.blob.core.windows.net/dotnet/Sdk/master/dotnet-sdk-latest-linux-arm64.tar.gz
sudo mkdir -p /usr/share/dotnet
sudo tar -zxf $temp_file -C /usr/share/dotnet
sudo ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet
rm $temp_file
