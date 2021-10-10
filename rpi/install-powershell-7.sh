#!/usr/bin/env sh

set -e

if [ "$(id -u)" != 0 ]; then
    echo "This script requires sudo:"
    exit 1
fi

# https://docs.microsoft.com/en-us/powershell/scripting/install/install-other-linux?view=powershell-7.1#installation-using-a-binary-archive-file

# Download the powershell '.tar.gz' archive
curl -L -o /tmp/powershell.tar.gz https://github.com/PowerShell/PowerShell/releases/download/v7.1.4/powershell-7.1.4-linux-x64.tar.gz

# Create the target folder where powershell will be placed
sudo mkdir -p /usr/share/powershell/7

# Expand powershell to the target folder
sudo tar zxf /tmp/powershell.tar.gz -C /usr/share/powershell/7

# Set execute permissions
sudo chmod +x /usr/share/powershell/7/pwsh

# Create the symbolic link that points to pwsh
sudo ln -s /usr/share/powershell/7/pwsh /usr/bin/pwsh
