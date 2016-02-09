#!/usr/bin/env bash

docker-compose -f docker/compose/test.yml up -d db
sleep 5
docker-compose -f docker/compose/test.yml run --rm rspec \
  bundle exec rails db:create db:migrate
docker-compose -f docker/compose/test.yml run --rm rspec

result=$?

docker-compose -f docker/compose/test.yml stop
docker-compose -f docker/compose/test.yml rm -v -f

exit $result
