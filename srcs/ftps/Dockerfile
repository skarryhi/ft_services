FROM alpine:3.7

RUN apk update && apk add vsftpd openssl openrc

RUN		mkdir -p /var/log/ftp && touch /var/log/ftp/xferlog
RUN openssl req -newkey rsa:1024\
				-x509\
				-days 365\ 
				-nodes\
				-out /etc/vsftpd/skarry.pem\
				-keyout /etc/vsftpd/skarry.pem\
				-subj "/C=RU/ST=Kazan/L=Kazan/O=21 School/OU=skarry/CN=skarry"
RUN     echo 'root:root' | chpasswd
COPY    ./srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf
RUN     rc default
EXPOSE	21

ENTRYPOINT	vsftpd /etc/vsftpd/vsftpd.conf