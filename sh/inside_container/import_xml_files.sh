#!/bin/bash
scriptdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
basedir=$(echo "${scriptdir}" | grep -Po ".*(?=/sh)")
datadir="${basedir}/xml"
impcmd="/vol/rdmo-app/manage.py import"

function imp() {
    xml=$(find "${datadir}" | grep "${1}.xml" | sort | head -n 1)
    cmd="${impcmd} ${xml}"
    echo "${cmd}"
    eval "${cmd}"
}

imp attributes
imp optionsets
imp conditions
imp tasks
imp catalogs
imp views
