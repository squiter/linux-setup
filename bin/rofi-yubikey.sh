#!/bin/bash

set -u
set -e

function get_services()
{
    ykman oath list
}

function main()
{
    local all_services="$(get_services)"
    local service=$( (echo "${all_services}")  | rofi -dmenu -i -p "Copy code for:")

    if [[ -z "$service" ]];then
        return 0
    else
        ykman oath code "$service" | awk '{print $2}' | xclip -selection clipboard
    fi
}

main
