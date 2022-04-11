#!/usr/bin/env sh

set -e

if [ "$(id -u)" != 0 ]; then
    echo "This script requires sudo:"
    exit 1
fi

curl -SL -o /tmp/dotnet.tar.gz https://download.visualstudio.microsoft.com/download/pr/33c6e1e3-e81f-44e8-9de8-91934fba3c94/9105f95a9e37cda6bd0c33651be2b90a/dotnet-sdk-6.0.201-linux-arm64.tar.gz
mkdir -p /opt/microsoft/dotnet
tar -xzf /tmp/dotnet.tar.gz -C /opt/microsoft/dotnet
ln -sf /opt/microsoft/dotnet/dotnet /usr/bin/dotnet
