#!/usr/bin/env sh

set -e
lib=https://raw.githubusercontent.com/phil-harmoniq/init/master/lib

curl -sSL $lib/require-sudo.sh | sh
curl -sSL $lib/confirmation.sh | sh -s rpi/install-powershell-7.sh

# https://docs.microsoft.com/en-us/powershell/scripting/install/install-other-linux?view=powershell-7.1#installation-using-a-binary-archive-file

# Download the powershell '.tar.gz' archive
curl -L -o /tmp/powershell.tar.gz https://github.com/PowerShell/PowerShell/releases/download/v7.1.4/powershell-7.1.4-linux-x64.tar.gz

# Create the target folder where powershell will be placed
sudo mkdir -p /opt/microsoft/powershell/7

# Expand powershell to the target folder
sudo tar zxf /tmp/powershell.tar.gz -C /opt/microsoft/powershell/7

# Set execute permissions
sudo chmod +x /opt/microsoft/powershell/7/pwsh

# Create the symbolic link that points to pwsh
sudo ln -s /opt/microsoft/powershell/7/pwsh /usr/bin/pwsh
