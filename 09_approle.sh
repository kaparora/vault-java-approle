#!/bin/sh
set -o xtrace
export VAULT_ADDR=http://localhost:8200
export VAULT_TOKEN=root

vault auth disable approle
vault auth enable approle

# TTL is set to 10 minutes, and Max TTL to be 30 minutes
vault write auth/approle/role/java-app-role policies="order" \
        token_ttl="1h" token_max_ttl="4h"

vault read auth/approle/role/java-app-role/role-id -format=json > role-id.json

#vault write -format=json -wrap-ttl=1h -f auth/approle/role/java-app-role/secret-id > secret.json
vault write -format=json -f  auth/approle/role/java-app-role/secret-id > secret.json
cat role-id.json| jq -r .data.role_id > role_id
cat secret.json| jq -r .data.secret_id > secret_id
#ROLE_ID=($(cat role-id.json| jq -r .data.role_id))

#echo $ROLE_ID

#TOKEN=($(cat secret.json| jq -r .wrap_info.token))

#echo $TOKEN
