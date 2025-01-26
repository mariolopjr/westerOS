ARG BASE_IMAGE="bazzite-gnome-nvidia"
ARG IMAGE="bazzite-gnome-nvidia"
ARG TAG_VERSION="stable-daily"

FROM scratch AS ctx
COPY / /

FROM ghcr.io/ublue-os/${BASE_IMAGE}:${TAG_VERSION}

ARG BASE_IMAGE="bazzite-gnome-nvidia"
ARG IMAGE="bazzite-gnome-nvidia"
ARG SET_X=""
ARG VERSION=""

COPY files/etc /etc

RUN --mount=type=bind,from=ctx,src=/,dst=/ctx \
    /ctx/build.sh && \
    ostree container commit && \
    bootc container lint

