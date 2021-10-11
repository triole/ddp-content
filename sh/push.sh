#!/bin/bash

scriptdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. "${scriptdir}/func.sh"

function import() {
    echo "<yellow>Import ${1}</yellow>" | tml
    docker exec -it ${conf_docker_name} \
        python /home/rdmo/rdmo-app/manage.py import \
        /tmp/data/${1}.xml
}

docker cp "${target_dir}" ${conf_docker_name}:/tmp/

import attributes
import conditions
import optionsets
import tasks
import catalogs
import views
