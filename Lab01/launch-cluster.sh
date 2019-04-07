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
printf "[${EKS_NAME}] Start creating .......${NC}\n"

eksctl create cluster \
	--name $EKS_NAME \
	--nodes $NODE_COUNT \
	--node-type ${NODE_TYPE} \
	--region ${AWS_REGION}
