#!/bin/bash
IFS=$'\n'
scriptdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
basedir=$(echo "${scriptdir}" | grep -Po ".*(?=/)")

target_extensions=("txt" "md" "html")
target_folder="${basedir}/content"

fol="${basedir}/tmp"

if [[ -z "${fol}" ]]; then
    echo -e "\nplease specify folder containing the docx files\n"
    exit
fi

arr=($(
    find "${fol}" -type f -regex "[^.].*docx$" |
        sort
))

for fil in "${arr[@]}"; do
    echo "Convert $(echo "${fil}" | sed "s|$(pwd)/||g")"
    target_folder=$(
        echo "${fil}" |
            grep -Po ".*(?=\/)" |
            grep -Po "tmp/.+?$" |
            grep -Po "content/.+?$"
    )
    shortname=$(
        echo "${fil}" |
            grep -Po "[^/]+$" |
            grep -Po "[A-Z].*" |
            sed "s/.docx/.md/g" |
            tr '[:upper:]' '[:lower:]'
    )
    mkdir -p "${target_folder}"
    pandoc "${fil}" -t markdown -o /dev/stdout \
        >"${target_folder}/${shortname}"
    #     sed '/Versionierungshistorie/,/Mindestanforderung/{//!d}' |
    #     sed 's/^Versionierungshistorie//g' |
    #     sed '/KEIN TEIL DER/,+50d' |
    #     sed 's/> /- /g' |
    #     markdownfmt |
    #     sed 's/>$//g' |
    #     sed 's/=html//g' |
    #     sed 's/<!--.*-->//g' |
    #     sed 's/<!-- --//g' |
    #     sed 's/```//g' |
    #     sed 's/\t$//g' |
    #     uniq \

done
