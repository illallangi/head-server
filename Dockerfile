# main image
FROM docker.io/library/php:8.1.13-apache

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

# add local files
COPY rootfs /
