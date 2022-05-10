#!/bin/bash

impcmd="/vol/rdmo-app/manage.py import"
fol="/home/rdmo/ddp-content/xml/data"

function imp() {
    cmd="${impcmd} ${fol}/${1}.xml"
    echo "${cmd}"
    eval "${cmd}"
}

imp attributes
imp optionsets
imp conditions
imp tasks
imp catalogs
imp views
