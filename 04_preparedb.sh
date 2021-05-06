#!/bin/sh
set -o xtrace

docker exec postgres psql -h localhost -U postgres -d postgres -c 'DROP TABLE IF EXISTS "orders"'
docker exec postgres psql -h localhost -U postgres -d postgres -a -f /sql/postgres.sql