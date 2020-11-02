FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add nginx openssl

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/certs/skarry.crt -keyout /etc/ssl/certs/skarry.key -subj "/C=RU/ST=Kazan/L=Kazan/O=21 School/OU=skarry/CN=skarry"

COPY /srcs/nginx.conf /etc/nginx/conf.d/default.conf

COPY ./srcs/start.sh /tmp/
RUN chmod +x /tmp/start.sh
RUN mkdir -p /run/nginx
EXPOSE 80 443
CMD ["/tmp/start.sh"]