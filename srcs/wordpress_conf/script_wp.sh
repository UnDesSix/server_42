#!/bin/sh

cd /tmp 
curl -LO https://wordpress.org/latest.tar.gz
tar xzvf latest.tar.gz
cp /tmp/wordpress/wp-config-sample.php /tmp/wordpress/wp-config.php
cp -a /tmp/wordpress/. /var/www/html/wordpress
chown -R www-data:www-data /var/www/html/wordpress
rm -f /var/www/html/wordpress/wp-config.php
mv /wp-config.php /var/www/html/wordpress
curl -s https://api.wordpress.org/secret-key/1.1/salt/ >> /var/www/html/wordpress/wp-config.php
cat /wp-config_end >> /var/www/html/wordpress/wp-config.php
rm /wp-config_end
service nginx reload
cd ..
bash
