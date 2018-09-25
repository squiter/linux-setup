#!/bin/bash

set -u
set -e

readonly REFILE_FILE=~/Dropbox/org/rofi-refile.org

if [[ ! -a "${REFILE_FILE}" ]]; then
    echo "empty" >> "${REFILE_FILE}"
fi

function get_notes()
{
    cat ${REFILE_FILE} | grep ^\*
}

function main()
{
    local all_notes="$(get_notes)"

    local note=$( (echo "${all_notes}")  | rofi -dmenu -p "Task:")
    echo "note: ${note}"

    if [[ -z "$note" ]];then
        return 0
    fi

    local matching=$( (echo "${all_notes}") | grep "^${note}$")

    if [[ -n "${matching}" ]]; then
        local new_notes=$( (echo "${all_notes}")  | grep -v "^${note}$" )
    else
        local new_notes=$( (echo -e "${all_notes}\n* TODO ${note} :REFILE:") | grep -v "^$")
    fi

    echo "${new_notes}" > "${REFILE_FILE}"
}

main
