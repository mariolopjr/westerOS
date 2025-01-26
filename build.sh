#!/bin/bash

set -ouex pipefail

mkdir -p /var/lib/alternatives

echo "::group:: ===Remove CLI Wrap==="
/ctx/remove-cliwrap.sh
echo "::endgroup::"

case "${IMAGE}" in
"bazzite"*)
    echo "::group:: ===Desktop Packages==="
    /ctx/desktop-packages.sh
    echo "::endgroup::"

    echo "::group:: ===Remove Packages==="
    /ctx/remove-packages.sh
    echo "::endgroup::"

    echo "::group:: ===Additional tweaks==="
    echo "::endgroup::"
    ;;
"cosmic"*)
    echo "::group:: ===Desktop Packages==="
    /ctx/desktop-packages.sh
    echo "::endgroup::"

    echo "::group:: ===Remove Packages==="
    /ctx/remove-packages.sh
    echo "::endgroup::"

    echo "::group:: ===Additional tweaks==="
    echo "::endgroup::"
    ;;
"ucore"*) ;;
esac

echo "::group:: ===Branding Changes==="
/ctx/branding.sh
echo "::endgroup::"
