#!/bin/bash

set -ouex pipefail

echo "::group:: ===Remove CLI Wrap==="
/tmp/remove-cliwrap.sh
echo "::endgroup::"

echo "::group:: ===Desktop Packages==="
/tmp/desktop-packages.sh
echo "::endgroup::"
