#!/bin/bash

set -u
set -e

function get_sites()
{
    lpass ls
}

function main()
{
    local all_sites="$(get_sites)"
    local site=$( (echo "${all_sites}")  | rofi -dmenu -i -p "Copy password for:")

    if [[ -z "$site" ]];then
        return 0
    else
        local lpass_id=$(echo "$site" | sed -e 's/.*\[id\:\ \(.*\)\]/\1/')
        lpass show --password -c "$lpass_id"
    fi
}

main
