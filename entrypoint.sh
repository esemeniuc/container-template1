#!/bin/sh -l
set -xeo
echo "hello $1"
printenv
set

if [ -n "$INPUT_RPC_NODE" ]; then
  echo Need RPC endpoint
  exit 1
fi

if [ -n "$INPUT_KEYPAIR_JSON" ]; then
  echo Need keypair
  exit 1
fi

echo "$INPUT_KEYPAIR" > /deploy/id.json

export ANCHOR_PROVIDER_URL=$INPUT_RPC_NODE
export ANCHOR_WALLET=/deploy/id.json

yarn start