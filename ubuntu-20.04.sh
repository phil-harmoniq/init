#!/usr/bin/env bash

set -e

main()
{
    check_if_root
    add_bash_aliases
    add_inputrc
    install_programs
}

check_if_root()
{
    if [ "$EUID" -ne 0 ]
        then echo "Please run as root"
        exit 1
    fi
}

install_programs()
{
    wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O /tmp/packages-microsoft-prod.deb
    dpkg -i /tmp/packages-microsoft-prod.deb
    apt-get update
    # Stupid tzdata prompting during install...
    export DEBIAN_FRONTEND="noninteractive"
    apt-get install git dotnet-sdk-3.1 shellcheck -y --no-install-recommends
}

add_bash_aliases()
{
    bash_aliases='# Define some ANSI colors
ANSI_RESET=$(tput sgr0)
ANSI_BOLD=$(tput bold)
ANSI_RED=$(tput setaf 1)
ANSI_GREEN=$(tput setaf 2)
ANSI_BLUE=$(tput setaf 4)
ANSI_CYAN=$(tput setaf 6)
USER_COLOR=$ANSI_BLUE

# Custom user prompt style
function _update_ps1_custom() {
    if [[ $? == 0 ]]; then
        PS1="\[$ANSI_RESET\]\[$ANSI_CYAN\][ \[$ANSI_BOLD\]\[$USER_COLOR\]\u@\h\[$ANSI_RESET\]\[$ANSI_GREEN\] \w\[$ANSI_CYAN\] ]\[$ANSI_RESET\]\\$ "
    else
        PS1="\[$ANSI_RESET\]\[$ANSI_RED\][ \[$ANSI_BOLD\]\u@\h\[$ANSI_RESET\]\[$ANSI_GREEN\] \w\[$ANSI_RED\] ]\[$ANSI_RESET\]\\$ "
    fi
}
PROMPT_COMMAND="_update_ps1_custom; $PROMPT_COMMAND"

# Custom aliases
alias ll="ls -lhaF --color=auto --group-directories-first"
alias dir="ll"

# docker-compose aliases
alias dc="docker-compose"
alias dc-attach="dc logs -f -t"
alias dc-status="dc ps"
alias dc-run="dc up"
alias dc-start="dc up -d"
alias dc-stop="dc down"

# IP aliases
alias ufw-ban="sudo ufw insert 1 deny from"
alias open-ports="netstat -plnt"'
    echo "$bash_aliases" >> /etc/skel/.bash_aliases
    echo "$bash_aliases" >> "$HOME"/.bash_aliases
}

add_inputrc()
{
    inputrc='# Ignore-case for bash completion
set completion-ignore-case on'
    echo "$inputrc" >> /etc/skel/.inputrc
    echo "$inputrc" >> "$HOME"/.bash_aliases
}

main
