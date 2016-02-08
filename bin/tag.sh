#!/usr/bin/env bash

ECR_HOST=352362988575.dkr.ecr.us-east-1.amazonaws.com
DOCKER_IMAGE_NAME=$ECR_HOST/wedding_api

docker tag -f wedding_api:$APP_ENV \
  $DOCKER_IMAGE_NAME:$APP_ENV
