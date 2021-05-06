#!/bin/sh
set -o xtrace

curl --header "Content-Type: application/json" \
       http://localhost:8080/api/orders | jq
