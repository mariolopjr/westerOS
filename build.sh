#!/bin/bash

set -ouex pipefail

echo "::group:: ===Remove CLI Wrap==="
/tmp/remove-cliwrap.sh
echo "::endgroup::"

echo "::group:: ===Desktop Packages==="
/tmp/desktop-packages.sh
echo "::endgroup::"

echo "::group:: ===Remove Packages==="
/tmp/remove-packages.sh
echo "::endgroup::"

echo "::group:: ===Additional tweaks==="
echo "::endgroup::"

echo "::group:: ===Branding Changes==="
/tmp/branding.sh
echo "::endgroup::"
