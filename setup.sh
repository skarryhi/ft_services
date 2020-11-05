#!bin/sh

# mini_restart
# kubectl delete deploy nginx-deployment
# kubectl delete svc nginx-svc


#all_restart
# minikube stop
# minikube delete 


# start
# minikube start --vm-driver=virtualbox
minikube addons enable metallb
eval $(minikube docker-env)


# proces
docker build -t nginx_image .
kubectl apply -f ./configmap.yaml 
kubectl apply -f nginx.yaml


# check
# kubectl get deploy 
# kubectl get svc
# minikube dashboard

# sh
# sh



