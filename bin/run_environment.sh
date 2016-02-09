#!/usr/bin/env bash

docker-compose -f docker/compose/development.yml up -d db
sleep 5
docker-compose -f docker/compose/development.yml run --rm app \
  bundle exec rails db:create db:migrate
docker-compose -f docker/compose/development.yml up -d app
