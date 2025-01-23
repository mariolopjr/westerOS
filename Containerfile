FROM ghcr.io/ublue-os/bazzite-gnome-nvidia:stable

COPY build.sh /tmp/build.sh
COPY desktop-1password.sh /tmp/desktop-1password.sh
COPY desktop-packages.sh /tmp/desktop-packages.sh
COPY remove-cliwrap.sh /tmp/remove-cliwrap.sh

RUN mkdir -p /var/lib/alternatives && \
    /tmp/build.sh && \
    ostree container commit && \
    bootc container lint

