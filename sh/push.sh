#!/bin/bash

scriptdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. "${scriptdir}/func.sh"

basedir=$(echo "${scriptdir}" | grep -Po ".*(?=/)")

docker cp "${basedir}" ${conf_docker_name}:/tmp/

# import script can take: xml folder and rdmo app folder
docker exec ${conf_docker_name} \
    /tmp/ddp-content/sh/inside_container/import_xml_files.sh \
    "xml:/tmp/ddp-content/xml/data" \
    "app:/home/rdmo/rdmo-app"
