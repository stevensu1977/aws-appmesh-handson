#!/bin/bash


#Color setup
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color


if [ -z "$SIDECAR_INJECT" ] ; then
    SIDECAR_INJECT="manual"
fi

if [ -z "$NAMESPACE" ] ; then
    NAMESPACE="default"
fi

RESOURCE_PATH="../resource/${SIDECAR_INJECT}_inject"
K8S_RESOURCE_PATH="${RESOURCE_PATH}/k8s"


printf "${GREEN}Delete  all deploy from EKS .......${NC}\n"


kubectl delete -n ${NAMESPACE} -f ${K8S_RESOURCE_PATH}/V1/product/product.yaml
kubectl delete -n ${NAMESPACE} -f ${K8S_RESOURCE_PATH}/V1/customer/customer.yaml
kubectl delete -n ${NAMESPACE} -f ${K8S_RESOURCE_PATH}/V2/product/productV2.yaml
kubectl delete -n ${NAMESPACE} -f ${K8S_RESOURCE_PATH}/V15/customer/customerV15.yaml
kubectl delete -n ${NAMESPACE} -f ${K8S_RESOURCE_PATH}/V1/order/order.yaml

printf "${GREEN}Deploy delete success ${NC}\n"
