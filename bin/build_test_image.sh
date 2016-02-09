#!/usr/bin/env bash

docker build -f docker/Dockerfile -t wedding_api:$APP_ENV .