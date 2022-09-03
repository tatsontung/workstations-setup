#!/bin/bash
# Fail immediately if any errors occur
set -e

function show_help() {
    cat << EOF
Usage: ${0##*/}
    [-h show help]
    [-d distribution ]
                            debian *
                            archlinux
                            fedora
    [-c configuration ]
                            internal
                            external *

Installing scripts for eburo linux

    -d                      Linux distribution cibled
    -c                      Configuration that PC is in
    -h                      display this help and exit

EOF
    exit $1
}

if [[ $# -eq 0 ]] ; then
    show_help 0
fi

distribution=debian
configuration=external
shell=bash

while getopts hd:c: opt; do
    case $opt in
        h)
            show_help 0
        ;;
        d)
            distribution="$OPTARG"
        ;;
        c)
            configuration="$OPTARG"
        ;;
        *)
            show_help 1 >&2
        ;;
    esac
done

shift "$((OPTIND-1))"
if (($# > 0)); then
    echo "unexpected argument(s): $@"
    show_help 1 >&2
fi

export SCRIPTS_DIR="$(dirname "$0")/environments/linux"
${SCRIPTS_DIR}/setup.sh $distribution $configuration
