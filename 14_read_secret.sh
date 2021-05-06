#!/bin/sh
set -o xtrace

curl -s http://localhost:8080/api/secret | jq