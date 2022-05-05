#!/bin/bash
IFS=$'\n'
function query() {
    PGPASSWORD=${POSTGRES_PASSWORD} \
        psql -h ${POSTGRES_HOST} -U ${POSTGRES_USER} \
        -t -c "${1};"
}

function list_tables() {
    query "
    select tablename from pg_catalog.pg_tables
	where tablename like 'domain_%' or
	tablename like 'conditions_%' or
	tablename like 'options_%' or
	tablename like 'projects_%' or
	tablename like 'tasks_%' or
	tablename like 'questions_%' or
	tablename like 'views_%'
	order by tablename
    "
}

function drop_table() {
    query "truncate ${1} cascade"
}

for t in $(list_tables); do
    drop_table ${t}
done
