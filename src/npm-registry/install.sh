#!/usr/bin/env bash

REGISTRY=${REGISTRY:-""}

set -e

if [ -z "${REGISTRY}" ] ; then
    echo "No registry specified. Skip installation..."
    exit 0
fi

echo -e "${REGISTRY}" > $_REMOTE_USER_HOME/.npmrc
chown ${_REMOTE_USER}:${_REMOTE_USER} "$_REMOTE_USER_HOME/.npmrc"

echo "Done!"