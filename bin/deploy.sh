#!/usr/bin/env bash

git add Dockerrun.aws.json

docker run \
  -v $(pwd):/home \
  -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
  -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
  -e AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION \
  manuelgfx/docker-aws-eb-cli-git \
  use wedding-api-$APP_ENV

docker run \
  -v $(pwd):/home \
  -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
  -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
  -e AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION \
  manuelgfx/docker-aws-eb-cli-git \
  deploy --staged

docker run \
  -v $(pwd):/home \
  -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
  -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
  -e AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION \
  manuelgfx/docker-aws-eb-cli-git \
  labs cleanup-versions --num-to-leave 5 --force