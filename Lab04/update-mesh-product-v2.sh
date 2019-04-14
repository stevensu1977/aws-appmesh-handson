


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


RESOURCE_PATH="../resource/manual_inject"
MESH_RESOURCE_PATH="${RESOURCE_PATH}/appmesh"



printf "${GREEN}AWS AppMesh | region: [ ${AWS_REGION} ], appmesh name:[ ${APPMESH_NAME} ] , create new  virtual-node .....${NC}\n"
aws appmesh create-virtual-node  --region ${AWS_REGION} --mesh-name ${APPMESH_NAME} --cli-input-json file://${MESH_RESOURCE_PATH}/V2/product/product-v2-vn.json


printf "${GREEN}AWS AppMesh | region: [ ${AWS_REGION} ], appmesh name:[ ${APPMESH_NAME} ] , update route to new virtual-node .....${NC}\n"
aws appmesh update-route --region ${AWS_REGION} --mesh-name ${APPMESH_NAME} --cli-input-json file://${MESH_RESOURCE_PATH}/V2/product/product-canary.json

