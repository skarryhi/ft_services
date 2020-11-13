FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add nginx supervisor php7 php7-fpm php7-json php7-mysqli openrc
RUN rc-update add php-fpm7 default

RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xf latest.tar.gz
RUN rm -rf latest.tar.gz
RUN mv wordpress /var/www/wordpress

RUN mkdir -p /run/nginx
RUN mkdir -p /var/run/php

COPY /srcs/supervisord.conf /etc/supervisord.conf
COPY /srcs/wordpress.conf /etc/nginx/conf.d/wordpress.conf

EXPOSE 5050

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]