#!/bin/bash


#Color setup
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' 



source ../tools/common-env.sh



printf "${GREEN}AWS AppMesh Hands-On Lab:  ${NC}\n"
printf "${GREEN}REGION: ${AWS_REGION}  ${NC}\n"
printf "${GREEN}EKS_NAME: ${EKS_NAME}  ${NC}\n"
printf "${GREEN}  NODE_COUNT: ${NODE_COUNT}${NC}\n"
printf "${GREEN}  NODE_TYPE:  ${NODE_TYPE} ${NC}\n"
printf "${GREEN}Stage1: AWS EKS:  creating EKS cluster [${EKS_NAME}] .....${NC}\n"


eksctl create cluster \
	--name $EKS_NAME \
	--nodes $NODE_COUNT \
	--node-type ${NODE_TYPE} \
	--region ${AWS_REGION}
