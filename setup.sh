#!bin/sh

# mini_restart
# kubectl delete deploy nginx-deployment
# kubectl delete svc nginx-svc


#all_restart
# minikube stop
# minikube delete 


# start
# minikube start --vm-driver=virtualbox
minikube start --vm-driver=virtualbox || exit 1
eval $(minikube docker-env)
minikube addons enable metallb
# minikube addons enable dashboard


# proces
docker build -t nginx_image ./nginx/
docker build -t ftps_image ./ftps/
kubectl apply -f ./configmap.yaml 
kubectl apply -f ./nginx/nginx.yaml
kubectl apply -f ./ftps/ftps.yaml


# check
# kubectl get deploy 
# kubectl get svc
# minikube dashboard

# sh
# sh



