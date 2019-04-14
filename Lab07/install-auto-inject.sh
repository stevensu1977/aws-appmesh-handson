#!/bin/bash

#Color setup
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color


export SIDECAR_INJECT="auto"


if [ -z "$APPMESH_NAME" ] ; then
    APPMESH_NAME="shopmesh"
fi


MESH_NAME=$APPMESH_NAME

export APPMESH_NAME MESH_NAME

./hack/install.sh

printf "${GREEN} Enable k8s appmesh-demo namespace auto inject.....${NC}\n"
kubectl create ns appmesh-demo
kubectl label namespace appmesh-demo appmesh.k8s.aws/sidecarInjectorWebhook=enabled

