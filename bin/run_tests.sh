#!/usr/bin/env bash

docker-compose -f docker/compose/test.yml run --rm rspec

result=$?

docker-compose -f docker/compose/test.yml stop
docker-compose -f docker/compose/test.yml rm -v -f

exit $result
