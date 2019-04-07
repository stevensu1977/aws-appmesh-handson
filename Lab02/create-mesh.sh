#!/bin/bash


#Color setup
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color





if [ -z "$AWS_REGION" ] ; then
    AWS_REGION="us-west-2"
fi

if [ -z "$APPMESH_NAME" ] ; then
    APPMESH_NAME="shopmesh"
fi



printf "${GREEN}AWS AppMesh | region: [ ${AWS_REGION} ], appmesh name:[ ${APPMESH_NAME} ] , creating.....${NC}\n"



aws appmesh create-mesh --region ${AWS_REGION} --mesh-name ${APPMESH_NAME}


printf "${GREEN}AWS AppMesh | region: [ ${AWS_REGION} ], appmesh name:[ ${APPMESH_NAME} ] , create order virtual node , virtual router, virtual service ${NC}\n"

aws appmesh create-virtual-node --region ${AWS_REGION} --mesh-name ${APPMESH_NAME} --cli-input-json file://../resource/appmesh/V1/order/order-vn.json
aws appmesh create-virtual-router --region ${AWS_REGION} --mesh-name ${APPMESH_NAME} --cli-input-json file://../resource/appmesh/V1/order/order-vr.json
aws appmesh create-route --region ${AWS_REGION} --mesh-name ${APPMESH_NAME} --cli-input-json  file://../resource/appmesh/V1/order/order-r.json
aws appmesh create-virtual-service --region ${AWS_REGION} --mesh-name ${APPMESH_NAME} --cli-input-json  file://../resource/appmesh/V1/order/order-vs.json


printf "${GREEN}AWS AppMesh | region: [ ${AWS_REGION} ], appmesh name:[ ${APPMESH_NAME} ] , create product virtual node , virtual router, virtual service ${NC}\n"
aws appmesh create-virtual-node --region ${AWS_REGION} --mesh-name ${APPMESH_NAME} --cli-input-json file://../resource/appmesh/V1/product/product-vn.json
aws appmesh create-virtual-router --region ${AWS_REGION} --mesh-name ${APPMESH_NAME} --cli-input-json file://../resource/appmesh/V1/product/product-vr.json
aws appmesh create-route --region ${AWS_REGION} --mesh-name ${APPMESH_NAME} --cli-input-json file://../resource/appmesh/V1/product/product-r.json
aws appmesh create-virtual-service  --region ${AWS_REGION} --mesh-name ${APPMESH_NAME} --cli-input-json file://../resource/appmesh/V1/product/product-vs.json

printf "${GREEN}AWS AppMesh | region: [ ${AWS_REGION} ], appmesh name:[ ${APPMESH_NAME} ] , create customer virtual node , virtual router, virtual service ${NC}\n"
aws appmesh create-virtual-node --region ${AWS_REGION} --mesh-name ${APPMESH_NAME} --cli-input-json file://../resource/appmesh/V1/customer/customer-vn.json
aws appmesh create-virtual-router --region ${AWS_REGION} --mesh-name ${APPMESH_NAME} --cli-input-json file://../resource/appmesh/V1/customer/customer-vr.json
aws appmesh create-route --region ${AWS_REGION} --cli-input-json file://../resource/appmesh/V1/customer/customer-r.json
aws appmesh create-virtual-service  --region ${AWS_REGION} --cli-input-json file://../resource/appmesh/V1/customer/customer-vs.json

printf "${GREEN}AWS AppMesh | region: [ ${AWS_REGION} ], meshs information: ${NC}\n"
aws appmesh list-meshes --region ${AWS_REGION}
printf "${GREEN}AWS AppMesh | region: [ ${AWS_REGION} ], appmesh name:[ ${APPMESH_NAME} ] , create successful ${NC}\n"
