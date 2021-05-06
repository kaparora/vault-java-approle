#!/bin/sh
set -o xtrace
export VAULT_ADDR=http://localhost:8200
export VAULT_TOKEN=root

#*****KV Secret Engine****
vault secrets disable secret
vault secrets enable -version=1 -path=secret kv