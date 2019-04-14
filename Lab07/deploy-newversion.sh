#!/bin/bash


#Color setup
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color


#!/bin/bash



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


printf "Start deploy Customer V15 service .......\n"
printf "kubectl apply -n appmesh-demo -f ${K8S_RESOURCE_PATH}/V15/customer/customerV15.yaml\n"
kubectl apply -n appmesh-demo -f ${K8S_RESOURCE_PATH}/V15/customer/customerV15.yaml



printf "Start deploy Product V2 service .......\n"
printf "kubectl apply -n appmesh-demo -f ${K8S_RESOURCE_PATH}/V2/product/productV2.yaml\n"
kubectl apply -n appmesh-demo -f ${K8S_RESOURCE_PATH}/V2/product/productV2.yaml





