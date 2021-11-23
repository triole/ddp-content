#!/bin/bash

scriptdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. "${scriptdir}/func.sh"

basedir=$(echo "${scriptdir}" | grep -Po ".*(?=/)")

docker exec -it rdmo python /home/rdmo/rdmo-app/manage.py dumpdata \
    >"${basedir}/xml/fixtures.json"
