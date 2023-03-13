#!/bin/bash

scriptdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
scriptname="$(basename "${0}")"

if [[ -z $(which psql) ]]; then
    echo -e "\n[error] psql command line tools required, consider installing..."
    echo -e "\n  apt install postgresql-client\n"
    exit 1
fi

find "${scriptdir}" -regex ".*\.sh$" | grep -v "${scriptname}" |
    sort | xargs -i bash {}
