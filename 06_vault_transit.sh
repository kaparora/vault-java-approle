#!/bin/sh
set -o xtrace
export VAULT_ADDR=http://localhost:8200
export VAULT_TOKEN=root

#*****Transit Confg*****
vault secrets disable transit

#Mount transit backend
vault secrets enable transit

#Create transit key
vault write -f transit/keys/order
