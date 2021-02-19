#!/bin/bash

scriptdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
basedir=$(echo "${scriptdir}" | grep -Po ".*(?=/)")
xmldir="${basedir}/xml"

function imp() {
    echo "<yellow>Import ${1}</yellow>" | tml
    sudo docker exec -it rdmo imp.sh /tmp/xml/${1}
}

sudo docker cp "${xmldir}" rdmo:/tmp/

imp domain.xml
imp conditions.xml
imp options.xml
imp questions.xml
imp views.xml
