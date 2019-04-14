#!/bin/bash


AWS_REGION="ap-northeast-1"
cat customer.tpl | sed "s/\%ENV_AWS_REGION\%/${AWS_REGION}/g"


