#!/usr/bin/env bash

git add Dockerrun.aws.json

if [ "$?" != "0" ]; then
  exit 1
fi


docker run \
  -v $(pwd):/home \
  -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
  -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
  -e AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION \
  manuelgfx/docker-aws-eb-cli-git \
  use wedding-api-$APP_ENV

if [ "$?" != "0" ]; then
  exit 1
fi

if [ "$?" != "0" ]; then
  exit 1
fi

docker run \
  -v $(pwd):/home \
  -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
  -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
  -e AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION \
  manuelgfx/docker-aws-eb-cli-git \
  deploy --staged

if [ "$?" != "0" ]; then
  exit 1
fi

docker run \
  -v $(pwd):/home \
  -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
  -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
  -e AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION \
  manuelgfx/docker-aws-eb-cli-git \
  labs cleanup-versions --num-to-leave 5 --force

if [ "$?" != "0" ]; then
  exit 1
fi
