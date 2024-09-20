#!/usr/bin/env sh

set -e

if [ "$(id -u)" != 0 ]; then
    echo "This script requires sudo:"
    exit 1
fi

# https://docs.microsoft.com/en-us/powershell/scripting/install/install-other-linux?view=powershell-7.1#installation-using-a-binary-archive-file

# Download the powershell '.tar.gz' archive
curl -L -o /tmp/powershell.tar.gz https://github.com/PowerShell/PowerShell/releases/download/v7.2.4/powershell-7.2.4-linux-arm64.tar.gz

# Create the target folder where powershell will be placed
sudo mkdir -p /opt/microsoft/powershell/7.2

# Expand powershell to the target folder
sudo tar zxf /tmp/powershell.tar.gz -C /opt/microsoft/powershell/7.2

# Set execute permissions
sudo chmod +x /opt/microsoft/powershell/7.2/pwsh

# Create the symbolic link that points to pwsh
sudo ln -sf /opt/microsoft/powershell/7.2/pwsh /usr/bin/pwsh
