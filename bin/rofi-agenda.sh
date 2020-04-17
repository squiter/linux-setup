#!/bin/bash

set -u
set -e

function get_events()
{
    gcalcli --nocolor agenda
}

function main()
{
    local all_events="$(get_events)"
    echo $all_events
    local event=$( (echo "${all_events}")  | rofi -dmenu -i -p "Next events :D")

    # if [[ -z "$site" ]];then
    #     return 0
    # else
    #     local lpass_id=$(echo "$site" | sed -e 's/.*\[id\:\ \(.*\)\]/\1/')
    #     lpass show --password -c "$lpass_id"
    # fi
}

main
