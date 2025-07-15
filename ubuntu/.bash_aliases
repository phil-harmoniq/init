if [[ -f "$HOME/.local/bin/oh-my-posh" ]]; then
    eval "$($HOME/.local/bin/oh-my-posh init bash --config $HOME/.config/oh-my-posh/themes/blueish-custom.omp.json)"
else
    . /etc/os-release
    OS_NAME="$NAME"
    OS_VER="$VERSION_ID"

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

    # User Prompt Style.
    function _update_ps1_custom() {
        if [[ $? == 0 ]]; then
            PS1="\[$CLR_RESET\]\[$CLR_CYAN\][ ($OS_NAME $OS_VER) \[$CLR_BOLD\]\[$USER_COLOR\]\u@\h\[$CLR_RESET\]\[$CLR_GREEN\] \w\[$CLR_CYAN\] ]\[$CLR_RESET\]\\$ "
        else
            PS1="\[$CLR_RESET\]\[$CLR_RED\][ ($OS_NAME $OS_VER) \[$CLR_BOLD\]\u@\h\[$CLR_RESET\]\[$CLR_GREEN\] \w\[$CLR_RED\] ]\[$CLR_RESET\]\\$ "
        fi
    }
    PROMPT_COMMAND="_update_ps1_custom; $PROMPT_COMMAND"
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alvF --group-directories-first'
alias la='ls -lhavAF --group-directories-first'
alias l='ls -CF'
alias dir='la'
