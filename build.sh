#!/bin/bash

set -ouex pipefail

echo "::group:: ===Remove CLI Wrap==="
/ctx/remove-cliwrap.sh
echo "::endgroup::"

echo "::group:: ===Desktop Packages==="
/ctx/desktop-packages.sh
echo "::endgroup::"
