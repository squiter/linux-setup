#!/bin/bash

set -u
set -e

function get_pids()
{
    ps exa
}

function main()
{
    local all_pids="$(get_pids)"
    local pid_line=$( (echo "${all_pids}")  | rofi -dmenu -i -p "🔥🔫 Kill with fire:")

    if [[ -z "$pid_line" ]];then
        return 0
    else
        local pid=$(echo "$pid_line" | awk '{print $1}')
        SUDO_ASKPASS="$HOME/bin/rofi-ask-password.sh" sudo -A kill -9 "$pid"
    fi
}

main
