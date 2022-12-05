# 🗣️ [Head Server](https://github.com/illallangi/head-server)

A server that presents a random picture of Andrew's massive head.

Add more pictures by forking, adding an image to rootfs/var/www/html/images, and opening a pull request.

Live version available at [andrewcolehasamassivehead.com](https://andrewcolehasamassivehead.com/)

## Installation

docker run -it --rm -p 8000:80 ghcr.io/illallangi/head-server:latest

### Environment Variables

TITLE: Text to display in title bar and in middle of page

CALLOUT: Callout to use in top right corner. "hide" to hide.

CALLOUT_URL: URL to link callout to.

## Usage

Run the above command then open localhost:8000 in a browser
