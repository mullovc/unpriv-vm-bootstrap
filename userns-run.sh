#!/bin/bash
set -u

IMAGEBASE="$1"

SCRIPTDIR="$(dirname "$0")"
NEWROOT=$(mktemp -d)

unshare --mount --ipc --uts --cgroup --time \
    --user --map-auto --map-root-user \
    "$SCRIPTDIR/init" "${NEWROOT}" "${IMAGEBASE}"

rmdir "${NEWROOT}"
