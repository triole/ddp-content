#!/bin/bash

scriptdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. "${scriptdir}/func.sh"

function save_to_file() {
    mkdir -p "${target_dir}"
    echo "${1}" | iconv >"${2}" && echo "Saved ${2}"
}

function req() {
    shortname="$(shortname_from_url "${1}")"
    ext="$(ext_from_url "${1}")"

    cmd="bat get ${conf_host}/${1} \"${conf_auth}\""
    target_file="${target_dir}/${shortname}.${ext}"

    echo -e "\n<magenta>${cmd}</magenta>" | tml
    echo -e "    > ${target_file}"
    response=$(eval "${cmd}" | sed -r '/^\s*$/d')

    if [[ "${ext}" == "xml" ]]; then
        if [[ "$(valid_xml "${response}")" == "true" ]]; then
            if [[ "${debug}" == "false" ]]; then
                save_to_file "${response}" "${target_file}"
            fi
        else
            echo "<red>Invalid xml: ${shortname}</red>" | tml
        fi
    fi

    if [[ "${ext}" == "json" ]]; then
        if [[ "$(valid_json "${response}")" == "true" ]]; then
            if [[ "${debug}" == "false" ]]; then
                save_to_file "${response}" "${target_file}"
            fi
        else
            echo "<red>Invalid json: ${shortname}</red>" | tml
        fi
    fi
}

for url in "${conf_urls[@]}"; do
    req "${url}"
done
