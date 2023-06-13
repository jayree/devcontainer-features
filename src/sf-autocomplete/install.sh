#!/bin/bash -i

set -e

if ! command -v sf >/dev/null 2>&1; then
    echo "sf command not found."
    exit 0
fi

su ${_REMOTE_USER} -c "sf autocomplete"
echo -e "SF_AC_ZSH_SETUP_PATH=${_REMOTE_USER_HOME}/.cache/sf/autocomplete/zsh_setup && test -f \$SF_AC_ZSH_SETUP_PATH && source \$SF_AC_ZSH_SETUP_PATH; # sf autocomplete setup" >> "${_REMOTE_USER_HOME}/.zshrc"
chown ${_REMOTE_USER}:${_REMOTE_USER} "${_REMOTE_USER_HOME}/.zshrc"

echo "Done!"