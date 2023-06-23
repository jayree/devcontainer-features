#!/bin/bash -i

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "plugin #1" bash -c "sf plugins | grep @jayree/sfdx-plugin-manifest"
check "plugin #2" bash -c "sf plugins | grep @jayree/sfdx-plugin-prettier"
check "zshrc" bash -c "cat /home/vscode/.zshrc | grep SF_AC_ZSH_SETUP_PATH"
check "autocomplete" bash -c "cat /home/vscode/.cache/sf/autocomplete/functions/zsh/_sf | grep _sf_jayree_manifest_git"

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
