#!/usr/bin/env bash

# ANSI color codes
RS="\[\033[0m\]"    # reset
HC="\[\033[1m\]"    # hicolor
UL="\[\033[4m\]"    # underline
INV="\[\033[7m\]"   # inverse background and foreground
FBLK="\[\033[30m\]" # foreground black
FRED="\[\033[31m\]" # foreground red
FGRN="\[\033[32m\]" # foreground green
FYEL="\[\033[33m\]" # foreground yellow
FBLE="\[\033[34m\]" # foreground blue
FMAG="\[\033[35m\]" # foreground magenta
FCYN="\[\033[36m\]" # foreground cyan
FWHT="\[\033[37m\]" # foreground white
BOLD="\[\e[1m\]"    # Set Bold
NORM="\[\e[0m\]"

BBLE="\[\e[44m\]" # Background Blue
BPURP="\[\e[104m\]" # Background Purple
FPURP="\[\e[94m\]" # Foreground Purple


# EMOJIS
EDIR="📂"
ECHK="✔️ "
EERR="💢 "
EPOO="💩 "
ESHU="🔀"
ELMB="λ"
EARL="➡"

DEGOUT="▒░"
DEGIN="░▒▓"

export PROMPT_COMMAND=__prompt_command  # Func to gen PS1 after CMDs

function __prompt_command() {
    local EXIT="$?"             # This needs to be first
    PS1="\n$BOLD"


    if [ $EXIT != 0 ]; then
        PS1+="$FMAG$EPOO"
    else
        PS1+="$FGRN"
    fi

    PS1+="$NORM${BBLE}"

    if [[ -n "$IN_NIX_SHELL" ]]; then
        PS1+="${FMAG}🐚> "
    fi

    PS1+="$NORM"

    PS1+="$FWHT$ELMB$FWHT:$FCYN[$BOLD$EDIR \w] $EARL "
    PS1+="$NORM$NORM"
}
