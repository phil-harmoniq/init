#!/usr/bin/env bash
# ~/.bash_aliases is sourced by ~/.bashrc

if [[ -z $BASH_SETUP_COMPLETE ]]; then

    # Colors from askubuntu.com
    CLR_RESET=$(tput sgr0)
    CLR_BOLD=$(tput bold)
    CLR_BLACK=$(tput setaf 0)
    CLR_RED=$(tput setaf 1)
    CLR_GREEN=$(tput setaf 2)
    CLR_YELLOW=$(tput setaf 3)
    CLR_BLUE=$(tput setaf 4)
    CLR_MAGENTA=$(tput setaf 5)
    CLR_CYAN=$(tput setaf 6)
    CLR_WHITE=$(tput setaf 7)
    USER_COLOR=$CLR_BLUE

    posh_exists=$(which oh-my-posh)
    if [[ $posh_exists ]]; then
        eval "$(oh-my-posh --init --shell bash --config ~/git/init/oh-my-posh/blueish-custom.omp.json)"
    else
        # User Prompt Style.
        function _update_ps1_custom() {
            if [[ $? == 0 ]]; then
                PS1="\[$CLR_RESET\]\[$CLR_CYAN\][ \[$CLR_BOLD\]\[$USER_COLOR\]\u@\h\[$CLR_RESET\]\[$CLR_GREEN\] \w\[$CLR_CYAN\] ]\[$CLR_RESET\]\\$ "
            else
                PS1="\[$CLR_RESET\]\[$CLR_RED\][ \[$CLR_BOLD\]\u@\h\[$CLR_RESET\]\[$CLR_GREEN\] \w\[$CLR_RED\] ]\[$CLR_RESET\]\\$ "
            fi
        }
        PROMPT_COMMAND="_update_ps1_custom; $PROMPT_COMMAND"
    fi

    # Custom Aliases
    alias ll='ls -lhF --color=auto'
    alias la='ls -lhaF --color=auto'

    # https://github.com/Azure/azure-cli/issues/3445
    alias az='az.cmd'

    export BASH_SETUP_COMPLETE="true"
fi

PATH="$PATH:$HOME/.local/bin"
