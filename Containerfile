FROM ghcr.io/ublue-os/bazzite-gnome-nvidia:stable

COPY build.sh /tmp/build.sh
COPY branding.sh /tmp/branding.sh
COPY desktop-1password.sh /tmp/desktop-1password.sh
COPY desktop-packages.sh /tmp/desktop-packages.sh
COPY remove-cliwrap.sh /tmp/remove-cliwrap.sh
COPY remove-packages.sh /tmp/remove-packages.sh
COPY files/etc /etc

RUN mkdir -p /var/lib/alternatives && \
    /tmp/build.sh && \
    ostree container commit && \
    bootc container lint

