#!bin/sh

# start

minikube start --vm-driver=virtualbox
eval $(minikube docker-env)
minikube addons enable metallb
kubectl apply -f ./configmap.yaml 
docker build -t nginx_image .
kubectl apply -f nginx.yaml
sh
# kubectl get pods
# minikube dashboard

#restart

# kubectl delete pods nginxs





# docker build -t nginx_image .
# kubectl apply -f nginx.yaml
# kubectl get pods
# minikube dashboard
# docker run -it nginx_image