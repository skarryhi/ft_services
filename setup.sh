#!bin/sh

minikube start --vm-driver=virtualbox || exit 1
eval $(minikube docker-env)
minikube addons enable metallb

# proces
kubectl apply -f ./srcs/configmap.yaml
kubectl apply -f ./srcs/volume.yaml


# docker
docker build -t nginx_image ./srcs/nginx/
docker build -t ftps_image ./srcs/ftps/
docker build -t mysql_image ./srcs/mysql/
docker build -t phpmyadmin_image ./srcs/phpmyadmin/
docker build -t wordpress_image ./srcs/wordpress/
docker build -t influx_image ./srcs/influx/
docker build -t grafana_image ./srcs/grafana/


kubectl apply -f ./srcs/nginx/nginx.yaml
kubectl apply -f ./srcs/ftps/ftps.yaml
kubectl apply -f ./srcs/mysql/mysql.yaml
kubectl apply -f ./srcs/phpmyadmin/phpmyadmin.yaml
kubectl apply -f ./srcs/wordpress/wordpress.yaml
kubectl apply -f ./srcs/influx/influx.yaml
kubectl apply -f ./srcs/grafana/grafana.yaml


# minikube dashboard
