#!/bin/bash

scriptdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
basedir=$(echo "${scriptdir}" | grep -Po ".*(?=/)")
tmpdir="${basedir}/tmp"

arr=($(find "${basedir}/content/docx" -type f -regex "[^.].*docx$"))

for fil in "${arr[@]}"; do
    sn=$(echo "${fil}" | grep -Po "[^/]+$" | grep -Po ".*(?=\.)")
    pandoc "${fil}" -o"${tmpdir}/${sn}.txt"
    pandoc "${fil}" -o"${tmpdir}/${sn}.html"
done
