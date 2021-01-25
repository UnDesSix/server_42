FROM debian:buster

RUN apt-get update \
&& apt-get install nginx mariadb-server php-fpm php-mysql wget curl -y \
&& apt install php-curl php-gd php-mbstring php-xml php-xmlrpc php-soap php-intl php-zip -y \
&& wget -O mkcert https://github.com/FiloSottile/mkcert/releases/download/v1.4.1/mkcert-v1.4.1-linux-amd64 \
&& chmod +x  mkcert \
&& mv mkcert /usr/local/bin \
&& mkcert -install \
&& rm /var/www/html/index.nginx-debian.html \
&& mkcert localhost

RUN apt-get install vim -y

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz \
&& tar xvf phpMyAdmin-5.0.4-all-languages.tar.gz \
&& mv phpMyAdmin-5.0.4-all-languages/ /var/www/html/phpmyadmin


COPY srcs/default /etc/nginx/sites-available/

COPY srcs/wordpress_conf/setup_user_wp.sh /

COPY srcs/wordpress_conf/script_wp.sh /

COPY srcs/wordpress_conf /

COPY srcs/autoindex /root

COPY srcs/config.inc.php /var/www/html/phpmyadmin
COPY srcs/mariadb_pma /root

CMD service mysql start \
&& mkdir -p /var/lib/phpmyadmin/tmp \
&& chown -R www-data:www-data /var/lib/phpmyadmin \
&& mariadb < /var/www/html/phpmyadmin/sql/create_tables.sql \
&& mariadb < /root/mariadb_pma \
&& mv /root/autoindex_on.sh /bin/autoindex_on \
&& mv /root/autoindex_off.sh /bin/autoindex_off \
&& service php7.3-fpm start \
&& service nginx start \
&& ./setup_user_wp.sh \
&& ./script_wp.sh
