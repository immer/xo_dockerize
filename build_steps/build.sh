#!/usr/bin/env bash

docker build -t $CONTAINER_HOST:$APP_NAME:$APP_ENV .
