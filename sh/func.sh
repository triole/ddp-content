#!/bin/bash
scriptdir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
basedir=$(echo "${scriptdir}" | grep -Po ".*(?=/)")
conf="${basedir}/conf/conf.toml"
conf_api_tokens="${basedir}/conf/api_tokens.toml"

arg="$(hostname | sed 's/\./_/g')"

# ts=$(date +%Y%m%d_%H%M%S)
xml_dir="${basedir}/xml"
# target_dir="${xml_dir}/${ts}"
target_dir="${xml_dir}/data"

debug="false"
for val in "$@"; do
    if [[ "${val}" =~ ^-+(d|debug)$ ]]; then
        debug="true"
    fi
done

function gk() {
    stoml "${conf}" "${1}"
}

function get_api_token() {
    echo "Authorization:Token $(stoml "${conf_api_tokens}" "${arg}")"

}

function ext_from_url() {
    if [[ "$(echo "${1}" | rg -c "/export")" == "1" ]]; then
        echo "xml"
    else
        echo "json"
    fi
}

function shortname_from_url() {
    shortname="$(echo "${1}" | rg --pcre2 -o "[a-z]+(?=/export)")"
    if [[ -z "${shortname}" ]]; then
        shortname="$(
            echo "${1}" | rg --pcre2 -o ".*(?=\/)" | rg --pcre2 -o "[^/]+$"
        )"
    fi
    echo "${shortname}"
}

conf_host=$(gk "${arg}.host")
conf_auth=$(get_api_token)
conf_docker_name=$(gk "${arg}.docker_name")
conf_manage_py=$(gk "${arg}.manage_py")

if [[ -z "${conf_host}" ]]; then
    echo -e "\nCheck your conf arg. Key not found."
    echo -e "Use 'dev' or 'ddp'\n"
fi

conf_urls=($(gk "urls"))
conf_url_projects="${conf_host}/$(gk "url_project")"

latest_dir=$(
    find "${xml_dir}" -mindepth 1 -maxdepth 1 -type d |
        rg "[0-9]{8}_[0-9]{6}" | sort | tail -n 1
)

function detect_latest() {
    find "${latest_dir}" -mindepth 1 -maxdepth 1 -type f |
        grep -E "${1}.json$"
}

function valid_xml() {
    if [[ "$(echo "${1}" | head -n 1 | sift -c "^\<\?xml version")" == "1" ]]; then
        echo true
    else
        echo false
    fi
}

function valid_json() {
    echo "${1}" | gojq >/dev/null 2>&1
    x="$?"
    if [[ "${x}" == "0" ]]; then
        echo "true"
    else
        echo "false"
    fi
}
