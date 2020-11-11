FROM alpine:latest

RUN	apk add vim openrc openssl supervisor nginx php7 php7-fpm php7-iconv \
	php7-json php7-mbstring php7-mysqli php7-phar php7-session
RUN rc-update add php-fpm7 default

RUN wget https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-english.tar.xz
RUN	mkdir -p /var/www/phpmyadmin /var/www/phpmyadmin/tmp
RUN	chmod 777 /var/www/phpmyadmin/tmp
RUN tar -xvf phpMyAdmin-latest-english.tar.xz --strip-components 1 -C /var/www/phpmyadmin

RUN rm -f /etc/nginx/conf.d/default.conf
COPY /srcs/supervisord.conf /etc/supervisord.conf
COPY /srcs/config.inc.php /var/www/phpmyadmin/
COPY /srcs/nginx.conf /etc/nginx/conf.d/
RUN mkdir /run/nginx
RUN mkdir /var/run/php



EXPOSE 5000

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]