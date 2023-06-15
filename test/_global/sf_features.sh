#!/bin/bash -i

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "validate npmrc" cat /home/vscode/.zshrc | grep "SF_AC_ZSH_SETUP_PATH"
check "validate plugin install #1" sf plugins | grep "@jayree/sfdx-plugin-manifest"
check "validate plugin install #2" sf plugins | grep "@jayree/sfdx-plugin-prettier"
check "validate autocomplete for plugin commands" cat /home/vscode/.cache/sf/autocomplete/functions/zsh/_sf | grep "_sf_jayree_manifest_git"

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
