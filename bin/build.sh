#!/usr/bin/env bash

docker build -f docker/Dockerfile \
             --build-arg SECRET_KEY_BASE=$SECRET_KEY_BASE \
             --build-arg RAILS_ENV=$RAILS_ENV \
             --build-arg DB_HOST=$DB_HOST \
             --build-arg DB_PORT=$DB_PORT \
             --build-arg POSTGRES_USERNAME=$POSTGRES_USERNAME \
             --build-arg POSTGRES_PASSWORD=$POSTGRES_PASSWORD \
             -t wedding_api:$APP_ENV .