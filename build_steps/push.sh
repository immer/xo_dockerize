#!/usr/bin/env bash

aws ecr get-login --region us-east-1

docker push $CONTAINER_HOST/$APP_NAME:$APP_ENV
