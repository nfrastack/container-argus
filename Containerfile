# SPDX-FileCopyrightText: © 2025 Nfrastack <code@nfrastack.com>
#
# SPDX-License-Identifier: MIT

ARG BASE_IMAGE
ARG DISTRO
ARG DISTRO_VARIANT

FROM ${BASE_IMAGE}:${DISTRO}_${DISTRO_VARIANT}

LABEL \
        org.opencontainers.image.title="Release Argus" \
        org.opencontainers.image.description="Release and update dashboard" \
        org.opencontainers.image.url="https://hub.docker.com/r/nfrastack/argus" \
        org.opencontainers.image.documentation="https://github.com/nfrastack/container-argus/blob/main/README.md" \
        org.opencontainers.image.source="https://github.com/nfrastack/container-argus.git" \
        org.opencontainers.image.authors="Nfrastack <code@nfrastack.com>" \
        org.opencontainers.image.vendor="Nfrastack <https://www.nfrastack.com>" \
        org.opencontainers.image.licenses="MIT"

COPY CHANGELOG.md /usr/src/container/CHANGELOG.md
COPY LICENSE /usr/src/container/LICENSE
COPY README.md /usr/src/container/README.md

ARG \
    ARGUS_VERSION="0.26.3" \
    ARGUS_REPO_URL="https://github.com/release-argus/Argus"

ENV \
    NGINX_SITE_ENABLED="argus" \
    NGINX_ENABLE_CREATE_SAMPLE_HTML=FALSE \
    NGINX_WORKER_PROCESSES=1 \
    IMAGE_NAME="nfrastack/argus" \
    IMAGE_REPO_URL="https://github.com/nfrastack/container-argus/"

COPY build-assets /build-assets

RUN echo "" && \
    ARGUS_BUILD_DEPS_ALPINE=" \
                                    git \
                                    go \
                                    make \
                                    nodejs \
                                    npm \
                                    yarn \
                                " \
                                && \
    ARGUS_RUN_DEPS_ALPINE=" \
                                    yq-go \
                                " \
                                && \
    source /container/base/functions/container/build && \
    container_build_log image && \
    create_user argus 10000 argus 10000 /dev/null && \
    package update && \
    package upgrade && \
    package install \
                    ARGUS_BUILD_DEPS \
                    ARGUS_RUN_DEPS \
                    && \
    \
    clone_git_repo "${ARGUS_REPO_URL}" "${ARGUS_VERSION}" && \
    if [ -d "/build-assets/src" ] && [ -n "$(ls -A "/build-assets/src" 2>/dev/null)" ]; then cp -R /build-assets/src/* ${GIT_REPO_SRC_ARGUS} ; fi; \
    if [ -d "/build-assets/scripts" ] && [ -n "$(ls -A "/build-assets/scripts" 2>/dev/null)" ]; then for script in /build-assets/scripts/*.sh; do echo "** Applying $script"; bash $script; done && \ ; fi ; \
    make build && \
    strip argus && \
    cp -R argus /usr/local/sbin && \
    mkdir -p /container/data/argus && \
    cp -R config.yml.example /container/data/argus && \
    chown -R argus:argus /container/data/argus && \
    container_build_log add "Release Argus" "${ARGUS_VERSION}" "${ARGUS_REPO_URL}" && \
    package remove \
                    ARGUS_BUILD_DEPS \
                    && \
    rm -rf /build-assets && \
    package cleanup

EXPOSE 10000

COPY rootfs /


