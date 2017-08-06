#!/bin/sh

systemctl --all is-active httpd || systemctl --all start httpd
systemctl --all is-active php*-php-fpm || systemctl --all start php*-php-fpm
exit 0
