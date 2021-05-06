#!/bin/sh
set -o xtrace
export VAULT_ADDR=http://localhost:8200
export VAULT_TOKEN=root

#*****Postgres Confg*****
vault secrets disable database

#Mount DB backend
vault secrets enable database

#Create the DB connection
vault write database/config/postgresql \
  plugin_name=postgresql-database-plugin \
  allowed_roles="*" \
  connection_url="postgresql://{{username}}:{{password}}@postgres:5432/postgres?sslmode=disable" \
  username="postgres" \
  password="p@sSw0rd_"

#Create the DB order role
vault write database/roles/order \
  db_name=postgresql \
  creation_statements="CREATE ROLE \"{{name}}\" WITH LOGIN PASSWORD '{{password}}' VALID UNTIL '{{expiration}}'; GRANT USAGE ON ALL SEQUENCES IN SCHEMA public TO \"{{name}}\"; GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO \"{{name}}\";" \
  default_ttl="1h" \
  max_ttl="24h"
