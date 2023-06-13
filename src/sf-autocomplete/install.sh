#!/usr/bin/env bash

set -e

su - ${_REMOTE_USER} -c "/usr/local/share/npm-global/bin/sf autocomplete"
echo -e "SF_AC_ZSH_SETUP_PATH=${_REMOTE_USER_HOME}/.cache/sf/autocomplete/zsh_setup && test -f \$SF_AC_ZSH_SETUP_PATH && source \$SF_AC_ZSH_SETUP_PATH; # sf autocomplete setup" >> "${_REMOTE_USER_HOME}/.zshrc"
chown ${_REMOTE_USER}:${_REMOTE_USER} "${_REMOTE_USER_HOME}/.zshrc"

echo "Done!"