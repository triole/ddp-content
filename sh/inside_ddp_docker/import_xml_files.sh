#!/bin/bash

imp="/vol/rdmo-app/manage.py import"

find /home/rdmo/ddp-content/xml/data -type f -regex ".*\.xml$" |
    sort | grep -v "catalogs.xml" |
    xargs -i ${imp} {}

${imp} /home/rdmo/ddp-content/xml/data/catalogs.xml
