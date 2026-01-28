#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")

main()
{
    add_shell_config
    install_packages
    install_posh
}

add_shell_config()
{
    SOURCE_BASH_CONFIG_DIR="$SCRIPT_DIR/.bashrc.d"
    DEST_BASH_CONFIG_DIR="$HOME/.bashrc.d/"

    mkdir -p "$DEST_BASH_CONFIG_DIR"
    cp "$SOURCE_BASH_CONFIG_DIR/aliases" "$DEST_BASH_CONFIG_DIR"
    cp "$SOURCE_BASH_CONFIG_DIR/prompt" "$DEST_BASH_CONFIG_DIR"
    cp "$SCRIPT_DIR/.inputrc" "$HOME"
}

install_packages()
{
    sudo dnf install epel-release
    sudo dnf install git btop shellcheck fastfetch podman
}

install_posh()
{
    SOURCE_THEMES_DIR="$SCRIPT_DIR/../oh-my-posh"
    DEST_THEMES_DIR="$HOME/.config/oh-my-posh/themes"

    curl -s https://ohmyposh.dev/install.sh | bash -s
    mkdir -p "$DEST_THEMES_DIR"
    cp "$SOURCE_THEMES_DIR/blueish-custom.omp.json" "$DEST_THEMES_DIR"

    oh-my-posh disable notice
}

main
