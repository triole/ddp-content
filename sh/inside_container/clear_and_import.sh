#!/bin/bash

scriptdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
scriptname="$(basename "${0}")"

find "${scriptdir}" -regex ".*\.sh$" | grep -v "${scriptname}" |
    sort | xargs -i bash {}
