#!/bin/sh
set -o xtrace
#stop and remove vault containers if already running
docker stop vault
docker rm vault
#start Vault in dev mode on port 8200
location=$(pwd)
docker run --name vault -v ${location}/log:/var/log \
    --network dev-network -p 8200:8200 vault:1.7.1 \
    server -dev -dev-root-token-id="root" &
