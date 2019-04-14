#!/bin/bash


#Color setup
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color


if [ -z "$AWS_REGION" ] ; then
    AWS_REGION="us-west-2"
fi

SIDECAR_INJECT="auto"




RESOURCE_PATH="../resource/${SIDECAR_INJECT}_inject"
K8S_RESOURCE_PATH="${RESOURCE_PATH}/k8s"




printf "${GREEN}AWS AppMesh Hands-On Lab:  ${NC}\n"
printf "${GREEN}AWS_REGION: ${AWS_REGION}  ${NC}\n"
printf "${GREEN}SIDECAR_INJECT: ${SIDECAR_INJECT}  ${NC}\n"




printf "${GREEN}Start deploy app to EKS cluster ......${NC}\n"

printf "${GREEN}Use kubectl delopy V1/prodcut , V1/customer, V1/order \n"
printf "Start deploy V1 service .......\n"
printf "kubectl apply -n appmesh-demo -f ${K8S_RESOURCE_PATH}/V1/product/product.yaml\n"
printf "kubectl apply -n appmesh-demo -f ${K8S_RESOURCE_PATH}/V1/customer/customer.yaml\n"
printf "kubectl apply -n appmesh-demo f ${K8S_RESOURCE_PATH}/V1/order/order.yaml${NC}\n"

kubectl apply -n appmesh-demo -f ${K8S_RESOURCE_PATH}/V1/product/product.yaml
kubectl apply -n appmesh-demo -f ${K8S_RESOURCE_PATH}/V1/customer/customer.yaml
kubectl apply -n appmesh-demo -f ${K8S_RESOURCE_PATH}/V1/order/order.yaml

printf "${GREEN}V1 Service deploy success ${NC}\n"
