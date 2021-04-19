#!/bin/bash

scriptdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
basedir=$(echo "${scriptdir}" | grep -Po ".*(?=/)")

target_extensions=("txt" "md" "html")
target_folder="${basedir}/content"

fol="${1}"

if [[ -z "${fol}" ]]; then
    echo -e "\nplease specify folder containing the docx files\n"
    exit
fi

function gk() {
    stoml "${scriptdir}/filemap.toml" "${1}"
}

arr=($(find "${fol}" -type f -regex "[^.].*docx$"))

for fil in "${arr[@]}"; do
    key=$(
        echo "${fil}" | grep -Po "[^/]+$" |
            grep -Po ".*(?=\.)" | tr '[:upper:]' '[:lower:]'
    )
    target=$(gk "${key}")
    cmd="pandoc \"${fil}\" -o\"${target_folder}/${target}.md\""
    echo "<yellow>${cmd}</yellow>" | tml
    eval "${cmd}"
done
