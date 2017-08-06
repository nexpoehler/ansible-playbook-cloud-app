#!/bin/sh

systemctl --all is-active httpd && systemctl --all stop httpd
systemctl --all is-active php*-php-fpm && systemctl --all stop php*-php-fpm 
exit 0
