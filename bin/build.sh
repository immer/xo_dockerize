#!/usr/bin/env bash

docker build -f docker/Dockerfile -t $PROJECT_NAME:$APP_ENV .
