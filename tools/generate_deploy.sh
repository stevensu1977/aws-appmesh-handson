#!/bin/bash





if [ -z "$1" ] ; then
    echo "Please give app name , etc generate_deploy.sh order" 
    exit
fi




cat ${K8S_RESOURCE_PATH}/${APP_VERSION}/$1/$1$2.tpl | sed "s/\%ENV_AWS_REGION\%/${AWS_REGION}/g" >  ${K8S_RESOURCE_PATH}/${APP_VERSION}/$1/$1$2.yaml

printf "${GREEN}Generate manual inject deploy [${K8S_RESOURCE_PATH}/${APP_VERSION}/$1/$1$2.yaml] yaml success ...${NC}\n"
