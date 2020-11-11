#!bin/sh

# mini_restart
# kubectl delete deploy nginx-deployment
# kubectl delete svc nginx-svc


#all_restart
# minikube stop
minikube delete 


# start
# minikube start --vm-driver=virtualbox
minikube start --vm-driver=virtualbox || exit 1
eval $(minikube docker-env)
minikube addons enable metallb
# minikube addons enable dashboard


# proces
kubectl apply -f ./configmap.yaml
kubectl apply -f ./volume.yaml
docker build -t nginx_image ./nginx/
docker build -t ftps_image ./ftps/
docker build -t mysql_image ./mysql/
docker build -t phpmyadmin_image ./phpmyadmin/
docker build -t wordpress_image ./wordpress/
docker build -t influx_image ./influx/
docker build -t grafana_image ./grafana/
kubectl apply -f ./nginx/nginx.yaml
kubectl apply -f ./ftps/ftps.yaml
kubectl apply -f ./mysql/mysql.yaml
kubectl apply -f ./phpmyadmin/phpmyadmin.yaml
kubectl apply -f ./wordpress/wordpress.yaml
kubectl apply -f ./influx/influx.yaml
kubectl apply -f ./grafana/grafana.yaml


# check
# kubectl get deploy 
# kubectl get svc
# minikube dashboard

# sh
# sh



