#!/bin/bash

scriptdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
. "${scriptdir}/func.sh"

basedir=$(echo "${scriptdir}" | grep -Po ".*(?=/)")

function import() {
    echo "<yellow>Import ${1}</yellow>" | tml
    docker exec -it ${conf_docker_name} \
        python "${conf_manage_py}" import \
        /tmp/data/${1}.xml
}

# main
docker cp "${target_dir}" ${conf_docker_name}:/tmp/

if [[ "${conf_docker_name}" == "ddp-rdmo" ]]; then
    docker cp "${basedir}/docker/import.sh" "${conf_docker_name}:/tmp/data/"
    docker cp "${basedir}/docker/pg.sh" "${conf_docker_name}:/tmp/data/"

    t=$(mktemp)
    chmod 777 "${t}"
    echo "${conf_manage_py}" >"${t}"
    docker cp "${t}" "${conf_docker_name}:/tmp/data/pm.txt"

    # docker exec "${conf_docker_name}" "/tmp/data/import.sh"
else
    import attributes
    import conditions
    import optionsets
    import tasks
    import catalogs
    import views
fi
