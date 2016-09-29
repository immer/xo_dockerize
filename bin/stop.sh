#!/usr/bin/env bash

docker-compose -f docker/compose/development.yml stop
docker-compose -f docker/compose/development.yml rm -v -f