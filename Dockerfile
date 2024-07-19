# main image
FROM docker.io/library/php:8.3.9-apache

# Install confd
RUN \
  if [ "$(uname -m)" = "x86_64" ]; then \
    curl https://github.com/kelseyhightower/confd/releases/download/v0.16.0/confd-0.16.0-linux-amd64 --location --output /usr/local/bin/confd \
  ; fi \
  && \
  if [ "$(uname -m)" = "aarch64" ]; then \
    curl https://github.com/kelseyhightower/confd/releases/download/v0.16.0/confd-0.16.0-linux-arm64 --location --output /usr/local/bin/confd \
  ; fi \
  && \
  chmod +x \
    /usr/local/bin/confd

# Install s6 overlay
RUN \
  if [ "$(uname -m)" = "x86_64" ]; then \
    curl https://github.com/just-containers/s6-overlay/releases/download/v2.2.0.3/s6-overlay-amd64-installer --location --output /tmp/s6-overlay-installer \
  ; fi \
  && \
  if [ "$(uname -m)" = "aarch64" ]; then \
    curl https://github.com/just-containers/s6-overlay/releases/download/v2.2.0.3/s6-overlay-aarch64-installer --location --output /tmp/s6-overlay-installer \
  ; fi \
  && \
  chmod +x \
    /tmp/s6-overlay-installer \
  && \
  /tmp/s6-overlay-installer / \
  && \
  rm /tmp/s6-overlay-installer

ENV S6_BEHAVIOUR_IF_STAGE2_FAILS=2

# set command
CMD ["/init"]

# add local files
COPY rootfs /
