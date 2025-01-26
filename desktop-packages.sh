#!/usr/bin/env bash

set ${SET_X:+-x} -eou pipefail

echo "Running desktop packages scripts..."

/ctx/desktop-1password.sh

# ublue staging repo needed for ghostty, etc
dnf5 -y copr enable ublue-os/staging

# common packages installed to desktops
# TODO: add udica: https://github.com/containers/udica
dnf5 install -y \
    ghostty \
    jetbrains-mono-fonts-all

# only the packages above should come from testing
dnf5 -y copr disable ublue-os/staging
