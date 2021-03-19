#!/usr/bin/env bash

# Open the last directory
alias cdlast='cd $( ls -lt | grep d | head -1 |  cut -b 49- )'

# List last updated files
alias lslast='ls -lt | head'

# GIT
alias gsupdate="git submodule foreach git pull origin master"
alias gprune="git remote prune origin"
alias gbdm="git branch --merged master | grep -v 'master$' | xargs git branch -d"

# GIT - Update all post-commit hook in repositories inside this folder
alias gupdatehook='find . -maxdepth 1 -type d \( ! -name . \) -exec bash -c "cd '{}' && rm .git/hooks/post-commit && git init ." \;'

# Ruby & cia
alias be="bundle exec"
alias bi="bundle install"
alias bu="bundle update"
alias brake="bin/rake"
alias brails="bin/rails"

# Fuck!
alias fuck='sudo $(history -p \!\!)'

alias all_projects="ls  ~/dev/code/ ~/dev/nu/ | grep -v / | grep ."

alias calendar-indicator="/opt/extras.ubuntu.com/calendar-indicator/bin/calendar-indicator &"

alias lpass-get-id="lpass ls | peco | sed -e 's/.*\[id\:\ \(.*\)\]/\1/'"

alias who-created-this-branch='git for-each-ref --format="%(committerdate) %09 %(authorname) %09 %(refname)" | sort -k5n -k2M -k3n -k4n | grep'

# this alias created (every time) a new alias file to be used in emacs shell
alias | sed -E "s/^alias ([^=]+)='(.*)'$/alias \1 \2 \$*/g; s/'\\\''/'/g;" >~/.emacs.d/eshell/alias

# pbcopy and pbpast using xclip
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

alias full-upgrade="sudo apt-get update && sudo apt-get -u upgrade && sudo apt autoremove && brew upgrade && snap changes"

alias mledger="ledger -f ~/Dropbox/ledger/ledger.data"

alias bitcoin_today="curl https://api.coindesk.com/v1/bpi/currentprice/BRL.json | jsonValue rate_float 2"
alias bkp_lastpass="lpass export | gpg -r brunno@brunno.me --encrypt > ~/dropbox/bkps/`date +%Y-%m-%d`-lastpass-bkp.csv.gpg"
alias bigger_directories_in_home="sudo du -sx ~/* 2>/dev/null | sort -n"
alias bigger_directories="sudo du -sx /* 2>/dev/null | sort -n"

alias dired="emacsclient -a '' -t -e '(my-dired-frame default-directory)'"
alias magit="emacsclient -a '' -t -e '(magit-status)'"
alias emacs="emacsclient -create-frame "

alias put_clock="while sleep 1;do tput sc;tput cup 0 $(($(tput cols)-29));date;tput rc;done &"
