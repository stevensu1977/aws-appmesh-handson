#!/bin/bash


#Color setup
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color


printf "${GREEN}Use kubectl delopy V1.5/customer \n"
printf "Start deploy V1.5 customer service .......\n"
printf "kubectl apply -n appmesh-demo -f V15/customer/customerV15.yaml${NC}\n"

kubectl apply -n appmesh-demo -f ./k8s/V15/customer/customerV15.yaml

printf "V1.5/customer service deploy complete${NC}\n"

