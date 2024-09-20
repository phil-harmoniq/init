#!/usr/bin/env sh

set -e

if [ "$(id -u)" != 0 ]; then
    echo "This script requires sudo:"
    exit 1
fi

main()
{
    install_apt_packages
    install_powershell
    install_dotnet
}

install_apt_packages()
{
    apt install docker.io docker-compose tldr screenfetch libraspberrypi-bin -y
}

install_powershell()
{
    # https://docs.microsoft.com/en-us/powershell/scripting/install/install-other-linux?view=powershell-7.2#installation-using-a-binary-archive-file
    curl -L -o /tmp/powershell.tar.gz https://github.com/PowerShell/PowerShell/releases/download/v7.2.0/powershell-7.2.0-linux-arm64.tar.gz
    mkdir -p /opt/microsoft/powershell/7
    tar zxf /tmp/powershell.tar.gz -C /opt/microsoft/powershell/7
    chmod +x /opt/microsoft/powershell/7/pwsh
    ln -sf /opt/microsoft/powershell/7/pwsh /usr/bin/pwsh
}

install_dotnet()
{
    curl -L -o /tmp/dotnet-install.sh https://dot.net/v1/dotnet-install.sh
    chmod +x /tmp/dotnet-install.sh
    /tmp/dotnet-install.sh -c 6.0
}

main
