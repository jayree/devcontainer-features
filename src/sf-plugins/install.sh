#!/bin/bash -i

PLUGINS=${PLUGINS:-""}

SF_PLUGINS=(${PLUGINS//,/ })

set -e

if [ -z "${PLUGINS}" ] ; then
    echo "No plugins specified. Skip installation..."
    exit 0
fi

su ${_REMOTE_USER} -c "sf plugins trust allowlist add$(printf ' --name %s' "${SF_PLUGINS[@]}")"

su ${_REMOTE_USER} -c "sf plugins install ${SF_PLUGINS[@]}"

echo "Done!"
