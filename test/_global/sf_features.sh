#!/bin/bash -i

# The 'test/_global' folder is a special test folder that is not tied to a single feature.
#
# This test file is executed against a running container constructed
# from the value of 'color_and_hello' in the tests/_global/scenarios.json file.
#
# The value of a scenarios element is any properties available in the 'devcontainer.json'.
# Scenarios are useful for testing specific options in a feature, or to test a combination of features.
# 
# This test can be run with the following command (from the root of this repo)
#    devcontainer features test --global-scenarios-only .

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "validate npmrc" cat /home/vscode/.zshrc | grep "SF_AC_ZSH_SETUP_PATH"
check "validate plugin install" sf plugins | grep "@jayree/sfdx-plugin-manifest"

echo $(cat /home/vscode/.cache/sf/autocomplete/functions/zsh/_sf)

check "validate autocomplete for plugin commands" cat /home/vscode/.cache/sf/autocomplete/functions/zsh/_sf | grep "_sf_jayree_manifest_git"

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
