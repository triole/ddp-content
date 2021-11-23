#!/bin/bash

function pgcmd() {
    PGPASSWORD=${POSTGRES_PASSWORD} \
        psql -h ${POSTGRES_HOST} -U ${POSTGRES_USER} -d ${POSTGRES_DB} \
        -c "${1}"
}
