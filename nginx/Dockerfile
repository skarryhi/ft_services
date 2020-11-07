FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add nginx sudo openssl openssh supervisor openrc

#add user fot nginx
RUN     adduser -D -g 'www' www
RUN		mkdir /www
RUN		chown -R www:www /var/lib/nginx
RUN		chown -R www:www /www
RUN		mkdir /run/nginx

#create key for nginx
RUN openssl req -newkey rsa:4096\
				-x509\
				-sha256\
				-days 365\ 
				-nodes\
				-out /etc/ssl/certs/skarry.crt\
				-keyout /etc/ssl/certs/skarry.key\
				-subj "/C=RU/ST=Kazan/L=Kazan/O=21 School/OU=skarry/CN=skarry"

#copy my files srcs
COPY /srcs/nginx.conf /etc/nginx/conf.d/default.conf
COPY /srcs/supervisord.conf /etc/supervisord.conf
# COPY ./srcs/start.sh /tmp/


#create user for ssh
RUN   mkdir -p /etc/sudoers.d
RUN   touch /etc/sudoers.d/wheel
RUN		adduser -D skarry \
		&& echo 'skarry:skarry' | chpasswd \
		&& addgroup skarry wheel \
		&& echo '%wheel ALL=(ALL) ALL' > /etc/sudoers.d/wheel \
		&& /usr/bin/ssh-keygen -A

#runing
# RUN chmod +x /tmp/start.sh
RUN mkdir -p /run/nginx
EXPOSE 80 443 22
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]