#!/usr/bin/bash

set ${SET_X:+-x} -eou pipefail

base_image="silverblue"
image_flavor="nvidia"

# Branding
cat <<<"$(jq ".\"image-name\" |= \"westeros\" |
              .\"image-flavor\" |= \"${image_flavor}\" |
              .\"image-vendor\" |= \"mariolopjr\" |
              .\"image-ref\" |= \"ostree-image-signed:docker://ghcr.io/mariolopjr/westeros\" |
              .\"image-tag\" |= \"${IMAGE}${BETA:-}\" |
              .\"base-image-name\" |= \"${base_image}\" |
              .\"fedora-version\" |= \"$(rpm -E %fedora)\"" \
    </usr/share/ublue-os/image-info.json)" \
>/tmp/image-info.json
cp /tmp/image-info.json /usr/share/ublue-os/image-info.json

sed -i 's/image-branch/image-tag/' /usr/libexec/bazzite-fetch-image

sed -i "s|^PRETTY_NAME=.*|PRETTY_NAME=\"$(echo "Bazzite" | cut -d - -f1) (Version: ${VERSION} / FROM ${BASE_IMAGE^} $(rpm -E %fedora))\"|" /usr/lib/os-release
sed -i "s|^VERSION=.*|VERSION=\"${VERSION} (${base_image^})\"|" /usr/lib/os-release
sed -i "s|^OSTREE_VERSION=.*|OSTREE_VERSION=\'${VERSION}\'|" /usr/lib/os-release
echo "IMAGE_ID=\"${IMAGE}\"" >>/usr/lib/os-release
echo "IMAGE_VERSION=\"${VERSION}\"" >>/usr/lib/os-release
