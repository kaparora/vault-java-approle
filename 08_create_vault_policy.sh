#!/bin/sh
set -o xtrace
export VAULT_ADDR=http://localhost:8200
export VAULT_TOKEN=root

echo 'path "secret/spring-vault-demo*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

path "secret/application*" {
  capabilities = ["create", "read", "update", "delete", "list"]
}

path "transit/decrypt/order" {
  capabilities = ["update"]
}

path "transit/encrypt/order" {
  capabilities = ["update"]
}

path "database/creds/order" {
  capabilities = ["read"]
}

path "sys/renew/*" {
  capabilities = ["update"]
}' | vault policy write order -
