#!/bin/bash

set -ouex pipefail

mkdir -p /var/lib/alternatives

echo "::group:: ===Remove CLI Wrap==="
/ctx/remove-cliwrap.sh
echo "::endgroup::"

echo "::group:: ===Desktop Packages==="
/ctx/desktop-packages.sh
echo "::endgroup::"

echo "::group:: ===Remove Packages==="
/ctx/remove-packages.sh
echo "::endgroup::"

echo "::group:: ===Additional tweaks==="
echo "::endgroup::"

echo "::group:: ===Branding Changes==="
/ctx/branding.sh
echo "::endgroup::"
