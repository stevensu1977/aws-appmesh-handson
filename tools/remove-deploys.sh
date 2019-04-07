#!/bin/bash


#Color setup
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

printf "${GREEN}Delete  all deploy from EKS .......${NC}\n"


kubectl delete -f ../resource/k8s/V1/product/product.yaml
kubectl delete -f ../resource/k8s/V1/customer/customer.yaml
kubectl delete -f ../resource/k8s/V2/product/productV2.yaml
kubectl delete -f ../resource/k8s/V15/customer/customerV15.yaml
kubectl delete -f ../resource/k8s/V1/order/order.yaml

printf "${GREEN}Deploy delete success ${NC}\n"
