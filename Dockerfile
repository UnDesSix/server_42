FROM debian:buster

RUN apt-get update \
&& apt-get install nginx -y \
&& apt-get install mariadb-server -y \
&& apt-get install php-fpm php-mysql -y \
&& service mysql start \
&& service nginx start \
&& service php7.3-fpm start \
&& service --status-all
