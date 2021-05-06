#!/bin/sh
set -o xtrace

docker exec -it postgres psql -h localhost -U postgres -d postgres  

#\d orders
#\du
#\q