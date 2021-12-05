#!/usr/bin/env sh

set -e

if [ "$(id -u)" != 0 ]; then
    echo "This script requires sudo:"
    exit 1
fi

curl -SL -o /tmp/dotnet.tar.gz https://download.visualstudio.microsoft.com/download/pr/adcd9310-5072-4179-9b8b-16563b897995/15a7595966f488c74909e4a9273c0e24/dotnet-sdk-6.0.100-linux-arm64.tar.gz
mkdir -p /opt/microsoft/dotnet
tar -xzf /tmp/dotnet.tar.gz -C /opt/microsoft/dotnet
ln -s /opt/microsoft/dotnet/dotnet /usr/bin/dotnet
