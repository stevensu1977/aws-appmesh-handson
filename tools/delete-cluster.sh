#!/bin/bash


#Color setup
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color


if [ -z "$NODE_COUNT" ] ; then
    NODE_COUNT=1
fi

if [ -z "$NODE_TYPE" ] ; then
    NODE_TYPE="t2.medium"
fi

if [ -z "$AWS_REGION" ] ; then
    AWS_REGION="us-west-2"
fi

if [ -z "$EKS_NAME" ] ; then
    EKS_NAME="jani-mi2-demo"
fi

printf "${GREEN}AWS EKS Config:Region : [ ${AWS_REGION} ],cluster name: [${EKS_NAME}],  nodes: [ ${NODE_COUNT} ], node-type: [ ${NODE_TYPE} ]\n"

while true; do
    read -p "Do you want delete EKS cluster [${EKS_NAME}]?" yn
    case $yn in
        [Yy]* ) printf "[${EKS_NAME}] Start deleting .......${NC}\n" ; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done


eksctl delete cluster \
	--name ${EKS_NAME} \
	--region ${AWS_REGION}
