#!/usr/bin/env bash

eval $(docker run \
  -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
  -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
  -e AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION \
  sahsu/docker-aws-cli \
  ecr get-login --region us-east-1)

if [ "$?" != "0" ]; then
  exit 1
fi

ECR_HOST=352362988575.dkr.ecr.us-east-1.amazonaws.com
DOCKER_IMAGE_NAME=$ECR_HOST/wedding_api
docker push $DOCKER_IMAGE_NAME:$APP_ENV