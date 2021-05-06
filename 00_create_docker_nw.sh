#!/bin/sh
set -o xtrace
#create a docker dev network for your containers
docker network rm dev-network
docker network create dev-network