# main image
FROM docker.io/library/php:8.1.13-apache

# add local files
COPY rootfs /
