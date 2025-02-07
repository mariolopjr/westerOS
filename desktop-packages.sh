#!/usr/bin/env bash

set ${SET_X:+-x} -eou pipefail

echo "Running desktop packages scripts..."

/ctx/desktop-1password.sh

# sometimes the version numbers do not match due to bugfixes in one
OPENSNITCH_VER=1.6.6
OPENSNITCH_UI_VER=1.6.7

# ublue staging repo needed for ghostty, etc
dnf5 -y copr enable ublue-os/staging

# common packages installed to desktops
# TODO: add udica: https://github.com/containers/udica
dnf5 install -y \
    ghostty \
    jetbrains-mono-fonts-all \
    flatpak-builder \
    neovim \
    firewall-config

# only the packages above should come from testing
dnf5 -y copr disable ublue-os/staging

# install opensnitch
curl -LO https://github.com/evilsocket/opensnitch/releases/download/v${OPENSNITCH_UI_VER}/gustavo_iniguez_goia.asc -LO https://github.com/evilsocket/opensnitch/releases/download/v${OPENSNITCH_VER}/opensnitch-${OPENSNITCH_VER}-1.x86_64.rpm -LO https://github.com/evilsocket/opensnitch/releases/download/v${OPENSNITCH_VER}/opensnitch-ui-${OPENSNITCH_VER}-1.noarch.rpm

rpm --import gustavo_iniguez_goia.asc

dnf install -y opensnitch-${OPENSNITCH_VER}-1.x86_64.rpm opensnitch-ui-${OPENSNITCH_UI_VER}-1.noarch.rpm
