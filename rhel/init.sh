#!/usr/bin/env bash

SCRIPT_DIR=$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")

main()
{
    add_shell_config
    install_posh
}

add_shell_config()
{
    SOURCE_BASH_CONFIG_DIR="$SCRIPT_DIR/rhel/.bashrc.d"
    DEST_BASH_CONFIG_DIR="$HOME/.bashrc.d/"

    mkdir -p "$DEST_BASH_CONFIG_DIR"
    cp "$SOURCE_BASH_CONFIG_DIR/oh-my-posh/aliases" "$DEST_BASH_CONFIG_DIR"
    cp "$SOURCE_BASH_CONFIG_DIR/oh-my-posh/prompt" "$DEST_BASH_CONFIG_DIR"
}

install_posh()
{
    THEMES_DIR="$HOME/.config/oh-my-posh/themes"

    curl -s https://ohmyposh.dev/install.sh | bash -s
    mkdir -p "$THEMES_DIR"
    cp "$SCRIPT_DIR/oh-my-posh/blueish-custom.omp.json" "$THEMES_DIR"
}

main
