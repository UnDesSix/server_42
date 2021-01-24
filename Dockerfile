FROM debian:buster

RUN apt-get update \
&& apt-get install nginx mariadb-server php-fpm php-mysql wget -y \
&& wget -O mkcert https://github.com/FiloSottile/mkcert/releases/download/v1.4.1/mkcert-v1.4.1-linux-amd64 \
&& chmod +x  mkcert \
&& mv mkcert /usr/local/bin \
&& apt-get install vim -y

RUN mkcert -install \
&& mkcert 127.0.0.1

RUN echo "daemon off;" >> /etc/nginx/nginx.conf

COPY srcs/default /etc/nginx/sites-available/

CMD service mysql start \
&& service php7.3-fpm start \
&& service nginx start
