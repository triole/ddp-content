#!/bin/bash
IFS=$'\n'
function query() {
    PGPASSWORD=${POSTGRES_PASSWORD} \
        psql -h ${POSTGRES_HOST} -U ${POSTGRES_USER} \
        -t -c "${1};"
}

function drop_table() {
    query "truncate ${1} cascade"
}

drop_table views_view
