#!/usr/bin/env bash

set -u
set -e

function get_events()
{
    with_cache gcalcli --nocolor agenda
}

clear_cache(){
    echo "Cleaning the cache!"
    rm $HOME/.cache/with_cache/gcalcli---nocolor-agenda
    main
}

function main()
{
    if item=$(
            local all_events="$(get_events)"
            echo "${all_events}" \
                | rofi -dmenu \
                       -i \
                       -p "Next events :D" \
                       -kb-custom-1 "Alt+r" \
                       -mesg "Alt+r to Refresh the content"
           ); then
        echo "just to have a true statement!"
    else
        rofi_exit_code=$?
        case $rofi_exit_code in
            10) clear_cache;;
            *) exit $?;;
        esac
    fi
}

main
