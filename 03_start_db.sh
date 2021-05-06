#!/bin/sh
set -o xtrace
docker stop postgres
docker rm postgres

location=$(pwd)

docker run --name postgres \
    -e POSTGRES_USER=postgres \
    -e POSTGRES_PASSWORD=p@sSw0rd_ \
    -e PGPASSWORD=p@sSw0rd_ \
    --network dev-network \
    -v ${location}/sql:/sql \
    -p 5432:5432 \
    postgres:latest &
