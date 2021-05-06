#!/bin/sh
set -o xtrace
docker stop spring
docker rm spring

location=$(pwd)
ROLE_ID=`cat role_id`
SECRET_ID=`cat secret_id`


docker run --name spring \
    -e SECRET_ID=${SECRET_ID} \
    -e ROLE_ID=${ROLE_ID} \
    --network dev-network \
    -v ${location}/config/bootstrap.yaml:/bootstrap.yaml \
    -p 8080:8080 \
    spring &