FROM	alpine:latest

COPY	./srcs/supervisor.ini /

RUN		apk	add ca-certificates supervisor

RUN		wget -q -O /etc/apk/keys/sgerrand.rsa.pub \
		https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub

# Install lib
RUN		wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk
RUN		apk add glibc-2.32-r0.apk
RUN		rm -f glibc-2.32-r0.apk

# Install influxDB
RUN		wget https://dl.influxdata.com/influxdb/releases/influxdb-1.8.2-static_linux_amd64.tar.gz
RUN		mkdir /etc/supervisor.d /var/lib/influxdb
RUN		tar xvfz influxdb-1.8.2-static_linux_amd64.tar.gz
RUN		mv /influxdb-1.8.2-1 /etc/influxdb
RUN		rm -f influxdb-1.8.2-static_linux_amd64.tar.gz

# Install telegraf
RUN		wget https://dl.influxdata.com/telegraf/releases/telegraf-1.15.3_linux_amd64.tar.gz
RUN		tar xf telegraf-1.15.3_linux_amd64.tar.gz
RUN		cp -r /telegraf-1.15.3/* /
RUN		rm -rf /telegraf-1.15.3/ telegraf-1.15.3_linux_amd64.tar.gz
RUN		./usr/bin/telegraf -sample-config --input-filter docker \
		--output-filter influxdb > /etc/telegraf/telegraf.conf

RUN		mv /supervisor.ini /etc/supervisor.d/

VOLUME	/var/lib/influxdb

ENTRYPOINT	/usr/bin/supervisord