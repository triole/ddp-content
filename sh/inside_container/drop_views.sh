#!/bin/bash
IFS=$'\n'

if [[ -z $(which psql) ]]; then
    echo -e "\n[error] psql command line tools required, consider installing..."
    echo -e "\n  apt install postgresql-client\n"
    exit 1
fi

function query() {
    PGPASSWORD=${POSTGRES_PASSWORD} \
        psql -h ${POSTGRES_HOST} -U ${POSTGRES_USER} \
        -t -c "${1};"
}

function drop_table() {
    query "truncate ${1} cascade"
}

drop_table views_view
