#!/bin/bash


#Color setup
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color



printf "Start deploy ${APP_NAME}/${APP_VERSION} service .......\n"
printf "kubectl apply -f ${APP_VERSION}/${APP_NAME}/${APP_NAME}$1.yaml${NC}\n"

kubectl apply -f ${K8S_RESOURCE_PATH}/${APP_VERSION}/${APP_NAME}/${APP_NAME}$1.yaml

printf "${APP_NAME}/${APP_VERSION} service deploy complete${NC}\n"
