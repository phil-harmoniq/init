#!/usr/bin/env sh

set -e

if [ "$(id -u)" != 0 ]; then
    echo "This script requires sudo:"
    exit 1
fi

curl -SL -o /tmp/dotnet.tar.gz https://download.visualstudio.microsoft.com/download/pr/1e7933b2-1202-4aeb-bb70-a6f9cecac61a/b12b5666b3d4cf508f8575581abd4033/aspnetcore-runtime-6.0.3-linux-arm64.tar.gz
mkdir -p /usr/share/dotnet
tar -xzf /tmp/dotnet.tar.gz -C /usr/share/dotnet
ln -sf /usr/share/dotnet/dotnet /usr/bin/dotnet
