#!/bin/bash

# The 'test/_global' folder is a special test folder that is not tied to a single feature.
#
# This test file is executed against a running container constructed
# from the value of 'globaltests' in the tests/_global/scenarios.json file.
#
# The value of a scenarios element is any properties available in the 'devcontainer.json'.
# Scenarios are useful for testing specific options in a feature, or to test a combination of features.
#
# This test can be run with the following command (from the root of this repo)
#    devcontainer features test --global-scenarios-only .

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# one or more of
#echo -e "The result of the 'xxxxx' command will be:\n"
#xxxxx
echo -e "The result of the 'hello' command will be:\n"
hello
echo -e "\n"

# Feature-specific tests (uses imported library)
# The 'check' command comes from the dev-container-features-test-lib.
# check "check foo is my favorite bar" bash -c "xxxxx | grep 'my favorite foo is bar'"
check "check I am greeting with 'Greetings'" bash -c "hello | grep 'Greetings, $(whoami)'"


# Report result (uses imported library)
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
