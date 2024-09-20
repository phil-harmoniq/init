#!/usr/bin/env sh

set -e

if [ "$(id -u)" != 0 ]; then
    echo "This script requires sudo:"
    exit 1
fi

curl -SL -o /tmp/dotnet.tar.gz https://download.visualstudio.microsoft.com/download/pr/8ba7087e-4513-41e5-8359-a4bcd2a3661f/e6828f0d8cf1ecc63074c9ff57685e27/aspnetcore-runtime-6.0.5-linux-arm64.tar.gz

mkdir -p /usr/share/dotnet
tar -xzf /tmp/dotnet.tar.gz -C /usr/share/dotnet
ln -sf /usr/share/dotnet/dotnet /usr/bin/dotnet
