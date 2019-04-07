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

printf "${GREEN}AWS AppMesh | region: [ ${AWS_REGION} ], appmesh name:[ ${APPMESH_NAME} ] , delete all resoure .....${NC}\n"


aws appmesh delete-virtual-service --region ${AWS_REGION} --mesh-name ${APPMESH_NAME} --virtual-service-name customer.default.svc.cluster.local
aws appmesh delete-virtual-service --region ${AWS_REGION} --mesh-name ${APPMESH_NAME} --virtual-service-name product.default.svc.cluster.local
aws appmesh delete-virtual-service --region ${AWS_REGION} --mesh-name ${APPMESH_NAME} --virtual-service-name order.default.svc.cluster.local


aws appmesh delete-route --region ${AWS_REGION} --mesh-name ${APPMESH_NAME} --route-name product-r --virtual-router-name product-vr 
aws appmesh delete-route --region ${AWS_REGION} --mesh-name ${APPMESH_NAME}  --route-name customer-r --virtual-router-name customer-vr 
aws appmesh delete-route --region ${AWS_REGION} --mesh-name ${APPMESH_NAME}  --route-name order-r --virtual-router-name order-vr 

aws appmesh delete-virtual-router --region ${AWS_REGION} --mesh-name ${APPMESH_NAME}  --virtual-router-name product-vr 
aws appmesh delete-virtual-router --region ${AWS_REGION} --mesh-name ${APPMESH_NAME}  --virtual-router-name customer-vr 
aws appmesh delete-virtual-router --region ${AWS_REGION} --mesh-name ${APPMESH_NAME}  --virtual-router-name order-vr 

aws appmesh delete-virtual-node --region ${AWS_REGION} --mesh-name ${APPMESH_NAME} --virtual-node-name product-vn 
aws appmesh delete-virtual-node --region ${AWS_REGION} --mesh-name ${APPMESH_NAME} --virtual-node-name customer-vn 
aws appmesh delete-virtual-node --region ${AWS_REGION} --mesh-name ${APPMESH_NAME} --virtual-node-name order-vn 

aws appmesh delete-virtual-node --region ${AWS_REGION} --mesh-name ${APPMESH_NAME} --virtual-node-name product-v2-vn 
aws appmesh delete-virtual-node --region ${AWS_REGION} --mesh-name ${APPMESH_NAME} --virtual-node-name customer-v15-vn





aws appmesh delete-mesh --region ${AWS_REGION} --mesh-name ${APPMESH_NAME}


printf "${GREEN}AWS AppMesh | region: [ ${AWS_REGION} ], appmesh name:[ ${APPMESH_NAME} ] , delete successful ${NC}\n"
