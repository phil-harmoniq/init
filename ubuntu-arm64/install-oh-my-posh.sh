#!/usr/bin/env bash

set -e

main()
{
    require_root
    check_dependencies
    install_oh_my_posh
    install_themes
}

require_root()
{
    if [[ $UID != 0 ]]; then
        echo "This script requires sudo/root"
        exit 1
    fi
}

check_dependencies()
{
    if [[ ! $(which unzip) ]]; then
        echo "Unmet dependency: unzip"
    fi
}

install_oh_my_posh()
{
    wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-arm64 -O /usr/local/bin/oh-my-posh
    chmod a+x /usr/local/bin/oh-my-posh
}

install_themes()
{
    mkdir -p /etc/oh-my-posh/themes
    wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O /tmp/oh-my-posh-themes.zip
    unzip -o /tmp/oh-my-posh-themes.zip -d /etc/oh-my-posh/themes
    chmod a+rw /etc/oh-my-posh/themes/*.json
    rm /tmp/oh-my-posh-themes.zip
}

main
