#!/bin/bash


#Color setup
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color


printf "${GREEN}Use kubectl delopy V2/prodcut \n"
printf "Start deploy V2 product service .......\n"
printf "kubectl apply -f V2/product/productV2.yaml${NC}\n"

kubectl apply -f ../resource/k8s/V2/product/productV2.yaml


printf "V2/product service deploy complete${NC}\n"

