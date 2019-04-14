#!/bin/bash


#Color setup
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color


#!/bin/bash



if [ -z "$SIDECAR_INJECT" ] ; then
    SIDECAR_INJECT="manual"
fi

if [ -z "$AWS_REGION" ] ; then
    AWS_REGION="us-west-2"
fi

RESOURCE_PATH="../resource/${SIDECAR_INJECT}_inject"
K8S_RESOURCE_PATH="${RESOURCE_PATH}/k8s"
APP_VERSION="V2"
APP_NAME="product"

export APP_NAME APP_VERSION K8S_RESOURCE_PATH RESOURCE_PATH

printf "${GREEN}AWS AppMesh Hands-On Lab:  ${NC}\n"
printf "${GREEN}AWS_REGION: ${AWS_REGION}  ${NC}\n"
printf "${GREEN}SIDECAR_INJECT: ${SIDECAR_INJECT}  ${NC}\n"


printf "${GREEN}Start generate manual inject deploy yaml......${NC}\n"
../tools/generate_deploy.sh $APP_NAME $APP_VERSION



#deploy product V2 to EKS cluster
../tools/deploy-with-version.sh $APP_VERSION



