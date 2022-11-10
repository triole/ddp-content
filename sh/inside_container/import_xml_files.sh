#!/bin/bash
scriptdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
basedir=$(echo "${scriptdir}" | grep -Po ".*(?=/sh)")

appdir="/vol/rdmo-app/"
datadir="${basedir}/xml"

pargs=()
for val in "$@"; do
    if [[ "${val}" =~ ^xml:.*$ ]]; then
        datadir="$(echo "${val}" | grep -Po "(?<=xml:).*")"
    fi
    if [[ "${val}" =~ ^app:.*$ ]]; then
        appdir="$(echo "${val}" | grep -Po "(?<=app:).*")"
    fi
done

function nodir() {
    if [[ ! -d "${1}" ]]; then
        echo "dir does not exist: ${1}"
        exit 1
    fi
}

function rcmd() {
    cmd=${@}
    echo -e "\\033[0;93m${cmd}\\033[0m"
    eval ${@}
}

function imp() {
    xml=$(find "${datadir}" | grep "${1}.xml" | sort | head -n 1)
    rcmd "python ${appdir}/manage.py import ${xml}"
}

nodir "${appdir}"
nodir "${datadir}"

imp attributes
imp optionsets
imp conditions
imp tasks
imp catalogs
imp views
imp conditions
