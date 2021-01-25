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


COPY srcs/default /etc/nginx/sites-available/

COPY srcs/setup_user_wp.sh /

COPY srcs/script_wp.sh /

COPY srcs/wordpress_conf /

CMD service mysql start \
&& service php7.3-fpm start \
&& service nginx start \
&& ./setup_user_wp.sh \
&& ./script_wp.sh
