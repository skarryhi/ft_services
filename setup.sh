#!bin/sh

# mini_restart
# kubectl delete deploy nginx-deployment
# kubectl delete svc nginx-svc


#all_restart
# minikube stop
# minikube delete 


# start
# minikube start --vm-driver=virtualbox
# minikube start --vm-driver=virtualbox
eval $(minikube docker-env)
minikube addons enable metallb
# minikube addons enable dashboard


# proces
docker build -t nginx_image ./nginx/
kubectl apply -f ./configmap.yaml 
kubectl apply -f ./nginx/nginx.yaml


# check
# kubectl get deploy 
# kubectl get svc
# minikube dashboard

# sh
# sh



