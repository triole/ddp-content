#!/bin/bash
scriptdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
basedir=$(echo "${scriptdir}" | grep -Po ".*(?=/sh)")

appdir="/vol/rdmo-app/"
datadir="${basedir}/xml"

views_only="false"
pargs=()
for val in "$@"; do
    if [[ "${val}" =~ ^xml:.*$ ]]; then
        datadir="$(echo "${val}" | grep -Po "(?<=xml:).*")"
    fi
    if [[ "${val}" =~ ^app:.*$ ]]; then
        appdir="$(echo "${val}" | grep -Po "(?<=app:).*")"
    fi
    if [[ "${val}" == "--views_only" ]]; then
        views_only="true"
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

if [[ "${views_only}" == "true" ]]; then
    "${scriptdir}/drop_views.sh"
    imp views
else
    imp attributes
    imp optionsets
    imp conditions
    imp tasks
    imp catalogs
    "${scriptdir}/drop_views.sh"
    imp views
    imp conditions
fi
