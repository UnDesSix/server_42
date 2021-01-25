#!/bin/sh

echo "
CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
GRANT ALL ON wordpress.* TO 'pma'@'localhost' IDENTIFIED BY 'password';
FLUSH PRIVILEGES;" | mariadb

service php7.3-fpm restart
