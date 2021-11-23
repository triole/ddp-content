#!/bin/bash

scriptdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

pm="python $(cat pm.txt)"

source /opt/ve.sh

find ${scriptdir} -regex ".*\.xml$" | sort |
    xargs -i ${pm} import {}
