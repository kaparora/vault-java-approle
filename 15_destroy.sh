#!/bin/sh
set -o xtrace


docker stop vault
docker rm vault

docker stop postgres
docker rm postgres

docker stop spring
docker rm spring

docker network rm dev-network

rm role_id
rm secret_id
rm role-id.json
rm secret.json
