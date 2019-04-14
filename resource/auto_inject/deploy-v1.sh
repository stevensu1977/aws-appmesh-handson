#!/bin/bash


#Color setup
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

printf "${GREEN}Use kubectl delopy V1/prodcut , V1/customer, V1/order \n"
printf "Start deploy V1 service .......\n"
printf "kubectl apply -n appmesh-demo -f V1/product/product.yaml\n"
printf "kubectl apply -n appmesh-demo -f V1/customer/customer.yaml\n"
printf "kubectl apply -n appmesh-demo -f V1/order/order.yaml${NC}\n"

kubectl apply -n appmesh-demo -f ./k8s/V1/product/product.yaml
kubectl apply -n appmesh-demo -f ./k8s/V1/customer/customer.yaml
kubectl apply -n appmesh-demo -f ./k8s/V1/order/order.yaml

printf "${GREEN}V1 Service deploy success ${NC}\n"
