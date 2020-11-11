FROM alpine:latest

RUN apk add mysql mysql-client openrc

COPY	srcs/start.sh ./

COPY	srcs/my.cnf ./etc/mysql/


VOLUME	["/var/lib"]
VOLUME	["sys/fs/cgroup"]

EXPOSE 3306

ENTRYPOINT ./start.sh