#!/usr/bin/env bash

PLUGINS=${PLUGINS:-""}

SF_PLUGINS=("${PLUGINS//,/ }")

set -e

if [ -z "${PLUGINS}" ] ; then
    echo "No plugins specified. Skip installation..."
    exit 0
fi

mkdir -p "${_REMOTE_USER_HOME}/.config/sf/"

echo ${SF_PLUGINS} | jq -Rc 'split(" ") | map(.[0:])' > "${_REMOTE_USER_HOME}/.config/sf/unsignedPluginAllowList.json"

chown ${_REMOTE_USER}:${_REMOTE_USER} "${_REMOTE_USER_HOME}/.config/sf/unsignedPluginAllowList.json"
su - ${_REMOTE_USER} -c "/usr/local/share/npm-global/bin/sf plugins install ${SF_PLUGINS}"

echo "Done!"